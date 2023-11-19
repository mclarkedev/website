#!/bin/bash
./build.sh && 
COMMIT=$(git rev-parse --short HEAD) && 
echo $COMMIT &&
cd ~/code/mclarkedev.github.io/ &&
rm -r ./* &&
cp -a ~/code/website/www/. ~/code/mclarkedev.github.io/ &&
git add . &&
git commit -m "deploy: $COMMIT" &&
git push