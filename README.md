# Vite + React + TypeScript + Tailwind Template

Minimalist, high-performance starter with multi-stage Docker/Nginx orchestration.

---

## 🛠️ Tech Stack

- **Build Tool:** Vite
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **Server:** Nginx

---

## 📦 Local Development

```bash
# dev
npm install
npm run dev

# prod
npm run build
npm run preview
```

### Included packages

- `vite-tsconfig-paths`
- `prettier@3.6.2`
- `prettier-plugin-tailwindcss`
- `eslint-config-prettier`

## 🐳 Docker

### Multi-Stage Build

The `Dockerfile` executes a binary separation of concerns:

1.  **Build Stage:** Node:20-Alpine environment to resolve `node_modules` and transpile TSX.
2.  **Production Stage:** Nginx:Alpine. Only the `/dist` folder is persisted.

### Nginx Config

I've added nginx config to support **React Router** client-side navigation and prevent 404s on refresh.

### Deployment

```bash
docker build -t app-name .
docker run -dt -p 3000:80 --name app-container app-name
```
