<script lang="ts">
  import NavBar from '../lib/components/NavBar.svelte';
  import { emailAddress, publicKey } from '../lib/data/contact';
  import HiddenImage from '../lib/assets/hidden.webp';

  let showSnackbar = false;

  const copyItem = async (item: string) => {
    await navigator.clipboard.writeText(item);
    showSnackbar = true;
    setTimeout(() => {
      showSnackbar = false;
    }, 3000);
  };
</script>

<NavBar />

<div class="flex flex-col items-center gap-5 py-5 max-w-4xl mx-4 sm:mx-6 md:mx-auto min-h-screen">
  <div class="bg-gradient-to-r from-cyan-500 to-blue-500 p-4 m-4 rounded-xl flex items-center justify-between">
    <a href={`mailto:${emailAddress}`}><p class="text-white text-2xl font-bold">{emailAddress}</p></a>
    <button class="bg-white text-cyan-500 ml-5 px-4 py-2 rounded-xl" on:click={() => copyItem(emailAddress)}>Copy</button>
  </div>
  <div class="bg-indigo-950 p-4 rounded-xl m-4">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-white text-2xl font-bold">PGP Public Key</h2>
      <button class="bg-white text-indigo-950 ml-5 px-4 py-2 rounded-xl" on:click={() => copyItem(publicKey)}>Copy</button>
    </div>
    <p class="hidden sm:block text-xs sm:text-sm md:text-base lg:text-lg xl:text-lg 2xl:text-lg text-white whitespace-pre-wrap">{publicKey}</p>
  </div>
  <img class="block sm:hidden w-45 h-40" src={HiddenImage} alt="Hidden" />
</div>

{#if showSnackbar}
  <div class="fixed bottom-0 right-0 m-6 bg-green-500 text-white p-5 rounded-xl">
    Copied to clipboard!
  </div>
{/if}