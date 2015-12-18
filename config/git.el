(add-lib-path "magit/lisp")
(add-lib-path "git-grep")
(require 'magit)
(require 'helm-git-grep)

(global-set-key (kbd "M-g s") 'magit-status)
(global-set-key (kbd "M-g l") 'magit-log)
(global-set-key (kbd "M-g f") 'magit-pull-current)
(global-set-key (kbd "M-g p") 'magit-push-quickly)
(global-set-key (kbd "M-g r") 'helm-git-grep)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
         (concat +emacs-lib-dir+ "/magit/Documentation")))
