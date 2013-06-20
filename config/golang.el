(add-lib-path "golang")
(require 'go-mode)

(add-hook
 'go-mode-hook (lambda () (setq indent-tabs-mode t)))
