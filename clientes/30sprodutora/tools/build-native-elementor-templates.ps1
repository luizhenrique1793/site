Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$projectRoot = if ([string]::IsNullOrWhiteSpace($PSScriptRoot)) { (Get-Location).Path } else { Split-Path -Parent $PSScriptRoot }
$outputDir = Join-Path $projectRoot 'elementor-templates\nativos'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
$script:elementIndex = 30000000

$logoDataUri = 'data:image/png;base64,' + [Convert]::ToBase64String([System.IO.File]::ReadAllBytes((Join-Path $projectRoot 'logo.png')))
$colors = @{ Black = '#000000'; Charcoal = '#121212'; White = '#FFFFFF'; Red = '#E30613'; Mist = '#C6C6C7'; Line = '#2B2B2B' }

function New-Id { $script:elementIndex++; return ('{0:x8}' -f $script:elementIndex) }
function Size([int]$value, [string]$unit = 'px') { return [ordered]@{ unit = $unit; size = $value; sizes = @() } }
function CustomWidth([int]$value) { return [ordered]@{ _element_width = 'initial'; _element_custom_width = Size $value '%' } }
function Box([int]$top, [int]$right = $top, [int]$bottom = $top, [int]$left = $right) { return [ordered]@{ unit = 'px'; top = "$top"; right = "$right"; bottom = "$bottom"; left = "$left"; isLinked = $false } }
function Link([string]$url) { return [ordered]@{ url = $url; is_external = ''; nofollow = ''; custom_attributes = '' } }
function ImageUrl([string]$url) { return [ordered]@{ url = $url; id = 0 } }

function New-Container([hashtable]$Settings = @{}, [object[]]$Elements = @()) {
    return [ordered]@{ id = New-Id; elType = 'container'; isInner = $false; settings = $Settings; elements = @($Elements) }
}
function New-Widget([string]$WidgetType, [hashtable]$Settings) {
    return [ordered]@{ id = New-Id; elType = 'widget'; widgetType = $WidgetType; isInner = $false; settings = $Settings; elements = @() }
}
function New-Heading([string]$Text, [int]$FontSize = 40, [string]$Tag = 'h2', [string]$Color = $colors.White, [string]$Align = 'left', [int]$Weight = 700) {
    return New-Widget 'heading' ([ordered]@{
        title = $Text; header_size = $Tag; align = $Align; title_color = $Color
        typography_typography = 'custom'; typography_font_family = 'Montserrat'; typography_font_size = Size $FontSize
        typography_font_weight = "$Weight"; typography_line_height = [ordered]@{ unit = 'em'; size = 1.12; sizes = @() }
    })
}
function New-Text([string]$Text, [int]$FontSize = 17, [string]$Color = $colors.Mist, [string]$Align = 'left') {
    return New-Widget 'text-editor' ([ordered]@{
        editor = "<p>$Text</p>"; text_color = $Color; align = $Align
        typography_typography = 'custom'; typography_font_family = 'Hanken Grotesk'; typography_font_size = Size $FontSize
        typography_line_height = [ordered]@{ unit = 'em'; size = 1.65; sizes = @() }
    })
}
function New-Label([string]$Text, [string]$Color = $colors.Red) {
    return New-Widget 'heading' ([ordered]@{
        title = $Text; header_size = 'p'; title_color = $Color
        typography_typography = 'custom'; typography_font_family = 'Hanken Grotesk'; typography_font_size = Size 11
        typography_font_weight = '700'; typography_letter_spacing = [ordered]@{ unit = 'px'; size = 2; sizes = @() }
    })
}
function New-Button([string]$Text, [string]$Url = '#', [string]$Background = $colors.Red, [string]$TextColor = $colors.White) {
    return New-Widget 'button' ([ordered]@{
        text = $Text; link = Link $Url; align = 'left'; button_text_color = $TextColor; background_color = $Background
        typography_typography = 'custom'; typography_font_family = 'Hanken Grotesk'; typography_font_size = Size 11; typography_font_weight = '700'
        typography_letter_spacing = [ordered]@{ unit = 'px'; size = 1.5; sizes = @() }
        button_padding = Box 16 24; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '1'; right = '1'; bottom = '1'; left = '1'; isLinked = $true }; border_color = $Background
    })
}
function New-Image([string]$Url, [string]$Alt = '30 Segundos', [int]$Width = 100, [string]$Unit = '%') {
    return New-Widget 'image' ([ordered]@{ image = ImageUrl $Url; image_size = 'full'; image_custom_dimension = [ordered]@{ width = $Width; height = 0 }; align = 'left'; image_alt = $Alt })
}
function New-Icon([string]$Icon = 'fas fa-arrow-up-right-from-square') {
    return New-Widget 'icon' ([ordered]@{ selected_icon = [ordered]@{ value = $Icon; library = 'fa-solid' }; icon_color = $colors.Red; icon_size = Size 18; align = 'right' })
}
function New-Page([string]$Title, [object[]]$Content) {
    return [ordered]@{ title = $Title; type = 'page'; version = '0.4'; page_settings = [ordered]@{ background_background = 'classic'; background_color = $colors.Black; content_wrapper_html_tag = 'main' }; content = @($Content) }
}
function Save-Page([string]$FileName, [hashtable]$Page) {
    $json = $Page | ConvertTo-Json -Depth 30
    [System.IO.File]::WriteAllText((Join-Path $outputDir $FileName), $json + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))
}
function New-Nav([string]$Active) {
    $navLinks = @(
        New-Button 'TRABALHOS' '/#trabalhos' $colors.Black $(if ($Active -eq 'inicio') { $colors.Red } else { $colors.White })
        New-Button 'SERVIÇOS' '/servicos/' $colors.Black $(if ($Active -eq 'servicos') { $colors.Red } else { $colors.White })
        New-Button 'INSIGHTS' '/insights/' $colors.Black $(if ($Active -eq 'insights') { $colors.Red } else { $colors.White })
        New-Button 'SOBRE NÓS' '/#sobre' $colors.Black $colors.White
    )
    return New-Container ([ordered]@{ flex_direction = 'row'; content_width = 'full'; justify_content = 'space-between'; align_items = 'center'; gap = [ordered]@{ unit = 'px'; size = 16; column = '16'; row = '16'; isLinked = $true }; padding = Box 18 80; background_background = 'classic'; background_color = $colors.Black; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '0'; right = '0'; bottom = '1'; left = '0'; isLinked = $false }; border_color = $colors.Line }) @(
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 15 '%' } @(New-Image $logoDataUri '30 Segundos' 128 'px')
        New-Container @{ content_width = 'full'; flex_direction = 'row'; _element_width = 'initial'; _element_custom_width = Size 55 '%'; justify_content = 'center'; align_items = 'center'; gap = [ordered]@{ unit = 'px'; size = 6; column = '6'; row = '6'; isLinked = $true } } $navLinks
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 25 '%'; align_items = 'flex-end' } @(New-Button 'VAMOS CONVERSAR' '/#contato')
    )
}
function New-Footer {
    return New-Container ([ordered]@{ flex_direction = 'row'; content_width = 'boxed'; boxed_width = Size 1440 'px'; justify_content = 'space-between'; padding = Box 36 80; background_background = 'classic'; background_color = $colors.Black; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '1'; right = '0'; bottom = '0'; left = '0'; isLinked = $false }; border_color = $colors.Line }) @(
        New-Text '© 2024 30 Segundos Produtora' 12 $colors.Mist
        New-Text 'Produção audiovisual para marcas que querem ser vistas.' 12 $colors.Mist 'right'
    )
}
function New-PortfolioCard([string]$Title, [string]$Category, [string]$Image, [int]$Width = 33, [int]$MinHeight = 350) {
    $cardWidth = if ($Width -gt 50) { 9 } else { 12 }
    $cardCss = "selector { flex: 0 0 calc($Width% - $($cardWidth)px); width: calc($Width% - $($cardWidth)px); max-width: calc($Width% - $($cardWidth)px); min-width: 0; }"
    return New-Container ([ordered]@{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size $Width '%'; min_height = Size $MinHeight 'px'; justify_content = 'flex-end'; padding = Box 28; background_background = 'classic'; background_image = ImageUrl $Image; background_position = 'center center'; background_size = 'cover'; background_overlay_background = 'classic'; background_overlay_color = '#00000080'; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '1'; right = '1'; bottom = '1'; left = '1'; isLinked = $true }; border_color = '#333333'; custom_css = $cardCss }) @(
        New-Label $Category $colors.White
        New-Heading $Title 27 'h3' $colors.White 'left' 700
        New-Button 'VER CASE' '#contato' $colors.Red $colors.White
    )
}
function New-ServiceItem([int]$Number, [string]$Title, [string]$Description, [string]$Deliverables) {
    return New-Container ([ordered]@{ flex_direction = 'row'; content_width = 'full'; align_items = 'center'; gap = [ordered]@{ unit = 'px'; size = 30; column = '30'; row = '30'; isLinked = $true }; padding = Box 30 0; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '0'; right = '0'; bottom = '1'; left = '0'; isLinked = $false }; border_color = $colors.Line }) @(
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 7 '%' } @(New-Label ('{0:d2}' -f $Number))
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 21 '%' } @(New-Heading $Title 24 'h3')
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 30 '%' } @(New-Text $Description 16)
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 28 '%' } @(New-Label 'ENTREGÁVEIS' $colors.White; New-Text $Deliverables 14)
        New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 4 '%' } @(New-Icon)
    )
}
function New-ArticleCard([string]$Category, [string]$Title, [string]$Description, [string]$Image) {
    return New-Container ([ordered]@{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 31 '%'; gap = [ordered]@{ unit = 'px'; size = 18; column = '18'; row = '18'; isLinked = $true } }) @(
        New-Container @{ min_height = Size 250 'px'; background_background = 'classic'; background_image = ImageUrl $Image; background_position = 'center center'; background_size = 'cover' } @()
        New-Label $Category
        New-Heading $Title 24 'h3'
        New-Text $Description 14
        New-Button 'LER ARTIGO' '#' $colors.Black $colors.White
    )
}

# Página inicial
$caseImages = @(
    'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1600&q=85',
    'https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=1600&q=85',
    'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1556911220-bff31c812dba?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1531058020387-3be344556be6?auto=format&fit=crop&w=1200&q=85',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=1200&q=85'
)
$homeContent = @(
    New-Nav 'inicio'
    (New-Container ([ordered]@{ min_height = Size 780 'px'; content_width = 'full'; justify_content = 'center'; align_items = 'center'; padding = Box 160 24 120; background_background = 'video'; background_video_link = 'https://www.youtube.com/watch?v=f7oWr5P_gn8'; background_video_loop = 'yes'; background_video_play_on_mobile = 'yes'; background_video_privacy_mode = 'yes'; background_overlay_background = 'classic'; background_overlay_color = '#00000099' }) @(
        New-Container @{ content_width = 'boxed'; boxed_width = Size 1050 'px'; align_items = 'center'; gap = [ordered]@{ unit = 'px'; size = 25; column = '25'; row = '25'; isLinked = $true } } @(
            New-Heading 'Histórias que merecem ser <em>vistas.</em>' 76 'h1' $colors.White 'center' 800
            New-Text 'Produção audiovisual de alto padrão para marcas e narrativas corporativas. Elevamos o padrão estético com precisão cinematográfica.' 20 $colors.Mist 'center'
            New-Button 'VER TRABALHOS' '#trabalhos' $colors.Black $colors.White
        )
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 120 80; gap = [ordered]@{ unit = 'px'; size = 45; column = '45'; row = '45'; isLinked = $true } }) @(
        New-Label 'PORTFÓLIO / CAMPANHAS'
        New-Container @{ flex_direction = 'row'; justify_content = 'space-between'; align_items = 'flex-end' } @(New-Heading 'Cases que fazem<br/>marcas acontecerem.' 58 'h2'; New-Text 'Filmes publicitários concebidos para interromper a rolagem, permanecer na memória e mover pessoas.' 18)
        New-Container @{ flex_direction = 'row'; flex_wrap = 'wrap'; gap = [ordered]@{ unit = 'px'; size = 18; column = '18'; row = '18'; isLinked = $true }; html_anchor = 'trabalhos' } @(
            New-PortfolioCard 'Varejo em Movimento' '01 / CAMPANHA' $caseImages[0] 57 500
            New-PortfolioCard 'Brilho Singular' '02 / CAMPANHA' $caseImages[1] 41 500
            New-PortfolioCard 'Experiência de Marca' '03 / SOCIAL' $caseImages[2]
            New-PortfolioCard 'Perto de Você' '04 / INSTITUCIONAL' $caseImages[3]
            New-PortfolioCard 'Sabores em Cena' '05 / CAMPANHA' $caseImages[4]
            New-PortfolioCard 'Novo Olhar' '06 / SOCIAL' $caseImages[5]
            New-PortfolioCard 'Marca em Cena' '07 / CAMPANHA' $caseImages[6]
            New-PortfolioCard 'Lançamento' '08 / INSTITUCIONAL' $caseImages[7]
            New-PortfolioCard 'Toda Jornada' '09 / SOCIAL' $caseImages[8]
            New-PortfolioCard 'Em Cena' '10 / CAMPANHA' $caseImages[9]
            New-PortfolioCard 'Momento Alto' '11 / INSTITUCIONAL' $caseImages[10]
        )
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 110 80; background_background = 'classic'; background_color = $colors.Charcoal; gap = [ordered]@{ unit = 'px'; size = 45; column = '45'; row = '45'; isLinked = $true } }) @(
        New-Label 'O QUE FAZEMOS'
        New-Heading 'Qualidade que<br/>se vê em cada frame.' 58 'h2'
        New-Text 'Da ideia à finalização, reunimos estratégia, direção e execução para produzir filmes que sustentam o valor de cada marca.' 18
        New-ServiceItem 1 'Vídeos Publicitários' 'Campanhas desenhadas para ganhar atenção, despertar desejo e mover marcas.' 'Filme principal, cutdowns e versões digitais.'
        New-ServiceItem 2 'Filmes Institucionais' 'Narrativas que tornam cultura, visão e impacto humano memoráveis.' 'Manifesto, entrevistas e documentários.'
        New-ServiceItem 3 'Vídeos Corporativos' 'Comunicação audiovisual clara para construir confiança e posicionamento.' 'Cases, treinamentos e eventos.'
        New-ServiceItem 4 'Social Content' 'Formatos ágeis que preservam direção, linguagem e qualidade cinematográfica.' 'Reels, séries e bastidores.'
        New-ServiceItem 5 'Timelapse de Obras' 'Acompanhamento que transforma tempo, escala e evolução em narrativa de valor.' 'Captação recorrente e filme final.'
        New-Button 'CONHEÇA TODOS OS SERVIÇOS' '/servicos/'
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 120 80; flex_direction = 'row'; justify_content = 'space-between'; align_items = 'flex-end'; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '1'; right = '1'; bottom = '1'; left = '1'; isLinked = $true }; border_color = '#4A4A4A'; html_anchor = 'contato' }) @(
        New-Container @{} @(New-Label 'PRÓXIMO PROJETO'; New-Heading 'Vamos fazer uma<br/>marca acontecer.' 56 'h2')
        New-Button 'SOLICITAR ORÇAMENTO' 'https://api.whatsapp.com/send/?phone=5543991619048'
    ))
    New-Footer
)
Save-Page '30-segundos-inicio-native-v3.json' (New-Page '30 Segundos, Início, Nativo V3' $homeContent)

# Página de serviços
$serviceRows = @(
    @(1, 'Vídeos Publicitários', 'Campanhas de produto e marca feitas para televisão, mídia digital, cinema e performance.', 'Filme principal, cutdowns, versões verticais e peças de social.'),
    @(2, 'Filmes Institucionais', 'Histórias que traduzem propósito, cultura e impacto para públicos internos, clientes e parceiros.', 'Filme manifesto, entrevistas, captação documental e versões de apoio.'),
    @(3, 'Vídeos Corporativos', 'Comunicação clara e confiável para vendas, treinamento, eventos e relacionamento com o mercado.', 'Apresentações, cases, treinamentos e comunicação interna.'),
    @(4, 'Social Content', 'Conteúdo nativo para plataformas sociais, com agilidade sem abrir mão de direção e acabamento.', 'Reels, séries, entrevistas, bastidores e peças de campanha.'),
    @(5, 'Timelapse de Obras', 'Acompanhamento visual de longa duração que torna evolução, escala e engenharia perceptíveis.', 'Captação recorrente, gestão remota e filme de encerramento.')
)
$servicesContent = @(
    New-Nav 'servicos'
    (New-Container ([ordered]@{ min_height = Size 620 'px'; content_width = 'boxed'; boxed_width = Size 1440 'px'; justify_content = 'center'; padding = Box 190 80 100; background_background = 'classic'; background_image = ImageUrl 'https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&w=2000&q=85'; background_position = 'center center'; background_size = 'cover'; background_overlay_background = 'classic'; background_overlay_color = '#000000A6' }) @(
        New-Label 'SERVIÇOS / 30 SEGUNDOS'
        New-Heading 'Do briefing ao<br/><em>último frame.</em>' 72 'h1'
        New-Text 'Criamos filmes e campanhas com uma equipe que conecta estratégia, direção criativa e execução cinematográfica.' 20
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 120 80; gap = [ordered]@{ unit = 'px'; size = 35; column = '35'; row = '35'; isLinked = $true } }) @(
        New-Label 'FORMATOS'
        New-Heading 'Uma produção do<br/>tamanho da sua ideia.' 58 'h2'
        New-Text 'Escolha o formato que atende ao momento da marca. Nós montamos o time, a linguagem e o plano de produção.' 18
        (New-Container ([ordered]@{ border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '1'; right = '0'; bottom = '0'; left = '0'; isLinked = $false }; border_color = $colors.Line }) ($serviceRows | ForEach-Object { New-ServiceItem $_[0] $_[1] $_[2] $_[3] }))
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 100 80; background_background = 'classic'; background_color = $colors.Charcoal; gap = [ordered]@{ unit = 'px'; size = 40; column = '40'; row = '40'; isLinked = $true } }) @(
        New-Label 'NOSSO PROCESSO'
        New-Heading 'Clareza antes<br/>da câmera.' 54 'h2'
        New-Container @{ flex_direction = 'row'; gap = [ordered]@{ unit = 'px'; size = 45; column = '45'; row = '45'; isLinked = $true } } @(
            New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 31 '%' } @(New-Heading '01' 48 'h3' '#5A5A5A'; New-Heading 'Estratégia' 22 'h3'; New-Text 'Imersão, objetivo, público e a ideia que organiza cada decisão criativa.' 15)
            New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 31 '%' } @(New-Heading '02' 48 'h3' '#5A5A5A'; New-Heading 'Produção' 22 'h3'; New-Text 'Roteiro, casting, locação, direção, captação e uma operação sob medida.' 15)
            New-Container @{ content_width = 'full'; _element_width = 'initial'; _element_custom_width = Size 31 '%' } @(New-Heading '03' 48 'h3' '#5A5A5A'; New-Heading 'Finalização' 22 'h3'; New-Text 'Edição, som, cor e versões pensadas para cada canal de distribuição.' 15)
        )
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; flex_direction = 'row'; justify_content = 'space-between'; align_items = 'flex-end'; padding = Box 110 80; border_border = 'solid'; border_width = [ordered]@{ unit = 'px'; top = '0'; right = '0'; bottom = '1'; left = '0'; isLinked = $false }; border_color = $colors.Line }) @(
        New-Container @{} @(New-Label 'PRÓXIMO PROJETO'; New-Heading 'Vamos fazer uma<br/>marca acontecer.' 56 'h2')
        New-Button 'SOLICITAR ORÇAMENTO' '/#contato'
    ))
    New-Footer
)
Save-Page '30-segundos-servicos-native-v3.json' (New-Page '30 Segundos, Serviços, Nativo V3' $servicesContent)

# Página de insights
$articleImages = @(
    'https://images.unsplash.com/photo-1485846234645-a62644f84728?auto=format&fit=crop&w=1000&q=85',
    'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1000&q=85',
    'https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&w=1000&q=85',
    'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1000&q=85',
    'https://images.unsplash.com/photo-1558655146-d09347e92766?auto=format&fit=crop&w=1000&q=85',
    'https://images.unsplash.com/photo-1531058020387-3be344556be6?auto=format&fit=crop&w=1000&q=85'
)
$articles = @(
    @('PRODUÇÃO / 5 MIN', 'Como planejar uma diária de gravação sem perder a espontaneidade', 'Planejamento técnico e espaço para a cena acontecer.'),
    @('ESTRATÉGIA / 4 MIN', 'O vídeo institucional ainda precisa parecer institucional?', 'Uma conversa sobre linguagem, pessoas e autenticidade.'),
    @('MARCA / 6 MIN', 'Por que direção de arte é estratégia de percepção', 'Quando o visual deixa de ser acabamento e passa a carregar sentido.'),
    @('MARCA / 3 MIN', 'Filmes com pessoas: como encontrar a voz certa', 'Casting, escuta e a escolha de quem torna a mensagem crível.'),
    @('PRODUÇÃO / 7 MIN', 'O que muda quando uma campanha nasce para múltiplas telas', 'Um só conceito, diferentes ritmos, formatos e contextos.'),
    @('BASTIDORES / 4 MIN', 'Da referência ao set: onde uma campanha ganha sua forma', 'Os encontros de criação que tornam uma produção realmente singular.')
)
$insightsContent = @(
    New-Nav 'insights'
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 175 80 80; gap = [ordered]@{ unit = 'px'; size = 25; column = '25'; row = '25'; isLinked = $true } }) @(
        New-Label 'JORNAL 30 SEGUNDOS'
        New-Heading 'Ideias para<br/><em>serem vistas.</em>' 72 'h1'
        New-Text 'Referências, bastidores e decisões que ajudam marcas a pensar audiovisual com mais intenção.' 20
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; min_height = Size 620 'px'; justify_content = 'flex-end'; padding = Box 55 70; background_background = 'classic'; background_image = ImageUrl 'https://images.unsplash.com/photo-1492619375914-88005aa9e8fb?auto=format&fit=crop&w=1800&q=85'; background_position = 'center center'; background_size = 'cover'; background_overlay_background = 'classic'; background_overlay_color = '#00000099' }) @(
        New-Label 'EM DESTAQUE / ESTRATÉGIA'
        New-Heading 'O que faz uma campanha de vídeo permanecer na memória?' 55 'h2'
        New-Text 'Uma boa produção não começa na câmera. Entenda as decisões que unem ideia, ritmo e execução para aumentar o impacto de uma campanha.' 18
        New-Button 'LER ARTIGO' '#destaque' $colors.Black $colors.White
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; padding = Box 110 80; gap = [ordered]@{ unit = 'px'; size = 38; column = '38'; row = '38'; isLinked = $true } }) @(
        New-Heading 'Mais recentes' 42 'h2'
        New-Container @{ flex_direction = 'row'; flex_wrap = 'wrap'; gap = [ordered]@{ unit = 'px'; size = 28; column = '28'; row = '42'; isLinked = $false } } @(
            New-ArticleCard $articles[0][0] $articles[0][1] $articles[0][2] $articleImages[0]
            New-ArticleCard $articles[1][0] $articles[1][1] $articles[1][2] $articleImages[1]
            New-ArticleCard $articles[2][0] $articles[2][1] $articles[2][2] $articleImages[2]
            New-ArticleCard $articles[3][0] $articles[3][1] $articles[3][2] $articleImages[3]
            New-ArticleCard $articles[4][0] $articles[4][1] $articles[4][2] $articleImages[4]
            New-ArticleCard $articles[5][0] $articles[5][1] $articles[5][2] $articleImages[5]
        )
    ))
    (New-Container ([ordered]@{ content_width = 'boxed'; boxed_width = Size 1440 'px'; flex_direction = 'row'; justify_content = 'space-between'; align_items = 'center'; padding = Box 95 80; background_background = 'classic'; background_color = $colors.Charcoal }) @(
        New-Container @{} @(New-Label 'RECEBA O JORNAL'; New-Heading 'Uma boa referência<br/>no seu e-mail.' 48 'h2')
        New-Button 'RECEBER CONTEÚDOS NO WHATSAPP' 'https://api.whatsapp.com/send/?phone=5543991619048'
    ))
    New-Footer
)
Save-Page '30-segundos-insights-native-v3.json' (New-Page '30 Segundos, Insights, Nativo V3' $insightsContent)

Write-Output "Templates nativos gerados em: $outputDir"
