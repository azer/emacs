(add-lib-path "golang")
(add-lib-path "go-errcheck")
(add-lib-path "gocode/emacs")

(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-errcheck)

(add-hook
 'go-mode-hook (lambda () (setq indent-tabs-mode t)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c m") 'go-errcheck)))
