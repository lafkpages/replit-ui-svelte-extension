<script lang="ts">
  import '@replit-svelte/ui/index.css';
  import ModalProvider from '@replit-svelte/ui/ModalProvider.svelte';
  import ToastProvider from '@replit-svelte/ui/ToastProvider.svelte';

  import { init, HandshakeStatus } from '@replit/extensions';
  import type { ReplitInitOutput } from '@replit/extensions';

  import { onMount, onDestroy } from 'svelte';

  let handshakeResult: ReplitInitOutput | null = null;

  onMount(() => {
    init()
      .then(res => {
        handshakeResult = res;

        console.debug(res);
      })
      .catch(err => {
        console.error('Error init()ing the Replit Extensions API:', err);
      });
  });

  onDestroy(() => {
    handshakeResult?.dispose();
  });
</script>

<ModalProvider>
  <ToastProvider>
    <main>
      {#if handshakeResult?.status == HandshakeStatus.Ready}
        <slot />
      {:else}
        <h1 class="headerBig">Handshake Error</h1>
        <p>
          We couldn't connect to the Replit workspace. Make sure you're running this as an extension.
        </p>
      {/if}
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
