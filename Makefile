CHECK=\033[32m✔\033[39m
DONE="${CHECK} DONE."

all: install

install: init-submodules install-js2mode install-go-tools install-helm
	@mkdir libs/color-theme/themes
	@echo $(DONE)

install-js2mode:
	@echo "Installing js2-mode"
	@mkdir -p libs/js2-mode-compiled
	@cd libs/js2-mode && make && mv *.elc ../js2-mode-compiled/.
	@cp libs/js2-mode/js2-old-indent.el libs/js2-mode-compiled/.

install-magit:
	@echo "Installing magit"
	@cd libs/magit && make

install-helm:
	@cd libs/helm && make

install-go-tools:
	@go get code.google.com/p/rog-go/exp/cmd/godef
	@go get -u github.com/nsf/gocode

init-submodules:
	@echo "Initializing submodules"
	@git submodule init && git submodule update && git submodule status

override:
	ln -s ~/emacs/init.el ~/.emacs

new-submodule:
	@echo "Creating new submodule '${name}' from ${git}"
	@git submodule add --force ${git} libs/${name}
	@echo $(DONE)

update: update-repo init-submodules update-submodules

update-repo:
	git pull origin master
	@echo $(DONE)

update-submodules:
	@echo "Updating submodules"
	@git submodule foreach "(git checkout master; git pull)&"
	@echo $(DONE)

clean: clean-js2mode

clean-js2mode:
	@rm -rf libs/js2-mode-compiled

.PHONY: clean
