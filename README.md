emacs.js is a ready-to-use Emacs setup for JavaScript coders.

### Installation

```bash
$ cd ~
$ git clone https://github.com/azer/emacs.js
$ make
# This will take a while.
$ ln -s emacs.js/init.el .emacs
$ cd emacs.js && make
```

### It comes with

* [auto-complete](https://github.com/auto-complete/auto-complete)
* [coffee-mode](https://github.com/defunkt/coffee-mode)
* [expand-region](https://github.com/magnars/expand-region.el)
* [jade-mode](https://github.com/brianc/jade-mode)
* [js-comint](http://js-comint-el.sourceforge.net/) (NodeJS)
* [js2-mode](https://github.com/mooz/js2-mode)
* [js2-refactor](https://github.com/magnars/js2-refactor.el)
* [markdown-mode](https://github.com/defunkt/markdown-mode)
* [smart-forward](https://github.com/magnars/smart-forward.el)
* [yasnippet](https://github.com/capitaomorte/yasnippet)
* [zencoding](https://github.com/rooney/zencoding.git)

and powerline, zsh, smex, undo-tree etc...

### Keybindings

* M-i **ido-goto-symbol**
* C-c C-m **Start Refactoring** ([More information](https://github.com/magnars/js2-refactor.el))
* m-g n **run-js**
* m-g m **js-send-region**
* m-s s **er/expand-region**
* C-j **zencoding-expand-yas**
* [up] **smart-up**
* [down] **smart-down**
* [left] **smart-backward**
* [right] **smart-forward**
* m-r **replace-regexp**
* m-g g **go to line**
* C-x \ **align=**
* m-c **run-last-command**
* m-g c **run-new-command**
* m-g s **magit-status**
* m-g l **magit-log**
* m-g f **magit-pull**
* m-g p **magit-push**
* m-z **zsh**

## Notes

* If you have `magit` installed on your system, enable related config from profiles/default.el
* If you have `emacs-w3m` installed on your system, enable related config from profiles/default.el
