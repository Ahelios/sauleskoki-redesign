# Files for the live site root (sauleskoki.lv)

Upload these three next to index.html when the chosen version goes live. They are not used by the draft site.

- `robots.txt` — lets every crawler in (search engines and AI assistants) and points to the sitemap.
- `sitemap.xml` — the one page, with the date. Update `lastmod` when the page changes.
- `llms.txt` — a plain-text summary of the business for AI assistants. Keep it in step with the page.

Also at go-live: make unknown addresses answer "404 Not Found" instead of the homepage (today https://sauleskoki.lv/anything returns the homepage). How depends on the host.
