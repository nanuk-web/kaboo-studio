# Kaboo Studio — Site vitrine (Astro)

Site vitrine statique (quelques pages) pour la nouvelle agence web Kaboo Studio.

## Développement

Depuis la racine du projet :

```sh
npm install
npm run dev
```

Le serveur de dev Astro démarre par défaut sur `http://localhost:4321`.

## Build

```sh
npm run build
npm run preview
```

## Docker (production)

Le container sert les fichiers statiques via Nginx sur le port **8080** (port interne au container, choisi pour éviter les conflits).

```sh
docker build -t kaboo-studio-site .
docker run --rm -p 18080:8080 kaboo-studio-site
```

Ou via Compose :

```sh
docker compose up --build
```

## Déploiement Coolify

- Type : **Dockerfile**
- Port à exposer : **8080** (Coolify peut router via son reverse-proxy, donc pas besoin de réserver un port host spécifique)
- Répertoire : `kaboo-studio-site/` (si vous pointez Coolify sur le repo racine)

Astro produit une sortie statique dans `dist/` et l’image Nginx la sert directement.
