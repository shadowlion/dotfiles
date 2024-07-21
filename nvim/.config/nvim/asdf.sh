cd

sudo apt update

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

echo ". \"$HOME/.asdf/asdf.sh\"" >> .bashrc
echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> .bashrc

. ~/.bashrc

# python-specific
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

for LANG in nodejs golang python rust starship
do
  asdf plugin add $LANG 
  asdf install $LANG latest
  asdf global $LANG latest
done

# go-specific
echo "export GOPATH=$(asdf where golang)/packages" >> .bashrc
echo "export GOROOT=$(asdf where golang)/go" >> .bashrc
echo "export PATH=\"${PATH}:$(go env GOPATH)/bin\"" >> .bashrc

# starship
echo "eval \"$(starship init bash)\"" >> .bashrc
