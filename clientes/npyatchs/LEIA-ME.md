# NP YACHTS — Site

Site estático em HTML, CSS e JavaScript puro. Sem build, sem framework, sem dependência
de servidor. Abra `index.html` no navegador e ele funciona.

---

## Como usar

1. Descompacte `np-yachts-site.zip`.
2. Mantenha a pasta `assets/` no mesmo nível dos arquivos `.html`.
3. Abra `index.html`.

**A estrutura de pastas não pode mudar.** Todas as páginas chamam os arquivos por caminho
relativo:

```html
<link rel="stylesheet" href="assets/css/style.css">
<script src="assets/js/main.js"></script>
```

Se você abrir um `.html` solto, fora da pasta, a página carrega sem estilo e sem
comportamento — não é erro do arquivo, é o caminho que deixou de existir.

---

## Estrutura

```
np-yachts/
├── index.html                 Home
├── barcos.html                Os doze modelos
├── modelo-*.html              12 páginas de modelo
├── schaefer.html              Institucional do estaleiro
├── np-yachts.html             Institucional da revenda
├── contato.html               Formulário comercial
├── assets/
│   ├── css/style.css          Design system completo em tokens
│   ├── js/main.js             Menu, header, carrossel, reveal, lightbox
│   ├── img/                   Fotos otimizadas para web
│   └── logo/                  Marcas em PNG e SVG
├── BASE-DE-CONTEUDO-MODELOS.md
└── LEIA-ME.md
```

---

## O que o CSS entrega

Um único arquivo, organizado em blocos comentados. Os tokens ficam em `:root` — cores,
tipografia, grid, espaçamento, radius e curvas de transição. Trocar um valor ali propaga
para o site inteiro.

Depois vêm, em ordem: reset, estrutura, tipografia, grafismo da marca, botões, header,
hero, grade de modelos, blocos editoriais, especificações, galeria, formulário,
assinatura 70/30, rodapé e o responsivo.

## O que o JavaScript entrega

Também em arquivo único, sem bibliotecas externas:

- Header que ganha fundo sólido ao rolar
- Menu mobile com fechamento por Esc
- Carrossel do banner, com troca a cada 5 segundos e pausa quando a aba perde o foco
- Reveal das seções ao entrar na tela
- Lightbox da galeria, com setas, contador, fechamento por Esc ou clique fora
- Formulário de contato — hoje só exibe aviso, sem envio

Tudo respeita `prefers-reduced-motion`.

---

## Publicação

Por ser estático, sobe em qualquer hospedagem: Vercel, Netlify, Cloudflare Pages, GitHub
Pages, ou FTP comum. Basta enviar a pasta inteira.

Antes de publicar, resolva:

1. **Backend do formulário.** Em `assets/js/main.js`, no bloco marcado como protótipo.
2. **Fonte Montserrat.** Vem do Google Fonts por CDN. Para hospedar localmente, baixe os
   arquivos e troque o `<link>` do `<head>` por `@font-face`.
3. **Vídeo do YouTube.** A home embute o vídeo institucional da Schaefer e depende de
   conexão.
4. **Placeholders.** Todo espaço de imagem ainda pendente aparece como bloco azul
   hachurado. Nenhum deles deve ir ao ar.

---

## Regerando as páginas

As doze páginas de modelo e a listagem saem de um gerador em Python, a partir de uma única
estrutura de dados com nome, medidas, textos, diferenciais e especificações de cada barco.
Editar um modelo é editar essa estrutura e rodar o gerador de novo — não é preciso mexer em
doze arquivos HTML à mão.
