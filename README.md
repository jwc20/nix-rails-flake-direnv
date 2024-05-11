# rails-nix-flake-direnv

How to create new rails app in nix env.

- Clone the repo
- make sure nix is installed
- enable nix flakes:

```
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

- install direnv:

```shell
nix profile install nixpkgs#direnv

# fish
echo 'eval (direnv hook fish)' >> ~/.config/fish/config.fish

# or bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

# or zsh
echo 'eval "$(direnv hook zsh)"' >> "$HOME/.zshrc"
```

- cd into repo and run:

```shell
direnv allow
```

- restart or refresh shell (terminal):

```
# fish
source ~/.config/fish/config.fish

# bash
source ~/.bashrc

# zsh
source ~/.zshrc
```

- generate new rails app:

```shell
./.gems/bin/rails new . --api --minimal
```
