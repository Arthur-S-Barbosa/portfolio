<script setup>
import { ref } from "vue";
import { useLocalizedField } from "../lib/localize";

defineProps({ profile: Object, languages: Array, loading: Boolean });

const imgLoaded = ref(false);
const { tr } = useLocalizedField();
</script>

<template>
  <section id="sobre" class="section container about">
    <div class="photo-frame">
      <div v-if="loading" class="photo-skeleton"></div>
      <img
        v-else-if="profile.photo_url"
        :src="profile.photo_url"
        alt="Foto de Arthur Barbosa"
        class="photo-img"
        :class="{ loaded: imgLoaded }"
        @load="imgLoaded = true"
      />
      <div v-else class="photo-placeholder">
        <span>{{ $t("about.photoFile") }}</span>
        <small>{{ $t("about.photoHint") }}</small>
      </div>
    </div>

    <div class="about-body">
      <span class="eyebrow">{{ $t("about.eyebrow") }}</span>
      <h2 class="section-title">{{ $t("about.title") }}</h2>
      <p class="lead">{{ tr(profile, "summary") }}</p>

      <div class="lang-grid">
        <div v-for="l in languages" :key="l.name" class="lang">
          <div class="lang-top">
            <span>{{ tr(l, "name") }}</span>
            <span class="lang-level">{{ tr(l, "level") }}</span>
          </div>
          <div class="lang-bar">
            <div class="lang-fill" :style="{ width: l.value + '%' }"></div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.about {
  display: grid;
  grid-template-columns: 260px 1fr;
  gap: 56px;
  align-items: start;
}
.photo-frame {
  aspect-ratio: 4/5;
  border-radius: var(--radius);
  overflow: hidden;
  border: 1px solid var(--line);
  background: var(--paper-dim);
}
.photo-frame img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.photo-skeleton {
  height: 100%;
  width: 100%;
  background: linear-gradient(
    100deg,
    var(--paper-dim) 30%,
    var(--line) 50%,
    var(--paper-dim) 70%
  );
  background-size: 200% 100%;
  animation: shimmer 1.4s ease-in-out infinite;
}
@keyframes shimmer {
  from {
    background-position: 200% 0;
  }
  to {
    background-position: -200% 0;
  }
}

.photo-img {
  opacity: 0;
  transition: opacity 0.35s ease;
}
.photo-img.loaded {
  opacity: 1;
}
.photo-placeholder {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 6px;
  font-family: var(--mono);
  color: var(--muted);
  text-align: center;
  padding: 12px;
}
.photo-placeholder span {
  font-size: 13px;
  color: var(--ink-soft);
}
.photo-placeholder small {
  font-size: 11px;
}

.lead {
  color: var(--ink-soft);
  line-height: 1.7;
  margin-top: 12px;
  max-width: 60ch;
}

.lang-grid {
  margin-top: 32px;
  display: grid;
  gap: 14px;
  max-width: 380px;
}
.lang-top {
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  margin-bottom: 6px;
}
.lang-level {
  font-family: var(--mono);
  color: var(--muted);
  font-size: 12px;
}
.lang-bar {
  height: 6px;
  background: var(--paper-dim);
  border-radius: 999px;
  overflow: hidden;
}
.lang-fill {
  height: 100%;
  background: var(--signal);
  border-radius: 999px;
}

@media (max-width: 700px) {
  .about {
    grid-template-columns: 1fr;
  }
  .photo-frame {
    max-width: 220px;
  }
}
</style>
