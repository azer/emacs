(add-lib-path "relative-line-numbers")
(require 'relative-linum)

(global-linum-mode)

(defun linum-forward (n)
  (interactive "n Jump to forward line: ")
  (forward-line n))

(defun linum-previous (n)
  (interactive "n Jump to previous line: ")
  (previous-line n))

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(global-set-key [(meta up)] 'linum-previous)
(global-set-key [(meta down)] 'linum-forward)
