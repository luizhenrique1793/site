# AutomaLeads — site institucional

Site estático da AutomaLeads, suas páginas de serviços e a landing page AtendeFIT.

## Estrutura

```text
index.html                       Home principal
agentes-ia-whatsapp-maringa.html  IA para WhatsApp em Maringá
artigos.html                    Guias de IA, WhatsApp e vendas
campanhas-whatsapp.html          Campanhas e disparos segmentados
crm-integracoes.html             CRM, APIs e integrações
sites-integrados.html            Sites e landing pages
trafego-funil.html               Tráfego pago e funis
politica-de-privacidade.html     Política de privacidade
termos-de-uso.html               Termos de uso
404.html                         Página de erro
atendefit/index.html             Landing page AtendeFIT
assets/                          Imagens, CSS e JavaScript compartilhados
robots.txt                       Regras para mecanismos de busca
sitemap.xml                      URLs indexáveis
CNAME                            Domínio do GitHub Pages
tools/validate-seo.cjs           Validação local de SEO sem dependências
assets/plans.json               Dados comerciais dos quatro planos
assets/pricing.css              Estilos responsivos da seção de planos
assets/home-refresh.css         Direção visual exclusiva da home
assets/home-refresh.js          Ajustes de privacidade e navegação das abas
assets/home-contrast.css        Seções claras e simulação do WhatsApp
assets/hero-chat.js             Controles da conversa ilustrativa
assets/telas/                   Capturas preparadas para apresentação pública
index-bkp-20-10-2026.html         Backup visual da home antes da revisão
tools/render-plans.cjs           Geração e conferência do HTML dos planos
PRICING_UPDATE.md                Relatório da atualização comercial
SEO_IMPLEMENTATION.md           Relatório das melhorias de SEO
```

## Executar localmente

O projeto não possui processo de build ou dependências. Pode ser aberto diretamente ou servido por qualquer servidor HTTP estático.

Exemplo com Python:

```powershell
python -m http.server 8000
```

Depois, acesse `http://localhost:8000`.

## Publicação no GitHub Pages

1. Publique os arquivos na branch configurada para o GitHub Pages.
2. Em **Settings → Pages**, selecione `Deploy from a branch`.
3. Confirme o domínio `automaleads.com` e ative **Enforce HTTPS**.
4. Verifique se o arquivo `CNAME` permanece no deploy.

DNS esperado para o domínio raiz:

```text
A  @  185.199.108.153
A  @  185.199.109.153
A  @  185.199.110.153
A  @  185.199.111.153
```

O `www` deve apontar via CNAME para o domínio GitHub Pages do repositório.

## Configurações preservadas

- Google tag: `AW-18138072784`
- Cadastro: `https://app.automaleads.com/criar-cadastro`
- Acesso à plataforma: `http://app.automaleads.com/`, informado pelo responsável pelo site.
- WhatsApp principal: `+55 (44) 99881-3718`
- WhatsApp AtendeFIT: `+55 (44) 98838-5503`

## Antes do deploy

- Confirmar preços, limites e condições do teste grátis.
- Revisar Termos e Política de Privacidade com orientação jurídica.
- Validar os resultados, métricas e provas sociais da página AtendeFIT.
- Testar todos os CTAs em produção e confirmar o recebimento no WhatsApp.

## Validar SEO antes de publicar

Com Node.js instalado, execute:

```powershell
node tools/validate-seo.cjs
```

O validador verifica as páginas do sitemap, títulos e descriptions únicos, canonical, Open Graph, Twitter Card, links, âncoras, imagens, JSON-LD, correspondência das FAQs e sintaxe dos scripts. Ele não mede Core Web Vitals nem substitui a revisão visual em desktop e mobile.

## Atualizar planos

Edite `assets/plans.json` e execute `node tools/render-plans.cjs` para atualizar a seção estática em `index.html`. Os cards são entregues no HTML e não dependem de JavaScript no navegador. Não há alterações no CRM ou no banco de dados.

Execute `node tools/render-plans.cjs --check` para conferir se o HTML corresponde aos dados antes de publicar. O período do teste não é anunciado até ser confirmado na configuração real do CRM. O relatório `PRICING_UPDATE.md` registra os CTAs alterados e as verificações realizadas.

## Revisão visual da home

A versão anterior está em `index-bkp-20-10-2026.html`, com os estilos anteriores dos planos embutidos e `noindex, nofollow`. Ela usa as imagens, vídeos e arquivos compartilhados existentes, que foram preservados. Não está na navegação nem no sitemap. Para restaurá-la como página principal, é necessário também restabelecer a meta robots indexável.

A home atual tem CTA inicial visível e hero com 150vh no desktop (antes, 340vh). O topo apresenta uma conversa ilustrativa entre cliente e agente de IA, com qualificação do interesse e contexto organizado para o CRM. A galeria mantém as três capturas reais da plataforma. Áreas claras de serviços, cenários, recursos, calculadora e FAQ alternam com demonstração, processo, atuação e planos em fundo escuro. Os planos separam capacidade e recursos sem alterar preços ou benefícios. O aviso de cookies é compacto somente na home e o WhatsApp se reposiciona conforme a altura do aviso. As páginas internas mantêm seus estilos e comportamentos anteriores.

Verificação local: Chrome headless em larguras de 1.440, 1.024, 768, 390 e 320 px, capturas inspecionadas, carregamento das imagens, alinhamento dos planos, menu mobile, recusa dos cookies opcionais, FAQ, navegação por teclado nas abas e movimento reduzido. Os comandos de SEO e consistência dos planos continuam aplicáveis. As telas foram preparadas a partir das capturas fornecidas, com recorte e ocultação de dados pelo Imagegen integrado. Os JPEGs públicos somam 318.318 bytes, com detalhes em `assets/telas/LEIA-ME.md`. Sem JavaScript, a galeria exibe as três telas. As alterações não foram publicadas.

Os originais das capturas estão em `.local-assets/telas-originais/`, fora do Git. Não publique essa pasta em uploads manuais. Os backups HTML anteriores foram mantidos.

## Serviços da empresa

A seção `#servicos` da home fica visível antes da galeria da plataforma e apresenta criação de sites, sistemas em nuvem personalizados, tráfego pago e consultoria de marketing para redes sociais. Cada serviço mostra uma possibilidade de conexão com agentes de IA, WhatsApp e CRM e tem um CTA de orçamento para o WhatsApp comercial existente. Sites e tráfego pago também apontam para suas páginas de detalhes.

O fluxo visual exemplifica marketing e redes sociais → site ou sistema → WhatsApp com IA → CRM e equipe. A contratação pode ser separada ou integrada, com escopo, entregas, conexões e investimento definidos em proposta. Os planos da plataforma continuam com preços e limites próprios.

O menu desktop, o menu mobile e o rodapé apontam para os serviços. As páginas de serviços retornam à nova seção pelas trilhas de navegação. A FAQ e seus dados estruturados explicam a contratação separada ou integrada; os dados da empresa na home incluem as quatro áreas. A antiga regra de CSS que ocultava `#servicos` foi removida.

Validação desta atualização: cinco larguras de tela, cards e botões alinhados, links comerciais, FAQ e integridade dos planos e do backup. O validador de SEO passou em 13 páginas com 1.050 verificações e nenhum erro.

Os links internos de retorno à home usam `index.html` ou `index.html#seção`, para funcionar também ao abrir arquivos locais. Isso corrige a logo de Artigos que antes resolvia `/` como `file:///C:/`. As URLs canonical de produção permanecem preservadas. `robots.txt` permite o rastreamento e aponta para o sitemap. O HTML de backup e a página 404 usam `noindex`.

## Contraste e demonstração no hero

Antes desta revisão foi criado `index-bkp-antes-contraste-20-10-2026.html`, com os estilos da home e dos planos e o script de ajustes da home embutidos. O arquivo tem `noindex, nofollow` e fica fora da navegação e do sitemap. O backup visual original também foi preservado. Para restaurar um backup como home, restabeleça a meta robots indexável.

A conversa do hero é uma simulação em HTML, identificada como ilustrativa, sem envio de mensagens ou conexão à plataforma. A sequência roda uma vez, tem pausa e repetição e pausa fora da área visível. Sem JavaScript ou com preferência por movimento reduzido, todo o conteúdo fica visível e os controles são ocultados. As telas reais continuam na galeria.

Verificação desta revisão: Chrome em 320, 390, 768, 1.024 e 1.440 px; leitura das seções claras; controles de pausa, retomada e repetição; movimento reduzido; hero e galeria sem JavaScript; links de retorno à home em arquivos locais e URLs hospedadas; integridade dos backups; validação de SEO (13 páginas, 1.050 verificações) e consistência dos planos. Alterações locais, sem publicação.
