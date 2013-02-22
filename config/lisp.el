(add-lib-path "rainbow")

(require 'rainbow-parens)
(require 'rainbow-delimiters)

(show-paren-mode 1)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(defun turn-on-paredit ()
  (paredit-mode t))

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) 'turn-on-paredit)
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-paren-mode))
