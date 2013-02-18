(setq cmd "make")

(defun run-last-command ()
  "Run given command on working directory"
  (interactive)
  (message (concat "Running " cmd))
  (compile cmd))

(defun run-new-command ()
  "Set the command to run"
  (interactive)
  (setq cmd (read-from-minibuffer "Set the command to run: " cmd))
  (run-last-command))

(global-set-key (kbd "M-g c") 'run-new-command)
(global-set-key (kbd "M-c") 'run-last-command)
