# CustomVerse

A working React + Vite customization storefront demo for hoodies, T-shirts, fabric wrappers and tote bags.

## Features
- Responsive homepage and product catalog
- Live canvas editor: text, upload image, drag, resize, rotate, change colors
- PNG mockup download, local in-memory cart
- Optional Supabase email/password auth and saved design records
- Vercel-ready deployment

## Run locally
1. Install Node.js 20 or newer.
2. Open a terminal in this folder.
3. Run `npm install` then `npm run dev`.
4. Open the local URL shown by Vite.

## Supabase setup (optional)
1. Create a Supabase project at https://supabase.com.
2. In **SQL Editor**, run `supabase/schema.sql` once.
3. Copy `.env.example` to `.env.local`.
4. In Supabase **Project Settings → API**, copy the Project URL and publishable/anon key into `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`.
5. Restart the development server. Enable email authentication in Supabase Auth settings. Never put a Supabase service-role key in a `VITE_` variable.

## GitHub and Vercel
1. Create a new GitHub repository and upload this project's **contents**, including `package.json`, `index.html`, `src`, and `vite.config.js` (not `node_modules`).
2. Sign in at https://vercel.com and import that GitHub repository.
3. Framework preset: **Vite**; build command: `npm run build`; output directory: `dist`.
4. If using Supabase, add both `VITE_` environment variables in Vercel Project Settings and redeploy.
5. Vercel will provide a public `.vercel.app` URL. Add a custom domain later in project settings.

## Important limitations before launch
- **Payments are not implemented.** Checkout deliberately displays a warning and does not charge users.
- The cart is in memory and resets when the page reloads.
- Saving a design stores its editor data in Supabase, but the starter does not yet provide a saved-design gallery or reload interface.
- Uploaded image data is embedded in saved JSON; for production, move uploads to private Supabase Storage, enforce file limits and storage access policies.
- PNG export is a product mockup, **not print-ready artwork**. A production workflow needs separate high-resolution print files and printer-specific bleed/DPI specifications.
- This starter has no admin dashboard, inventory management, fulfillment, shipping calculations, or transactional emails.
- Before accepting real orders, implement server-side Stripe checkout with verified webhooks, order persistence, privacy/returns policies, and secure administrative access.
