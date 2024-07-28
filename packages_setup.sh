sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install python3 python3-dev libgtk-3-dev libgl1-mesa-dev libglu1-mesa-dev -y
sudo apt install npm -y
sudo npm install node -y
sudo apt install golang-go -y
sudo apt install stow -y
sudo apt install pavucontrol -y
sudo apt install keepassxc -y
mkdir ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/repos/nerdfonts
~/repos/nerdfonts/install.sh FiraCode
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
stow nvim 
sudo apt install neovim 
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
stow i3
sudo apt install i3 picom polybar -y
cp ./i3/.config/i3/pulseaudio-control /bin/pulseaudio-control 
stow startup-scripts
