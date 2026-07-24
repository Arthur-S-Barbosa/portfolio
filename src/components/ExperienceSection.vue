<script setup>
import { useLocalizedField } from "../lib/localize";

defineProps({ experience: Array });
const { tr } = useLocalizedField();
</script>

<template>
  <section id="experiencia" class="section container">
    <div class="section-head">
      <span class="eyebrow">{{ $t("experience.eyebrow") }}</span>
      <h2 class="section-title">{{ $t("experience.title") }}</h2>
    </div>

    <div class="timeline">
      <article v-for="(job, i) in experience" :key="i" class="entry">
        <div class="entry-rail">
          <span class="entry-dot"></span>
          <span v-if="i < experience.length - 1" class="entry-line"></span>
        </div>
        <div class="entry-body card">
          <div class="entry-top">
            <h3>{{ tr(job, "role") }}</h3>
            <span class="period">{{ job.period }}</span>
          </div>
          <p class="company">{{ job.company }}</p>
          <ul>
            <li v-for="(b, bi) in tr(job, 'bullets')" :key="bi">{{ b }}</li>
          </ul>
        </div>
      </article>
    </div>
  </section>
</template>

<style scoped>
.timeline {
  display: flex;
  flex-direction: column;
}
.entry {
  display: grid;
  grid-template-columns: 24px 1fr;
  gap: 20px;
}
.entry-rail {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.entry-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: var(--accent);
  margin-top: 26px;
  flex-shrink: 0;
}
.entry-line {
  flex: 1;
  width: 1px;
  background: var(--line);
  margin: 4px 0;
}
.entry-body {
  padding: 22px 24px;
  margin-bottom: 22px;
}
.entry-top {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  gap: 12px;
  flex-wrap: wrap;
}
.entry-top h3 {
  font-family: var(--display);
  font-size: 18px;
  margin: 0;
}
.period {
  font-family: var(--mono);
  font-size: 12px;
  color: var(--muted);
  white-space: nowrap;
}
.company {
  color: var(--accent-ink);
  font-size: 13.5px;
  margin: 4px 0 12px;
}
ul {
  margin: 0;
  padding-left: 18px;
  color: var(--ink-soft);
  font-size: 14px;
  line-height: 1.7;
}
</style>
