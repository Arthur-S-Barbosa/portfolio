<script setup>
defineProps({ skills: Array, competencies: Array });
</script>

<template>
  <section id="skills" class="section container">
    <div class="section-head">
      <span class="eyebrow">{{ $t("skills.eyebrow") }}</span>
      <h2 class="section-title">{{ $t("skills.title") }}</h2>
      <p class="section-sub">{{ $t("skills.subtitle") }}</p>
    </div>

    <div class="grid">
      <div class="card block">
        <span class="block-label">{{ $t("skills.techStack") }}</span>
        <div class="chips">
          <span class="tag" v-for="s in skills" :key="s.id || s.name">{{
            s.name
          }}</span>
        </div>
      </div>
      <div class="card block">
        <span class="block-label">{{ $t("skills.competencies") }}</span>
        <ul class="comp-list">
          <li v-for="c in competencies" :key="c.id || c.name">
            <span class="check">✓</span>{{ c.name }}
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
.block {
  padding: 24px;
}
.block-label {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--muted);
  display: block;
  margin-bottom: 14px;
}
.chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.comp-list {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  gap: 10px;
}
.comp-list li {
  font-size: 14px;
  color: var(--ink-soft);
  display: flex;
  align-items: center;
  gap: 8px;
}
.check {
  color: var(--signal);
  font-family: var(--mono);
}

@media (max-width: 700px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
</style>
