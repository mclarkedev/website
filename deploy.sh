./build.sh && 
COMMIT=$(git log -1 --pretty=%B) && 
echo $COMMIT &&
cd ~/code/mclarkedev.github.io/ &&
rm -r ./* && 
cp -a ~/code/website/www/. ~/code/mclarkedev.github.io/ &&
git add . &&
git commit -m "deploy: $COMMIT" &&
git push