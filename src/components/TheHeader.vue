<script setup>
import { useTheme } from "../lib/useTheme";

const { theme, toggleTheme } = useTheme();

const links = [
  { id: "sobre", label: "about.tsx" },
  { id: "skills", label: "skills.json" },
  { id: "experiencia", label: "experience.log" },
  { id: "formacao", label: "education.md" },
  { id: "projetos", label: "projects.gh" },
  { id: "contato", label: "contact.sh" },
];
</script>

<template>
  <header class="header">
    <div class="container bar">
      <span class="logo">arthur<span class="dot">.</span>dev</span>
      <nav class="tabs">
        <a v-for="l in links" :key="l.id" :href="`#${l.id}`" class="tab">{{
          l.label
        }}</a>
      </nav>
      <button
        class="theme-toggle"
        type="button"
        @click="toggleTheme"
        :aria-label="
          theme === 'dark' ? 'Ativar modo claro' : 'Ativar modo escuro'
        "
      >
        <svg
          v-if="theme === 'dark'"
          width="16"
          height="16"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <circle cx="12" cy="12" r="4"></circle>
          <line x1="12" y1="2" x2="12" y2="4"></line>
          <line x1="12" y1="20" x2="12" y2="22"></line>
          <line x1="4.93" y1="4.93" x2="6.34" y2="6.34"></line>
          <line x1="17.66" y1="17.66" x2="19.07" y2="19.07"></line>
          <line x1="2" y1="12" x2="4" y2="12"></line>
          <line x1="20" y1="12" x2="22" y2="12"></line>
          <line x1="4.93" y1="19.07" x2="6.34" y2="17.66"></line>
          <line x1="17.66" y1="6.34" x2="19.07" y2="4.93"></line>
        </svg>
        <svg
          v-else
          width="16"
          height="16"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
        </svg>
      </button>
    </div>
  </header>
</template>

<style scoped>
.header {
  position: sticky;
  top: 0;
  z-index: 20;
  background: var(--header-bg);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--line);
  transition:
    background-color 0.2s ease,
    border-color 0.2s ease;
}
.bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 56px;
  gap: 12px;
}
.logo {
  font-family: var(--mono);
  font-weight: 500;
  font-size: 14px;
}
.dot {
  color: var(--accent);
}
.tabs {
  display: flex;
  gap: 4px;
  overflow-x: auto;
  scrollbar-width: none;
  min-width: 0;
  flex: 1;
}
.tabs::-webkit-scrollbar {
  display: none;
}
.tab {
  font-family: var(--mono);
  font-size: 12.5px;
  color: var(--muted);
  text-decoration: none;
  padding: 6px 10px;
  border-radius: 6px;
  white-space: nowrap;
  flex-shrink: 0;
}
.tab:hover {
  color: var(--ink);
  background: var(--paper-dim);
}

.theme-toggle {
  flex-shrink: 0;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 8px;
  border: 1px solid var(--line);
  background: transparent;
  color: var(--ink-soft);
  cursor: pointer;
  transition:
    border-color 0.15s ease,
    color 0.15s ease;
}
.theme-toggle:hover {
  border-color: var(--ink);
  color: var(--ink);
}
@media (max-width: 640px) {
  .bar {
    gap: 12px;
  }
  .logo {
    flex-shrink: 0;
  }
  .tabs {
    -webkit-mask-image: linear-gradient(
      to right,
      transparent,
      black 12px,
      black 90%,
      transparent
    );
    mask-image: linear-gradient(
      to right,
      transparent,
      black 12px,
      black 90%,
      transparent
    );
  }
}
</style>
