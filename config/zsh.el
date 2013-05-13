(defun zsh ()
  "Start a terminal and rename buffer."
  (interactive)
  (term "/bin/zsh"))

(global-set-key (kbd "M-z") 'zsh)

(add-hook 'term-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)
                            (linum-mode 0)))
