(setq java-package-list '(meghanada))
(dolist (package java-package-list) 
  (unless (package-installed-p package) 
    (package-install package)))

(require 'meghanada)
(add-hook 'java-mode-hook 
	  (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t) 
	    (flycheck-mode +1) 
	    (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify)))
(cond ((eq system-type 'windows-nt) 
       (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME"))) 
       (setq meghanada-maven-path "mvn.cmd")) 
      (t 
       (setq meghanada-java-path "java") 
       (setq meghanada-maven-path "mvn")))

(provide 'init-java)
