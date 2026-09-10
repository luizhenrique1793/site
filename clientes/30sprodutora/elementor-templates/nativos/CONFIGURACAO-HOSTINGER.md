# Ajuste no WordPress e Elementor

## Diagnóstico da página publicada

A página está com o layout `Elementor Canvas`, que remove cabeçalho, rodapé e barra lateral do tema. Por isso o tema ativo não é a causa do conteúdo da página.

O problema encontrado é a importação de imagens externas: o Elementor substituiu o logo e as imagens de fundo dos cards pelo arquivo `placeholder.png`. A troca de tema não resolve essas imagens.

## Ordem certa de ajuste

1. Em **Aparência > Temas**, instale e ative **Hello Elementor**.
2. Em **Elementor > Configurações > Geral**, mantenha a página em `Elementor Canvas` enquanto o cabeçalho e rodapé estiverem dentro do conteúdo da página.
3. Em **Elementor > Ferramentas**, execute **Regenerar arquivos e dados** depois de trocar o tema.
4. Em **Mídia > Adicionar nova**, envie o logo e as imagens usadas nos cards.
5. Abra a página com Elementor e substitua cada `placeholder.png` pela imagem correspondente na aba **Estilo > Plano de fundo > Clássico > Imagem**. Para o logo, clique no widget Imagem e escolha o arquivo enviado.
6. Atualize a página e limpe o cache da Hostinger e do LiteSpeed, se estiver ativo.

## Configurações globais da marca

Abra qualquer página no Elementor, clique no ícone do Elementor no canto superior esquerdo e entre em **Configurações do site**.

### Cores globais

| Nome sugerido | Cor |
| --- | --- |
| Signal Red | `#E30613` |
| Pure Black | `#000000` |
| Deep Charcoal | `#121212` |
| Mist | `#C6C6C7` |
| Stark White | `#FFFFFF` |

Defina Signal Red como cor de destaque. Use Pure Black no fundo principal, Deep Charcoal nas faixas de contraste, Mist no texto secundário e Stark White nos títulos.

### Fontes globais

| Papel | Fonte | Uso |
| --- | --- | --- |
| Títulos | Montserrat | peso 700 ou 800 |
| Texto | Hanken Grotesk | peso 400 |
| Rótulos e botões | Hanken Grotesk | peso 700, maiúsculas, espaçamento entre letras |

Em **Configurações do site > Layout**, use largura de conteúdo de `1440px` e espaçamento padrão de widgets `0px`. Os espaçamentos de cada seção já vêm definidos no template.

## Tema recomendado

**Hello Elementor é recomendado**, mas não é obrigatório. O tema atual é Twenty Twenty-Five e já está isolado pelo Canvas nesta página. O Hello é melhor para o projeto porque é mínimo, feito para Elementor e reduz estilos globais do tema que podem interferir em páginas futuras.

Antes de ativar o tema, confira se há outras páginas no WordPress que dependem do visual do Twenty Twenty-Five. Se este WordPress é exclusivo para a 30 Segundos, a troca é segura e indicada.

## O que ainda precisa de administração no painel

- Escolher e enviar as imagens à Biblioteca de Mídia.
- Trocar os placeholders nos cards e no logo.
- Definir a página inicial em **Configurações > Leitura** quando o endereço final estiver pronto.
- Criar cabeçalho e rodapé pelo Theme Builder apenas se quiser removê-los do conteúdo de cada página. Enquanto o layout for Canvas, mantenha-os dentro da página.
