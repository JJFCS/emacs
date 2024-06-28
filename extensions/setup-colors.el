
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ENABLE OR DISABLE BOLD & ITALICS UNIVERSALLY (`t' <--> `nil')
;; ENABLE ON ERROR MODE-LINE FLASHING
;; ENRICH ORG-MODE'S NATIVE FONTIFICATION
(use-package doom-themes :ensure t
	:config
	(setq doom-themes-enable-bold t) (setq doom-themes-enable-italic t)
	(doom-themes-visual-bell-config) (doom-themes-org-config)
)


(use-package leuven-theme        :ensure t)
(use-package modus-themes        :ensure t)
(use-package moe-theme           :ensure t)
(use-package ef-themes           :ensure t)
(use-package gruber-darker-theme :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-colors)

