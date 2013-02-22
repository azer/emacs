;;; rainbow-parens.el --- Argh!  My eyes!

;; Copyright (C) 2009  Mark Triggs

;; Author: Mark Triggs <mst@dishevelled.net> with thanks to help
;;         from Alex Osborne <ato@meshy.org>
;; Keywords: pain, horror

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; The horror!  M-x rainbow-paren-mode to start it.


;;; Code:

;; Too lazy to define my own functions for figuring out whether I'm in a string
;; or comment...
(require 'paredit)
(require 'cl)


(defun rainbow-paren-face-from-colour (colour)
  (let ((face (make-face (intern (concat "rainbow-paren-" colour "-face")))))
    (set-face-foreground face colour)
    face))


(defvar *rainbow-paren-faces*
  `[,(rainbow-paren-face-from-colour "dark red")
    ,(rainbow-paren-face-from-colour "dark green")
    ,(rainbow-paren-face-from-colour "deep pink")
    ,(rainbow-paren-face-from-colour "yellow")
    ,(rainbow-paren-face-from-colour "green")
    ,(rainbow-paren-face-from-colour "light blue")
    ,(rainbow-paren-face-from-colour "orange")
    ,(rainbow-paren-face-from-colour "slate blue")
    ,(rainbow-paren-face-from-colour "light gray")
    ,(rainbow-paren-face-from-colour "gold")
    ,(rainbow-paren-face-from-colour "turquoise")])


(defun rainbow-paren-this-paren-nesting ()
  (let ((point (point))
        (depth 0))
    (while (ignore-errors
             (setq point (scan-lists point -1 1)))
      (when (= (char-after point) 40)
        (setq depth (1+ depth))))
    depth))


(defun rainbow-paren-face-for-depth (n)
  (aref *rainbow-paren-faces*
        (mod n (length *rainbow-paren-faces*))))


(defun rainbow-paren-apply (point face)
  (let* ((os (overlays-at point))
         (o (or (some (lambda (o)
                        (and (eq (overlay-get o 'type) 'rainbow-paren)
                             o))
                      os)
                (make-overlay point (1+ point) nil t nil))))
    (overlay-put o 'type 'rainbow-paren)
    (overlay-put o 'face face)
    (overlay-put o 'evaporate t)))



(defun rainbow-paren-boring-paren-p ()
  (or (paredit-in-string-p)
      (paredit-in-comment-p)))


(defun rainbow-paren-skip-boring (bound)
  (while (and (< (point) bound)
              (rainbow-paren-boring-paren-p))
    (forward-char 1)))


(defun rainbow-paren-fontify (beg end)
  (save-excursion
    (goto-char beg)
    (rainbow-paren-skip-boring end)
    (let* ((depth (rainbow-paren-this-paren-nesting)))
      (while (< (point) end)
        (rainbow-paren-skip-boring end)
        (cond ((= (char-after (point)) 40)
               (rainbow-paren-apply (point)
                                    (rainbow-paren-face-for-depth depth))
               (setq depth (1+ depth)))
              ((= (char-after (point)) 41)
               (setq depth (1- depth))
               (rainbow-paren-apply (point)
                                    (rainbow-paren-face-for-depth depth))))
        (forward-char 1)))))


(defun rainbow-paren-unfontify (beg end)
  (mapc #'(lambda (o)
            (when (eq (overlay-get o 'type) 'rainbow-paren)
              (delete-overlay o)))
        (overlays-in beg end)))


(define-minor-mode rainbow-paren-mode
  "Angry fruit salad parens"
  nil " R" nil
  (cond ((not rainbow-paren-mode)
         (jit-lock-unregister 'rainbow-paren-fontify)
         (rainbow-paren-unfontify (point-min) (point-max)))
        (t (jit-lock-register 'rainbow-paren-fontify))))



(provide 'rainbow-parens)
;;; rainbow-parens.el ends here
