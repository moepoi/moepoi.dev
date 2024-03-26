<script lang="ts">
  import NotFoundImage from '../lib/assets/not-found.webp';
  import { Link } from 'svelte-routing';
</script>

<div class="flex flex-col items-center justify-center min-h-screen">
  <h1 class="text-5xl font-bold text-white">Not Found</h1>
  <img class="w-45 h-40 mt-5" src={NotFoundImage} alt="" />
  <Link to="/" class="mt-5 bg-gradient-to-r from-indigo-500 to-sky-500 text-white px-4 py-2 rounded-xl">Go Home</Link>
</div>