// Comportamentos exclusivos da home; páginas internas e backup mantêm o padrão anterior.
(() => {
  const banner = document.querySelector('.privacy-consent');
  if (banner) {
    const paragraph = banner.querySelector('p');
    const policy = paragraph?.querySelector('a');
    if (paragraph && policy) {
      policy.textContent = 'Privacidade';
      paragraph.replaceChildren(document.createTextNode('Cookies opcionais ajudam a melhorar o site. '), policy, document.createTextNode('.'));
    }
    const syncBannerHeight = () => document.body.style.setProperty('--consent-height', `${banner.getBoundingClientRect().height}px`);
    syncBannerHeight();
    if ('ResizeObserver' in window) new ResizeObserver(syncBannerHeight).observe(banner);
    // Após aceitar ou recusar, devolve o WhatsApp à posição original.
    const observer = new MutationObserver(() => {
      if (!banner.isConnected) {
        document.body.style.removeProperty('--consent-height');
        observer.disconnect();
      }
    });
    observer.observe(document.body, { childList: true });
  }

  const tabs = [...document.querySelectorAll('.tab[role="tab"]')];
  const syncTabs = () => tabs.forEach(tab => { tab.tabIndex = tab.getAttribute('aria-selected') === 'true' ? 0 : -1; });
  tabs.forEach((tab, index) => {
    tab.addEventListener('click', syncTabs);
    tab.addEventListener('keydown', event => {
      let next;
      if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
      else if (event.key === 'ArrowLeft') next = (index - 1 + tabs.length) % tabs.length;
      else if (event.key === 'Home') next = 0;
      else if (event.key === 'End') next = tabs.length - 1;
      else return;
      event.preventDefault();
      tabs[next].click();
      tabs[next].focus();
    });
  });
  syncTabs();
})();
