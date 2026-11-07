<script lang="ts">
  interface SocialItem {
    name: string;
    href: string;
    icon: string;
    color: string;
    hoverBorder: string;
    hoverShadow: string;
  }

  const socials: SocialItem[] = [
    {
      name: 'GitHub',
      href: 'https://github.com/moepoi',
      icon: '/assets/images/github.svg',
      color: 'hover:text-white',
      hoverBorder: 'hover:border-slate-500',
      hoverShadow: 'hover:shadow-slate-500/20'
    },
    {
      name: 'Telegram',
      href: 'https://t.me/moepoi',
      icon: '/assets/images/telegram.svg',
      color: 'hover:text-sky-400',
      hoverBorder: 'hover:border-sky-500/50',
      hoverShadow: 'hover:shadow-sky-500/20'
    },
    {
      name: 'LinkedIn',
      href: 'https://linkedin.com/in/moepoi',
      icon: '/assets/images/linkedin.svg',
      color: 'hover:text-blue-400',
      hoverBorder: 'hover:border-blue-500/50',
      hoverShadow: 'hover:shadow-blue-500/20'
    },
    {
      name: 'Blog',
      href: 'https://blog.moe.team',
      icon: '/assets/images/blog.svg',
      color: 'hover:text-amber-400',
      hoverBorder: 'hover:border-amber-500/50',
      hoverShadow: 'hover:shadow-amber-500/20'
    }
  ];
</script>

<div class="flex items-center gap-2.5 sm:gap-3 flex-wrap justify-center">
  {#each socials as item (item.name)}
    <a
      href={item.href}
      target="_blank"
      rel="noopener noreferrer"
      aria-label={item.name}
      class="group relative flex items-center justify-center w-11 h-11 sm:w-12 sm:h-12 rounded-xl bg-slate-900/80 border border-slate-800 text-slate-300 hover:scale-105 active:scale-95 transition-all duration-200 shadow-sm hover:shadow-lg {item.hoverBorder} {item.hoverShadow}"
    >
      <img
        src={item.icon}
        alt={item.name}
        class="w-5 h-5 opacity-80 group-hover:opacity-100 transition-opacity"
        width="20"
        height="20"
        loading="eager"
        decoding="async"
      />
      <!-- Tooltip -->
      <span class="pointer-events-none absolute -bottom-8 scale-90 opacity-0 group-hover:scale-100 group-hover:opacity-100 transition-all duration-150 px-2 py-0.5 rounded text-[11px] font-medium bg-slate-800 text-slate-200 border border-slate-700 whitespace-nowrap shadow-md z-30">
        {item.name}
      </span>
    </a>
  {/each}
</div>

