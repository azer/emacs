all: install

install: install-js2mode

install-js2mode:
	@echo "Installing js2-mode"
	@mkdir libs/js2-mode-compiled
	@cd libs/js2-mode && make && mv *.elc ../js2-mode-compiled/.

	@cd libs/auto-complete/dict; \
	ln -s javascript-mode js2-mode;

new-submodule:
	@git submodule add ${git} libs/${name}

update-supmodules:
	git submodule foreach "(git checkout master; git pull)&"

clean: clean-js2mode

clean-js2mode:
	@rm -rf libs/js2-mode-compiled

.PHONY: clean
