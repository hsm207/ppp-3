add-plutus-apps-repo:
	if [ ! -d "plutus-apps" ]; then \
		git submodule add https://github.com/input-output-hk/plutus-apps.git; \
	fi

add-ppp-repo: add-plutus-apps-repo
	if [ ! -d "plutus-pioneer-program" ]; then \
		git submodule add https://github.com/input-output-hk/plutus-pioneer-program.git; \
	fi

update-bashrc:
	cat utils.sh >> $$HOME/.bashrc

run-post-create-command: add-ppp-repo update-bashrc
	sudo chown -R `whoami` $$HOME/.cabal && \
	cabal update && \
	sudo chown -R `whoami` /nix/store && \
	git submodule foreach git pull origin main