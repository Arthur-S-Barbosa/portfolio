import { ref, onMounted } from 'vue'
import { supabase, isSupabaseConfigured } from './supabase'
import * as fallback from '../data/fallbackData'

export function useTable(tableName, fallbackKey, orderColumn = 'order_index') {
  const data = ref(fallback[fallbackKey] || [])
  const loading = ref(isSupabaseConfigured)

  onMounted(async () => {
    if (!supabase) {
      console.warn(
        `[supabase] cliente não configurado — usando fallback para "${tableName}". ` +
        `Verifique VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY.`
      )
      return
    }
    const { data: rows, error } = await supabase
      .from(tableName)
      .select('*')
      .order(orderColumn, { ascending: true })

    if (error) {
      console.error(`[supabase] erro ao buscar "${tableName}":`, error.message, error)
    } else if (!rows || rows.length === 0) {
      console.warn(`[supabase] tabela "${tableName}" retornou vazia — usando fallback.`)
    } else {
      data.value = rows
      console.info(`[supabase] fonte: supabase — "${tableName}" (${rows.length} linhas)`)
    }
    loading.value = false
  })

  return { data, loading }
}

export function useProfile() {
  const data = ref(fallback.profile)
  onMounted(async () => {
    if (!supabase) {
      console.warn('[supabase] cliente não configurado — usando fallback para "profile".')
      return
    }
    const { data: rows, error } = await supabase.from('profile').select('*').limit(1)
    if (error) {
      console.error('[supabase] erro ao buscar "profile":', error.message, error)
    } else if (!rows || rows.length === 0) {
      console.warn('[supabase] tabela "profile" retornou vazia — usando fallback.')
    } else {
      data.value = rows[0]
      console.info('[supabase] fonte: supabase — "profile"')
    }
  })
  return { data }
}
