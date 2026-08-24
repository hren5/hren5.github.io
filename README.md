# hangren-website

Personal academic website. Plain HTML, no build step, no dependencies, no JavaScript.
Hosted free on GitHub Pages.

## Files

| File | What it is |
|---|---|
| `index.html` | The entire site — markup and CSS in one file. Edit this to change content. |
| `cv.pdf` | Published copy of the CV. Do not edit by hand; run `./update-cv.sh`. |
| `assets/photo.jpg` | Headshot, 440px wide. |
| `assets/favicon.svg` | Browser-tab icon. |
| `update-cv.sh` | Copies the latest `CV.pdf` from Dropbox and publishes it. |
| `.nojekyll` | Tells GitHub Pages to serve files as-is. Leave it alone. |

## Updating the CV

After recompiling `CV.tex` in Dropbox:

```sh
cd ~/Sites/hangren-website
./update-cv.sh
```

The CV is live at `<site>/cv.pdf` about a minute later. The script is a no-op when the
PDF hasn't changed.

## Updating anything else

Edit `index.html`, then:

```sh
cd ~/Sites/hangren-website
open index.html          # check it looks right
git add -A && git commit -m "Update publications" && git push
```

You can also edit `index.html` directly in GitHub's web editor (press `.` on the repo
page, or click the pencil icon) if you're away from this Mac. Changes go live about a
minute after committing.

Everything on the site is transcribed from `CV.tex` in Dropbox
(`0_Research_Drop/CV & website/CV/`), which stays the source of truth.

## Why this repo is not in Dropbox

Git repositories inside Dropbox get corrupted by sync conflicts. GitHub already provides
version history and an offsite copy, so Dropbox would add risk without adding safety.
