<script lang="ts">
  import { getContext } from 'svelte';
  import type { FileHandlerPathStore } from '$lib/types';

  // File handler file path
  const filePath = getContext<FileHandlerPathStore>('filePath');
</script>

This is a file handler. You selected the file:
<code>{$filePath}</code>
