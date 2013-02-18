(add-lib-path "coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-to-list 'ac-modes 'coffee-mode)

(add-hook 'coffee-mode-hook
          (lambda ()
            (setq imenu-generic-expression coffee-imenu-generic-expression)))
