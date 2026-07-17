<script setup>
defineProps({ skills: Array, competencies: Array })
</script>

<template>
  <section id="skills" class="section container">
    <div class="section-head">
      <span class="eyebrow">02 · skills.json</span>
      <h2 class="section-title">Stack e competências</h2>
      <p class="section-sub">Tecnologias que uso no dia a dia e frentes em que atuo, do front ao deploy.</p>
    </div>

    <div class="grid">
      <div class="card block">
        <span class="block-label">tech_stack</span>
        <div class="chips">
          <span class="tag" v-for="s in skills" :key="s">{{ s }}</span>
        </div>
      </div>
      <div class="card block">
        <span class="block-label">competencies</span>
        <ul class="comp-list">
          <li v-for="c in competencies" :key="c">
            <span class="check">✓</span>{{ c }}
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<style scoped>
.grid {
  display: grid;
  grid-template-columns: 1.3fr 1fr;
  gap: 20px;
}
.block { padding: 24px; }
.block-label {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--muted);
  display: block;
  margin-bottom: 14px;
}
.chips { display: flex; flex-wrap: wrap; gap: 8px; }

.comp-list { list-style: none; margin: 0; padding: 0; display: grid; gap: 10px; }
.comp-list li { font-size: 14px; color: var(--ink-soft); display: flex; align-items: center; gap: 8px; }
.check { color: var(--signal); font-family: var(--mono); }

@media (max-width: 700px) {
  .grid { grid-template-columns: 1fr; }
}
</style>
