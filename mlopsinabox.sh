#start with cookiecutter template download
python3 -m cookiecutter https://github.com/sharathtirumalaraju/mlopsinabox
#choose project directory
read -p "enter your project name given above:" projectdirectory
cd $projectdirectory
cwd=$(pwd)
#initiliaze git and dvc
git init
dvc init
#commit the initialization
git commit -m "Initialize DVC and git"
read -p "enter your git repo uri:" gitrepo
#add a git remote 
git remote add origin $gitrepo
read -p "user-email:" email
read -p "user-name:" username
python3 -c "from configparser import ConfigParser; c=ConfigParser(); c.read('config.ini'); c.set('git_repo','git_uri','$gitrepo'); c.set('git_repo','git_user_email','$email'); c.set('git_repo','git_user_name','$username'); f=open('config.ini','w'); c.write(f)"
#add a dvc remote storage using the path of storage directory
dvc remote add -d localstorage $cwd/data/external
#add dvc config to git
git add .dvc/config
#this commit has info of the remote config with the git, which redirects it to the remote storage
git commit -m "remote config"
git push origin master
mv config.ini $cwd/src/models
mlflow server --backend-store-uri sqlite:///mlrun.db --default-artifact-root file:///mlrun.db

