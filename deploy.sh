./build.sh && 
COMMIT=$(git log -1 --pretty=%B) && 
echo $COMMIT &&
cp -a www/. ~/code/mclarkedev.github.io/ &&
cd ~/code/mclarkedev.github.io/ &&
git add . &&
git commit -m "deploy: $COMMIT" &&
git push