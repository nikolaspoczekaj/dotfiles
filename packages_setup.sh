sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install python3 python3-dev libgtk-3-dev libgl1-mesa-dev libglu1-mesa-dev -y
sudo apt install npm -y
sudo npm install node -y
sudo apt install golang-go -y
sudo apt install stow -y
sudo apt install pavucontrol -y
mkdir ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/repos/nerdfonts
~/repos/nerdfonts/install.sh FiraCode

