(add-lib-path "yasnippet")
(require 'yasnippet)

;;(defconst +snippets-dir+ (concat +emacs-lib-dir+ "/yasnippet/snippets"))

;;(yas/load-directory +snippets-dir+)
;;(setq yas/snippet-dirs '(+snippets-dir+))


(setq yas-snippet-dirs '(+emacs-snippets-dir+))

(yas/global-mode 1)
(setq yas/trigger-key "M-SPC")
(global-set-key (kbd "M-SPC") 'yas/expand)

;;(define-key yas-minor-mode-map [(tab)]        nil)
;;(define-key yas-minor-mode-map (kbd "TAB")    nil)
;;(define-key yas-minor-mode-map (kbd "<tab>")  nil)
;;(define-key ac-completing-map "\t" nil)
;;(define-key yas-minor-mode-map (kbd "SPC")     'yas-next-field-or-maybe-expand)

(eval-after-load 'yasnippet
  '(progn
     (define-key yas-keymap (kbd "TAB") nil)
     (define-key yas-keymap (kbd "<tab>") nil)
     (define-key yas-keymap [(tab)] nil)
     (define-key yas-keymap [right] 'yas-next-field-or-maybe-expand)))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "TAB") (lambda()
                                            (interactive)
                                            (let ((yas/fallback-behavior 'return-nil))
                                              (unless (yas/expand)
                                                (indent-for-tab-command)
                                                (if (looking-back "^\s*")
                                                    (back-to-indentation))))))))
