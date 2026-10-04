# sauleskoki.lv — the website

This folder is the complete website. Nothing else is needed.

## How to put it online

1. Download this repository as a ZIP (green "Code" button, then "Download ZIP") or take the ZIP from the Releases page.
2. Unpack it. You get a folder with `index.html`, an `img` folder, a `video` folder and a few small files.
3. Upload **the contents** of that folder (not the folder itself) to the web root of your hosting. The web root is usually called `public_html`, `www` or `htdocs`. After the upload, `index.html` must sit directly in the web root, with `img` and `video` next to it.
4. Open https://sauleskoki.lv in a browser, on a phone too. The page is in Latvian and should show the photos and, in the services list, two short clips that play on their own.

That is all. There is no build step, no database and no settings file.

## What the small files do

- `favicon.ico` — the icon in the browser tab.
- `og-image.jpg` — the picture Facebook and WhatsApp show when someone shares the link.
- `robots.txt` — lets search engines and AI assistants read the site.
- `sitemap.xml` — the list of pages for search engines (there is one page).
- `llms.txt` — a plain-text summary of the business for AI assistants.

## Two things to check with the hosting company

- HTTPS must be on, so that the address starts with `https://`.
- A wrong address such as `https://sauleskoki.lv/abc` should show a "404 not found" page, not the homepage. Today it shows the homepage. Ask the hosting company to turn that off, or send them this line.

## Updating later

Do not edit this folder by hand. The site is generated from the design project; changes are made there and released again here.
