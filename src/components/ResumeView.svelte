<script lang="ts">
  import resumeData from '../data/resume.json';

  const { basics, experiences, education, languages, certificates } = resumeData;

  let activeFilter: 'all' | 'experience' | 'education' | 'certificates' = 'all';
</script>

<div class="w-full max-w-4xl mx-auto flex flex-col gap-8">
  <!-- Page Header & PDF Download Banner -->
  <div class="relative overflow-hidden rounded-2xl bg-gradient-to-r from-sky-900/40 via-indigo-900/40 to-emerald-900/40 border border-slate-700/60 p-6 sm:p-8 shadow-xl backdrop-blur-md">
    <div class="absolute -right-16 -top-16 w-56 h-56 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none"></div>

    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-5 relative z-10">
      <div class="space-y-1.5">
        <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-slate-900/90 border border-slate-700/70 text-xs text-emerald-400 font-medium">
          <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <span>Curriculum Vitae</span>
        </div>
        <h1 class="text-2xl sm:text-3xl font-extrabold text-white tracking-tight">
          {basics.name}
        </h1>
        <p class="text-sm sm:text-base text-slate-300 font-medium">
          {basics.role} · <span class="text-slate-400">{basics.location}</span>
        </p>
      </div>

      <a
        href={basics.resumePdf}
        target="_blank"
        rel="noopener noreferrer"
        class="inline-flex items-center gap-2 px-5 py-3 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-600 hover:from-emerald-400 hover:to-teal-500 text-white font-semibold text-sm shadow-lg shadow-emerald-500/25 transition-all duration-200 active:scale-95 shrink-0 self-stretch sm:self-auto justify-center"
      >
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
        </svg>
        <span>Download PDF</span>
      </a>
    </div>
  </div>

  <!-- Filter tabs -->
  <div class="flex items-center gap-2 overflow-x-auto pb-1 scrollbar-none">
    <button
      on:click={() => (activeFilter = 'all')}
      class="px-4 py-1.5 rounded-full text-xs font-semibold transition-all shrink-0 {activeFilter === 'all' ? 'bg-cyan-500 text-slate-950 shadow-md shadow-cyan-500/20' : 'bg-slate-900/80 text-slate-400 hover:text-white border border-slate-800'}"
    >
      All Overview
    </button>
    <button
      on:click={() => (activeFilter = 'experience')}
      class="px-4 py-1.5 rounded-full text-xs font-semibold transition-all shrink-0 {activeFilter === 'experience' ? 'bg-cyan-500 text-slate-950 shadow-md shadow-cyan-500/20' : 'bg-slate-900/80 text-slate-400 hover:text-white border border-slate-800'}"
    >
      Experience ({experiences.length})
    </button>
    <button
      on:click={() => (activeFilter = 'education')}
      class="px-4 py-1.5 rounded-full text-xs font-semibold transition-all shrink-0 {activeFilter === 'education' ? 'bg-cyan-500 text-slate-950 shadow-md shadow-cyan-500/20' : 'bg-slate-900/80 text-slate-400 hover:text-white border border-slate-800'}"
    >
      Education ({education.length})
    </button>
    <button
      on:click={() => (activeFilter = 'certificates')}
      class="px-4 py-1.5 rounded-full text-xs font-semibold transition-all shrink-0 {activeFilter === 'certificates' ? 'bg-cyan-500 text-slate-950 shadow-md shadow-cyan-500/20' : 'bg-slate-900/80 text-slate-400 hover:text-white border border-slate-800'}"
    >
      Certifications ({certificates.length})
    </button>
  </div>

  <!-- Main Content Grid -->
  <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
    <!-- Left Column: Experience -->
    {#if activeFilter === 'all' || activeFilter === 'experience'}
      <div class="{activeFilter === 'all' ? 'lg:col-span-7' : 'lg:col-span-12'} space-y-6">
        <div class="flex items-center gap-2.5 pb-2 border-b border-slate-800">
          <div class="w-8 h-8 rounded-lg bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 flex items-center justify-center">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
          </div>
          <h2 class="text-xl font-bold text-white tracking-tight">Work Experience</h2>
        </div>

        <div class="relative pl-6 sm:pl-8 border-l-2 border-slate-800 space-y-8">
          {#each experiences as exp (exp.company + exp.period)}
            <div class="relative group">
              <!-- Glowing timeline node dot -->
              <div class="absolute -left-[31px] sm:-left-[39px] top-1.5 w-3.5 h-3.5 rounded-full bg-slate-950 border-2 border-cyan-400 group-hover:bg-cyan-400 group-hover:scale-125 transition-all shadow-[0_0_8px_rgba(6,182,212,0.4)]"></div>

              <div class="p-5 rounded-2xl bg-slate-900/60 hover:bg-slate-900/90 border border-slate-800/80 hover:border-slate-700 transition-all duration-200 space-y-2.5">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-1 sm:gap-2">
                  <h3 class="text-base sm:text-lg font-bold text-white group-hover:text-cyan-300 transition-colors">
                    {exp.company}
                  </h3>
                  <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-slate-800 text-slate-300 border border-slate-700 w-fit">
                    {exp.period}
                  </span>
                </div>

                <div class="flex items-center gap-2 flex-wrap text-xs font-medium text-cyan-400">
                  <span>{exp.role}</span>
                  {#if exp.type}
                    <span class="text-slate-600">•</span>
                    <span class="text-slate-400">{exp.type}</span>
                  {/if}
                </div>

                {#if exp.description}
                  <p class="text-xs sm:text-sm text-slate-300 leading-relaxed">
                    {exp.description}
                  </p>
                {/if}

                {#if exp.skills && exp.skills.length > 0}
                  <div class="flex flex-wrap gap-1.5 pt-1.5">
                    {#each exp.skills as tag}
                      <span class="px-2 py-0.5 rounded-md bg-slate-950/80 border border-slate-800 text-[11px] text-slate-400 font-medium">
                        {tag}
                      </span>
                    {/each}
                  </div>
                {/if}
              </div>
            </div>
          {/each}
        </div>
      </div>
    {/if}

    <!-- Right Column: Education, Languages, Certifications -->
    {#if activeFilter === 'all' || activeFilter === 'education' || activeFilter === 'certificates'}
      <div class="{activeFilter === 'all' ? 'lg:col-span-5' : 'lg:col-span-12'} space-y-8">
        <!-- Education Section -->
        {#if activeFilter === 'all' || activeFilter === 'education'}
          <div class="space-y-4">
            <div class="flex items-center gap-2.5 pb-2 border-b border-slate-800">
              <div class="w-8 h-8 rounded-lg bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 flex items-center justify-center">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path d="M12 14l9-5-9-5-9 5 9 5z" />
                  <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222" />
                </svg>
              </div>
              <h2 class="text-xl font-bold text-white tracking-tight">Education</h2>
            </div>

            <div class="space-y-4">
              {#each education as edu (edu.institution)}
                <div class="p-5 rounded-2xl bg-slate-900/60 hover:bg-slate-900/90 border border-slate-800/80 hover:border-slate-700 transition-all duration-200 space-y-2">
                  <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-1">
                    <h3 class="text-base font-bold text-white">{edu.institution}</h3>
                    <span class="text-xs text-slate-400 font-medium px-2 py-0.5 rounded-full bg-slate-800 w-fit">
                      {edu.period}
                    </span>
                  </div>
                  <p class="text-xs sm:text-sm font-semibold text-emerald-400">{edu.degree}</p>
                  {#if edu.description}
                    <p class="text-xs text-slate-400 leading-relaxed">{edu.description}</p>
                  {/if}
                </div>
              {/each}
            </div>
          </div>
        {/if}

        <!-- Languages Section (shown in All mode) -->
        {#if activeFilter === 'all'}
          <div class="space-y-4">
            <div class="flex items-center gap-2.5 pb-2 border-b border-slate-800">
              <div class="w-8 h-8 rounded-lg bg-purple-500/10 border border-purple-500/20 text-purple-400 flex items-center justify-center">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129" />
                </svg>
              </div>
              <h2 class="text-xl font-bold text-white tracking-tight">Languages</h2>
            </div>

            <div class="p-5 rounded-2xl bg-slate-900/60 border border-slate-800/80 space-y-4">
              {#each languages as lang (lang.name)}
                <div class="space-y-1.5">
                  <div class="flex items-center justify-between text-xs sm:text-sm font-medium">
                    <span class="text-slate-200">{lang.name}</span>
                    <span class="text-purple-400 font-semibold">{lang.level}</span>
                  </div>
                  <div class="w-full h-2 rounded-full bg-slate-800 overflow-hidden">
                    <div
                      class="h-full rounded-full bg-gradient-to-r from-purple-500 to-indigo-500 transition-all duration-500"
                      style="width: {lang.percent}%"
                    ></div>
                  </div>
                </div>
              {/each}
            </div>
          </div>
        {/if}

        <!-- Certificates Section -->
        {#if activeFilter === 'all' || activeFilter === 'certificates'}
          <div class="space-y-4">
            <div class="flex items-center gap-2.5 pb-2 border-b border-slate-800">
              <div class="w-8 h-8 rounded-lg bg-amber-500/10 border border-amber-500/20 text-amber-400 flex items-center justify-center">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z" />
                </svg>
              </div>
              <h2 class="text-xl font-bold text-white tracking-tight">Certificates & Awards</h2>
            </div>

            <div class="space-y-3">
              {#each certificates as cert (cert.title)}
                <a
                  href={cert.file}
                  target="_blank"
                  rel="noopener noreferrer"
                  class="group flex items-center justify-between p-4 rounded-xl bg-slate-900/60 hover:bg-slate-900 border border-slate-800/80 hover:border-amber-500/40 transition-all duration-200"
                >
                  <div class="space-y-0.5 min-w-0 pr-2">
                    <p class="text-xs sm:text-sm font-semibold text-white group-hover:text-amber-300 transition-colors truncate">
                      {cert.title}
                    </p>
                    <p class="text-xs text-slate-400">{cert.issuer}</p>
                  </div>
                  <span class="shrink-0 p-2 rounded-lg bg-slate-800 group-hover:bg-amber-500/20 text-slate-400 group-hover:text-amber-300 transition-all">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                  </span>
                </a>
              {/each}
            </div>
          </div>
        {/if}
      </div>
    {/if}
  </div>
</div>

