(setq magit-package-list '(magit forge magit-topgit))
(dolist (package magit-package-list) 
  (unless (package-installed-p package) 
    (package-install package)))

(global-set-key (kbd "C-x g") 'magit-status)
(setq ediff-split-window-function 'split-window-horizontally) ;; Better for wide monitor
(setq ediff-merge-split-window-function 'split-window-vertically) ;; Better for wide monitor

(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t)) ;; auto-refresh

(with-eval-after-load 'magit 
  (require 'forge))
(provide 'init-magit)
