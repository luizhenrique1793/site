(() => {
  const end = Date.parse('2026-11-04T13:38:55-03:00');
  const banner = document.getElementById('promotion-banner');
  const countdown = document.getElementById('promotion-countdown');
  if (!banner || !countdown) return;
  const prices = [...document.querySelectorAll('[data-regular-price]')];
  const currency = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });
  const originals = prices.map(price => {
    const link = price.closest('.price-card').querySelector('a.button');
    return { price, link, html: price.innerHTML, href: link.href, label: link.textContent, aria: link.getAttribute('aria-label') };
  });
  let active = false;
  function update() {
    const remaining = end - Date.now();
    if (remaining <= 0) {
      banner.hidden = true;
      if (active) originals.forEach(({ price, link, html, href, label, aria }) => {
        price.innerHTML = html;
        link.href = href;
        link.textContent = label;
        link.setAttribute('aria-label', aria);
      });
      active = false;
      return;
    }
    if (!active) {
      originals.forEach(({ price, link }) => {
        const regular = Number(price.dataset.regularPrice);
        price.innerHTML = `<span class="promotion-old">De ${currency.format(regular)}/mês</span>${currency.format(regular - 100)} <small>/mês nos 6 primeiros meses<br>Depois, ${currency.format(regular)}/mês</small>`;
        const message = `Olá, quero contratar o plano ${price.dataset.planName} com R$ 100 de desconto nas 6 primeiras mensalidades.`;
        link.href = `https://wa.me/5544974006015?text=${encodeURIComponent(message)}`;
        link.textContent = 'Solicitar oferta';
        link.setAttribute('aria-label', `Solicitar oferta: ${price.dataset.planName}`);
      });
      banner.hidden = false;
      active = true;
    }
    const seconds = Math.floor(remaining / 1000);
    const days = Math.floor(seconds / 86400);
    const hours = Math.floor(seconds / 3600) % 24;
    const minutes = Math.floor(seconds / 60) % 60;
    countdown.textContent = `${days}d ${String(hours).padStart(2, '0')}h ${String(minutes).padStart(2, '0')}min ${String(seconds % 60).padStart(2, '0')}s`;
  }
  update();
  setInterval(update, 1000);
})();
