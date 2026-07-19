<script setup>
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
    </div>
  </header>
</template>

<style scoped>
.header {
  position: sticky;
  top: 0;
  z-index: 20;
  background: rgba(243, 245, 247, 0.85);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--line);
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
