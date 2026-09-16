/* NP Yachts — comportamentos de interface */
(function () {
  'use strict';

  var header = document.querySelector('.header');
  var burger = document.querySelector('.burger');
  var nav = header ? header.querySelector('.nav') : null;

  /* Header ganha fundo sólido depois do topo ----------------------------- */
  if (header) {
    var solid = function () {
      header.classList.toggle('is-solid', window.scrollY > 40);
    };
    solid();
    window.addEventListener('scroll', solid, { passive: true });
  }

  /* Menu mobile ---------------------------------------------------------- */
  if (burger && header && nav) {
    if (!nav.id) nav.id = 'main-navigation';
    burger.setAttribute('aria-controls', nav.id);

    var closeMenu = function () {
      header.classList.remove('is-open');
      document.body.classList.remove('menu-open');
      burger.setAttribute('aria-expanded', 'false');
      burger.setAttribute('aria-label', 'Abrir menu');
    };

    burger.addEventListener('click', function () {
      var open = header.classList.toggle('is-open');
      document.body.classList.toggle('menu-open', open);
      burger.setAttribute('aria-expanded', open ? 'true' : 'false');
      burger.setAttribute('aria-label', open ? 'Fechar menu' : 'Abrir menu');
    });

    nav.addEventListener('click', function (event) {
      if (event.target.closest('a') && header.classList.contains('is-open')) {
        closeMenu();
      }
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && header.classList.contains('is-open')) {
        closeMenu();
        burger.focus();
      }
    });

    var desktopMenu = window.matchMedia('(min-width: 821px)');
    desktopMenu.addEventListener('change', function (event) {
      if (event.matches) closeMenu();
    });
  }

  /* Reveal ao entrar na viewport ----------------------------------------- */
  var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var items = document.querySelectorAll('.reveal');

  if (reduced || !('IntersectionObserver' in window)) {
    items.forEach(function (el) { el.classList.add('is-in'); });
  } else {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-in');
          io.unobserve(entry.target);
        }
      });
    }, { rootMargin: '0px 0px -12% 0px', threshold: 0.05 });

    items.forEach(function (el) { io.observe(el); });
  }

  /* Carrossel do hero — troca a cada 5 s ---------------------------------- */
  var stage = document.querySelector('[data-hero-slider]');
  if (stage) {
    var slides = Array.prototype.slice.call(stage.querySelectorAll('.hero__slide'));
    var hero = stage.closest('.hero');
    var dots = Array.prototype.slice.call(hero.querySelectorAll('.hero__dot'));

    if (slides.length > 1) {
      var current = 0;
      var timer = null;
      var DELAY = 5000;

      var show = function (next) {
        slides[current].classList.remove('is-active');
        if (dots[current]) dots[current].setAttribute('aria-current', 'false');
        current = (next + slides.length) % slides.length;
        slides[current].classList.add('is-active');
        if (dots[current]) dots[current].setAttribute('aria-current', 'true');
      };

      var start = function () {
        stop();
        if (!window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
          timer = setInterval(function () { show(current + 1); }, DELAY);
        }
      };
      var stop = function () {
        if (timer) { clearInterval(timer); timer = null; }
      };

      dots.forEach(function (dot, i) {
        dot.addEventListener('click', function () { show(i); start(); });
      });

      stage.addEventListener('mouseenter', stop);
      stage.addEventListener('mouseleave', start);
      stage.addEventListener('focusin', stop);
      stage.addEventListener('focusout', start);

      /* Não gasta ciclo nem banda com a aba em segundo plano */
      document.addEventListener('visibilitychange', function () {
        if (document.hidden) { stop(); } else { start(); }
      });

      start();
    }
  }

  /* Lightbox da galeria --------------------------------------------------- */
  var zooms = Array.prototype.slice.call(document.querySelectorAll('[data-zoom]'));
  if (zooms.length) {
    var lb = document.createElement('div');
    lb.className = 'lb';
    lb.setAttribute('role', 'dialog');
    lb.setAttribute('aria-modal', 'true');
    lb.setAttribute('aria-label', 'Galeria ampliada');
    lb.innerHTML =
      '<button class="lb__close" type="button" aria-label="Fechar">&times;</button>' +
      '<button class="lb__prev" type="button" aria-label="Imagem anterior">' +
        '<svg width="22" height="10" viewBox="0 0 18 8" fill="none" style="transform:rotate(180deg)">' +
        '<path d="M0 4h16M13 1l3 3-3 3" stroke="currentColor" stroke-width="1.3"/></svg></button>' +
      '<button class="lb__next" type="button" aria-label="Próxima imagem">' +
        '<svg width="22" height="10" viewBox="0 0 18 8" fill="none">' +
        '<path d="M0 4h16M13 1l3 3-3 3" stroke="currentColor" stroke-width="1.3"/></svg></button>' +
      '<img alt=""><div class="lb__count"></div>';
    document.body.appendChild(lb);

    var lbImg = lb.querySelector('img');
    var lbCount = lb.querySelector('.lb__count');
    var atual = 0;
    var aberto = false;
    var focusBeforeOpen = null;

    var pinta = function (i) {
      atual = (i + zooms.length) % zooms.length;
      lbImg.src = zooms[atual].src;
      lbImg.alt = zooms[atual].alt || '';
      lbCount.textContent = (atual + 1) + ' / ' + zooms.length;
      lb.querySelector('.lb__prev').hidden = zooms.length < 2;
      lb.querySelector('.lb__next').hidden = zooms.length < 2;
    };
    var abre = function (i) {
      focusBeforeOpen = document.activeElement;
      pinta(i);
      lb.classList.add('is-open');
      document.body.classList.add('has-modal');
      aberto = true;
      lb.querySelector('.lb__close').focus();
    };
    var fecha = function () {
      lb.classList.remove('is-open');
      document.body.classList.remove('has-modal');
      aberto = false;
      if (focusBeforeOpen) focusBeforeOpen.focus();
    };

    zooms.forEach(function (img, i) {
      img.setAttribute('role', 'button');
      img.setAttribute('tabindex', '0');
      img.setAttribute('aria-haspopup', 'dialog');
      img.setAttribute('aria-label', 'Ampliar: ' + (img.alt || 'imagem'));
      img.addEventListener('click', function () { abre(i); });
      img.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          abre(i);
        }
      });
    });
    lb.querySelector('.lb__close').addEventListener('click', fecha);
    lb.querySelector('.lb__prev').addEventListener('click', function (e) {
      e.stopPropagation(); pinta(atual - 1);
    });
    lb.querySelector('.lb__next').addEventListener('click', function (e) {
      e.stopPropagation(); pinta(atual + 1);
    });
    lb.addEventListener('click', function (e) { if (e.target === lb) fecha(); });

    document.addEventListener('keydown', function (e) {
      if (!aberto) return;
      if (e.key === 'Escape') fecha();
      if (e.key === 'ArrowLeft') pinta(atual - 1);
      if (e.key === 'ArrowRight') pinta(atual + 1);
      if (e.key === 'Tab') {
        var controls = Array.prototype.slice.call(lb.querySelectorAll('button:not([hidden])'));
        var first = controls[0];
        var last = controls[controls.length - 1];
        if (e.shiftKey && document.activeElement === first) {
          e.preventDefault();
          last.focus();
        } else if (!e.shiftKey && document.activeElement === last) {
          e.preventDefault();
          first.focus();
        }
      }
    });
  }

  /* Formulário de contato — protótipo sem back-end ----------------------- */
  var form = document.querySelector('[data-contact-form]');
  if (form) {
    var requestedModel = new URLSearchParams(window.location.search).get('modelo');
    var modelField = form.elements.modelo;
    var normalizeModel = function (value) {
      return value.toLowerCase().replace(/[^a-z0-9]/g, '');
    };

    if (requestedModel && modelField) {
      Array.prototype.some.call(modelField.options, function (option) {
        if (normalizeModel(option.textContent) === normalizeModel(requestedModel)) {
          modelField.value = option.value;
          return true;
        }
        return false;
      });
    }

    form.addEventListener('submit', function (e) {
      e.preventDefault();
      var status = form.querySelector('[data-form-status]');
      if (status) {
        status.textContent =
          'Protótipo: o envio ainda não está conectado. Integrar com o e-mail comercial ou CRM antes de publicar.';
        status.hidden = false;
      }
    });
  }
})();
