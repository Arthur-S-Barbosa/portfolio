<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";
import { SUPPORTED_LOCALES, setLocale } from "../i18n";

const props = defineProps({ locale: String });

const open = ref(false);
const root = ref(null);

function toggle() {
  open.value = !open.value;
}

function choose(code) {
  setLocale(code);
  open.value = false;
}

function onClickOutside(e) {
  if (root.value && !root.value.contains(e.target)) open.value = false;
}

function onKeydown(e) {
  if (e.key === "Escape") open.value = false;
}

onMounted(() => {
  document.addEventListener("mousedown", onClickOutside);
  document.addEventListener("keydown", onKeydown);
});
onBeforeUnmount(() => {
  document.removeEventListener("mousedown", onClickOutside);
  document.removeEventListener("keydown", onKeydown);
});
</script>

<template>
  <div class="lang" ref="root">
    <button
      type="button"
      class="lang-trigger"
      :aria-expanded="open"
      aria-haspopup="listbox"
      aria-label="Idioma / Language / Idioma"
      @click="toggle"
    >
      {{ locale.toUpperCase() }}
      <svg
        class="chev"
        :class="{ up: open }"
        width="12"
        height="12"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <polyline points="6 9 12 15 18 9"></polyline>
      </svg>
    </button>

    <ul v-if="open" class="lang-list" role="listbox">
      <li
        v-for="l in SUPPORTED_LOCALES"
        :key="l.code"
        role="option"
        :aria-selected="l.code === locale"
        class="lang-option"
        :class="{ active: l.code === locale }"
        @click="choose(l.code)"
      >
        <span class="code">{{ l.code.toUpperCase() }}</span>
        <span class="name">{{ l.label }}</span>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.lang {
  position: relative;
  flex-shrink: 0;
}
.lang-trigger {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--mono);
  font-size: 12px;
  color: var(--ink-soft);
  background: transparent;
  border: 1px solid var(--line);
  border-radius: 8px;
  padding: 6px 10px;
  cursor: pointer;
  transition:
    border-color 0.15s ease,
    color 0.15s ease;
}
.lang-trigger:hover {
  border-color: var(--ink);
  color: var(--ink);
}
.chev {
  transition: transform 0.15s ease;
  opacity: 0.7;
}
.chev.up {
  transform: rotate(180deg);
}

.lang-list {
  position: absolute;
  top: calc(100% + 6px);
  right: 0;
  min-width: 140px;
  margin: 0;
  padding: 4px;
  list-style: none;
  background: var(--card-bg);
  border: 1px solid var(--line);
  border-radius: 10px;
  box-shadow: 0 12px 32px -12px rgba(20, 23, 31, 0.3);
  z-index: 30;
}
.lang-option {
  display: flex;
  align-items: baseline;
  gap: 8px;
  padding: 8px 10px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 13px;
  color: var(--ink-soft);
}
.lang-option:hover {
  background: var(--paper-dim);
  color: var(--ink);
}
.lang-option.active {
  color: var(--accent-ink);
  background: var(--accent-soft);
}
.lang-option .code {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--muted);
  width: 22px;
}
.lang-option.active .code {
  color: var(--accent-ink);
}
</style>
