# hren5.github.io

Personal academic website — **https://hren5.github.io**

Plain HTML. No build step, no JavaScript, no frameworks, no external requests.
The whole site is one file: `index.html` (markup and CSS together).

---

## How to update it

**The fastest way: ask Claude Code.** Open a session in this folder and say what changed —
"the parcel sortation paper was accepted at IISE", "add a new media mention", "update my CV".
It has the context to do it. Everything below is the manual path.

### Updating the CV

After you recompile `CV.tex` in Dropbox:

```sh
cd ~/Sites/hangren-website
./update-cv.sh
```

Live at `hren5.github.io/cv.pdf` about a minute later. Safe to run any time — it does nothing
if the PDF hasn't changed. The site's CV button always points at the latest published copy.

### Changing a paper's status (the most common edit)

Every under-review paper ends with a venue and a status, styled the same way as a published
paper. Open `index.html`, find the paper, and edit that line:

```html
<span class="venue">Operations Research</span>, minor revision.
```

Change `minor revision` to `major revision`, `under review`, `second-round revision` — whatever
is true. Then publish (see below).

### When a paper gets accepted

Move the entry from the `<section id="review">` block up into `<section id="publications">`,
and reformat it to match its new neighbours:

```html
<li>
  <span class="authors">Author, A., Ren, H., and Author, B.</span> (2027).
  <a href="https://doi.org/...">Title of the Paper</a>.
  <span class="venue">Journal Name</span>, 12(3), 456&ndash;789.
</li>
```

Published entries carry authors, year, linked title, italic venue, volume(issue), pages.
Under-review entries carry authors, title, venue, status — no year, no volume.

### Teaching tools (`teaching/`)

Interactive course pages (simulations and similar) live in `teaching/<tool>/index.html` and
are served at `hren5.github.io/teaching/<tool>/`. They use JavaScript, unlike the main page,
because Canvas cannot run scripts itself. See `teaching/README.md` for the list.

### Adding a new working paper or media mention

Copy the nearest existing `<li>` in that section, paste it, and change the text. The
formatting is entirely carried by the surrounding tags, so a copied block will always
look right.

### Publishing any of these edits

```sh
cd ~/Sites/hangren-website
open index.html                                   # look at it first
git add -A && git commit -m "what changed" && git push
```

Live about a minute later.

**Away from this Mac?** Edit `index.html` directly at
https://github.com/hren5/hren5.github.io — press `.` on the repo page for a full web
editor, or click any file and use the pencil icon. Committing there publishes the same way.

---

## Files

| File | What it is |
|---|---|
| `index.html` | The entire site. Everything you'd ever edit is here. |
| `cv.pdf` | Published CV. Never edit by hand — run `./update-cv.sh`. |
| `assets/photo.jpg` | Headshot, 440px wide. |
| `assets/favicon.svg` | Browser-tab icon. |
| `update-cv.sh` | Copies the latest `CV.pdf` out of Dropbox and publishes it. |
| `.nojekyll` | Tells GitHub Pages to serve files verbatim. Leave it alone. |

## How it's set up

- **Host:** GitHub Pages, serving branch `main` at the repository root.
- **Source of truth for content:** `CV.tex` in Dropbox at
  `0_Research_Drop/CV & website/CV/`. The site is transcribed from it; when they disagree,
  the CV is right.
- **Authentication:** SSH key at `~/.ssh/id_ed25519`, no passphrase, so pushes never prompt.
- **Commit identity:** `hren5@users.noreply.github.com`, which keeps a real email address out
  of the public commit log.
- **Old branches:** `master`, `gh-pages-*`, `navbar-menu`, `flexbox-sticky-footer` are leftovers
  from an abandoned 2026 experiment with the Minimal Mistakes Jekyll theme. Nothing uses them;
  they can be deleted whenever.
- **The old site** at `mason.gmu.edu/~hren5/` is still live and now out of date. Its Mobirise
  source is archived in Dropbox at `0_Research_Drop/CV & website/Personal website/`.

## Why this repo is not in Dropbox

Git repositories inside Dropbox get corrupted by sync conflicts — the same failure that
produced `CV (Hang Ren's conflicted copy 2025-10-16).tex` in the CV folder. GitHub already
provides version history and an offsite copy, so Dropbox would add risk without adding safety.
