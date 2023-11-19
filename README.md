# Matthew Clarke's website

A minimalist's static site generator

# Dev Dependencies

```bash
./dev.sh # uses config.sh to build, watch and serve site
```

- brew install fswatch
- brew install pandoc
- brew install tidy-html5

## Build Dependencies

```bash
./build.sh # uses config.sh to build nav into pages
```

- brew install pandoc
- brew install tidy-html5

## Files

```
├── build-nav.sh
├── build.sh                 # Builds to www
├── config.sh
├── dev-watch.sh
├── dev.sh                   # Dev hot loads src/md and www
├── src
│   ├── css
│   │   └── globals.css
│   ├── fragments            # Fragments build into pages
│   │   └── meta.html
│   └── pages                # Pages define all pages of the site
│       ├── About.md
│       └── Index.md
└── www
    ├── about.html
    ├── css
    │   └── globals.css
    ├── fragments
    │   ├── meta.html
    │   └── nav.html
    ├── index.html
    └── pages
        ├── About.md
        └── Index.md
```
