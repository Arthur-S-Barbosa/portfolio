import { ref, onMounted } from 'vue'
import { supabase, isSupabaseConfigured } from './supabase'
import * as fallback from '../data/fallbackData'

/**
 * Busca uma tabela do Supabase (ordenada por "order_index" se existir).
 * Se o Supabase não estiver configurado, ou a tabela ainda estiver vazia,
 * usa os dados estáticos de fallbackData.js — assim você pode publicar o
 * site antes mesmo de configurar o banco de dados.
 */
export function useTable(tableName, fallbackKey, orderColumn = 'order_index') {
  const data = ref(fallback[fallbackKey] || [])
  const loading = ref(isSupabaseConfigured)

  onMounted(async () => {
    if (!supabase) return
    const { data: rows, error } = await supabase
      .from(tableName)
      .select('*')
      .order(orderColumn, { ascending: true })

    if (!error && rows && rows.length > 0) {
      data.value = rows
    }
    loading.value = false
  })

  return { data, loading }
}

export function useProfile() {
  const data = ref(fallback.profile)
  onMounted(async () => {
    if (!supabase) return
    const { data: rows, error } = await supabase.from('profile').select('*').limit(1)
    if (!error && rows && rows.length > 0) data.value = rows[0]
  })
  return { data }
}
