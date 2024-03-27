<script lang="ts">
  import NavBar from '../lib/components/NavBar.svelte';
  import { projects, type Project } from '../lib/data/projects';

  const projectsData: Project[] = projects;
</script>

<NavBar />

<div class="flex justify-center items-center min-h-screen">
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-5 py-5 max-w-4xl mx-6 sm:mx-6 md:mx-auto md:px-6">
    {#each projectsData as project (project.title)}
      <div class="flex flex-col rounded-xl bg-indigo-950">
        <div class="w-full h-64 bg-cover bg-center m-0 p-0 rounded-t-xl" style="background-image: url('/{project.image}')"></div>
        <div class="p-4 pt-0">
          <a href={project.url}><h2 class="mt-4 text-white text-xl font-semibold">{project.title}</h2></a>
          <p class="mt-2 text-white text-base">{project.description}</p>
        </div>
      </div>
    {/each}
  </div>
</div>