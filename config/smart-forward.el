(add-lib-path "smart-forward")
(require 'smart-forward)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])


;;(global-set-key [(meta up)] 'smart-up)
;;(global-set-key [(meta down)] 'smart-down)
