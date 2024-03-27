<script lang="ts">
  import NavBar from '../lib/components/NavBar.svelte';
  import SocialMedia from '../lib/components/SocialMedia.svelte';
  import profile from '../lib/assets/profile.webp';
</script>

<svelte:head>
  <link rel="preload" href="{profile}" as="image">
</svelte:head>

<NavBar isFixed={true} />

<div class="flex flex-col items-center justify-center h-screen flex-wrap">
  <img class="w-40 h-40 rounded-full" src={profile} alt="" loading="lazy" />
  <h1 class="mt-5 text-4xl text-white font-bold">Moepoi</h1>
  <SocialMedia />
</div>