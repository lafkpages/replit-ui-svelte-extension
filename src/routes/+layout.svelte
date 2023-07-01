<script>
  import '@replit-svelte/ui/index.css';
  import ModalProvider from '@replit-svelte/ui/ModalProvider.svelte';
</script>

<ModalProvider>
  <main>
    <slot />
  </main>
</ModalProvider>

<style>
  main {
    padding: var(--space-32);
    display: flex;
    flex-direction: column;
    gap: var(--space-16);
  }
</style>
