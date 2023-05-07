all: install.nix install.home_manager

install.nix:
	@sh -s <install_nix

install.home_manager:
	@./install_home_manager
