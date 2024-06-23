;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  PLACEHOLDER
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(use-package doom-themes
	:ensure t
	:config
	(setq doom-themes-enable-bold t) (setq doom-themes-enable-italic t)  ;; disable universally (`t' <--> `nil')
	(doom-themes-org-config)  ;; Corrects (and improves) org-mode's native fontification
)


(use-package gruber-darker-theme :ensure t)
(use-package leuven-theme        :ensure t)
(use-package modus-themes        :ensure t)
(use-package moe-theme           :ensure t)



(provide 'setup-colors)

