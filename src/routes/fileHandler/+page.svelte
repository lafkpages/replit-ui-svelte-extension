<script lang="ts">
  import { getContext } from 'svelte';
  import type { Writable } from 'svelte/store';
  import type { FileHandlerPath } from '$lib/types';

  // File handler file path
  const filePath = getContext<Writable<FileHandlerPath>>('filePath');
</script>

This is a file handler. You selected the file:
<code>{$filePath}</code>
