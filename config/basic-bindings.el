(global-set-key (kbd "M-r") 'replace-regexp)
(global-set-key (kbd "M-g u") 'undo)
(global-set-key (kbd "M-g r") 'redo)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [left] 'undo)
(global-set-key [right] 'redo)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'scroll-down-command)
(global-set-key [(meta down)] 'scroll-up-command)


;;(global-set-key [up] nil)
;;(global-set-key [down] nil)
;;(global-set-key [left] nil)
;;(global-set-key [right] nil)
