# …or create a new repository on the command line
echo "# Hello World!" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:username/repositorio-name.git
git push -u origin main

# …or push an existing repository from the command line
git remote add origin git@github.com:username/repositorio-name.git
git branch -M main
git push -u origin main

# ..branch
git branch
git branch name-new-branch
git checkout name-branch
