<script setup>
defineProps({ profile: Object, languages: Array })
</script>

<template>
  <section id="sobre" class="section container about">
    <div class="photo-frame">
      <!--
        Substitua a imagem abaixo pela sua foto:
        coloque o arquivo em /public/photo.jpg e troque o src para "/photo.jpg"
        (ou aponte para uma coluna "photo_url" da tabela profile no Supabase).
      -->
      <img
        v-if="profile.photo_url"
        :src="profile.photo_url"
        alt="Foto de Arthur Barbosa"
      />
      <div v-else class="photo-placeholder">
        <span>foto.jpg</span>
        <small>adicione sua foto em /public/photo.jpg</small>
      </div>
    </div>

    <div class="about-body">
      <span class="eyebrow">01 · sobre</span>
      <h2 class="section-title">Quem constrói o que você está vendo</h2>
      <p class="lead">{{ profile.summary }}</p>

      <div class="lang-grid">
        <div v-for="l in languages" :key="l.name" class="lang">
          <div class="lang-top">
            <span>{{ l.name }}</span>
            <span class="lang-level">{{ l.level }}</span>
          </div>
          <div class="lang-bar"><div class="lang-fill" :style="{ width: l.value + '%' }"></div></div>
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
.photo-frame img { width: 100%; height: 100%; object-fit: cover; display: block; }
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
.photo-placeholder span { font-size: 13px; color: var(--ink-soft); }
.photo-placeholder small { font-size: 11px; }

.lead { color: var(--ink-soft); line-height: 1.7; margin-top: 12px; max-width: 60ch; }

.lang-grid { margin-top: 32px; display: grid; gap: 14px; max-width: 380px; }
.lang-top { display: flex; justify-content: space-between; font-size: 13px; margin-bottom: 6px; }
.lang-level { font-family: var(--mono); color: var(--muted); font-size: 12px; }
.lang-bar { height: 6px; background: var(--paper-dim); border-radius: 999px; overflow: hidden; }
.lang-fill { height: 100%; background: var(--signal); border-radius: 999px; }

@media (max-width: 700px) {
  .about { grid-template-columns: 1fr; }
  .photo-frame { max-width: 220px; }
}
</style>
