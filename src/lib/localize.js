import { useI18n } from "vue-i18n";

export function useLocalizedField() {
  const { locale } = useI18n();

  function tr(row, field) {
    if (!row) return "";
    if (locale.value === "pt") return row[field];
    const translated = row[`${field}_${locale.value}`];
    if (translated == null) return row[field];
    if (Array.isArray(translated) && translated.length === 0) return row[field];
    return translated;
  }

  return { tr };
}
