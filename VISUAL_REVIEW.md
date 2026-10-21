# Revisão visual e de recursos, 20/10/2026

A home repetia benefícios em cenários, cards de recursos, serviços e processo. No celular, essas repetições e as listas completas dos planos alongavam a página. A revisão concentra a explicação na demonstração, encurta o texto e acrescenta exemplos visuais.

## O que mudou

- Hero com apresentação e conversa mais curtas.
- Quatro serviços com miniaturas em SVG, descrições curtas e etiquetas de conexão. Sites, sistemas em nuvem personalizados, tráfego pago e consultoria para redes sociais continuam presentes.
- Galeria com seis áreas: agentes de IA, chat, automações, agenda, integrações e origem do lead.
- Três capturas reais preservadas. As áreas novas são exemplos ilustrativos em HTML/CSS, identificados como tal, sem conexão a dados de clientes ou simulação de controles funcionais do sistema.
- Cenários e antigos cards de recursos consolidados na galeria. Os links `#solucoes` e `#cenarios` continuam levando ao conteúdo equivalente.
- Processo em quatro passos curtos. Calculadora e recursos incluídos dos planos disponíveis para expandir por controles nativos de HTML.
- Preços, capacidades, 43 recursos e sete links de cadastro preservados. A disponibilidade dos recursos novos continua condicionada ao plano, às conexões e à configuração.

## Recursos conferidos

Consulta feita à documentação pública fornecida pelo responsável. O conteúdo foi acessado por HTTP; a ferramenta de busca não conseguiu abrir a aplicação.

| Área | Conteúdo usado | Fonte |
| --- | --- | --- |
| Agenda | Link público e conexão com Google Agenda | [Agendamentos](https://app.automaleads.com/central-de-ajuda/agendamentos), [Google Agenda](https://app.automaleads.com/central-de-ajuda/agendamentos/google-agenda) |
| Integrações | Recebimento de dados por webhook e ações conectadas ao CRM | [Automações](https://app.automaleads.com/central-de-ajuda/automacoes), [Webhook de entrada](https://app.automaleads.com/central-de-ajuda/automacoes/webhook-de-entrada) |
| Origem do lead | Links com parâmetros de campanha usados em anúncios, sites e páginas | [Links rastreáveis](https://app.automaleads.com/central-de-ajuda/rastreamento/links-rastreaveis) |
| Jornada | Etapas e eventos de conversão configuráveis | [Jornada do lead](https://app.automaleads.com/central-de-ajuda/rastreamento/jornada-do-lead) |

## Verificação

Chrome local em 320, 390, 768, 1.024 e 1.440 px. Capturas inspecionadas para serviços, hero, agenda, integrações, origem e planos. Foi corrigida uma sobreposição inicial dos cards no celular. Conferidos carregamento das imagens, ausência de transbordamento, seis abas, teclado, FAQ, expansão dos planos, atualização da calculadora, conversa animada, movimento reduzido e funcionamento sem JavaScript.

Comparação com o backup, no mesmo navegador e altura de janela de 1.100 px, com movimento reduzido, primeira aba ativa e detalhes inicialmente fechados:

| Medida | Antes | Depois | Redução aproximada |
| --- | ---: | ---: | ---: |
| Altura da página em 390 px | 17.775 px | 10.345 px | 42% |
| Altura da página em 1.440 px | 10.887 px | 7.607 px | 30% |
| Palavras visíveis no conteúdo principal | 1.986 | 1.370 | 31% |

As medidas descrevem o estado inicial da página. Expandir planos ou calculadora e selecionar outra aba altera sua altura. Não são medições de desempenho nem resultados de conversão.

- `node tools/validate-seo.cjs`: 13 páginas, 1.046 verificações, nenhum erro.
- `node tools/render-plans.cjs --check`: HTML corresponde à fonte de dados.
- Conferência de contrato: 43 recursos e sete links de cadastro preservados.
- `git diff --check`: sem erros de whitespace.

## Backups e publicação

Antes da revisão foi salvo `index-bkp-antes-revisao-visual-recursos-20-10-2026.html`, com estilos e scripts anteriores embutidos e `noindex, nofollow`. Os backups anteriores foram preservados; o hash do backup visual original foi conferido.

A cópia local `index - Copia.html` recebeu somente a meta robots não indexável. O validador passou a aceitar documentos explicitamente não indexáveis fora do sitemap; páginas presentes no sitemap continuam obrigadas a ser indexáveis.

Alterações locais, sem publicação.
