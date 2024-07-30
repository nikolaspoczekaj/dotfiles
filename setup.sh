sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install python3 python3-dev python3.10-venv libgtk-3-dev libgl1-mesa-dev libglu1-mesa-dev -y
sudo apt install npm -y
sudo npm install node -y
sudo apt install stow -y
sudo apt install xterm xclip -y
sudo apt install pavucontrol -y
sudo apt install keepassxc -y
sudo apt install pulseaudio -y


stow xterm
mkdir ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/repos/nerdfonts
~/repos/nerdfonts/install.sh FiraCode
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
stow nvim 
sudo apt install neovim -y
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
stow i3
sudo apt install i3 picom polybar -y
sudo cp ./i3/.config/i3/pulseaudio-control /bin/pulseaudio-control 
stow startup-scripts

#lazygit Installation
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

#go Installation
GO_VERSION="1.22.5"
GO_TARBALL="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TARBALL}"
INSTALL_DIR="/usr/local"
DOWNLOADS_DIR="$HOME/Downloads"
PROFILE_FILE="$HOME/.profile"
sudo apt remove -y golang-go
sudo apt purge -y golang-go
sudo rm -rf ${INSTALL_DIR}/go
mkdir -p ${DOWNLOADS_DIR}
wget -P ${DOWNLOADS_DIR} ${GO_URL}
sudo tar -C ${INSTALL_DIR} -xzf ${DOWNLOADS_DIR}/${GO_TARBALL}
rm ${DOWNLOADS_DIR}/${GO_TARBALL}
if ! grep -q "export PATH=\$PATH:${INSTALL_DIR}/go/bin" ${PROFILE_FILE}; then
    sudo echo "export PATH=\$PATH:${INSTALL_DIR}/go/bin" >> ${PROFILE_FILE}
fi
