## Azer's Emacs Setup [![Build Status](https://travis-ci.org/azer/emacs.js.png)](https://travis-ci.org/azer/emacs.js)

Ready-to-use Emacs setup for JavaScript and Go programming.

### Install

```bash
$ cd ~
$ git clone https://github.com/azer/emacs
$ cd emacs
$ make
```

Backup your existing configuration:

```bash
$ mkdir ~/emacsbak && mv ~/.emacs* ~/emacsbak/.
```

And enable this emacs distro:

```
$ ln -s ~/emacs/init.el ~/.emacs
```

To check for updates;

```bash
$ make update
```

## What's included?

* [npm.el](http://github.com/azer/npm.el)
* [js2-mode](https://github.com/mooz/js2-mode)
* [go-mode](https://github.com/dominikh/go-mode.el)
* [gocode](https://github.com/nsf/gocode)
* [errcheck](https://github.com/kisielk/errcheck)
* [auto-complete](https://github.com/auto-complete/auto-complete)
* [yasnippet](https://github.com/capitaomorte/yasnippet)
* [zencoding](https://github.com/rooney/zencoding.git)
* [js2-refactor](https://github.com/magnars/js2-refactor.el)
* [js-comint](http://js-comint-el.sourceforge.net/)
* [expand-region](https://github.com/magnars/expand-region.el)
* [smart-forward](https://github.com/magnars/smart-forward.el)
* powerline
* jade-mode
* zsh
* smex
* undo-tree
* markdown-mode

## Usage

### Arrow Buttons

* **Left:** Undo
* **Right:** Redo
* **Up:** Jump to up
* **Down:** Jump to down

### NPM

* **M-n n:** Create a new NodeJS Project
* **M-n d:** Install and save new dependency
* **M-n e:** Install and save new development dependency
* **M-n s:** Search NPM
* **M-n i:** Run `npm install` on current directory
* **M-n p:** Publish the library on NPM
* **M-n t:** Run the test command
* **M-n v:** Make a new NPM version
* **M-n b:** Release new minor version

### Go

* **C-c C-d:** Describe the code
* **C-c C-j:** Jump to the definition of the code
* **C-c C-a:** Add new import
* **C-c C-r:** Remove unused imports
* **C-c i:** Go to imports
* **C-c m:** Run error check
* **C-M a:** Go to the beginning of the function
* **C-M e:** Go to the end of the function

### Others

```bash
* M-i       ido-goto-symbol
* C-c C-m   Start Refactoring. More info: https://github.com/magnars/js2-refactor.el
* m-g n     run-js
* m-g m     js-send-region
* m-s s     er/expand-region
* C-j       zencoding-expand-yas
* up        jump to up
* down      jump to down
* left      undo
* right     redo
* m-r       replace-regexp
* m-g g     go to line
* m-down    go to forward line
* m-up      go to previous line
* C-x \     align=
* m-c       run-last-command
* m-g c     run-new-command
* m-z       zsh
```

## Snippets

emacs.js comes with a wide variety of JavaScript snippets. If you're not familiar with yasnippet yet, open a JavaScript file
and type "new", then hit the control and space buttons.

It'll let you initialize a new NodeJS module with require and export code, based on this template; [https://github.com/azer/yasnippet/blob/master/snippets/js2-mode/mod.yasnippet](https://github.com/azer/yasnippet/blob/master/snippets/js2-mode/mod.yasnippet)

Try also `rq`, `exp`, `fn`, `invoc`, `it`, `desc` keywords. To browse/fork all the snippets, visit;

[https://github.com/azer/yasnippet/blob/master/snippets/js2-mode](https://github.com/azer/yasnippet/blob/master/snippets/js2-mode)

## Troubleshooting

* js2-mode not working? Recompile js2-mode: `make install-js2mode`

## Notes

* If you have `magit` installed on your system, enable related config from profiles/default.el
* If you have `emacs-w3m` installed on your system, enable related config from profiles/default.el
