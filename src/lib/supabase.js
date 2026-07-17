import { createClient } from '@supabase/supabase-js'

const url = import.meta.env.VITE_SUPABASE_URL
const anonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

// Se as variáveis de ambiente não estiverem configuradas, o app cai de volta
// para os dados estáticos em src/data/fallbackData.js — assim o site nunca
// quebra, mesmo antes de você configurar o Supabase.
export const supabase = url && anonKey ? createClient(url, anonKey) : null

export const isSupabaseConfigured = !!supabase
