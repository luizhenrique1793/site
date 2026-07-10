# AutomaLeads — site institucional

Site estático da AutomaLeads, suas páginas de serviços e a landing page AtendeFIT.

## Estrutura

```text
index.html                       Home principal
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
- Cadastro: `https://app.automaleads.cloud/webhook/cadastrar`
- WhatsApp principal: `+55 (44) 99881-3718`
- WhatsApp AtendeFIT: `+55 (44) 98838-5503`

## Antes do deploy

- Confirmar preços, limites e condições do teste grátis.
- Revisar Termos e Política de Privacidade com orientação jurídica.
- Validar os resultados, métricas e provas sociais da página AtendeFIT.
- Testar todos os CTAs em produção e confirmar o recebimento no WhatsApp.
