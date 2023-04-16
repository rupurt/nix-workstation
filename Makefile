all: install.nix install.home_manager

install.nix:
	@sh -s <install_nix

install.home_manager:
	@./install_default_home_manager

install.home_manager.mechanical-orchard-m2-macbook:
	@sh -s <install_home_manager -- --device mechanical-orchard-m2-macbook

install.home_manager.kawasaki:
	@sh -s <install_home_manager -- --device kawasaki
