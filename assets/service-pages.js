const reducedMotion=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
const mainNavigation=document.querySelector('.site-header .nav-links');
if(mainNavigation){
  mainNavigation.innerHTML='<a href="index.html#solucoes">Soluções</a><a href="index.html#cenarios">Cenários</a><a href="index.html#como-funciona">Como funciona</a><a href="index.html#planos">Planos</a><a href="artigos.html">Artigos</a>';
}
const platformLink=document.querySelector('.site-header .back-link');
if(platformLink){
  platformLink.href='https://app.automaleads.cloud/webhook/cadastrar';
  platformLink.target='_blank';
  platformLink.rel='noopener';
  platformLink.textContent='Entrar na plataforma';
}
if(!reducedMotion&&'IntersectionObserver' in window){
  const revealObserver=new IntersectionObserver(entries=>entries.forEach(entry=>{if(entry.isIntersecting){entry.target.classList.add('visible');revealObserver.unobserve(entry.target)}}),{threshold:.12});
  document.querySelectorAll('.reveal').forEach(element=>revealObserver.observe(element));
}else{
  document.querySelectorAll('.reveal').forEach(element=>element.classList.add('visible'));
}
document.querySelectorAll('[data-year]').forEach(element=>element.textContent=new Date().getFullYear());
