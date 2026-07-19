import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

export const supabase = url && anonKey ? createClient(url, anonKey) : null

export const isSupabaseConfigured = !!supabase

if (isSupabaseConfigured) {
  console.info('[supabase] cliente configurado:', url)
} else {
  console.warn(
    '[supabase] VITE_SUPABASE_URL ou VITE_SUPABASE_ANON_KEY não encontradas neste build. ' +
    'Local: confira o .env e reinicie "npm run dev". ' +
    'Produção (GitHub Pages): confira os Secrets do repositório e rode o workflow de novo.'
  )
}
