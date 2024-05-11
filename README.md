# rails-nix-flake-direnv

How to create new rails app in nix env.

- Clone the repo
- make sure nix is installed
- to enable nix flakes, run:

```shell
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

- install direnv:

```shell
nix profile install nixpkgs#direnv
```

- then run:

```shell
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

```shell
# fish
source ~/.config/fish/config.fish

# or bash
source ~/.bashrc

# or zsh
source ~/.zshrc
```

- initiate bundler to create Gemfile:

```shell
bundler init
```

- uncomment `gem "rails"` in **Gemfile** and run:

```shell
bundler
```

- this will create the gems in .gems

- generate new rails app:

```shell
./.gems/bin/rails new . --api --minimal
```

- run server

```shell
./bin/rails s
```
