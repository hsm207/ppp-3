SHELL := /bin/bash

add-plutus-apps-repo:
	if [ ! -d "plutus-apps" ]; then \
		git submodule add https://github.com/input-output-hk/plutus-apps.git; \
	fi

add-ppp-repo: add-plutus-apps-repo
	if [ ! -d "plutus-pioneer-program" ]; then \
		git submodule add https://github.com/input-output-hk/plutus-pioneer-program.git; \
	fi

install-nix:
	if [ ! -d "/nix" ]; then \
		bash <(curl -L https://nixos.org/nix/install) --no-daemon; \
	fi

update-bashrc: install-nix
	cat utils.sh >> $$HOME/.bashrc

run-post-create-command: add-ppp-repo update-bashrc
	sudo chown -R `whoami` $$HOME/.cabal && \
	cabal update && \
	# sudo chown -R `whoami` /nix && \
	git submodule update --init --recursive
	git submodule foreach git pull origin main
	