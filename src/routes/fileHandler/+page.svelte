<script lang="ts">
  import { getContext } from 'svelte';
  import type { Writable } from 'svelte/store';

  // File handler file path
  type FilePath = string | null | undefined;
  const filePath = getContext<Writable<FilePath>>('filePath');
</script>

This is a file handler. You selected the file:
<code>{$filePath}</code>
