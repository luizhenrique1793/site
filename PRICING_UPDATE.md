# Atualização comercial da AutomaLeads

Alteração local do site institucional, sem publicação, novas bibliotecas ou alterações no CRM. O projeto usa HTML, CSS e JavaScript estáticos, sem Nuxt/Vue nem etapa de compilação.

## Planos implementados

| Plano | Mensalidade | Destino do CTA |
| --- | --- | --- |
| Starter | R$ 297,00/mês | Cadastro |
| Growth, Mais escolhido | R$ 597,00/mês | Cadastro |
| Pro | R$ 997,00/mês | Cadastro |
| Sob Medida | Sob consulta | WhatsApp comercial existente, 55 44 99881-3718 |

Descrições, recursos e limites seguem o pedido. Foram removidas as ofertas anteriores de recursos ilimitados, disparos e suporte prioritário. A observação sobre tarifas da Meta e custos separados está abaixo dos cards.

## Arquivos alterados ou adicionados

- `index.html`: quatro cards semânticos, CTAs de cadastro, remoção da duração não confirmada e atualização correspondente da FAQ e do JSON-LD. Após a revisão visual, a home tem um CTA de cadastro no hero e um link para demonstração. Metadados, canonical e demais dados estruturados preservados.
- `assets/plans.json`: fonte única das descrições, preços, recursos e destinos dos cards.
- `assets/pricing.css`: estilos restritos à seção, fundo escuro, verde nas ações, roxo complementar no fundo e foco, destaque moderado do Growth, alinhamento de preços e botões e layout responsivo.
- `tools/render-plans.cjs`: componente de renderização reutilizado para os quatro planos. Gera HTML estático, escapa conteúdo e permite conferir consistência com `--check`.
- `README.md`: URL oficial de cadastro e instruções de manutenção.
- `PRICING_UPDATE.md`: este relatório.

## Links atualizados

Os sete CTAs de cadastro da home atual apontam para `https://app.automaleads.com/criar-cadastro`:

1. Cabeçalho desktop.
2. Menu mobile.
3. Primeiro CTA do hero.
4. Starter.
5. Growth.
6. Pro, substituindo a oferta anterior de Business.
7. CTA final da página.

Sob Medida aponta para o WhatsApp comercial já existente, com texto de solicitação de orçamento. Os demais contatos e demonstrações foram preservados. Após confirmação do responsável pelo site, os links de acesso à plataforma passaram a usar `http://app.automaleads.com/` no cabeçalho, no rodapé, no menu mobile e no script compartilhado das páginas de serviços. A URL de criação de conta continua separada. As páginas comerciais internas usam contatos ou navegação, sem outros CTAs de criação de conta. A demonstração AtendeFIT continua no WhatsApp próprio.

O arquivo histórico `index - bkp 04-09-2026.html`, marcado como `noindex` e fora do sitemap/navegação, foi preservado como backup. Seus links históricos não fazem parte da home atualizada. `index-bkp-20-10-2026.html` preserva a home imediatamente anterior à revisão visual, já com os quatro novos planos e os estilos anteriores embutidos.

## Verificações

- `node tools/render-plans.cjs --check`: dados válidos e HTML estático consistente.
- `node tools/validate-seo.cjs`: 13 páginas, 1.050 verificações após as revisões de serviços, contraste e hero, nenhum erro. Inclui correspondência da FAQ com JSON-LD, links locais, metadados e sintaxe dos scripts.
- Chrome headless com perfil temporário: viewports reais de 1.440, 1.024, 768, 390 e 320 pixels. Quatro colunas a partir de 1.240 px, duas entre 640 e 1.239 px e uma abaixo de 640 px. Sem transbordamento nos cards, preços e CTAs alinhados em cada linha, botões contidos nos cards e FAQ abrindo corretamente.
- Capturas de desktop, tablet e mobile inspecionadas visualmente. As larguras foram conferidas dentro de frames locais para respeitar o tamanho mínimo de janela do Chrome no Windows.
- Auditoria dos sete destinos de cadastro da home atual, preços, limites e preservação de login e contatos existentes. A navegação das páginas de serviços foi atualizada para a seção visível `#servicos`. Os 43 benefícios foram mantidos integralmente na revisão visual, com separação entre capacidade e recursos.
- Sem etapa de build aplicável; nenhum pacote instalado.

## Validação manual pendente

- Confirmar o período e os recursos do teste na configuração real do CRM. Não foi encontrado acesso a essa configuração; as afirmações de 7 dias foram retiradas da home e da FAQ, mantendo o convite para teste gratuito sem duração.
- Conferir o fluxo de criação de conta e início do teste na aplicação. A nova URL oficial não respondeu às tentativas de acesso deste ambiente; não foi criada conta nem realizado envio de formulário.
- A rota de acesso à plataforma foi confirmada pelo responsável e aplicada como `http://app.automaleads.com/`. Conferir o fluxo real de autenticação na aplicação, sem criação ou uso de conta nos testes locais.
- Conferir a experiência em aparelhos reais e o recebimento da solicitação comercial pelo WhatsApp após a publicação.
