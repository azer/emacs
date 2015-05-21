(add-lib-path "grizzl")
(require 'grizzl)

(add-lib-path "fiplr")
(require 'fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(setq fiplr-ignored-globs
      '((directories
         ;; Version control
         (".git"
          ".svn"
          ".hg"
          ".bzr"
          ;; NPM
          "node_modules"
          ;; Bower
          "bower_components"
          ;; Maven
          "target"
          ;; Python
          "__pycache__"
          ;; others
          "tmp"
          "vendor"
          ))
        (files
         ;; Emacs
         (".#*"
          ;; Vim
          "*~"
          ;; Objects
          "*.so"
          "*.o"
          "*.obj"
          ;; Media
          "*.jpg"
          "*.png"
          "*.gif"
          "*.pdf"
          ;; Archives
          "*.gz"
          "*.zip"))))
