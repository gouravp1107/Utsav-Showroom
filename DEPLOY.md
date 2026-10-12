# Deploying Utsav: Vercel (frontend) + Render (backend + PostgreSQL)

## 0. Put the project on GitHub
Create a private GitHub repo and push this whole folder (frontend, backend, DEPLOY.md, .gitignore).
The backend/uploads folder (~86 MB of product photos) must be included.

## 1. Render: database
New > PostgreSQL. Name it utsav-db. Choose a paid plan for a live shop (free databases expire).
After it is created, copy the **Internal Database URL**.

## 2. Render: backend
New > Web Service > connect the GitHub repo.
- Root Directory: backend
- Build Command: npm install
- Start Command: node server.js
- Health Check Path: /api/health
- Environment variables:
  - DATABASE_URL = the Internal Database URL
  - JWT_SECRET = a long random string (keeps logins valid across restarts)
  - ADMIN_PASSWORD = the owner password you want (used on the very first start only)
Deploy. Open https://YOUR-SERVICE.onrender.com/api/health - you should see {"ok":1}.

## 3. Vercel: frontend
Edit frontend/vercel.json: replace both YOUR-SERVICE-NAME.onrender.com with your real Render address. Commit and push.
Vercel > Add New Project > import the repo.
- Root Directory: frontend
- Framework Preset: Other (no build command)
Deploy. The site opens at your .vercel.app address. Owner panel: /admin.

## 4. Domain
Vercel > Project > Settings > Domains > add your domain and follow the DNS instructions.
Do this only after step 5 passes. Keep the old site running until then.

## 5. Test before switching
Register a user, rent an item, book a slot, open /admin, edit a text, upload a photo, press Save, reload.
Change the owner password with the Password button.

## 6. Backups
Everything lives in PostgreSQL (site content, users, bookings, uploaded photos). Turn on Render database backups or run pg_dump regularly.
