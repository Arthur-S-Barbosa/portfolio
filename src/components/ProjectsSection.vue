<script setup>
import { ref, onMounted } from "vue";

const props = defineProps({ githubUsername: String });

const repos = ref([]);
const status = ref("loading"); // loading | ok | empty | error

onMounted(async () => {
  if (!props.githubUsername) {
    status.value = "empty";
    return;
  }
  try {
    const res = await fetch(
      `https://api.github.com/users/${props.githubUsername}/repos?sort=updated&per_page=6`,
    );
    if (!res.ok) throw new Error("github api error");
    const data = await res.json();
    repos.value = data.filter((r) => !r.fork);
    status.value = repos.value.length ? "ok" : "empty";
  } catch (e) {
    status.value = "error";
  }
});
</script>

<template>
  <section id="projetos" class="section container">
    <div class="section-head row">
      <div>
        <span class="eyebrow">{{ $t("projects.eyebrow") }}</span>
        <h2 class="section-title">{{ $t("projects.title") }}</h2>
        <p class="section-sub">
          {{ $t("projects.subtitlePrefix") }}
          <a
            :href="`https://github.com/${githubUsername}`"
            target="_blank"
            rel="noopener"
            >@{{ githubUsername }}</a
          >
        </p>
      </div>
    </div>

    <div v-if="status === 'loading'" class="state">
      {{ $t("projects.loading") }}
    </div>
    <div v-else-if="status === 'error'" class="state">
      {{ $t("projects.error") }}
      <a
        :href="`https://github.com/${githubUsername}`"
        target="_blank"
        rel="noopener"
        >{{ $t("projects.errorLink") }}</a
      >.
    </div>
    <div v-else-if="status === 'empty'" class="state">
      {{ $t("projects.empty") }} <code>src/App.vue</code> (prop
      <code>githubUsername</code>).
    </div>

    <div v-else class="repo-grid">
      <a
        v-for="r in repos"
        :key="r.id"
        :href="r.html_url"
        target="_blank"
        rel="noopener"
        class="card repo"
      >
        <div class="repo-top">
          <span class="repo-name">{{ r.name }}</span>
          <span class="repo-star">★ {{ r.stargazers_count }}</span>
        </div>
        <p class="repo-desc">
          {{ r.description || $t("projects.noDescription") }}
        </p>
        <span v-if="r.language" class="tag lang-tag">{{ r.language }}</span>
      </a>
    </div>
  </section>
</template>

<style scoped>
.row {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  gap: 20px;
}
.section-sub a {
  color: var(--accent-ink);
}
.state {
  font-family: var(--mono);
  font-size: 13px;
  color: var(--muted);
  padding: 24px 0;
}
.state code {
  background: var(--paper-dim);
  padding: 1px 6px;
  border-radius: 4px;
}

.repo-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
}
.repo {
  padding: 18px;
  text-decoration: none;
  color: var(--ink);
  display: block;
  transition:
    border-color 0.15s ease,
    transform 0.15s ease;
}
.repo:hover {
  border-color: var(--accent);
  transform: translateY(-2px);
}
.repo-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.repo-name {
  font-family: var(--mono);
  font-weight: 500;
  font-size: 14px;
}
.repo-star {
  font-family: var(--mono);
  font-size: 11.5px;
  color: var(--muted);
}
.repo-desc {
  font-size: 13px;
  color: var(--ink-soft);
  line-height: 1.5;
  margin: 10px 0 12px;
  min-height: 36px;
}
.lang-tag {
  background: var(--signal-soft);
  border-color: transparent;
  color: var(--signal-ink);
}

@media (max-width: 800px) {
  .repo-grid {
    grid-template-columns: 1fr;
  }
}
</style>
