(setq erc-truncate-buffer-on-save t)
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook
          'erc-truncate-buffer)

(setq erc-max-buffer-size 20000)
;;(erc-hide-timestamps)

(setq erc-hide-list '("JOIN" "NICK" "PART" "QUIT"))

(add-hook 'erc-mode-hook (lambda ()
                           (setq show-trailing-whitespace nil)
                           (linum-mode 0)))
