(add-lib-path "js-comint")

(require 'js-comint)

(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                                                 (replace-regexp-in-string ".*1G.*3G" " > " output))))))

(global-set-key (kbd "M-g n") 'run-js)
(global-set-key (kbd "M-g m") 'js-send-region)
