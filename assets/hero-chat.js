// Conversa ilustrativa local. Não acessa a plataforma nem envia mensagens.
(() => {
  const chat = document.querySelector('[data-hero-chat]');
  if (!chat) return;
  const steps = [...chat.querySelectorAll('[data-chat-step]')];
  const controls = chat.querySelector('.chat-demo-controls');
  const pauseButton = chat.querySelector('[data-chat-pause]');
  const replayButton = chat.querySelector('[data-chat-replay]');
  const motion = window.matchMedia('(prefers-reduced-motion: reduce)');
  let nextStep = 0;
  let timer = null;
  let playing = false;
  let resumeOnReturn = false;
  let inView = true;

  const clearTimer = () => { clearTimeout(timer); timer = null; };
  function finish() {
    clearTimer();
    playing = false;
    nextStep = steps.length;
    steps.forEach(step => step.classList.add('is-visible'));
    pauseButton.hidden = true;
  }
  function advance() {
    if (!playing) return;
    steps[nextStep++].classList.add('is-visible');
    if (nextStep === steps.length) { finish(); return; }
    timer = setTimeout(advance, nextStep === steps.length - 1 ? 1100 : 950);
  }
  function pause() {
    clearTimer();
    playing = false;
    pauseButton.textContent = 'Continuar';
  }
  function resume() {
    if (motion.matches || nextStep >= steps.length) return;
    playing = true;
    pauseButton.hidden = false;
    pauseButton.textContent = 'Pausar';
    advance();
  }
  function replay() {
    clearTimer();
    if (motion.matches) { finish(); return; }
    chat.classList.add('is-playing');
    steps.forEach(step => step.classList.remove('is-visible'));
    nextStep = 0;
    resumeOnReturn = false;
    resume();
  }
  pauseButton.addEventListener('click', () => {
    resumeOnReturn = false;
    if (playing) pause(); else resume();
  });
  replayButton.addEventListener('click', replay);
  function updateMotion() {
    controls.hidden = motion.matches;
    if (motion.matches) {
      chat.classList.remove('is-playing');
      resumeOnReturn = false;
      finish();
    }
  }
  motion.addEventListener('change', updateMotion);
  updateMotion();
  let started = motion.matches;
  function updateVisibility() {
    const visible = inView && !document.hidden;
    if (!visible && playing) { resumeOnReturn = true; pause(); }
    else if (visible && !started && !motion.matches) { started = true; replay(); }
    else if (visible && resumeOnReturn && !motion.matches) { resumeOnReturn = false; resume(); }
  }
  document.addEventListener('visibilitychange', updateVisibility);
  if ('IntersectionObserver' in window) {
    new IntersectionObserver(entries => {
      inView = entries[0].isIntersecting;
      updateVisibility();
    }, { threshold: .25 }).observe(chat);
  } else updateVisibility();
})();
