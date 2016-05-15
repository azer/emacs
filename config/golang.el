(add-lib-path "go-mode")
(add-lib-path "go-errcheck")
(add-lib-path "gocode/emacs")

(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-errcheck)

(add-hook 'before-save-hook 'gofmt-before-save)
;;(add-hook 'before-save-hook 'go-remove-unused-imports)

(add-hook
 'go-mode-hook (lambda () (setq indent-tabs-mode t)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c m") 'go-errcheck)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c d") 'godoc-at-point)))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)

(defun set-go-path ()
  "Set GOPATH and GOBIN"
  (interactive)
  (let (gopath)
    (setq gopath (read-from-minibuffer "GOPATH: " (file-name-directory (or load-file-name buffer-file-name))))
    (message (concat "Setting GOPATH to " gopath))
    (setenv "GOPATH" gopath)
    (setenv "GOBIN" (concat gopath "/bin"))
    )
  )

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c p") 'set-go-path)))
