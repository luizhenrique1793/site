Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $projectRoot 'elementor-templates'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$logoBytes = [System.IO.File]::ReadAllBytes((Join-Path $projectRoot 'logo.png'))
$logoDataUri = 'data:image/png;base64,' + [Convert]::ToBase64String($logoBytes)

$pages = @(
    @{ Source = 'index.html';    Title = '30 Segundos, Início';   Slug = 'inicio' },
    @{ Source = 'servicos.html'; Title = '30 Segundos, Serviços'; Slug = 'servicos' },
    @{ Source = 'insights.html'; Title = '30 Segundos, Insights'; Slug = 'insights' }
)

function Get-DeterministicId([string]$value) {
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $hash = $sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($value))
        return ([System.BitConverter]::ToString($hash)).Replace('-', '').Substring(0, 7).ToLowerInvariant()
    } finally {
        $sha.Dispose()
    }
}

foreach ($page in $pages) {
    $sourcePath = Join-Path $projectRoot $page.Source
    $source = [System.IO.File]::ReadAllText($sourcePath, [System.Text.Encoding]::UTF8)

    $head = [regex]::Match($source, '(?is)<head[^>]*>(.*?)</head>').Groups[1].Value
    $bodyMatch = [regex]::Match($source, '(?is)<body(?<attributes>[^>]*)>(?<content>.*?)</body>')
    if (-not $bodyMatch.Success) { throw "Não foi possível encontrar o corpo de $($page.Source)." }

    # Meta, título e favicon pertencem ao documento WordPress, não ao widget HTML.
    $head = [regex]::Replace($head, '(?is)<meta\b[^>]*>', '')
    $head = [regex]::Replace($head, '(?is)<title\b[^>]*>.*?</title>', '')
    $head = [regex]::Replace($head, '(?is)<link\b(?=[^>]*\brel=["'']icon["''])[^>]*>', '')

    $bodyClasses = [regex]::Match($bodyMatch.Groups['attributes'].Value, '(?is)\bclass=["'']([^"'']*)["'']').Groups[1].Value
    $content = $bodyMatch.Groups['content'].Value.Trim()

    # Transforma a navegação dos arquivos estáticos em URLs de páginas WordPress.
    $content = $content.Replace('index.html#', '/#').Replace('index.html', '/')
    $content = $content.Replace('servicos.html', '/servicos/').Replace('insights.html', '/insights/')
    $content = $content.Replace('src="logo.png"', "src=`"$logoDataUri`"")

    $scope = "thirty-page-$($page.Slug)"
    $html = @"
<div id="$scope" class="$bodyClasses">
  <!-- 30 Segundos: dependências visuais do template -->
  $head
  $content
</div>
"@

    $containerId = Get-DeterministicId "$($page.Slug)-container"
    $widgetId = Get-DeterministicId "$($page.Slug)-html-widget"
    $template = [ordered]@{
        version = '0.4'
        title = $page.Title
        type = 'page'
        content = @(
            [ordered]@{
                id = $containerId
                elType = 'container'
                settings = [ordered]@{
                    content_width = 'full'
                    padding = [ordered]@{ unit = 'px'; top = '0'; right = '0'; bottom = '0'; left = '0'; isLinked = $false }
                    margin = [ordered]@{ unit = 'px'; top = '0'; right = '0'; bottom = '0'; left = '0'; isLinked = $false }
                }
                elements = @(
                    [ordered]@{
                        id = $widgetId
                        elType = 'widget'
                        widgetType = 'html'
                        settings = [ordered]@{ html = $html }
                        elements = @()
                        isInner = $false
                    }
                )
                isInner = $false
            }
        )
        page_settings = @()
        exported_type = 'page'
    }

    $json = $template | ConvertTo-Json -Depth 20
    $destination = Join-Path $outputDir ("30-segundos-$($page.Slug).json")
    [System.IO.File]::WriteAllText($destination, $json + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))
    Write-Output "Gerado: $destination"
}
