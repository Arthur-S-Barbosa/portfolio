# Portfólio — Arthur Barbosa

Site de portfólio profissional. Apresenta perfil, stack técnica, experiência
profissional, formação acadêmica e projetos, com uma identidade visual que
mistura estética de editor de código com design de interface — reforçando o
perfil híbrido de dev e designer.

## O que o projeto é

Uma single-page application em **Vue 3**, publicada como site estático no
**GitHub Pages**, com o conteúdo (skills, experiências, formação, idiomas)
armazenado no **Supabase** em vez de codificado diretamente no front-end.

A seção de projetos é preenchida automaticamente a partir da API pública do
GitHub, sempre refletindo os repositórios mais recentes do perfil.

## Arquitetura

O projeto usa Vue3 como estrutura front-end e **Supabase** como camada de dados/backend: um banco Postgres com uma API REST pronta (guarda o conteúdo do currículo) sem exigir um servidor rodando à parte.

```
src/
  components/   seções da página (hero, sobre, skills, experiência...)
  data/         dados de fallback, usados se o Supabase não responder
  lib/          cliente Supabase, tema claro/escuro, busca de conteúdo
supabase/
  schema.sql    estrutura das tabelas e conteúdo inicial
.github/workflows/deploy.yml   build e deploy automático no GitHub Pages
```

## Funcionalidades

- Conteúdo editável via Supabase (skills, experiência, formação, cursos,
  idiomas, dados de perfil e foto), com fallback estático caso o banco
  esteja indisponível
- Projetos puxados em tempo real da API pública do GitHub
- Modo claro/escuro, com detecção da preferência do sistema e persistência
  da escolha do usuário
- Layout responsivo, do celular ao desktop
- Deploy automático a cada `push`, via GitHub Actions

## Stack

Vue 3 · Vite · Supabase (Postgres + REST API) · GitHub Actions · GitHub
Pages
