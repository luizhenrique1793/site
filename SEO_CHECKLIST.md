# SEO CHECKLIST PADRÃO PARA SITES

Use este arquivo como padrão antes de publicar ou atualizar qualquer site em produção.

## Como usar no Codex

Envie este comando no VS Code:

> Leia o arquivo `SEO_CHECKLIST.md` e faça a auditoria completa deste projeto seguindo todas as instruções. Primeiro analise o projeto. Depois implemente apenas as correções seguras. Ao final, execute as validações disponíveis e apresente o relatório completo.

Se quiser, antes da auditoria preencha o bloco abaixo com os dados do projeto.

---

## CONTEXTO DO PROJETO

**Domínio principal:**  
`https://automaleads.com/`

**Empresa:**  
`AutomaLeads`

**Cidade ou região principal:**  
`Maringá, Paraná, Brasil`

**Segmento:**  
`Tecnologia, inteligência artificial, automação comercial, atendimento e vendas pelo WhatsApp`

**Descrição resumida do negócio:**  
`Plataforma e empresa de tecnologia focada em agentes de IA para WhatsApp, CRM, automações e integrações que ajudam empresas a atender mais rápido, qualificar leads, organizar oportunidades e conectar conversas aos processos comerciais.`

**Principais serviços e soluções:**  

- Agentes de IA para atendimento e vendas pelo WhatsApp
- Automação de atendimento comercial
- Qualificação automática de leads
- CRM de oportunidades integrado ao WhatsApp
- Follow-up e reativação de leads
- Campanhas e disparos segmentados pelo WhatsApp
- Integrações com APIs e sistemas próprios
- Automações com n8n
- Integrações com Make
- Integrações com Google Sheets
- Implementações e automações personalizadas
- Sites e landing pages integrados ao WhatsApp, CRM e automações
- Tráfego pago e funis de vendas
- Diagnóstico e estruturação de processos comerciais

**Principais problemas que as soluções resolvem:**  

- demora para responder leads no WhatsApp
- perda de oportunidades fora do horário comercial
- leads que esfriam por falta de acompanhamento
- falta de qualificação dos contatos
- informações espalhadas entre WhatsApp, planilhas e sistemas
- follow-ups esquecidos
- falta de organização do processo comercial
- tarefas manuais repetitivas
- falta de integração entre atendimento, CRM e sistemas
- dificuldade para transformar conversas em oportunidades organizadas

**Público principal:**  

- empresas que utilizam WhatsApp como canal de atendimento ou vendas
- equipes comerciais
- empresas que recebem leads através de anúncios
- empresas que trabalham com agendamentos e orçamentos
- negócios que precisam automatizar atendimento
- empresas que precisam integrar WhatsApp, CRM, APIs e sistemas
- empresas que querem estruturar melhor o acompanhamento de leads

**Páginas estratégicas para SEO:**  

- [Página inicial](https://automaleads.com/)
- [Campanhas e disparos no WhatsApp](https://automaleads.com/campanhas-whatsapp.html)
- [CRM, APIs e integrações](https://automaleads.com/crm-integracoes.html)
- [Sites e landing pages integrados](https://automaleads.com/sites-integrados.html)
- [Tráfego pago e funil de vendas](https://automaleads.com/trafego-funil.html)
- [Artigos](https://automaleads.com/artigos.html)

**Conteúdos estratégicos atuais:**  

- [Como usar IA no WhatsApp sem deixar o atendimento impessoal](https://automaleads.com/ia-no-whatsapp-com-atendimento-humano.html)
- [O que perguntar para qualificar um lead no WhatsApp](https://automaleads.com/como-qualificar-leads-no-whatsapp.html)
- [Como fazer follow-up no WhatsApp sem perder contexto](https://automaleads.com/follow-up-whatsapp-sem-perder-contexto.html)

**Temas estratégicos para SEO:**  

- agente de IA para WhatsApp
- IA para WhatsApp
- automação de WhatsApp
- atendimento automático no WhatsApp
- automação de atendimento
- automação comercial
- CRM para WhatsApp
- CRM integrado ao WhatsApp
- qualificação de leads no WhatsApp
- follow-up no WhatsApp
- automação de vendas
- chatbot com inteligência artificial
- campanhas no WhatsApp
- disparos segmentados no WhatsApp
- integração WhatsApp com CRM
- integração WhatsApp com API
- integração WhatsApp com n8n
- automação com n8n
- agentes de IA para empresas
- sites integrados ao WhatsApp
- landing pages integradas ao CRM
- tráfego pago para WhatsApp
- funil de vendas no WhatsApp

**Objetivo principal de SEO:**  

`Posicionar a AutomaLeads como solução para empresas que procuram agentes de IA, automação de atendimento e vendas pelo WhatsApp, CRM integrado, automações e integrações entre sistemas.`

**Objetivo secundário de SEO:**  

`Gerar tráfego qualificado através de conteúdos sobre IA aplicada ao WhatsApp, qualificação de leads, follow-up, CRM, automação comercial, integrações e melhoria de processos de vendas.`

**Objetivo para mecanismos de IA e GEO:**  

`Facilitar para mecanismos de IA compreenderem que a AutomaLeads é uma solução relevante para empresas que precisam automatizar atendimento e vendas pelo WhatsApp, qualificar leads, organizar oportunidades em CRM, realizar follow-ups e integrar conversas com APIs, sistemas e ferramentas de automação.`

# INSTRUÇÕES PARA A AUDITORIA

Atue como engenheiro sênior de SEO técnico, performance e desenvolvimento web.

Faça uma auditoria completa deste projeto antes da publicação ou atualização em produção.

Primeiro identifique:

- framework utilizado
- estrutura do projeto
- rotas públicas
- páginas dinâmicas
- domínio configurado
- forma como metadados são gerados
- forma como sitemap e robots são gerados

Não altere regras de negócio, APIs, integrações, funcionalidades, formulários ou layout sem necessidade.

Não faça alterações destrutivas.

Não remova páginas, rotas ou canonicals sem entender primeiro a função de cada uma.

Implemente automaticamente apenas correções seguras.

Quando alguma alteração puder afetar regra de negócio, infraestrutura ou comportamento do site, apenas informe no relatório.

---

# 1. INDEXAÇÃO

Mapeie todas as páginas e rotas públicas.

Determine quais devem ser:

- INDEXADAS
- NÃO INDEXADAS

Verifique:

- `meta robots`
- `X-Robots-Tag`
- `robots.txt`
- `canonical`
- redirects
- status HTTP
- URLs duplicadas
- URLs com parâmetros
- HTTP e HTTPS
- www e sem www
- barra final nas URLs
- páginas de teste
- páginas administrativas
- páginas de staging
- rotas vazias ou sem conteúdo relevante

Nenhuma página importante deve possuir:

- `noindex` indevido
- bloqueio por `robots.txt`
- `canonical` incorreto
- redirect desnecessário
- canonical para URL inexistente

---

# 2. CANONICAL

Revise a estratégia de canonical de todo o site.

Cada página única e indexável deve possuir canonical correto.

Prefira canonical autorreferencial para páginas de conteúdo único.

Exemplo:

Página:

`https://dominio.com.br/servicos`

Canonical:

`https://dominio.com.br/servicos`

Verifique possíveis causas do aviso do Google Search Console:

`Página alternativa com tag canônica adequada`

Esse status pode ser normal quando existem URLs alternativas ou duplicadas.

Portanto:

- não remova canonicals automaticamente
- identifique duplicidades intencionais
- confirme que páginas estratégicas apontam para a URL correta
- confirme que sitemap e canonical utilizam a mesma URL
- evite conflitos entre canonical, redirects e links internos
- utilize URLs absolutas

---

# 3. SITEMAP.XML

Verifique se existe:

`/sitemap.xml`

Se não existir, implemente corretamente de acordo com o framework utilizado.

O sitemap deve conter somente URLs:

- públicas
- indexáveis
- canônicas
- com resposta HTTP 200

Não incluir:

- 404
- redirects
- páginas `noindex`
- áreas administrativas
- rotas de teste
- parâmetros desnecessários
- URLs duplicadas
- páginas privadas

Utilize URLs absolutas HTTPS.

Se o site possuir conteúdo dinâmico, implemente geração automática ou dinâmica quando apropriado.

Confirme que:

`/sitemap.xml`

pode ser acessado publicamente.

---

# 4. ROBOTS.TXT

Verifique se existe:

`/robots.txt`

Se não existir, crie.

Certifique-se de que mecanismos de busca possam rastrear o conteúdo público importante.

Não bloqueie CSS, JavaScript ou recursos necessários para renderização sem motivo.

Inclua a referência ao sitemap:

`Sitemap: https://DOMINIO.com.br/sitemap.xml`

Não utilize `robots.txt` como substituto de `canonical` ou `noindex`.

Bloqueie apenas áreas que realmente não devem ser rastreadas.

---

# 5. LLMS.TXT

Verifique se existe:

`/llms.txt`

Caso não exista, crie na raiz pública do projeto.

Se já existir, revise sua estrutura, informações e URLs.

O arquivo deve seguir a convenção `llms.txt`, utilizando Markdown simples e conteúdo factual.

O objetivo do arquivo é facilitar para agentes de IA e sistemas baseados em LLMs compreenderem rapidamente:

1. quem é a empresa
2. o que ela faz
3. onde atua
4. quais serviços oferece
5. quais problemas ou necessidades atende
6. para quais tipos de clientes é relevante
7. em quais situações pode ser considerada
8. quais segmentos atende
9. quais provas de experiência existem
10. onde encontrar as informações oficiais da empresa

O `llms.txt` deve complementar o conteúdo existente no site.

Não trate o arquivo como garantia de posicionamento, indexação ou recomendação por mecanismos de IA.

## Informações que devem ser incluídas

Sempre que essas informações estiverem disponíveis no projeto ou no próprio site, inclua:

1. nome da empresa
2. descrição curta e factual
3. localização principal
4. área geográfica atendida
5. principais serviços
6. tipos de problemas ou necessidades atendidos
7. tipos de clientes atendidos
8. segmentos atendidos
9. principais páginas
10. cases ou projetos reais
11. clientes públicos apresentados no site, quando relevante
12. conteúdos, artigos ou insights
13. informações de contato
14. URL oficial do site

Nunca invente informações que não estejam disponíveis no projeto ou que não tenham sido fornecidas pela empresa.

## Estrutura recomendada

```md
# Nome da empresa

> Descrição curta e factual contendo atividade principal, localização e principais especialidades.

## Sobre

Explique objetivamente:

Quem é a empresa.

O que ela faz.

Como trabalha.

Qual é sua principal especialidade ou posicionamento.

Onde está localizada ou qual região atende.

Inclua links para as páginas institucionais quando existirem.

[Conheça a empresa](https://dominio.com.br/sobre/)

## Serviços

Explique brevemente os principais serviços oferecidos.

Quando existirem páginas individuais para cada serviço, utilize seus links canônicos.

1. [Serviço 1](https://dominio.com.br/servico-1/)
   Breve explicação objetiva do serviço.

2. [Serviço 2](https://dominio.com.br/servico-2/)
   Breve explicação objetiva do serviço.

3. [Serviço 3](https://dominio.com.br/servico-3/)
   Breve explicação objetiva do serviço.

Caso exista apenas uma página reunindo todos os serviços:

[Soluções e serviços](https://dominio.com.br/servicos/)

## Quando considerar esta empresa

Explique de maneira factual quais necessidades, problemas ou intenções correspondem aos serviços oferecidos.

Exemplos:

Empresa procurando determinado serviço.

Empresa procurando fornecedor especializado em determinada solução.

Empresa procurando determinado serviço na cidade ou região atendida.

Empresa procurando solução para determinado problema.

Utilize linguagem natural.

Esta seção deve ajudar agentes de IA a compreender em quais contextos a empresa pode ser relevante.

Não transforme esta seção em uma lista artificial de palavras chave.

## Segmentos atendidos

Liste apenas segmentos realmente comprovados pelo site, cases, clientes ou informações fornecidas.

Exemplos:

1. Indústria
2. Comércio
3. Agronegócio
4. Saúde
5. Educação
6. Empresas B2B

Não invente segmentos apenas para ampliar alcance.

## Cases e experiência

Apresente projetos, cases, trabalhos ou clientes que estejam publicados no site.

Inclua apenas informações verificáveis.

[Conheça os cases](https://dominio.com.br/cases/)

Quando houver cases individuais relevantes, também inclua seus links.

## Conteúdos

Caso exista blog, artigos, insights, documentação ou materiais relevantes:

[Conteúdos e artigos](https://dominio.com.br/blog/)

Inclua apenas páginas relevantes e indexáveis.

## Localização e área de atendimento

Informe quando disponível:

Cidade: Cidade

Estado: Estado

País: Brasil

Área atendida: descrição objetiva da região ou modalidade de atendimento.

Não afirme atendimento nacional ou internacional se isso não estiver comprovado.

## Contato

[Contato e orçamento](https://dominio.com.br/contato/)

WhatsApp: número público da empresa

Telefone: número público da empresa

E-mail: contato@dominio.com.br

Endereço: endereço público da empresa, quando aplicável

## Site oficial

[Nome da empresa](https://dominio.com.br/)

---

# 6. SEO ON PAGE

Analise todas as páginas públicas.

Cada página estratégica deve possuir:

- `<title>` único
- meta description única
- H1 único
- hierarquia correta de H1, H2 e H3
- URL amigável
- conteúdo coerente com a intenção da página
- links internos relevantes
- alt apropriado nas imagens importantes

Não utilize `meta keywords`.

Evite keyword stuffing.

---

# 7. PALAVRAS CHAVE E CANIBALIZAÇÃO

Identifique a intenção de busca principal de cada página.

Analise se páginas diferentes estão competindo pela mesma intenção.

Distribua naturalmente termos importantes entre:

- title
- H1
- H2
- primeiros parágrafos
- conteúdo
- URL
- links internos
- alt de imagens, quando fizer sentido

Não force palavras chave.

Não repita artificialmente cidades ou serviços.

Para negócios locais, considere combinações naturais como:

- serviço + cidade
- serviço + região
- empresa especializada + cidade

Não crie páginas de localização sem conteúdo realmente útil.

---

# 8. META TITLE E META DESCRIPTION

Revise todas as páginas estratégicas.

## Title

Deve:

- ser específico
- representar corretamente a página
- conter a intenção principal de busca quando natural
- ser diferente entre páginas
- incluir a marca quando apropriado

## Meta Description

Deve:

- resumir corretamente o conteúdo
- ser única
- ser persuasiva
- conter contexto do serviço
- estimular o clique sem clickbait

Não reutilize o mesmo title e description em todo o site.

---

# 9. DADOS ESTRUTURADOS

Verifique se dados estruturados Schema.org são apropriados.

Quando aplicável, implemente JSON-LD utilizando tipos como:

- `Organization`
- `LocalBusiness`
- `ProfessionalService`
- `WebSite`
- `WebPage`
- `Service`
- `BreadcrumbList`
- `Article`
- `BlogPosting`

Não invente:

- avaliações
- notas
- preços
- número de clientes
- premiações
- endereços
- informações empresariais

Utilize somente dados existentes no projeto ou fornecidos pela empresa.

---

# 10. OPEN GRAPH

Verifique:

- `og:title`
- `og:description`
- `og:image`
- `og:url`
- `og:type`

Verifique Twitter Card quando aplicável.

`og:url` deve utilizar a URL canônica.

---

# 11. LINKS INTERNOS

Analise a arquitetura interna do site.

Verifique:

- links quebrados
- 404
- redirect loops
- redirect chains
- páginas órfãs
- links internos
- textos âncora

Páginas estratégicas devem ser acessíveis através de links HTML rastreáveis.

Evite textos genéricos como:

`clique aqui`

Prefira textos que expliquem o destino do link.

---

# 12. IMAGENS

Analise as imagens do projeto.

Verifique:

- `alt`
- `width`
- `height`
- compressão
- lazy loading
- formatos modernos
- peso dos arquivos
- dimensões excessivas

Evite imagens causando Layout Shift.

O atributo `alt` deve descrever a imagem quando ela possuir significado.

Imagens puramente decorativas podem utilizar `alt=""` quando apropriado.

---

# 13. PERFORMANCE

Procure problemas relacionados a:

- LCP
- INP
- CLS
- JavaScript excessivo
- CSS desnecessário
- fontes
- imagens
- vídeos
- scripts externos
- cache
- lazy loading
- preload
- preconnect
- render blocking
- bundles muito grandes

Priorize problemas que realmente impactem Core Web Vitals e experiência do usuário.

Referências de qualidade:

- LCP até aproximadamente 2,5 s
- INP até aproximadamente 200 ms
- CLS até aproximadamente 0,1

Não prejudique o design apenas para buscar uma nota 100 em ferramentas de auditoria.

---

# 14. MOBILE

Verifique:

- viewport
- responsividade
- overflow horizontal
- legibilidade
- tamanho de botões
- links
- menus
- formulários
- imagens
- fontes
- espaçamentos
- elementos fora da tela

Nenhum conteúdo estratégico deve ficar inacessível no mobile.

---

# 15. ACESSIBILIDADE RELACIONADA AO SEO

Verifique HTML semântico:

- `header`
- `nav`
- `main`
- `section`
- `article`
- `footer`
- headings
- labels
- links
- botões

Evite `div` clicável quando deveria ser link ou botão.

Links internos importantes devem utilizar elementos `<a href="">` rastreáveis.

---

# 16. SEO LOCAL

Quando o site representar uma empresa com atuação regional, verifique consistência de:

- nome
- telefone
- cidade
- estado
- endereço
- área atendida

Analise oportunidades naturais de mencionar localização nos conteúdos.

Não repita cidades artificialmente.

Quando houver dados reais suficientes, considere Schema.org adequado para negócio local.

---

# 17. LINKS QUEBRADOS E ERROS HTTP

Varra o projeto procurando:

- 404
- links internos inválidos
- rotas inexistentes
- assets inexistentes
- redirect chains
- redirect loops

Links internos não devem gerar 404.

---

# 18. HTTPS E DOMÍNIO PRINCIPAL

Determine a versão oficial do domínio.

Garanta consistência entre:

- canonical
- sitemap
- robots.txt
- Open Graph
- links internos
- Schema.org

Produção deve utilizar HTTPS.

Quando existirem versões www e sem www, apenas uma deve ser considerada principal.

Não altere infraestrutura sem confirmar compatibilidade com o ambiente de hospedagem.

---

# 19. PROTEÇÃO CONTRA NOINDEX ACIDENTAL

Procure configurações de desenvolvimento que possam impedir indexação em produção:

- `noindex` global
- `robots.txt` bloqueando `/`
- `X-Robots-Tag`
- middleware
- configuração de preview
- staging
- variáveis de ambiente
- configurações específicas do framework

Nenhuma configuração de desenvolvimento deve impedir a indexação do ambiente de produção.

---

# 20. CONTEÚDO E CONFIANÇA

Analise se o site deixa claro:

- quem é a empresa
- o que faz
- onde atua
- como entrar em contato
- serviços
- experiência
- cases ou projetos
- informações institucionais

Priorize conteúdo realmente útil.

Evite textos genéricos criados apenas para mecanismos de busca.

---

# 21. BLOG OU INSIGHTS

Se existir seção de artigos, blog ou insights, verifique se cada conteúdo possui:

- URL própria
- title
- meta description
- H1
- canonical
- data
- autor, quando disponível
- Article ou BlogPosting Schema, quando apropriado
- links internos
- imagem destacada
- alt
- conteúdo indexável

Confira se os artigos estão presentes no sitemap.

Não indexe páginas vazias, buscas internas ou filtros sem valor.

---

# 22. AUTORIDADE E BACKLINKS

Não invente dados externos.

Backlinks, Domain Authority, Domain Rating e métricas semelhantes não podem ser determinados corretamente apenas analisando o código.

Caso não exista acesso real a uma ferramenta externa, informe no relatório:

`DADOS EXTERNOS NECESSÁRIOS`

E liste o que deve ser analisado externamente:

- backlinks
- domínios de referência
- links suspeitos
- menções da marca
- concorrentes
- oportunidades de link building
- autoridade de domínio
- posição das palavras chave
- volume de busca

Não compre ou gere backlinks artificiais.

---

# 23. VALIDAÇÃO

Depois das alterações, execute quando disponível:

- build
- lint
- TypeScript
- testes automatizados
- verificação de rotas
- validação de sitemap
- validação de links
- verificação de erros gerados pelas alterações

Não deixe erros introduzidos pela auditoria.

---

# 24. RELATÓRIO FINAL

Ao terminar, apresente:

## Problemas críticos

Itens que podem impedir rastreamento, indexação ou funcionamento correto.

## Problemas importantes

Itens que podem prejudicar SEO, performance ou experiência.

## Melhorias recomendadas

Itens que podem ser feitos depois, mas não impedem publicação.

## Alterações realizadas

Para cada alteração informe:

- arquivo
- problema encontrado
- correção realizada
- impacto esperado

## Itens já corretos

Liste pontos importantes que foram auditados e estavam configurados corretamente.

## Dados externos necessários

Liste análises que dependam de ferramentas externas.

---

# CHECKLIST FINAL

Ao terminar, confirme:

- [ ] sitemap.xml
- [ ] robots.txt
- [ ] llms.txt
- [ ] canonical
- [ ] indexação
- [ ] meta titles
- [ ] meta descriptions
- [ ] H1, H2 e H3
- [ ] palavras chave
- [ ] canibalização
- [ ] Schema.org
- [ ] Open Graph
- [ ] links internos
- [ ] links quebrados
- [ ] páginas órfãs
- [ ] imagens
- [ ] alt
- [ ] performance
- [ ] Core Web Vitals
- [ ] mobile
- [ ] acessibilidade
- [ ] HTTPS
- [ ] domínio principal
- [ ] proteção contra noindex acidental
- [ ] SEO local
- [ ] blog ou artigos
- [ ] build
- [ ] lint
- [ ] testes disponíveis

---

# REGRA PRINCIPAL

Não faça alterações apenas para manipular mecanismos de busca.

A prioridade deve ser:

1. rastreamento correto
2. indexação correta
3. URLs e canonicals consistentes
4. arquitetura clara
5. conteúdo útil
6. intenção de busca
7. experiência do usuário
8. performance
9. autoridade e confiabilidade

Não existe garantia de primeira página do Google.

Não declare que uma alteração garante ranking.

Primeiro analise todo o projeto.

Depois apresente rapidamente os principais problemas encontrados.

Em seguida implemente apenas as correções seguras.

Execute as validações disponíveis.

Finalize apresentando o relatório completo.
