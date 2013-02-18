;;; dircolors.el -- provide the same facility of ls --color inside emacs

;; Copyright (C) 2000  Padioleau yoann <padiolea@irisa.fr>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; Emacs Lisp Archive Entry                                                                                               
;; Filename: dircolors.el                                                                                                  
;; Author: Padioleau Yoann <padiolea@irisa.fr>
;; Version: 1.0                                                                                                           
 
;;; Goal
; try to colorize the buffers of emacs as ls --color do in a terminal
;  so if you try C-x b TAB or C-x C-f, you will see directory in blue
;  c source file in yellow, object file in gray, ....
;  it helps a lot to find the file you want to open

;;; Usage
; Add the following lines to ~/.emacs or an equivalent
;         (require 'dircolors)
; you can customize this module by : 
;   - changing the colors of some faces for example with 
;          (set-face-foreground 'dircolors-face-asm "blue")
;   - adding some faces/extension for example with 
;          (make-face 'myface-modula) 
;          (set-face-foreground 'myface-modula "yellow")
;          (setq dircolors-extension (cons '(("mod" "md3") myface-modula) dircolors-extension)
;   - make dircolors working for other emacs buffer
;          (add-hook 'completion-list-mode-hook 'dircolors)



;;; Code

;; generic functions not included in emacs
(defun join-string(xs &optional sep)
  (cond ((null xs) "")
	((null (cdr xs)) (car xs))
	(t (concat (car xs) (or sep " ") (join-string (cdr xs) sep)))))

(defun map-apply(func xs)
  (mapcar #'(lambda (l)(apply func l)) xs))

(defmacro lam(args &rest body) `(lambda  ,args ,@body))

;; here start the real code
(map-apply (lam (face color)
		(make-face face) (set-face-foreground face color))
	   '(
	     (dircolors-face-dir            "SkyBlue"        )
	     (dircolors-face-doc            "MediumTurquoise")
	     (dircolors-face-html           "Plum"           )
	     (dircolors-face-package        "IndianRed"      )
	     (dircolors-face-tar            "OrangeRed"      )
	     (dircolors-face-dos            "LimeGreen"      )
	     (dircolors-face-sound          "LightBlue"      )
	     (dircolors-face-img            "Salmon"         )
	     (dircolors-face-ps             "BlueViolet"     )
	     (dircolors-face-backup         "Magenta"        )
	     (dircolors-face-make           "Khaki"          )
	     (dircolors-face-paddb          "Orange"         )
	     (dircolors-face-lang           "Yellow"         )
	     (dircolors-face-emacs          "GreenYellow"    )
	     (dircolors-face-lang-interface "Goldenrod"      )
	     (dircolors-face-yacc           "Coral"          )
	     (dircolors-face-objet          "DimGray"        )
	     (dircolors-face-asm            "Tan"            )
	     (dircolors-face-compress       "Sienna"         )
	     ))

(defvar dircolors-extension
       '((("txt" "doc" "tex" "texi" "man" 
	   (r "README") (r "readme")
	   )                                dircolors-face-doc)
	 (("htm" "html" "html\\.gz" "htm\\.gz")
	                                    dircolors-face-html)
	 (("rpm" "deb" )                    dircolors-face-package)
	 (("tar" "tgz" "tar.gz" "tar.bz2" "zip" )           dircolors-face-tar)
	 (("cmd" "exe" "com" "bat")         dircolors-face-dos)
	 (("mp3" "s3m" "mod" "au" "wav")    dircolors-face-sound)
	 (("jpg" "gif" "bmp" "xbm" "tif"
	   "xpm" "jpeg"
	   )                                dircolors-face-img)
	 (("ps" "pdf" "ps\\.gz" )           dircolors-face-ps)
	 (("bak" "BAK" (r "\\.save"))       dircolors-face-backup)
	 (((r "akefile"))                   dircolors-face-make)
	 (("db")                            dircolors-face-paddb)
	 (("ml" 
	   "hs" "lhs" 
	   "scm" "sc" 
	   "p" "pas"
	   "c" "cpp" "c\\+\\+" "cc"
	   "pm" "pl" "m"
	   "bet"
	   )                                dircolors-face-lang)
	 ((	   "el" "emacs")            dircolors-face-emacs)
	 (("mli" 
	   "h" "hpp" "hh"
	   )                               dircolors-face-lang-interface)
	 (("ly" "mly" "mll" 
	   "l" "y" 
	   "l\\+\\+" "y\\+\\+" 
	   "ll" "yy")                       dircolors-face-yacc)
	 (("class" "o" )                    dircolors-face-objet)
	 (("asm" "s" "S" )                  dircolors-face-asm)
					; last because can conflict
	 (("gz" )                       dircolors-face-compress)
	 )
 "the syntax is (extension_list face), where extension can be either of the
   simple form string in which case it is interpreted as an extension
   for example \"txt\" will colorise all string that ends with .txt
   or can be of the form (r regexp)"
 )



(setq dircolors-font-lock-keywords
      (append
	'(
	  ("\\w*/" . 'dircolors-face-dir); why this ` and 'tricks ??  
	  )
	(map-apply 
	 (lam (lext face) 
	      (cons (join-string 
		     (mapcar 
		      (lam (e) (if (stringp e) 
;				   (concat "\\w\\(\\w\\|[_-]\\)*+\\." e "\\>")
				   (concat "\\w*\\." e "\\>")
				 (concat "\\w*" (cadr e) "\\w*\\>") ;regexp '(r "reg")
				 )) lext)
		     "\\|"
		     ) (list 'quote face))) dircolors-extension)))

(defun dircolors()
  (interactive)
  (make-local-variable 'font-lock-defaults)
  (make-local-variable 'lazy-lock-minimum-size)
  ; quite fast with this
  (setq lazy-lock-minimum-size 10) ;dont know why, but put this in global and all is slow
  (setq font-lock-defaults
	'(dircolors-font-lock-keywords
	  t ; KEYWORDS-ONLY, dont want fontification of comment/strings ?
	  nil ; CASE-FOLD
					; SYNTAX-ALIST, say that _ is a word constituent
	  ((?_ . "w") (?- . "w") (?+ . "w") (?. . "w"))  
	  ))
  (font-lock-mode 1))

; if no font-lock-mode : but pb with read-only buffer, and with speed (lazy-mode is fast)
;  (mapcar (lambda (x) 
;	     (goto-char (point-min))
;	     (while (re-search-forward (car x) (point-max) t)
;		 (progn 
;		   (remove-text-properties (match-beginning 0) (match-end 0)  '(face nil))
;		   (add-text-properties (match-beginning 0) (match-end 0) 
;					(list 'face (car (cdr x)))) 
;		   )
;	       )
;	     )
;	   dircolors-font-lock-keywords)
;  )


(add-hook 'completion-list-mode-hook 'dircolors)
(add-hook 'buffer-menu-mode-hook     'dircolors)

(provide 'dircolors)