all: install

install: install-js2mode

install-js2mode:
	@echo "Installing js2-mode"
	@mkdir libs/js2-mode-compiled
	@cd libs/js2-mode && make && mv *.elc ../js2-mode-compiled/.

	@cd libs/auto-complete/dict; \
	ln -s javascript-mode js2-mode;

clean-js2mode:
	@rm -rf libs/js2-mode-compiled

clean: clean-js2mode

.PHONY: clean
