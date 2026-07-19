<script setup>
const year = new Date().getFullYear();
</script>

<template>
  <footer class="footer container">
    <span>© {{ year }} Arthur Barbosa</span>
    <span class="built">feito com Vue + Supabase</span>
  </footer>
</template>

<style scoped>
.footer {
  padding: 28px 24px 40px;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 8px;
  font-family: var(--mono);
  font-size: 12px;
  color: var(--muted);
}
</style>
