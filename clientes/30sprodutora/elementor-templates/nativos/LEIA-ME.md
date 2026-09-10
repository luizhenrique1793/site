# Modelos nativos do Elementor

Estes são os modelos para importar agora. Cada título, texto, imagem, botão, ícone e bloco de layout é um elemento nativo do Elementor. Não há widget HTML nestes arquivos.

Importe um arquivo por página em **Modelos salvos > Importar modelos**:

- `30-segundos-inicio-native-v3.json`
- `30-segundos-servicos-native-v3.json`
- `30-segundos-insights-native-v3.json`

Abra a página correspondente no Elementor, insira o modelo em **Meus modelos** e escolha o layout de página **Elementor Canvas**. Depois publique cada página nos slugs `/`, `/servicos/` e `/insights/` ou ajuste os links dos botões de navegação se preferir outros endereços.

Use os arquivos com sufixo `-v3`. Eles corrigem a codificação dos textos e usam os controles avançados de largura do Elementor para organizar os contêineres em colunas. Os modelos antigos na pasta acima ficaram preservados somente como referência e não devem ser usados.

Depois de importar, siga [CONFIGURACAO-HOSTINGER.md](CONFIGURACAO-HOSTINGER.md). O Elementor substitui imagens externas por placeholders durante a importação, então logo e fundos dos cards precisam ser selecionados novamente pela Biblioteca de Mídia.

## O que pode ser editado diretamente

- Textos, tamanhos, fontes, cores, espaçamentos e alinhamentos.
- Imagens de cada case e artigo.
- Vídeo de fundo do hero da página inicial.
- Botões e seus links.
- Estrutura de contêineres, cards, serviços e rodapé.

Os filtros de cases e a captura de e-mail da versão HTML foram trocados por blocos nativos. Para restaurar filtros com comportamento dinâmico ou um formulário que envie e-mail, é necessário configurar um formulário do Elementor Pro ou um plugin de formulários, porque esses recursos precisam de processamento além dos widgets nativos gratuitos.
