# nix-home

My [nix](https://nixos.org) [home-manager](https://github.com/nix-community/home-manager) configuration. The new Dotfiles!

## Install

```sh
sh <(curl -L https://raw.githubusercontent.com/rupurt/nix-home/main/install_nix)
```

Open a separate shell to activate `nix` after the initial install

```sh
sh <(curl -L https://raw.githubusercontent.com/rupurt/nix-home/main/install_home_manager)
```

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
