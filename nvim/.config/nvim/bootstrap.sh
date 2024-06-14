sudo apt update

sudo apt install git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen ripgrep

gh repo clone neovim/neovim

cd neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

cd ..

rm -rf neovim

sh asdf.sh
