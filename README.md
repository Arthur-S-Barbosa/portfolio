# Portfólio — Arthur Barbosa

Site de portfólio em **Vue 3 + Vite**, com conteúdo (skills, experiência,
formação etc.) armazenado no **Supabase** e editável direto pelo painel do
Supabase — sem precisar mexer em código para adicionar ou remover informações.
Projetos são puxados automaticamente da **API pública do GitHub**.

## 1. Rodar localmente

```bash
npm install
cp .env.example .env   # preencha com as credenciais do Supabase (passo 2)
npm run dev
```

## 2. Configurar o Supabase (recomendado)

1. Crie um projeto gratuito em [supabase.com](https://supabase.com).
2. Vá em **SQL Editor** → cole o conteúdo de `supabase/schema.sql` → **Run**.
   Isso cria as tabelas e já insere os dados do seu currículo atual.
3. Vá em **Project Settings → API** e copie a **Project URL** e a chave
   **anon public**.
4. Cole essas duas informações no seu `.env` local (para testar) e também em
   **GitHub → Settings → Secrets and variables → Actions**, como
   `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY` (para o deploy automático).
5. Para editar seu currículo depois: Supabase → **Table Editor** → escolha a
   tabela (`experience`, `skills`, `education`...) → adicione, edite ou
   remova linhas direto na interface. O site reflete a mudança no próximo
   carregamento — sem precisar rebuildar nem mexer em código.

Se você pular esse passo, o site funciona normalmente usando os dados
estáticos de `src/data/fallbackData.js` como conteúdo inicial.

## 3. Sua foto

Coloque o arquivo de imagem em `public/photo.jpg` e adicione a coluna
`photo_url` na tabela `profile` do Supabase apontando para
`/photo.jpg` (ou para uma URL de imagem hospedada, ex: no próprio Supabase
Storage). Sem isso, aparece um placeholder no lugar da foto.

## 4. Seu usuário do GitHub (seção de projetos)

Edite `GITHUB_USERNAME` em `src/App.vue` com o seu usuário — a seção de
projetos busca automaticamente seus repositórios públicos mais recentes via
`api.github.com`, sem precisar de configuração adicional.

## 5. Publicar no GitHub Pages

1. Crie um repositório no GitHub (ex: `portfolio`) e envie este código:
   ```bash
   git init
   git add .
   git commit -m "portfolio inicial"
   git branch -M main
   git remote add origin https://github.com/SEU-USUARIO/portfolio.git
   git push -u origin main
   ```
2. Em **Settings → Pages**, em "Build and deployment", escolha
   **Source: GitHub Actions** (o workflow em `.github/workflows/deploy.yml`
   já está pronto e roda sozinho a cada `push` na `main`).
3. Se o nome do seu repositório **não** for `portfolio`, ajuste o valor de
   `VITE_BASE_PATH` em `.github/workflows/deploy.yml` e em `vite.config.js`
   para `/nome-do-seu-repo/`. Se for um repositório
   `seu-usuario.github.io`, use `/`.
4. Depois do primeiro push, o site fica em
   `https://SEU-USUARIO.github.io/portfolio/`.

## Estrutura

```
src/
  components/     seções da página (hero, sobre, skills, experiência...)
  data/           dados de fallback (extraídos do seu currículo atual)
  lib/            cliente Supabase + composable de busca de conteúdo
supabase/
  schema.sql      cria as tabelas e popula com os dados do currículo
.github/workflows/deploy.yml   build + deploy automático no GitHub Pages
```

## Por que não Laravel

O pedido original incluía Vue + Laravel. Tecnicamente isso é possível, mas
**não em conjunto com o GitHub Pages**, que hospeda apenas arquivos
estáticos — não roda PHP nem qualquer backend. As alternativas seriam:

- **Vue (GitHub Pages) + Supabase** *(o que este projeto usa)* — sem
  servidor para manter, tabelas editáveis por interface visual, gratuito no
  plano usado aqui. É o caminho mais simples para o que você descreveu
  (editar informações com facilidade).
- **Vue (GitHub Pages) + Laravel API hospedado à parte** (ex: Railway,
  Render, Fly.io) — faz sentido se você já tem lógica de negócio complexa em
  PHP ou quer praticar Laravel especificamente, mas adiciona um servidor a
  mais para manter, monitorar e pagar (a maioria desses serviços tem camada
  gratuita limitada, que "dorme" após inatividade).

Se seu objetivo é aprender/mostrar Laravel no currículo, vale manter um
projeto Laravel separado (ex: uma API de outro projeto), e usar este
portfólio - que é o que fica público e precisa ser rápido/barato de manter -
com a stack mais simples.
