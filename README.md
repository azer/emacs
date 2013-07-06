## emacs.js [![Build Status](https://travis-ci.org/azer/emacs.js.png)](https://travis-ci.org/azer/emacs.js)

Ready-to-use Emacs setup for JavaScript coders.

Screencast: http://www.youtube.com/watch?v=4iSfLy8qfbM&feature=youtu.be

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
$ ln -s ~/emacs.js/init.el ~/.emacs
```

To check for updates;

```bash
$ make update
```

## It comes with

* [npm.el](http://github.com/azer/npm.el) for creating new NodeJS projects and very useful NPM bindings. [Screencast in Youtube](http://www.youtube.com/watch?v=ZmKHOaSpaJk) or [Screencast.gif](https://dl.dropbox.com/s/jnuo3m5w5x0q8vw/npmel.gif)

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

#### Arrow Buttons

**Left:** Undo

**Right:** Redo

**Up:** Jump to up

**Down:** Jump to down

#### NPM (Meta-n)

**M-n n:** Create a new NodeJS Project

**M-n d:** Install and save new dependency

**M-n i:** Run `npm install` on current directory

**M-n p:** Publish the library on NPM

**M-n t:** Run the test command

**M-n v:** Bump NPM version

#### Others

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
