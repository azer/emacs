;;(global-set-key (kbd "RET") 'newline-and-indent)

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

(global-set-key (kbd "C-c r") 'rename-this-buffer-and-file)

;;(global-set-key [up] nil)
;;(global-set-key [down] nil)
;;(global-set-key [left] nil)
;;(global-set-key [right] nil)

(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))
