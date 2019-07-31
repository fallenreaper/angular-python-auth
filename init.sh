#!/bin/bash
if [-z $1]:
    echo "Be in the applcation Directory for sake of setting up the PipFile"
    exit 1
fi
brew update && brew install pyenv
echo "You may need an update from XCode as it references zlib from xcode sdk."
echo ""
echo "If pyenv install fails on mac, it will likely be due to ar and ranlib existing in your local.  You can move them and it should install"
echo ""
echo "sudo mv /opt/local/bin/ar /opt/local/bin/ar-backup-TODAY"
echo "sudo mv /opt/local/bin/ranlib /opt/local/bin/ranlib-backup-TODAY"
echo ""
read -p "Press [Enter] key to continue..."

pyenv install 3.7.0
pyenv global 3.7.0
export PATH="$(pyenv root)/shims:$PATH"
echo "Pip is set on test machine to 3.x"
pip3 --version
pip3 install --user pipenv
echo "Updating Path variable to access pipenv"
echo 'export PATH="$(python3 -m site --user-base)/bin:$PATH"' >> ~/.bash_profile
echo "Adding pipenv to current Terminal"
export PATH="$(python3 -m site --user-base)/bin:$PATH"

pipenv --three --python=$(pyenv root)/shims/python
echo "DBMS..."
pipenv install pymongo==3.7.2
echo "JWT.."
pipenv install pyjwt==1.7.1
echo "Webserver..."
pipenv install flask==1.0.2
echo "CORS..."
pipenv install flask_cors==3.0.7

echo "Running Sample Flask App.  If it runs, visit: localhost:4433/kudos"
FLASK_APP=$PWD/app/http/api/endpoints.py FLASK_ENV=development pipenv run python -m flask run --port 4433
