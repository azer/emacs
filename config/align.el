(defun align= (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)[=|:]" 1 1))

(global-set-key (kbd "\C-x\\") 'align=)
