<script setup>
defineProps({ education: Array, courses: Array });
</script>

<template>
  <section id="formacao" class="section container">
    <div class="section-head">
      <span class="eyebrow">{{ $t("education.eyebrow") }}</span>
      <h2 class="section-title">{{ $t("education.title") }}</h2>
    </div>

    <div class="edu-grid">
      <div class="card edu-card" v-for="(e, i) in education" :key="i">
        <span class="period">{{ e.period }}</span>
        <h3>{{ e.title }}</h3>
        <p class="institution">{{ e.institution }}</p>
        <p class="detail">{{ e.detail }}</p>
      </div>
    </div>

    <div class="courses">
      <span class="block-label">{{ $t("education.courses") }}</span>
      <div class="course-chips">
        <span class="tag" v-for="c in courses" :key="c.name"
          >{{ c.name }} — {{ c.provider }}</span
        >
      </div>
    </div>
  </section>
</template>

<style scoped>
.edu-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
}
.edu-card {
  padding: 20px;
}
.period {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--signal);
}
.edu-card h3 {
  font-family: var(--display);
  font-size: 15.5px;
  margin: 8px 0 4px;
  line-height: 1.35;
}
.institution {
  font-size: 13px;
  color: var(--muted);
  margin: 0 0 10px;
}
.detail {
  font-size: 13.5px;
  color: var(--ink-soft);
  line-height: 1.6;
  margin: 0;
}

.courses {
  margin-top: 36px;
}
.block-label {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--muted);
  display: block;
  margin-bottom: 12px;
}
.course-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

@media (max-width: 800px) {
  .edu-grid {
    grid-template-columns: 1fr;
  }
}
</style>
