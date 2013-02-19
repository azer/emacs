CHECK=\033[32m✔\033[39m
DONE="${CHECK} DONE."

all: install

install: init-submodules install-js2mode
	@mkdir libs/color-theme/themes
	@echo $(DONE)

install-js2mode:
	@echo "Installing js2-mode"
	@mkdir libs/js2-mode-compiled
	@cd libs/js2-mode && make && mv *.elc ../js2-mode-compiled/.

init-submodules:
	@echo "Initializing submodules"
	@git submodule init && git submodule update && git submodule status

new-submodule:
	@echo "Creating new submodule '${name}' from ${git}"
	@git submodule add ${git} libs/${name}
	@echo $(DONE)

update-supmodules:
	@echo "Updating submodules"
	@git submodule foreach "(git checkout master; git pull)&"
	@echo $(DONE)

clean: clean-js2mode

clean-js2mode:
	@rm -rf libs/js2-mode-compiled

.PHONY: clean
