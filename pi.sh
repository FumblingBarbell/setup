sudo apt install -y zsh neovim curl build-essential git
chsh -s /bin/zsh
mkdir ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ":imap jk <Esc>" > ~/.config/nvim/init.vim

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=~/.cargo/bin:$PATH
echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.zshrc

# install the stable and nightly toolchains
rustup toolchain install stable
rustup toolchain install nightly
rustup default stable
rustup component add rust-src

# Install Rust Language Server
rustup component add rls --toolchain nightly

# Install Racer
cargo +nightly install racer
export RUST_SRC_PATH=$home/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
echo 'export RUST_SRC_PATH=$home/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src' >> ~/.zshrc

mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale

cp init.vim ~/.config/nvim/init.vim
cp zshrc ~/.zshrc

