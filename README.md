
# Setup on Fresh Ubuntu install

```sh
sudo apt install curl git
curl -L https://nixos.org/nix/install | sh -s -- --daemon
# follow prompts
git clone <this-repo> ~/nix
# edit files, replace my username with yours
cd ~
mkdir -p ~/.local/state/nix/profiles
nix --extra-experimental-features "nix-command flakes" run nixpkgs#home-manager -- --extra-experimental-features "nix-command flakes" switch --flake nix/#$USER
# should setup experimental features in config and install home-manager
home-manager switch --flake nix/#${USER}
sudo cp nix/xsession.desktop /usr/share/xsessions/xsession.desktop
```
