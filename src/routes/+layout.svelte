<script lang="ts">
  import '@replit-svelte/ui/index.css';
  import ModalProvider from '@replit-svelte/ui/ModalProvider.svelte';
  import ToastProvider from '@replit-svelte/ui/ToastProvider.svelte';
  import Loader from '@replit-svelte/ui/icons/Loader.svelte';

  import { init, me, HandshakeStatus } from '@replit/extensions';
  import type { ReplitInitOutput } from '@replit/extensions';

  import { onMount, onDestroy } from 'svelte';

  let handshakeResult: ReplitInitOutput | null = null;
  let filePath: string | null | undefined = null;

  onMount(() => {
    init()
      .then(res => {
        handshakeResult = res;

        console.debug(res);

        me.filePath().then(file => {
          filePath = file;
        }).catch(console.error);
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
      {#if handshakeResult?.status == HandshakeStatus.Error || filePath === undefined}
        <h1 class="headerBig">Handshake Error</h1>
        <p>
          We couldn't connect to the Replit workspace. Make sure you're running this as an extension.
        </p>
      {:else if handshakeResult?.status == HandshakeStatus.Ready}
        <slot />
      {:else}
        <div class="handshakeLoading">
          <Loader />
        </div>
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
    width: 100%;
    height: 100%;
  }

  .handshakeLoading {
    margin: auto;
  }
</style>
