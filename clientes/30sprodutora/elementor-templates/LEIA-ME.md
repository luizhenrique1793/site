# Templates Elementor, 30 Segundos

Importe um arquivo por página em **Modelos > Modelos salvos > Importar modelos** no WordPress:

1. `30-segundos-inicio.json`
2. `30-segundos-servicos.json`
3. `30-segundos-insights.json`

Depois crie ou abra a página correspondente no Elementor, clique no ícone de pasta, selecione **Meus modelos** e insira o template.

Use o layout de página **Elementor Canvas** para não duplicar o cabeçalho e o rodapé do tema. Se precisar manter o cabeçalho do tema, use **Elementor Full Width** e remova do template a navegação e o rodapé internos.

Os templates carregam Tailwind, Google Fonts e Material Symbols pelo navegador, como a versão HTML original. O logo foi incorporado no próprio JSON, então não precisa ser enviado para a Biblioteca de Mídia. As fotos continuam sendo carregadas do Unsplash e o vídeo de fundo do YouTube, como no site atual.

Os links de navegação foram convertidos para as rotas `/`, `/servicos/` e `/insights/`. Caso os seus slugs sejam diferentes, atualize os links dentro do widget HTML depois da importação.

O conteúdo é mantido em um widget HTML para preservar o visual e os comportamentos atuais, inclusive filtros, menus e formulários de WhatsApp. Isso não transforma cada bloco em widgets nativos editáveis do Elementor. Uma versão totalmente nativa exigiria reconstruir a página seção por seção e as interações em JavaScript continuariam personalizadas.
