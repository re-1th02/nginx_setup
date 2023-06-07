read -e -p "Edit Port : " -i 5000 port
sed s/5000/${port}/g template > nginx.conf

sudo apt-get update
pkgs="make python3.9-venv nginx"
sudo apt-get install $pkgs
make nginx
python3.9 -m venv $HOME/env
echo 'alias require="python3 -m pip install -r requirements.txt";' $'\n' >> ~/.bashrc
source ~/.bashrc
source $HOME/env/bin/activate