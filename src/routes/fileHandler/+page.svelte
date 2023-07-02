<script lang="ts">
  // Replit Extensions API
  import { me } from '@replit/extensions';
</script>

This is a file handler. You selected the file:

{#await me?.filePath()}
  <i>Loading file</i>
{:then file}
  <code>{file}</code>
{:catch error}
  <i>
    Unexpected error:

    <code>
      {error}
    </code>
  </i>
{/await}
