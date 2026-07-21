<script setup>
defineProps({ profile: Object });
</script>

<template>
  <section id="contato" class="section container contact">
    <span class="eyebrow">{{ $t("contact.eyebrow") }}</span>
    <h2 class="section-title">{{ $t("contact.title") }}</h2>
    <p class="section-sub">{{ $t("contact.subtitle") }}</p>

    <div class="links">
      <a class="btn" :href="`mailto:${profile.email}`"
        >{{ $t("contact.email") }}<span class="arrow">→</span></a
      >
      <a
        class="btn btn-ghost"
        :href="profile.linkedin"
        target="_blank"
        rel="noopener"
        >{{ $t("contact.linkedin") }}</a
      >
      <a
        class="btn btn-ghost"
        :href="profile.github"
        target="_blank"
        rel="noopener"
        >{{ $t("contact.github") }}</a
      >
    </div>
  </section>
</template>

<style scoped>
.contact {
  text-align: left;
}
.links {
  display: flex;
  gap: 12px;
  margin-top: 24px;
  flex-wrap: wrap;
}
.arrow {
  transition: transform 0.15s ease;
}
.btn:hover .arrow {
  transform: translateX(3px);
}
</style>
