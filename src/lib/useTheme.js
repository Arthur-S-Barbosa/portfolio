import { ref } from "vue";

const theme = ref(
  document.documentElement.getAttribute("data-theme") || "light",
);

export function useTheme() {
  function setTheme(value) {
    theme.value = value;
    document.documentElement.setAttribute("data-theme", value);
    localStorage.setItem("theme", value);
  }

  function toggleTheme() {
    setTheme(theme.value === "dark" ? "light" : "dark");
  }

  return { theme, setTheme, toggleTheme };
}
