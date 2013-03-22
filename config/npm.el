(add-lib-path "npm")
(require 'npm)

(global-set-key (kbd "M-n i") 'npm-install)
(global-set-key (kbd "M-n n") 'npm-new)
(global-set-key (kbd "M-n d") 'npm-new-dependency)
(global-set-key (kbd "M-n p") 'npm-publish)
(global-set-key (kbd "M-n v") 'npm-version)
