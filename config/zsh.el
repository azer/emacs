(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sTerminal Title: ")
  (term "/bin/zsh")
    (rename-buffer buffer-name t))

(global-set-key (kbd "M-z") 'zsh)
