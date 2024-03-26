<script lang="ts">
  import { Router, Route } from 'svelte-routing';
  import Home from './routes/Home.svelte';
  import Contact from './routes/Contact.svelte';
  import Projects from './routes/Projects.svelte';
  import Resume from './routes/Resume.svelte';
  import NotFound from './routes/NotFound.svelte';
</script>

<main>
  <Router>

    <Route path="/" component={Home} />
    <Route path="/projects" component={Projects} />
    <Route path="/resume" component={Resume} />
    <Route path="/contact" component={Contact} />
    <Route component={NotFound} />

  </Router>
</main>