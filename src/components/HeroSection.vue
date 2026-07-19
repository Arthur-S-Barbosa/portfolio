<script setup>
defineProps({ profile: Object });
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
        <span class="editor-dot" style="background: #ff5f57"></span>
        <span class="editor-dot" style="background: #febc2e"></span>
        <span class="editor-dot" style="background: #28c840"></span>
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
.cta-row {
  display: flex;
  gap: 12px;
  margin-top: 28px;
}
.arrow {
  transition: transform 0.15s ease;
}
.btn:hover .arrow {
  transform: translateX(3px);
}

.editor {
  background: #12141b;
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
  background: #1b1e27;
  border-bottom: 1px solid #2a2e3a;
}
.editor-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}
.editor-file {
  margin-left: 10px;
  font-family: var(--mono);
  font-size: 12px;
  color: #8a90a0;
}
.editor-body {
  padding: 22px;
}
.editor-body pre {
  margin: 0;
  font-family: var(--mono);
  font-size: 13.5px;
  line-height: 1.8;
  color: #c8cdd8;
  white-space: pre-wrap;
  word-break: break-word;
}
.c-kw {
  color: #7ea2ff;
}
.c-var {
  color: #e8b96a;
}
.c-key {
  color: #9fd4c0;
}
.c-str {
  color: #f2a6a0;
}

@media (max-width: 860px) {
  .hero {
    grid-template-columns: 1fr;
    padding-top: 40px;
    gap: 36px;
  }
  .editor {
    transform: none;
  }
}

@media (max-width: 480px) {
  .hero {
    padding: 32px 0 56px;
  }
  .cta-row {
    flex-direction: column;
    align-items: stretch;
  }
  .cta-row .btn {
    justify-content: center;
  }
  .editor-body {
    padding: 16px;
  }
  .editor-body pre {
    font-size: 12px;
    line-height: 1.7;
  }
}
</style>
