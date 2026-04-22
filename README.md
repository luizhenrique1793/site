# AutomaLeads — Site Institucional

Landing pages da plataforma AutomaLeads e suas marcas guarda-chuva.

## Estrutura

```
automaleads-site/
├── index.html          → automaleads.com        (página principal)
├── atendefit/
│   └── index.html      → automaleads.com/atendefit
├── assets/
│   ├── logo.png        → logo principal AutomaLeads
│   ├── favicon.png     → favicon do site
│   └── og-image.jpg    → imagem Open Graph (1200×630px)
└── README.md
```

## Deploy

### GitHub Pages
1. Vá em **Settings → Pages**
2. Source: `Deploy from a branch`
3. Branch: `main` / `root`
4. O site ficará disponível em `https://seu-usuario.github.io/automaleads-site/`

### Domínio customizado (automaleads.com)
1. Em **Settings → Pages → Custom domain**, adicione `automaleads.com`
2. No painel DNS do seu domínio, configure:

```
Tipo   Nome    Valor
A      @       185.199.108.153
A      @       185.199.109.153
A      @       185.199.110.153
A      @       185.199.111.153
CNAME  www     seu-usuario.github.io
```

3. Aguarde propagação (até 24h)
4. Marque **Enforce HTTPS**

## Assets necessários

Adicione na pasta `/assets` antes do deploy:

| Arquivo | Tamanho recomendado | Onde é usado |
|---|---|---|
| `logo.png` | 300×80px (fundo transparente) | Navbar AutomaLeads |
| `favicon.png` | 512×512px | Aba do navegador |
| `og-image.jpg` | 1200×630px | Compartilhamento em redes sociais |
| `atendefit-og.jpg` | 1200×630px | OG da página AtendeFIT |

## Páginas

| URL | Arquivo | Descrição |
|---|---|---|
| `automaleads.com` | `index.html` | Landing page principal |
| `automaleads.com/atendefit` | `atendefit/index.html` | Agente de IA para academias |

## Contato / WhatsApp

Número configurado: `+55 (44) 99881-3718`
Link cadastro: `https://app.automaleads.cloud/webhook/cadastrar`
