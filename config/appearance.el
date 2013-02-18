(add-lib-path "dircolors")
(require 'dircolors)

(add-lib-path "smooth-scrolling")
(require 'smooth-scrolling)

(if window-system
    ((tool-bar-mode -1)
     (menu-bar-mode -1)
     (scroll-bar-mode -1)))

;;highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#111")

;;set cursor colour
(set-cursor-color "yellow")
