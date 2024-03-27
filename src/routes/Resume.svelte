<script lang="ts">
  import NavBar from '../lib/components/NavBar.svelte';
  import { experience, education, language, type Resume } from '../lib/data/resume';

  const experienceData: Resume[] = experience;
  const educationData: Resume[] = education;
  const languageData: Resume[] = language;

  const resumeFile: string = '/assets/resume/Resume-Michael-William-Jonathan.pdf';
</script>

<NavBar />

<div class="max-w-4xl mx-6 sm:mx-6 md:mx-auto md:px-6">
  <div class="bg-gradient-to-r from-sky-500 to-emerald-500 mt-6 p-4 flex justify-between items-center rounded-xl">
    <h2 class="text-white text-lg font-bold">Download Resume</h2>
    <a href={resumeFile}><button class="bg-white text-emerald-500 ml-5 px-4 py-2 rounded-xl">Download</button></a>
  </div>

  <div class="-m-4 mt-6 p-4 grid grid-cols-1 md:grid-cols-2 xl:grid-cols-2 gap-4">
    <section class="bg-indigo-950 p-4 rounded-xl">
      <h2 class="text-white text-2xl font-bold mb-2">Experience</h2>
      {#each experienceData as experience (experience.title)}
        <p class="text-white text-xl font-semibold">{experience.title}</p>
        <p class="text-white text-lg mb-1">{experience.description}</p>
      {/each}
    </section>

    <section class="bg-indigo-950 p-4 rounded-xl">
      <h2 class="text-white text-2xl font-bold mb-2">Education</h2>
      {#each educationData as education (education.title)}
        <p class="text-white text-xl font-semibold">{education.title}</p>
        <p class="text-white text-lg mb-1">{education.description}</p>
      {/each}

      <h2 class="text-white text-2xl font-bold mb-2 mt-3">Language</h2>
      {#each languageData as language (language.title)}
        <p class="text-white text-xl font-semibold">{language.title}</p>
        <p class="text-white text-lg mb-1">{language.description}</p>
      {/each}
    </section>
  </div>
</div>