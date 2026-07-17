<script setup>
defineProps({ profile: Object })
</script>

<template>
  <section id="contato" class="section container contact">
    <span class="eyebrow">06 · contact.sh</span>
    <h2 class="section-title">Vamos conversar?</h2>
    <p class="section-sub">Aberto a oportunidades de Full Stack e UI/UX.</p>

    <div class="links">
      <a class="btn" :href="`mailto:${profile.email}`">email<span class="arrow">→</span></a>
      <a class="btn btn-ghost" :href="profile.linkedin" target="_blank" rel="noopener">linkedin</a>
      <a class="btn btn-ghost" :href="profile.github" target="_blank" rel="noopener">github</a>
    </div>
  </section>
</template>

<style scoped>
.contact { text-align: left; }
.links { display: flex; gap: 12px; margin-top: 24px; flex-wrap: wrap; }
.arrow { transition: transform 0.15s ease; }
.btn:hover .arrow { transform: translateX(3px); }
</style>
