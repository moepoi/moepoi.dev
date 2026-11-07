<script lang="ts">
  import { emailAddress, pgpInfo, publicKey } from '../data/contact';

  let copiedText: string | null = null;
  let copyTimeout: number | undefined;
  let isKeyExpanded: boolean = false;

  const copyToClipboard = async (text: string, label: string) => {
    try {
      await navigator.clipboard.writeText(text);
      copiedText = label;
      if (copyTimeout) clearTimeout(copyTimeout);
      copyTimeout = window.setTimeout(() => {
        copiedText = null;
      }, 2500);
    } catch (err) {
      console.error('Failed to copy to clipboard', err);
    }
  };

  const downloadPgpKey = () => {
    const blob = new Blob([publicKey], { type: 'text/plain;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'moepoi.asc';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };
</script>

<div class="w-full max-w-3xl mx-auto flex flex-col gap-6 sm:gap-8">
  <!-- Header Title -->
  <div class="text-center space-y-2">
    <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-slate-900 border border-slate-800 text-xs text-cyan-400 font-medium">
      <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
      </svg>
      <span>Get in Touch</span>
    </div>
    <h1 class="text-3xl sm:text-4xl font-extrabold tracking-tight text-white">Contact & Security</h1>
    <p class="text-slate-400 text-sm sm:text-base max-w-md mx-auto">
      Feel free to reach out for inquiries, collaborations, or secure encrypted communication.
    </p>
  </div>

  <!-- Email Card -->
  <div class="relative overflow-hidden rounded-2xl bg-gradient-to-br from-slate-900/90 via-slate-900/60 to-slate-950 border border-slate-800/80 p-5 sm:p-6 shadow-xl backdrop-blur-sm group hover:border-cyan-500/40 transition-all duration-300">
    <div class="absolute -right-10 -bottom-10 w-40 h-40 bg-cyan-500/10 rounded-full blur-3xl pointer-events-none group-hover:bg-cyan-500/15 transition-all"></div>
    
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
      <div class="flex items-center gap-3.5 min-w-0">
        <div class="w-12 h-12 rounded-xl bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 flex items-center justify-center shrink-0 shadow-inner">
          <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
          </svg>
        </div>
        <div class="min-w-0">
          <span class="text-xs uppercase tracking-wider text-slate-400 font-semibold">Direct Email</span>
          <a
            href="mailto:{emailAddress}"
            class="block text-lg sm:text-2xl font-bold text-white hover:text-cyan-300 transition-colors truncate"
            title="Send email to {emailAddress}"
          >
            {emailAddress}
          </a>
        </div>
      </div>

      <div class="flex items-center gap-2 self-start sm:self-auto shrink-0 w-full sm:w-auto">
        <a
          href="mailto:{emailAddress}"
          class="flex-1 sm:flex-none inline-flex items-center justify-center gap-1.5 px-4 py-2.5 rounded-xl bg-slate-800 hover:bg-slate-700 text-slate-200 text-xs sm:text-sm font-medium border border-slate-700 transition-all active:scale-95"
        >
          <svg class="w-4 h-4 text-cyan-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
          </svg>
          <span>Send</span>
        </a>
        <button
          on:click={() => copyToClipboard(emailAddress, 'Email')}
          class="flex-1 sm:flex-none inline-flex items-center justify-center gap-1.5 px-4 py-2.5 rounded-xl bg-cyan-600 hover:bg-cyan-500 text-white text-xs sm:text-sm font-medium shadow-md shadow-cyan-600/30 transition-all active:scale-95"
          aria-label="Copy email address"
        >
          {#if copiedText === 'Email'}
            <svg class="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7" />
            </svg>
            <span>Copied!</span>
          {:else}
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
            </svg>
            <span>Copy</span>
          {/if}
        </button>
      </div>
    </div>
  </div>

  <!-- PGP Public Key Card -->
  <div class="rounded-2xl bg-slate-900/80 border border-slate-800 p-5 sm:p-6 shadow-xl backdrop-blur-sm space-y-5">
    <!-- PGP Header -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-4 border-b border-slate-800/80">
      <div class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-xl bg-indigo-500/10 border border-indigo-500/20 text-indigo-400 flex items-center justify-center shrink-0">
          <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
          </svg>
        </div>
        <div>
          <div class="flex items-center gap-2 flex-wrap">
            <h2 class="text-lg sm:text-xl font-bold text-white">PGP Public Key</h2>
            <span class="px-2 py-0.5 rounded-md text-[11px] font-semibold bg-indigo-950 text-indigo-300 border border-indigo-800">
              {pgpInfo.algorithm}
            </span>
          </div>
          <p class="text-xs text-slate-400 mt-0.5">Use this key to verify messages or send encrypted communications.</p>
        </div>
      </div>

      <!-- Quick Action Buttons -->
      <div class="flex items-center gap-2 flex-wrap shrink-0">
        <button
          on:click={downloadPgpKey}
          class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-200 text-xs font-medium border border-slate-700 transition-all active:scale-95"
          title="Download .asc key file"
        >
          <svg class="w-3.5 h-3.5 text-slate-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
          </svg>
          <span>.asc</span>
        </button>

        <button
          on:click={() => copyToClipboard(publicKey, 'PGP Key')}
          class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-indigo-600 hover:bg-indigo-500 text-white text-xs font-medium shadow-sm transition-all active:scale-95"
          aria-label="Copy PGP Public Key"
        >
          {#if copiedText === 'PGP Key'}
            <svg class="w-3.5 h-3.5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7" />
            </svg>
            <span>Copied!</span>
          {:else}
            <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
            </svg>
            <span>Copy Key</span>
          {/if}
        </button>
      </div>
    </div>

    <!-- Key Metadata & Fingerprint -->
    <div class="grid grid-cols-1 gap-3 text-xs">
      <div class="p-3 rounded-xl bg-slate-950/70 border border-slate-800/80 space-y-1.5">
        <div class="flex items-center justify-between text-slate-400">
          <span class="font-medium text-slate-300 flex items-center gap-1.5">
            <svg class="w-3.5 h-3.5 text-cyan-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 7a2 2 0 012 2m4 0a6 6 0 01-7.743 5.743L11 17H9v2H7v2H4a1 1 0 01-1-1v-2.586a1 1 0 01.293-.707l5.964-5.964A6 6 0 1121 9z" />
            </svg>
            Fingerprint
          </span>
          <button
            on:click={() => copyToClipboard(pgpInfo.fingerprint, 'Fingerprint')}
            class="text-[11px] text-cyan-400 hover:text-cyan-300 font-medium hover:underline flex items-center gap-1"
          >
            {copiedText === 'Fingerprint' ? 'Copied!' : 'Copy Fingerprint'}
          </button>
        </div>
        <p class="font-mono text-slate-200 text-[11px] sm:text-xs tracking-wide break-all select-all">
          {pgpInfo.fingerprint}
        </p>
      </div>

      <!-- Associated Identities -->
      <div class="space-y-1.5">
        <span class="text-[11px] font-semibold text-slate-400 uppercase tracking-wider">Associated UIDs</span>
        <div class="flex flex-wrap gap-1.5">
          {#each pgpInfo.identities as uid}
            <span class="px-2 py-1 rounded-md bg-slate-950/60 border border-slate-800 text-[11px] text-slate-300 font-mono break-all">
              {uid}
            </span>
          {/each}
        </div>
      </div>
    </div>

    <!-- Public Key Code Block Container -->
    <div class="rounded-xl overflow-hidden border border-slate-800 bg-slate-950/90 shadow-inner">
      <!-- Terminal Header -->
      <div class="flex items-center justify-between px-3.5 py-2 bg-slate-900/90 border-b border-slate-800 text-xs">
        <div class="flex items-center gap-2">
          <div class="flex items-center gap-1.5">
            <span class="w-2.5 h-2.5 rounded-full bg-rose-500/80"></span>
            <span class="w-2.5 h-2.5 rounded-full bg-amber-500/80"></span>
            <span class="w-2.5 h-2.5 rounded-full bg-emerald-500/80"></span>
          </div>
          <span class="text-slate-400 font-mono text-[11px] ml-1.5">moepoi.asc</span>
        </div>

        <button
          on:click={() => (isKeyExpanded = !isKeyExpanded)}
          class="text-[11px] text-cyan-400 hover:text-cyan-300 font-medium hover:underline flex items-center gap-1"
        >
          <span>{isKeyExpanded ? 'Collapse' : 'Expand full key'}</span>
          <svg class="w-3 h-3 transition-transform duration-200 {isKeyExpanded ? 'rotate-180' : ''}" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
          </svg>
        </button>
      </div>

      <!-- Public Key Content with safe mobile overflow -->
      <div class="relative">
        <pre
          class="p-3.5 sm:p-4 text-[10px] sm:text-[11.5px] font-mono text-slate-300 leading-relaxed overflow-x-auto overflow-y-auto transition-all duration-300 break-all select-all {isKeyExpanded ? 'max-h-[500px]' : 'max-h-48'}"
        ><code>{publicKey}</code></pre>

        <!-- Gradient blur overlay when collapsed -->
        {#if !isKeyExpanded}
          <div 
            class="absolute bottom-0 inset-x-0 h-16 bg-gradient-to-t from-slate-950 via-slate-950/80 to-transparent flex items-end justify-center pb-2 cursor-pointer"
            on:click={() => (isKeyExpanded = true)}
            on:keydown={(e) => e.key === 'Enter' && (isKeyExpanded = true)}
            tabindex="0"
            role="button"
            aria-label="Expand public key"
          >
            <span class="text-xs text-cyan-400 font-medium bg-slate-900/90 px-3 py-1 rounded-full border border-slate-700 shadow-md">
              Tap to expand full key (28 lines)
            </span>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

<!-- Floating Toast Notification -->
{#if copiedText}
  <div 
    class="fixed bottom-6 right-6 z-50 flex items-center gap-2 px-4 py-3 rounded-xl bg-emerald-500 text-white shadow-2xl shadow-emerald-500/40 text-sm font-medium animate-bounce"
    role="status"
    aria-live="polite"
  >
    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7" />
    </svg>
    <span>{copiedText} copied to clipboard!</span>
  </div>
{/if}

