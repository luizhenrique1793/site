(()=>{
  const key='automaleads_cookie_consent';
  const updateConsent=granted=>{
    if(typeof window.gtag==='function')window.gtag('consent','update',{
      ad_storage:granted?'granted':'denied',
      analytics_storage:granted?'granted':'denied',
      ad_user_data:granted?'granted':'denied',
      ad_personalization:granted?'granted':'denied'
    });
  };
  let saved=null;
  try{saved=localStorage.getItem(key)}catch(error){}
  if(saved){updateConsent(saved==='accepted');return}
  const banner=document.createElement('div');
  const privacyUrl=new URL('../politica-de-privacidade.html',document.currentScript.src).href;
  banner.className='privacy-consent visible';
  banner.setAttribute('role','dialog');
  banner.setAttribute('aria-label','Preferências de privacidade');
  banner.innerHTML=`<p>Usamos dados de navegação para medir o desempenho do site e melhorar sua experiência. Você pode aceitar ou continuar apenas com os recursos essenciais. <a href="${privacyUrl}">Saiba mais</a>.</p><div class="privacy-actions"><button type="button" data-consent="rejected">Somente essenciais</button><button class="accept" type="button" data-consent="accepted">Aceitar</button></div>`;
  document.body.appendChild(banner);
  banner.querySelectorAll('[data-consent]').forEach(button=>button.addEventListener('click',()=>{
    const value=button.dataset.consent;
    try{localStorage.setItem(key,value)}catch(error){}
    updateConsent(value==='accepted');
    banner.remove();
  }));
})();
