<script>
  import '@replit-svelte/ui/index.css';
</script>

<main>
  <slot />
</main>

<style>
  main {
    padding: var(--space-32);
    display: flex;
    flex-direction: column;
    gap: var(--space-16);
  }
</style>
