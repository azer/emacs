emacs.js is a ready-to-use Emacs setup for JavaScript coders.

### Installation

```bash
$ cd ~
$ git clone https://github.com/azer/emacs.js
$ cd emacs.js
$ make
```

Once you have emacs.js installed in your home directory, backup your existing configuration by the below command;

```bash
$ mkdir ~/emacsbak && mv ~/.emacs* ~/emacsbak/.
```

Now emacs.js can be your default configuration;

```
$ ln -s emacs.js/init.el .emacs
```

To check for updates;

```bash
$ make update
```

### It comes with

* [npm.el](http://github.com/azer/npm.el) for creating new NodeJS projects. [Screencast in Youtube](http://www.youtube.com/watch?v=ZmKHOaSpaJk) or [Screencast.gif](https://dl.dropbox.com/s/jnuo3m5w5x0q8vw/npmel.gif)

Indention, Syntax Check and Accurate Highlighting

* [js2-mode](https://github.com/mooz/js2-mode)
* [coffee-mode](https://github.com/defunkt/coffee-mode)

Snippets & Auto-completion

* [auto-complete](https://github.com/auto-complete/auto-complete)
* [yasnippet](https://github.com/capitaomorte/yasnippet)
* [zencoding](https://github.com/rooney/zencoding.git)

Refactoring:

* [js2-refactor](https://github.com/magnars/js2-refactor.el)

Interpreter:

* [js-comint](http://js-comint-el.sourceforge.net/) (NodeJS)

Code Navigation:

* [expand-region](https://github.com/magnars/expand-region.el)
* [smart-forward](https://github.com/magnars/smart-forward.el)

and powerline, jade-mode, zsh, smex, undo-tree, markdown-mode etc...

### Keybindings

```bash
* M-n       npm-new (Create a new NodeJS project)
* M-i       ido-goto-symbol
* C-c C-m   Start Refactoring. More info: https://github.com/magnars/js2-refactor.el
* m-g n     run-js
* m-g m     js-send-region
* m-s s     er/expand-region
* C-j       zencoding-expand-yas
* up        smart-up
* down      smart-down
* left      smart-backward
* right     smart-forward
* m-r       replace-regexp
* m-g g     go to line
* C-x \     align=
* m-c       run-last-command
* m-g c     run-new-command
* m-g s     magit-status
* m-g l     magit-log
* m-g f     magit-pull
* m-g p     magit-push
* m-z       zsh
```

## Notes

* If you have `magit` installed on your system, enable related config from profiles/default.el
* If you have `emacs-w3m` installed on your system, enable related config from profiles/default.el
