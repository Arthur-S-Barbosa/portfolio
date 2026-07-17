<script setup>
defineProps({ profile: Object })
</script>

<template>
  <section class="hero container">
    <div class="hero-text">
      <span class="eyebrow">● disponível para novos projetos</span>
      <h1 class="name">{{ profile.name }}</h1>
      <p class="role">{{ profile.role }}</p>
      <p class="summary">{{ profile.summary }}</p>
      <div class="cta-row">
        <a href="#contato" class="btn">contato()<span class="arrow">→</span></a>
        <a href="#projetos" class="btn btn-ghost">ver projetos</a>
      </div>
    </div>

    <div class="editor" aria-hidden="true">
      <div class="editor-topbar">
        <span class="editor-dot" style="background:#FF5F57"></span>
        <span class="editor-dot" style="background:#FEBC2E"></span>
        <span class="editor-dot" style="background:#28C840"></span>
        <span class="editor-file">profile.tsx</span>
      </div>
      <div class="editor-body">
        <pre><code><span class="c-kw">const</span> <span class="c-var">dev</span> = {
  <span class="c-key">name</span>: <span class="c-str">"{{ profile.name }}"</span>,
  <span class="c-key">role</span>: [<span class="c-str">"Full Stack"</span>, <span class="c-str">"UI/UX"</span>],
  <span class="c-key">base</span>: <span class="c-str">"{{ profile.location }}"</span>,
  <span class="c-key">stack</span>: <span class="c-str">"Vue + Laravel"</span>,
  <span class="c-key">status</span>: <span class="c-str">"shipping"</span>,
};

<span class="c-kw">export default</span> dev;</code></pre>
      </div>
    </div>
  </section>
</template>

<style scoped>
.hero {
  padding: 72px 0 96px;
  display: grid;
  grid-template-columns: 1.1fr 1fr;
  gap: 56px;
  align-items: center;
}
.name {
  font-family: var(--display);
  font-weight: 700;
  font-size: clamp(34px, 5vw, 52px);
  line-height: 1.05;
  margin: 14px 0 6px;
  letter-spacing: -0.02em;
}
.role {
  font-family: var(--mono);
  color: var(--signal);
  font-size: 15px;
  margin: 0 0 18px;
}
.summary {
  color: var(--ink-soft);
  font-size: 16px;
  line-height: 1.6;
  max-width: 52ch;
}
.cta-row { display: flex; gap: 12px; margin-top: 28px; }
.arrow { transition: transform 0.15s ease; }
.btn:hover .arrow { transform: translateX(3px); }

.editor {
  background: #12141B;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 20px 50px -20px rgba(20, 23, 31, 0.35);
  transform: rotate(0.6deg);
}
.editor-topbar {
  display: flex;
  align-items: center;
  gap: 7px;
  padding: 12px 14px;
  background: #1B1E27;
  border-bottom: 1px solid #2A2E3A;
}
.editor-dot { width: 10px; height: 10px; border-radius: 50%; }
.editor-file {
  margin-left: 10px;
  font-family: var(--mono);
  font-size: 12px;
  color: #8A90A0;
}
.editor-body { padding: 22px; }
.editor-body pre {
  margin: 0;
  font-family: var(--mono);
  font-size: 13.5px;
  line-height: 1.8;
  color: #C8CDD8;
  white-space: pre-wrap;
  word-break: break-word;
}
.c-kw { color: #7EA2FF; }
.c-var { color: #E8B96A; }
.c-key { color: #9FD4C0; }
.c-str { color: #F2A6A0; }

@media (max-width: 860px) {
  .hero { grid-template-columns: 1fr; padding-top: 40px; }
  .editor { transform: none; }
}
</style>
