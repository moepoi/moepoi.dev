<script lang="ts">
  import { onMount, tick } from 'svelte';
  import projectsData from '../data/projects.json';

  interface Project {
    title: string;
    image: string;
    date: string;
    categories: string;
    description: string;
    url: string;
  }

  const projects: Project[] = projectsData;

  const categories = ['All', ...Array.from(new Set(projects.map((p) => p.categories)))];

  let selectedCategory: string = 'All';
  let imageElements: HTMLImageElement[] = [];

  $: filteredProjects = selectedCategory === 'All'
    ? projects
    : projects.filter((p) => p.categories.toLowerCase() === selectedCategory.toLowerCase());

  const updateLoadingAttributes = () => {
    if (typeof window === 'undefined') return;
    const vh = window.innerHeight;

    imageElements.forEach((img) => {
      if (!img) return;
      let currentElement: HTMLElement | null = img;
      let elementYPosition = 0;
      while (currentElement) {
        elementYPosition += currentElement.offsetTop;
        currentElement = currentElement.offsetParent as HTMLElement | null;
      }

      if (elementYPosition < vh) {
        img.loading = 'eager';
        img.setAttribute('loading', 'eager');
      } else {
        img.loading = 'lazy';
        img.setAttribute('loading', 'lazy');
      }
    });
  };

  onMount(() => {
    updateLoadingAttributes();
    window.addEventListener('resize', updateLoadingAttributes, { passive: true });
    return () => {
      window.removeEventListener('resize', updateLoadingAttributes);
    };
  });

  $: if (selectedCategory) {
    tick().then(updateLoadingAttributes);
  }

  const getCategoryColor = (cat: string) => {
    switch (cat.toLowerCase()) {
      case 'app':
        return 'bg-cyan-950/80 text-cyan-300 border-cyan-800';
      case 'web':
        return 'bg-emerald-950/80 text-emerald-300 border-emerald-800';
      case 'bot':
        return 'bg-purple-950/80 text-purple-300 border-purple-800';
      case 'game':
        return 'bg-rose-950/80 text-rose-300 border-rose-800';
      default:
        return 'bg-slate-800 text-slate-300 border-slate-700';
    }
  };
</script>

<div class="w-full max-w-5xl mx-auto flex flex-col gap-8">
  <!-- Header -->
  <div class="text-center space-y-2">
    <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-slate-900 border border-slate-800 text-xs text-cyan-400 font-medium">
      <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
      </svg>
      <span>Featured Work</span>
    </div>
    <h1 class="text-3xl sm:text-4xl font-extrabold tracking-tight text-white">Projects & Creations</h1>
    <p class="text-slate-400 text-sm sm:text-base max-w-md mx-auto">
      A collection of open-source applications, bots, web services, and games I've developed.
    </p>
  </div>

  <!-- Filter Pills -->
  <div class="flex items-center justify-center gap-2 flex-wrap">
    {#each categories as category (category)}
      <button
        on:click={() => (selectedCategory = category)}
        class="px-4 py-1.5 rounded-full text-xs font-semibold transition-all duration-200 select-none {selectedCategory === category ? 'bg-cyan-500 text-slate-950 shadow-md shadow-cyan-500/25 scale-105' : 'bg-slate-900/80 text-slate-400 hover:text-white hover:bg-slate-800 border border-slate-800'}"
      >
        {category}
        <span class="ml-1 opacity-75 text-[10px]">
          ({category === 'All' ? projects.length : projects.filter((p) => p.categories.toLowerCase() === category.toLowerCase()).length})
        </span>
      </button>
    {/each}
  </div>

  <!-- Projects Grid -->
  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
    {#each filteredProjects as project, index (project.title)}
      <div class="group relative flex flex-col rounded-2xl bg-slate-900/70 border border-slate-800/80 hover:border-slate-700 overflow-hidden shadow-lg hover:shadow-2xl hover:shadow-cyan-500/5 transition-all duration-300">
        <!-- Image Container -->
        <div class="relative w-full h-48 sm:h-52 bg-slate-950 overflow-hidden">
          <img
            bind:this={imageElements[index]}
            src="/{project.image}"
            alt={project.title}
            class="w-full h-full object-cover object-center group-hover:scale-105 transition-transform duration-500"
            loading={index < 6 ? 'eager' : 'lazy'}
            fetchpriority={index === 0 ? 'high' : 'auto'}
            decoding="async"
            width="600"
            height="350"
          />
          <div class="absolute inset-0 bg-gradient-to-t from-slate-900 via-transparent to-transparent opacity-80"></div>
          
          <!-- Category Badge -->
          <div class="absolute top-3 left-3">
            <span class="px-2.5 py-0.5 rounded-full text-xs font-semibold border backdrop-blur-md shadow-sm {getCategoryColor(project.categories)}">
              {project.categories}
            </span>
          </div>

          <!-- Date Badge -->
          <div class="absolute bottom-3 left-3 text-[11px] text-slate-300 font-medium px-2 py-0.5 rounded-md bg-slate-950/70 backdrop-blur-sm border border-slate-800">
            {project.date}
          </div>
        </div>

        <!-- Details -->
        <div class="p-5 flex-1 flex flex-col justify-between gap-4">
          <div class="space-y-2">
            <a
              href={project.url}
              target="_blank"
              rel="noopener noreferrer"
              class="inline-block"
            >
              <h2 class="text-lg font-bold text-white group-hover:text-cyan-300 transition-colors flex items-center gap-1.5">
                <span>{project.title}</span>
                <svg class="w-3.5 h-3.5 opacity-0 group-hover:opacity-100 transition-opacity text-cyan-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
              </h2>
            </a>
            <p class="text-xs sm:text-sm text-slate-400 leading-relaxed line-clamp-3">
              {project.description}
            </p>
          </div>

          <!-- Link Button -->
          <div class="pt-2 border-t border-slate-800/80">
            <a
              href={project.url}
              target="_blank"
              rel="noopener noreferrer"
              class="inline-flex items-center gap-1.5 text-xs font-semibold text-cyan-400 hover:text-cyan-300 transition-colors"
            >
              <span>View Source / Live</span>
              <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
              </svg>
            </a>
          </div>
        </div>
      </div>
    {/each}
  </div>
</div>
