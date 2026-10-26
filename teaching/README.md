# Teaching tools

Interactive HTML pages for Hang Ren's courses at George Mason University, served by GitHub
Pages so their JavaScript runs. Canvas cannot run them: it serves uploaded HTML files with
`script-src 'none'` and strips `<script>` from Pages. Each tool is embedded in a Canvas Page
with an iframe plus an "open in a new tab" link.

One folder per tool, each holding a single self-contained `index.html`:

| Folder | Tool | Course | Added |
|---|---|---|---|
| `cafe-queue-lab/` | Café Queue Lab: single-barista queue simulation (utilization, waiting time, variability, limited waiting space) | OSCM 303, Service Operations I | 2026-10-06 |
| `pickleball-drop-test/` | Pickleball Drop Test: pickleball factory with the USA Pickleball bounce test (accuracy vs. consistency, capability index C_pk with practice, control-chart patterns) | OSCM 303, Quality Management II (Statistical Quality Control) | 2026-10-26 |

Live URL pattern: `https://hren5.github.io/teaching/<folder>/`

The master copy of each tool lives with the course materials in Dropbox; this folder holds the
published copy. To update a tool, copy the new file over its `index.html`, commit, and push.
The site's own `index.html` stays plain HTML with no JavaScript; this folder is the exception.
