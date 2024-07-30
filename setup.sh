#packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install python3 python3-dev python3.10-venv libgtk-3-dev libgl1-mesa-dev libglu1-mesa-dev -y
sudo apt install stow -y
sudo apt install xterm xclip -y
sudo apt install pavucontrol -y
sudo apt install keepassxc -y
sudo apt install pulseaudio -y
sudo apt install tmux -y
sudo apt install gio -y
sudo apt install feh -y

#node + npm Installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 22

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

#lazygit Installation
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
sudo rm -r lazygit.tar.gz
sudo rm -r lazygit

#nerdfonts
mkdir ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/repos/nerdfonts
~/repos/nerdfonts/install.sh Hack


#stow dotfiles
stow tmux
stow bin
stow xterm
stow themes

#neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
stow nvim 
sudo apt install neovim -y
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#i3
stow i3
sudo apt install i3 picom polybar -y
sudo cp ./i3/.config/i3/pulseaudio-control /bin/pulseaudio-control 

#autostart und .bashrc
if ! grep -q mp_hidive_mount "${PROFILE_FILE}";  then
	echo ". ~/.local/scripts/mp_hidrive_mount" >> ${PROFILE_FILE}
fi

if ! grep -q ssh-agent ~/.bashrc;  then
	echo 'eval "$(ssh-agent -s)"' >> "~/.bashrc"
#	echo 'ssh-add ~/.ssh/id_ed25519' >> "${PROFILE_FILE}"
#	echo 'ssh-add ~/.ssh/devops_mtn' >> "${PROFILE_FILE}"
	echo 'clear' >> "~/.bashrc"
fi


