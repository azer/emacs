(defconst +home-dir+ "~")
(defconst +emacs-dir+ (concat +home-dir+ "/emacs.js"))
(defconst +emacs-profiles-dir+ (concat +emacs-dir+ "/profiles"))
(defconst +emacs-lib-dir+ (concat +emacs-dir+ "/libs"))
(defconst +emacs-conf-dir+ (concat +emacs-dir+ "/config"))
(defconst +emacs-tmp-dir+ (concat +emacs-dir+ "/tmp"))

(defun add-load-path (p)
  (add-to-list 'load-path (concat +emacs-dir+ "/" p)))

(defun add-lib-path (p)
  (add-to-list 'load-path (concat +emacs-lib-dir+ "/" p)))

(defun load-conf-file (f)
  (load-file (concat +emacs-conf-dir+ "/" f ".el")))

(defun load-lib-file (f)
  (load-file (concat +emacs-lib-dir+ "/" f)))

(defun load-profile(p)
  (message (format "Loading profile: \"%s\"..." p))
  (load-file (concat +emacs-profiles-dir+ "/" p ".el")))

(add-load-path "")
(add-load-path "lib")

(load-profile "default")
(load-profile "js")
(load-profile "coffee")

;;(add-to-list 'command-switch-alist '("clojure" . (lambda (n) (load-profile "clojure"))))
;;(add-to-list 'command-switch-alist '("ruby" . (lambda (n) (load-profile "ruby"))))
;;(add-to-list 'command-switch-alist '("android" . (lambda (n) (load-profile "android"))))
