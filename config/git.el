(add-lib-path "magit")
(require 'magit)

(global-set-key (kbd "M-g s") 'magit-status)
(global-set-key (kbd "M-g l") 'magit-log)
(global-set-key (kbd "M-g f") 'magit-pull)
(global-set-key (kbd "M-g p") 'magit-push)
