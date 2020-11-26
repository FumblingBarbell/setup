# assumes Apple Dev Tools have been installed so we have git
#         neovim is installed

# Set up the shell
cp zshrc ~/.zshrc

# Set up neovim
# Install package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/

nvim +PlugInstall
