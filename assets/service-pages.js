const reducedMotion=window.matchMedia('(prefers-reduced-motion: reduce)').matches;
if(!reducedMotion&&'IntersectionObserver' in window){
  const revealObserver=new IntersectionObserver(entries=>entries.forEach(entry=>{if(entry.isIntersecting){entry.target.classList.add('visible');revealObserver.unobserve(entry.target)}}),{threshold:.12});
  document.querySelectorAll('.reveal').forEach(element=>revealObserver.observe(element));
}else{
  document.querySelectorAll('.reveal').forEach(element=>element.classList.add('visible'));
}
document.querySelectorAll('[data-year]').forEach(element=>element.textContent=new Date().getFullYear());
