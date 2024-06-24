;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  PLACEHOLDER
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; a replacement for the older Flymake extension which is part of GNU emacs
;; a modern (on-the-fly) syntax checking extension
(use-package flycheck :ensure t :config (add-hook 'after-init-hook #'global-flycheck-mode))



(provide 'setup-checkers)

