import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// IMPORTANT: troque 'nome-do-repositorio' pelo nome exato do seu repositório
// no GitHub. Se o repo se chamar "portfolio", o base deve ser '/portfolio/'.
// Se for um repositório do tipo <usuario>.github.io, use base: '/'.
export default defineConfig({
  plugins: [vue()],
  base: process.env.VITE_BASE_PATH || '/portfolio/',
})
