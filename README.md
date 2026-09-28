# nexaevo.org

Landing page for **NexaEvo** — research and development of predictive
maintenance for production lines, combining IoT sensors and AI.

Static site: one `index.html` with inline CSS/JS, a favicon and a social
preview image. No build step.

## Content

- Vietnamese by default, English via the VI/EN toggle (also picked from the
  browser language on first visit; the choice is remembered).
- The hero chart is an **illustration** of how an alert works, not real data,
  and says so on the page.
- Contact: `hphung10499@gmail.com` (mailto links).

## Local preview

```bash
python3 -m http.server 8080
# open http://localhost:8080
```

Append `?frame=end` to render the hero chart in its final (alert) state
without animation — used for screenshots.

## Deploy

Temporarily hosted on the shared server (`194.233.82.190`) behind nginx.

- Checkout: `/root/NexaEvo/nexaevo.org` (NexaEvo code lives under `/root/NexaEvo/`,
  never alongside Eranin projects).
- Web root: `/var/www/nexaevo.org`, published by `./deploy.sh` (pull + rsync).
- nginx site: `nginx/nexaevo.org.conf` -> `/etc/nginx/sites-available/nexaevo.org`;
  TLS by certbot (Let's Encrypt).
- DNS: Cloudflare zone `nexaevo.org` (NexaEvo's own Cloudflare account), A records
  for `@` and `www`, proxy off.
