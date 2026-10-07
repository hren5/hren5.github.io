# Teaching tools

Interactive HTML pages for Hang Ren's courses at George Mason University, served by GitHub
Pages so their JavaScript runs. Canvas cannot run them: it serves uploaded HTML files with
`script-src 'none'` and strips `<script>` from Pages. Each tool is embedded in a Canvas Page
with an iframe plus an "open in a new tab" link.

One folder per tool, each holding a single self-contained `index.html`:

| Folder | Tool | Course | Added |
|---|---|---|---|
| `cafe-queue-lab/` | Café Queue Lab: single-barista queue simulation (utilization, waiting time, variability, limited waiting space) | OSCM 303, Service Operations I | 2026-10-06 |

Live URL pattern: `https://hren5.github.io/teaching/<folder>/`

The master copy of each tool lives with the course materials in Dropbox; this folder holds the
published copy. To update a tool, copy the new file over its `index.html`, commit, and push.
The site's own `index.html` stays plain HTML with no JavaScript; this folder is the exception.
