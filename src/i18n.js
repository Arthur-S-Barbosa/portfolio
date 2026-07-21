import { createI18n } from "vue-i18n";
import pt from "./locales/pt";
import en from "./locales/en";
import es from "./locales/es";

export const SUPPORTED_LOCALES = [
  { code: "pt", label: "Português" },
  { code: "en", label: "English" },
  { code: "es", label: "Español" },
];

function detectDefaultLocale() {
  const saved = localStorage.getItem("locale");
  if (saved && SUPPORTED_LOCALES.some((l) => l.code === saved)) return saved;

  const browser = (navigator.language || "pt").slice(0, 2);
  if (SUPPORTED_LOCALES.some((l) => l.code === browser)) return browser;

  return "pt";
}

export const i18n = createI18n({
  legacy: false,
  locale: detectDefaultLocale(),
  fallbackLocale: "pt",
  messages: { pt, en, es },
});

export function setLocale(code) {
  i18n.global.locale.value = code;
  localStorage.setItem("locale", code);
  document.documentElement.setAttribute("lang", code === "pt" ? "pt-BR" : code);
}
