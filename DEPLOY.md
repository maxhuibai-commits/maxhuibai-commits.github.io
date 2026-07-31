# Deploying maxhuibai.com for ~$12/year (instead of $240)

**The plan:** free hosting on GitHub Pages + your domain kept at a cheap
registrar. Hosting: $0. Domain: ~$10-13/yr (Cloudflare Registrar sells at
cost; Porkbun and Namecheap are similar). Everything in this folder is
ready to upload as-is.

## Step 0 - BEFORE canceling Weebly (do these first!)
1. **Download your files.** See uploads/1/2/1/1/121166125/DOWNLOAD-THESE-FROM-WEEBLY.txt
   - drop the four files into that folder so all published links keep working.
2. **Find out where your domain is registered.** Log into Weebly/Square ->
   Settings -> Domains. If the domain was purchased THROUGH Weebly, unlock it
   and request the transfer authorization (EPP) code, then transfer it to
   Cloudflare Registrar / Porkbun / Namecheap (~$10/yr, takes up to 5 days -
   start early). If it's registered elsewhere (e.g., GoDaddy), skip the
   transfer; you'll just change DNS in Step 3.
3. **Archive the old site for the record.** Go to https://web.archive.org/save
   and save each of these URLs (takes ~2 min total):
   - http://www.maxhuibai.com/
   - http://www.maxhuibai.com/research-findings1.html
   - http://www.maxhuibai.com/research-statement.html
   - http://www.maxhuibai.com/diversity-statement.html
   - http://www.maxhuibai.com/blog.html
   - http://www.maxhuibai.com/application-materials.html
   - http://www.maxhuibai.com/r-packages.html
   - http://www.maxhuibai.com/regtable-package.html
   - http://www.maxhuibai.com/blog/evidence-that-responses-from-repeating-gps-are-random
   - http://www.maxhuibai.com/blog/a-proposed-procedure-for-testing-the-evidentiary-value-of-responses-from-duplicated-gps-sources-comments-invited
   - http://www.maxhuibai.com/blog/a-prospective-test-and-some-predictions-regarding-mturk-data-contamination
   - http://www.maxhuibai.com/blog/proposed-agenda-and-updates-on-the-mturk-issue
   The Wayback Machine keeps a permanent public snapshot - your archive copy.

## Step 1 - Pick your design
- `index.html` is the light version and will be the live site.
- `maxhuibai-nocturne.html` is the dark version. If you prefer it, delete
  index.html and rename maxhuibai-nocturne.html -> index.html.
- Either way, search the file for `REPLACE-` and put in your two real
  contact email addresses.

## Step 2 - Put it on GitHub Pages (free)
1. Sign in at github.com (account: maxhuibai-commits).
2. Create a new PUBLIC repository named exactly: `maxhuibai-commits.github.io`
3. Upload the ENTIRE contents of this folder (keep the folder structure:
   blog/, uploads/, 1/, CNAME, etc.). Drag-and-drop works on github.com.
4. Repo Settings -> Pages: it should auto-enable from the main branch.
   The CNAME file in this folder tells GitHub your custom domain.
5. In Settings -> Pages -> Custom domain, confirm `www.maxhuibai.com`,
   and tick **Enforce HTTPS** once available.

## Step 3 - Point your domain at GitHub
At your registrar's DNS settings for maxhuibai.com:
- CNAME record:  www  ->  maxhuibai-commits.github.io
- A records for the apex (@): 185.199.108.153, 185.199.109.153,
  185.199.110.153, 185.199.111.153
DNS can take a few hours to propagate. When www.maxhuibai.com shows the
new site, you're live.

## Step 4 - Cancel Weebly
Only after Steps 0-3 are done and verified. (Check whether your Weebly
plan includes an email address you use - if so, arrange email hosting
before canceling.)

## What's preserved (citation-proof)
These old URLs all keep working on the new host:
- /blog/evidence-that-responses-from-repeating-gps-are-random  -> full archived
  page with the original post + comment thread (this is the one cited in
  published papers)
- the other three /blog/... posts -> archived pages
- /1/post/2018/08/... (Weebly's alternate permalinks) -> redirect to the above
- /blog.html, /research-findings1.html, /research-statement.html,
  /diversity-statement.html, /application-materials.html, /r-packages.html
  -> redirect into the new site
- /regtable-package.html -> archived documentation page
- /uploads/1/2/1/1/121166125/... -> same paths, once you drop the files in
- anything else -> 404 page that forwards to the homepage
