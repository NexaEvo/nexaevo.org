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

Hosted on the Hermes host (`37.60.226.153`) behind nginx since 2026-11-15. The previous
shared server (`194.233.82.190`) was retired.

- Checkout: `/root/NexaEvo/nexaevo.org` (NexaEvo code lives under `/root/NexaEvo/`,
  never alongside Eranin projects).
- Web root: `/var/www/nexaevo.org`, published by `./deploy.sh` (pull + rsync).
- nginx site: `nginx/nexaevo.org.conf` -> `/etc/nginx/sites-available/nexaevo.org`;
  `nginx/00-default-deny.conf` closes requests for any other name (bare IP scans).
- TLS: Let's Encrypt via `certbot --nginx` (certificate `nexaevo.org`, both names),
  renewed by `certbot.timer`.
- DNS: Cloudflare zone `nexaevo.org` (NexaEvo's own Cloudflare account), A records
  for `@` and `www`, proxy off so HTTP-01 renewals reach the origin.
