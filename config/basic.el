(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq confirm-kill-emacs nil)

(setq temporary-file-directory "/tmp/emacs.js")
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq create-lockfiles nil)

(setq-default truncate-lines nil)

(setq visible-bell t
      column-number-mode t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      delete-by-moving-to-trash nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(auto-compression-mode t)

(random t) ;; Seed the random-number generator

(setq diff-switches "-u")

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

(setq confirm-nonexistent-file-or-buffer nil)

;;remove all trailing whitespace and trailing blank lines before saving the file
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-blank-lines)
(setq-default show-trailing-whitespace t)

;; set uniquify separator
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
   uniquify-separator ":")

(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))
