(add-lib-path "relative-line-numbers")
(require 'relative-linum)

(global-linum-mode)

(defun linum-forward (n)
  (interactive "n Jump to forward line: ")
  (forward-line n))

(defun linum-previous (n)
  (interactive "n Jump to previous line: ")
  (previous-line n))

(global-set-key (kbd "M-g f") 'linum-forward)
(global-set-key (kbd "M-g p") 'linum-previous)
