<script lang="ts">
  import '@replit-svelte/ui/index.css';
  import ModalProvider from '@replit-svelte/ui/ModalProvider.svelte';
  import ToastProvider from '@replit-svelte/ui/ToastProvider.svelte';
  import Loader from '@replit-svelte/ui/icons/Loader.svelte';

  import { init, me, themes, HandshakeStatus } from '@replit/extensions';
  import type { ReplitInitOutput } from '@replit/extensions';

  import { onMount, onDestroy, setContext } from 'svelte';
  import { writable } from 'svelte/store';

  import type { FileHandlerPathStore } from '$lib/types';

  let handshakeResult: ReplitInitOutput | null = null;
  let filePath: FileHandlerPathStore = writable(null);

  setContext<FileHandlerPathStore>('filePath', filePath);

  onMount(() => {
    init()
      .then((res) => {
        handshakeResult = res;

        me.filePath()
          .then((file) => {
            filePath.set(file);
          })
          .catch(console.error);

        themes.getCurrentThemeValues().then((themeValues) => {
          for (const [key, value] of Object.entries(themeValues)) {
            if (key == '__typename') {
              continue;
            }

            document.documentElement.style.setProperty(`--${
              key.replace(/([A-Z])/g, '-$1').toLowerCase()
            }`, value);
          }
        });
      })
      .catch((err) => {
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
          We couldn't connect to the Replit workspace. Make sure you're running
          this as an extension.
        </p>
      {:else if handshakeResult?.status == HandshakeStatus.Ready && filePath !== undefined}
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
  :global(:root), :global(body) {
    background-color: var(--background-default) !important;
  }

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
