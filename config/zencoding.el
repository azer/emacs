(add-lib-path "zencoding")

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

(global-set-key (kbd "\C-j") 'zencoding-expand-yas)
