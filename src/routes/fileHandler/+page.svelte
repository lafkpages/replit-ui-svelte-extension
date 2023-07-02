<script lang="ts">
  import Input from '@replit-svelte/ui/Input.svelte';

  import { getContext } from 'svelte';
  import type { FileHandlerPathStore } from '$lib/types';

  // File handler file path
  const filePath = getContext<FileHandlerPathStore>('filePath');
</script>

This is a file handler.

{#if $filePath}
  You selected the file:
  <Input value={$filePath} disabled />
{:else}
  You haven't selected a file.
{/if}
