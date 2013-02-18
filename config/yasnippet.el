(add-lib-path "yasnippet")
(require 'yasnippet)

;;(defconst +snippets-dir+ (concat +emacs-lib-dir+ "/yasnippet/snippets"))

;;(yas/load-directory +snippets-dir+)
;;(setq yas/snippet-dirs '(+snippets-dir+))

(yas/global-mode 1)
(setq yas/trigger-key "M-SPC")
(global-set-key (kbd "M-SPC") 'yas/expand)

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "TAB") (lambda()
                                            (interactive)
                                            (let ((yas/fallback-behavior 'return-nil))
                                              (unless (yas/expand)
                                                (indent-for-tab-command)
                                                (if (looking-back "^\s*")
                                                    (back-to-indentation))))))))
