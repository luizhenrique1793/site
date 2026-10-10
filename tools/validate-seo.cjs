const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const root = path.resolve(__dirname, '..');
const origin = 'https://' + fs.readFileSync(path.join(root, 'CNAME'), 'utf8').trim();
const sitemap = fs.readFileSync(path.join(root, 'sitemap.xml'), 'utf8');
const urls = [...sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)].map(m => m[1]);
const today = new Intl.DateTimeFormat('sv-SE', { timeZone: 'America/Sao_Paulo' }).format(new Date());
const errors = [];
let checks = 0;
function check(condition, message) { checks++; if (!condition) errors.push(message); }
function read(file) { return fs.readFileSync(path.join(root, file), 'utf8'); }
function fileFor(url) {
  const pathname = decodeURIComponent(url.pathname);
  const file = path.resolve(root, '.' + pathname);
  assert(file === root || file.startsWith(root + path.sep));
  return path.relative(root, pathname.endsWith('/') ? path.join(file, 'index.html') : file);
}
function text(s) { return s.replace(/<[^>]*>/g, '').replace(/\s+/g, ' ').trim(); }
function attributes(tag) {
  const attrs = {};
  for (const m of tag.matchAll(/([\w:-]+)\s*=\s*(?:"([^"]*)"|'([^']*)')/g)) attrs[m[1].toLowerCase()] = m[2] ?? m[3];
  return attrs;
}
function tags(html) {
  return [...html.replace(/<!--[^]*?-->/g, '').replace(/<(script|style)\b[^>]*>[^]*?<\/\1>/gi, '').matchAll(/<(?:[^"'<>]|"[^"]*"|'[^']*')*>/g)].map(m => m[0]);
}
function schemas(html) { return [...html.matchAll(/<script type="application\/ld\+json">([^]*?)<\/script>/g)].map(m => JSON.parse(m[1])); }
const documents = new Map(urls.map(url => [url, read(fileFor(new URL(url)))]));
const titles = new Set();
const descriptions = new Set();
const incoming = new Set();
check(sitemap.startsWith('<?xml'), 'Declaração XML ausente');
check(/<urlset xmlns="http:\/\/www.sitemaps.org\/schemas\/sitemap\/0.9">/.test(sitemap), 'Namespace inválido');
check(urls.length === new Set(urls).size, 'URLs repetidas no sitemap');
check((sitemap.match(/<url>/g) || []).length === urls.length, 'Estrutura do sitemap inválida');
for (const m of sitemap.matchAll(/<lastmod>([^<]+)<\/lastmod>/g)) check(/^\d{4}-\d{2}-\d{2}$/.test(m[1]) && m[1] <= today, 'lastmod inválido: ' + m[1]);
for (const [url, html] of documents) {
  const label = fileFor(new URL(url));
  check(new URL(url).origin === origin && url.startsWith('https://'), label + ': domínio incorreto');
  check(/<html lang="pt-BR">/.test(html), label + ': idioma incorreto');
  check((html.match(/<h1\b/g) || []).length === 1, label + ': precisa de um H1');
  const title = text(html.match(/<title>([^]*?)<\/title>/)?.[1] || '');
  check(Boolean(title) && !titles.has(title), label + ': title vazio ou repetido'); titles.add(title);
  const ts = tags(html);
  const metas = ts.filter(t => /^<meta\b/.test(t)).map(attributes);
  const meta = name => metas.filter(m => (m.name || m.property) === name);
  for (const name of ['description', 'viewport', 'robots', 'og:title', 'og:description', 'og:url', 'og:image', 'og:type', 'og:locale', 'twitter:card', 'twitter:title', 'twitter:description', 'twitter:image']) check(meta(name).length === 1 && Boolean(meta(name)[0]?.content), label + ': meta ausente ou duplicada ' + name);
  const description = meta('description')[0]?.content;
  check(!descriptions.has(description), label + ': description repetida'); descriptions.add(description);
  check(!meta('robots')[0]?.content.includes('noindex'), label + ': noindex no sitemap');
  check(meta('og:url')[0]?.content === url, label + ': og:url não é canônico');
  check(meta('twitter:card')[0]?.content === 'summary_large_image', label + ': Twitter Card inválido');
  const canonicals = ts.filter(t => /^<link\b/.test(t)).map(attributes).filter(a => a.rel === 'canonical');
  check(canonicals.length === 1 && canonicals[0].href === url, label + ': canonical incorreto');
  check(ts.some(t => /^<link\b/.test(t) && attributes(t).rel === 'icon'), label + ': favicon ausente');
  const ids = ts.map(attributes).map(a => a.id).filter(Boolean);
  check(ids.length === new Set(ids).size, label + ': IDs duplicados');
  const structured = schemas(html);
  for (const obj of structured) {
    check(obj['@context'] === 'https://schema.org' && obj['@type'], label + ': schema incompleto');
    if (obj['@type'] === 'FAQPage') {
      const questions = [...html.matchAll(/<article class="faq-item">[^]*?<span>([^]*?)<\/span>[^]*?<p>([^]*?)<\/p>[^]*?<\/article>/g)].map(m => [text(m[1]), text(m[2])]);
      questions.push(...[...html.matchAll(/<details class="faq-item">\s*<summary>([^]*?)<\/summary>\s*<p>([^]*?)<\/p>\s*<\/details>/g)].map(m => [text(m[1]), text(m[2])]));
      check(questions.length > 0 && questions.length === obj.mainEntity.length, label + ': FAQ não corresponde ao HTML');
      for (const [q, a] of questions) check(obj.mainEntity.some(e => e.name === q && e.acceptedAnswer.text === a), label + ': FAQ divergente: ' + q);
    }
    if (obj['@type'] === 'BreadcrumbList') for (const item of obj.itemListElement) check(html.includes('>' + item.name + '<'), label + ': breadcrumb sem correspondência: ' + item.name);
  }
  for (const tag of ts) {
    const a = attributes(tag);
    if (/^<img\b/.test(tag)) {
      check(Object.hasOwn(a, 'alt'), label + ': imagem sem alt');
      check(Number(a.width) > 0 && Number(a.height) > 0, label + ': imagem sem dimensões ' + a.src);
    }
    if (a['aria-controls']) check(ids.includes(a['aria-controls']), label + ': aria-controls inexistente ' + a['aria-controls']);
    const href = a.src || a.href;
    if (!href || /^(mailto:|tel:|data:|javascript:)/.test(href)) continue;
    const target = new URL(href.replaceAll('&amp;', '&'), url);
    if (target.origin !== origin) continue;
    const targetFile = fileFor(target);
    check(fs.existsSync(path.join(root, targetFile)), label + ': arquivo inexistente ' + href);
    if (target.hash && targetFile.endsWith('.html') && fs.existsSync(path.join(root, targetFile))) {
      const targetHtml = read(targetFile);
      const targetIds = tags(targetHtml).map(attributes).map(a => a.id);
      check(targetIds.includes(decodeURIComponent(target.hash.slice(1))), label + ': âncora inexistente ' + href);
    }
    if (/^<a\b/.test(tag)) { target.hash = ''; incoming.add(target.href); }
  }
  for (const m of html.matchAll(/<script(?![^>]*type="application\/ld\+json")[^>]*>([^]*?)<\/script>/g)) {
    try { new vm.Script(m[1], { filename: label }); checks++; } catch (e) { errors.push(label + ': JavaScript inválido: ' + e.message); }
  }
  for (const name of ['og:image', 'twitter:image']) check(fs.existsSync(path.join(root, fileFor(new URL(meta(name)[0].content)))), label + ': imagem social inexistente');
}
for (const url of urls) check(incoming.has(url), 'Página órfã: ' + url);
for (const f of fs.readdirSync(root).filter(f => f.endsWith('.html') && !f.includes('bkp') && f !== '404.html')) check(documents.has(origin + (f === 'index.html' ? '/' : '/' + f)), 'Página pública ausente do sitemap: ' + f);
check(/name="robots" content="noindex/.test(read('404.html')), '404 indexável');
check(/name="robots" content="noindex/.test(read('index - bkp 04-09-2026.html')), 'Backup indexável');
const robots = read('robots.txt');
check(robots.includes('Sitemap: ' + origin + '/sitemap.xml'), 'Referência ao sitemap ausente no robots');
check(!/^Disallow:\s*\/\s*$/m.test(robots), 'Site bloqueado no robots');
for (const file of fs.readdirSync(path.join(root, 'assets')).filter(f => f.endsWith('.js'))) { try { new vm.Script(read('assets/' + file)); checks++; } catch(e) { errors.push(file + ': ' + e.message); } }
console.log(JSON.stringify({ pages: documents.size, checks, errors }, null, 2));
if (errors.length) process.exitCode = 1;
