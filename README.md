# nix-home

My [nix](https://nixos.org) [home-manager](https://github.com/nix-community/home-manager) configuration. The new Dotfiles!

## Install

```sh
sh <(curl -L https://raw.githubusercontent.com/rupurt/nix-home/main/install_nix)
```

Open a separate shell to activate `nix` after the initial install

```sh
sh -s <(curl -L https://raw.githubusercontent.com/rupurt/nix-home/main/install_home_manager) -- --device kawasaki
```

This config uses [zsh](https://www.zsh.org) as the default login shell. Linux hosts will need to
manually add the path to the installed nix version of `zsh` and switch the default login shell

```sh
sudo sh -c 'echo $1 >> /etc/shells' -- $(which zsh)
chsh $(which zsh)
```

Mac OS X >= Catalina (10.15) uses `zsh` by default

## Contributing

Clone this repository locally

```sh
git clone https://github.com/rupurt/nix-home.git
```

Run the default `make` target to execute the [`install_nix`](./install_nix) & [`install_home_manager`](./install_home_manager) scripts

```sh
make
```

## License

`nix-home` is released under the [MIT license](./LICENSE.md)
