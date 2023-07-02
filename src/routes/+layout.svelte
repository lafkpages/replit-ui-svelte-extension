<script>
  import '@replit-svelte/ui/index.css';
  import ModalProvider from '@replit-svelte/ui/ModalProvider.svelte';
  import ToastProvider from '@replit-svelte/ui/ToastProvider.svelte';
</script>

<ModalProvider>
  <ToastProvider>
    <main>
      <slot />
    </main>
  </ToastProvider>
</ModalProvider>

<style>
  main {
    padding: var(--space-32);
    display: flex;
    flex-direction: column;
    gap: var(--space-16);
  }
</style>
