// Gera HTML estático a partir da fonte única de dados, sem dependências de runtime.
const fs = require('node:fs');
const path = require('node:path');
const assert = require('node:assert/strict');
const root = path.resolve(__dirname, '..');
const { signupUrl, quoteUrl, plans } = JSON.parse(fs.readFileSync(path.join(root, 'assets/plans.json'), 'utf8'));
const escape = value => String(value).replace(/[&<>"']/g, char => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));
const currency = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });
assert.equal(new URL(signupUrl).protocol, 'https:');
assert.equal(new URL(quoteUrl).protocol, 'https:');
assert.equal(new Set(plans.map(plan => plan.id)).size, plans.length, 'IDs de planos devem ser únicos');
function renderPlan(plan) {
  assert.match(plan.id, /^[a-z][a-z-]*$/);
  assert.ok(plan.name && plan.description && plan.features.length);
  assert.ok(plan.price === null || (Number.isFinite(plan.price) && plan.price > 0));
  assert.ok(Number.isInteger(plan.capacityFeatureCount) && plan.capacityFeatureCount > 0 && plan.capacityFeatureCount < plan.features.length);
  const custom = plan.price === null;
  const cta = custom ? 'Solicitar orçamento' : 'Começar teste gratuito';
  const renderFeatures = features => features.map(feature => `              <li><span>${escape(feature).replace(/^((?:Até )?[\d.,]+)(?= )/, '<strong>$1</strong>')}</span></li>`).join('\n');
  return `        <article class="price-card${plan.recommended ? ' recommended' : ''}" aria-labelledby="plan-${escape(plan.id)}">
          ${plan.recommended ? '<span class="recommended-label">Mais escolhido</span>\n          ' : ''}<h3 class="plan-name" id="plan-${escape(plan.id)}">${escape(plan.name)}</h3>
          <p class="plan-description">${escape(plan.description)}</p>
          <p class="plan-price${custom ? ' custom-price' : ''}">${custom ? 'Sob consulta' : `${escape(currency.format(plan.price))} <small>/mês</small>`}</p>
          <div class="plan-group plan-capacity">
            <h4>${custom ? 'Configuração da operação' : 'Capacidade do plano'}</h4>
            <ul class="plan-features">
${renderFeatures(plan.features.slice(0, plan.capacityFeatureCount))}
            </ul>
          </div>
          <details class="plan-group plan-included">
            <summary>${custom ? 'Ver serviços sob proposta' : 'Ver recursos incluídos'}</summary>
            <ul class="plan-features">
${renderFeatures(plan.features.slice(plan.capacityFeatureCount))}
            </ul>
          </details>
          <a class="button ${plan.recommended ? 'primary' : 'secondary'}" href="${escape(custom ? quoteUrl : signupUrl)}" target="_blank" rel="noopener noreferrer" aria-label="${escape(cta)}: ${escape(plan.name)}">${cta}</a>
        </article>`;
}
const section = `    <!-- plans:start | Gerado por tools/render-plans.cjs; editar assets/plans.json. -->
    <section class="section pricing-section" id="planos" aria-labelledby="pricing-title" aria-describedby="pricing-description">
      <div class="container">
        <div class="section-heading center">
          <span class="eyebrow">CRM para WhatsApp com IA</span>
          <h2 id="pricing-title">Um plano para cada operação</h2>
          <p id="pricing-description">Compare a capacidade e explore os recursos de cada plano.</p>
        </div>
        <div class="pricing-grid">
${plans.map(renderPlan).join('\n')}
        </div>
        <p class="plan-note">Os planos incluem os recursos e limites contratados. Tarifas de mensagens cobradas pela Meta, serviços adicionais e integrações personalizadas podem ter custos separados. Consulte as <a href="termos-de-uso.html">condições de contratação</a>.</p>
      </div>
    </section>
    <!-- plans:end -->`;
const file = path.join(root, 'index.html');
const html = fs.readFileSync(file, 'utf8');
const region = /    <!-- plans:start[^]*?<!-- plans:end -->/;
assert.ok(region.test(html), 'Marcadores da seção de planos não encontrados');
const output = html.replace(region, section);
if (process.argv.includes('--check')) {
  assert.equal(html, output, 'HTML dos planos desatualizado. Execute node tools/render-plans.cjs');
  console.log('Planos: dados válidos e HTML estático atualizado.');
} else {
  fs.writeFileSync(file, output);
  console.log('Seção de planos gerada em index.html.');
}
