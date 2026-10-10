# Melhorias de SEO da AutomaLeads

Data: 10 de outubro de 2026.

## Estrutura auditada

O projeto é um site estático em HTML, CSS e JavaScript, sem Nuxt, Vue, Vite, Next, build ou dependências de aplicação. A home concentra estilos e scripts; os serviços usam assets/service-pages.css e assets/service-pages.js; os artigos usam assets/articles.css. O domínio canônico é https://automaleads.com/, conforme CNAME.

Foram revisadas as 13 páginas indexáveis da AutomaLeads, o HTML de backup, a página 404, os recursos compartilhados, robots.txt, sitemap.xml, llms.txt e a estrutura do subprojeto clientes/30sprodutora. Esse subprojeto representa outra marca e não recebeu alterações.

## Problemas encontrados e corrigidos

- Dois H1 na home: os modos cinematográfico e estático duplicavam o título. O hero agora reutiliza um único bloco com H1 nos modos desktop, mobile, movimento reduzido e economia de dados.
- A home descrevia principalmente a plataforma e não destacava Maringá, Paraná ou a criação de sites. Title, description, Open Graph, Twitter e conteúdo principal agora comunicam esses serviços e a atuação local.
- Links nas páginas de serviços apontavam para seções ocultas da home. Foram direcionados para a demonstração e para a nova seção local, ambas visíveis.
- Os H1 das quatro páginas de serviços eram comerciais, mas pouco específicos. Agora descrevem CRM para WhatsApp com IA, sites integrados, campanhas e follow-up ou tráfego pago.
- O depoimento da home era um modelo fictício. A área foi preservada com um exemplo de aplicação e um link para a solução AtendeFIT, sem depoimentos ou resultados inventados.
- O HTML de backup estava indexável. Recebeu noindex,follow e continua fora do sitemap.
- Imagens não tinham dimensões intrínsecas. Foram adicionados width, height, decoding, alt descritivo e lazy loading em logos de rodapé e no ícone não crítico do AtendeFIT.
- Elementos de conteúdo dependiam de JavaScript para aparecer. Um CSS carregado por noscript torna textos, FAQ e navegação da home acessíveis sem JavaScript.

## Páginas otimizadas

| Página | Intenção e alteração principal |
| --- | --- |
| Home | IA para WhatsApp, sites e automações em Maringá; H1 único, seção local, FAQ e links visíveis para serviços. |
| agentes-ia-whatsapp-maringa.html | Busca local por agentes de IA; definição, comparação com chatbot, exemplos por segmento, integrações, agendamentos e demonstração. |
| crm-integracoes.html | CRM para WhatsApp com IA, APIs, planilhas e automação comercial. |
| sites-integrados.html | Sites profissionais em Maringá conectados ao WhatsApp, CRM e atendimento com IA. |
| campanhas-whatsapp.html | Automação de follow-up, reativação e campanhas segmentadas no WhatsApp. |
| trafego-funil.html | Tráfego pago ligado a sites, atendimento, CRM e acompanhamento comercial. |
| artigos.html | Hub de guias sobre IA, atendimento e vendas pelo WhatsApp; H1 específico e breadcrumb. |
| Três artigos existentes | BreadcrumbList, links canônicos para a home, dimensões de logos e informações de imagens sociais. O conteúdo editorial e suas datas foram preservados. |
| Política e termos | Breadcrumb visível e estruturado, imagem social e estabilidade do logo. O texto jurídico foi preservado. |
| AtendeFIT | Dimensões de SVGs, carregamento de imagens secundárias e informações da imagem social. Formulário e integração preservados. |

Não foram criadas páginas duplicadas por localização ou rotas artificiais. A página de Maringá já existia e foi ampliada com conteúdo útil.

## Metadados

Novo title da home: **AutomaLeads | IA para WhatsApp, sites e automações em Maringá**.

Nova description da home: **Agentes de IA para WhatsApp, CRM, sites e automações comerciais para empresas de Maringá e do Paraná organizarem o atendimento e as vendas.**

A home, a página de Maringá e os quatro serviços receberam descriptions, Open Graph e Twitter alinhados ao conteúdo de cada página. A home teve o valor inválido de Twitter Card corrigido para summary_large_image.

Todas as 13 páginas indexáveis possuem title e description únicos, canonical absoluto, og:url igual ao canonical, imagem social existente, idioma pt-BR, viewport e favicon. Foram adicionados og:image:width, og:image:height, og:image:alt e twitter:image:alt. Os links para a home usam a URL canônica /.

## Dados estruturados

- **Organization:** entidade existente da home ampliada com identificador estável, descrição, áreas atendidas e assuntos relacionados aos serviços. Foram usados somente nome, domínio, logo, telefone e cidade/estado já existentes.
- **WebSite:** novo na home, com idioma e referência à organização.
- **Service:** novo na home; os cinco schemas existentes de serviços foram melhorados com identificação, descrição e área atendida.
- **FAQPage:** novo na home, com 10 perguntas; o schema da página de Maringá foi sincronizado com suas 9 perguntas. As respostas estão no HTML e podem ser abertas pelos visitantes.
- **BreadcrumbList:** adicionado aos quatro serviços, hub de artigos, três artigos e duas páginas legais. A marcação existente da página de Maringá foi alinhada à trilha visível.
- **Article, CollectionPage e SoftwareApplication:** preservados.

Organization foi usado para representar a empresa; não foi criado um LocalBusiness com endereço físico incompleto. Não foram adicionados avaliações, coordenadas, premiações, preços estruturados ou provas sociais inventadas.

Os schemas descrevem o conteúdo. Sua presença não garante posicionamento ou exibição especial na busca. Referência: [políticas de dados estruturados do Google](https://developers.google.com/search/docs/appearance/structured-data/sd-policies). A área atendida segue a propriedade [areaServed de Schema.org](https://schema.org/areaServed).

## Sitemap, robots e llms

- **sitemap.xml:** as 13 URLs canônicas foram mantidas. lastmod foi atualizado para 2026-10-10 na home, página de Maringá, quatro serviços e hub de artigos, que receberam alterações relevantes de conteúdo. Não contém backup, 404 ou páginas da outra marca.
- **robots.txt:** já estava correto; preservado com Allow: / e referência a https://automaleads.com/sitemap.xml. Não bloqueia CSS, JavaScript ou páginas principais.
- **llms.txt:** texto da página local e área de atendimento atualizados para incluir Maringá e Paraná, mantendo a atuação já descrita no projeto.
- **404.html:** noindex existente preservado.
- **Manifest:** não foi adicionado; o projeto não implementa uma PWA.

## Arquivos alterados ou criados

| Arquivos | Mudanças |
| --- | --- |
| index.html | SEO principal, hero com H1 único, conteúdo local, FAQ, schemas, links e preload do pôster. |
| agentes-ia-whatsapp-maringa.html | Conteúdo local, exemplos, FAQ, metadados, Service e breadcrumb. |
| campanhas-whatsapp.html, crm-integracoes.html, sites-integrados.html, trafego-funil.html | H1/H2 específicos, descriptions, cards sociais, schemas, navegação e imagens. |
| artigos.html | H1, breadcrumb, cards sociais e imagens. |
| como-qualificar-leads-no-whatsapp.html, follow-up-whatsapp-sem-perder-contexto.html, ia-no-whatsapp-com-atendimento-humano.html | BreadcrumbList, links da home, atributos de imagens e fallback de conteúdo. |
| politica-de-privacidade.html, termos-de-uso.html | Breadcrumbs, imagem social e dimensões do logo. |
| atendefit/index.html | Dimensões e carregamento de SVGs; informações da imagem social; proporção do logo preservada no CSS. |
| index - bkp 04-09-2026.html | noindex,follow. |
| assets/service-pages.css, assets/articles.css | Proporção dos logos e quebra de linha dos breadcrumbs em telas pequenas. |
| assets/no-script.css — novo | Conteúdo e navegação disponíveis sem JavaScript. |
| sitemap.xml, llms.txt | Atualizações descritas acima. |
| tools/validate-seo.cjs — novo | Validação reutilizável sem dependências npm. |
| README.md, SEO_IMPLEMENTATION.md — novo | Estrutura, validação e relatório. |

SEO_CHECKLIST.md foi preservado como checklist geral do projeto.

## Validações executadas

Comando: node tools/validate-seo.cjs.

**Resultado: 13 páginas, 1.015 verificações, zero erros.**

Inclui metadados únicos e obrigatórios, canonical e domínio, presença no sitemap, noindex indevido, links internos, âncoras, IDs, aria-controls, arquivos de imagens, dimensões, favicon, JSON-LD, correspondência exata entre FAQ e schema, breadcrumbs e sintaxe JavaScript dos scripts inline e compartilhados.

Todas as 13 URLs do sitemap, robots.txt e sitemap.xml responderam **HTTP 200 no servidor local de teste**. Isso não equivale a validar o deploy em produção.

Foi feita comparação com os arquivos originais: formulários e scripts de integração foram preservados. A única alteração no script do hero adiciona a classe do modo estático ao contêiner para compartilhar o H1. URLs de WhatsApp, cadastro, Google tag e scripts de consentimento foram mantidos.

Git diff --check passou sem problemas de whitespace. Não há build, lint ou TypeScript configurados no projeto.

## Limitações da verificação

A ferramenta de UI não encontrou navegadores conectados. O Chrome headless instalado falhou no ambiente de execução: erro de inicialização da GPU e, na tentativa por software, timeout de carregamento. Portanto, **revisão visual desktop/mobile, execução das interações no navegador e medidas de LCP, INP e CLS estão pendentes**.

O vídeo cinematográfico, suas regras de economia de dados e as imagens existentes foram preservados. O pôster tem aproximadamente 24 KB, a imagem Open Graph 33 KB e o vídeo de scroll 2,46 MB. Foi adicionado preload somente para o pôster, sem antecipar o vídeo no mobile. As fontes já usam display=swap.

## Próximos passos fora do código

1. Publicar os arquivos e conferir visualmente a home em desktop e mobile, inclusive modo de movimento reduzido, menu, FAQ, abas e calculadora.
2. Conferir em produção HTTPS, redirecionamentos entre HTTP/HTTPS e www/sem www, headers, cache e códigos HTTP; a configuração de hospedagem não foi alterada.
3. Verificar o domínio no Google Search Console, enviar https://automaleads.com/sitemap.xml e inspecionar home e página de Maringá.
4. Configurar ou atualizar o Perfil da Empresa no Google com dados reais, serviços e região atendida, conforme a elegibilidade do negócio.
5. Rodar PageSpeed Insights/Lighthouse e acompanhar Core Web Vitals com dados reais; testar dados estruturados em ferramentas externas.
6. Acompanhar indexação, impressões, cliques, buscas locais e conversões. Posições, volumes de busca, backlinks, menções e concorrentes exigem dados externos.
7. Publicar cases e depoimentos reais, quando disponíveis, e desenvolver artigos a partir das dúvidas dos clientes.
8. Definir a hospedagem e a indexação de clientes/30sprodutora: são páginas de outra empresa, sem canonical ou meta robots, e não foram incluídas no sitemap da AutomaLeads. Se forem prévias de trabalho, tratar a exposição delas na etapa de publicação.

Não foram configurados Search Console, Perfil da Empresa no Google, DNS ou hospedagem; as alterações estão nos arquivos locais.
