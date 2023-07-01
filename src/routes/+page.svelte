<script>
  import Button from '@replit-svelte/ui/Button.svelte';
  import { showModal } from '@replit-svelte/utils';
</script>

<h1 class="headerBig">Replit UI Svelte Extension</h1>

<Button text="My button" on:click={() => {
  showModal({
    text: 'Button clicked'
  });
}} />
