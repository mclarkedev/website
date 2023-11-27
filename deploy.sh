#!/bin/bash
./build.sh && 
COMMIT=$(git rev-parse --short HEAD) && 
echo $COMMIT &&
cd ~/code/mclarkedev.github.io/ &&
git rm -rf . &&
cp -a ~/code/website/www/. ~/code/mclarkedev.github.io/ &&
git add . &&
git commit -m "deploy: $COMMIT" &&
git push &&
open https://github.com/mclarkedev/mclarkedev.github.io/commit/$(git rev-parse HEAD) &&
echo "[deploy.sh] deployed $COMMIT : $(git rev-parse HEAD)"