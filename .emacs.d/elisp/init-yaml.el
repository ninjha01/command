(setq yaml-package-list '(yaml-mode))
(dolist (package yaml-package-list) 
  (unless (package-installed-p package) 
    (package-install package)))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(put 'erase-buffer 'disabled nil)
(provide 'init-yaml)
