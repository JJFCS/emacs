
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - PLACEHOLDER
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package helm
	:ensure t


	:init
	(helm-mode 1)


	:bind (
	("M-x"     . helm-M-x)
	("M-s l"   . helm-occur)
	("C-x C-f" . helm-find-files)
	)


	:config
	(setq helm-buffers-fuzzy-matching           t)  ;; enables fuzzy matching for buffer names in Helm
	(setq helm-completion-in-region-fuzzy-match t)  ;; enables fuzzy matching for completions in the region
	(setq helm-imenu-fuzzy-match                t)  ;; enables fuzzy matching for `helm-imenu'
	(setq helm-locate-fuzzy-match               t)  ;; enables fuzzy matching for `helm-locate'
	(setq helm-semantic-fuzzy-match             t)  ;; enables fuzzy matching for `helm-semantic'
	(setq helm-M-x-fuzzy-match                  t)  ;; enables fuzzy matching for `helm-M-x'
	(setq helm-move-to-line-cycle-in-source     t)  ;; cycling candidates in Helm BUFFER
	(setq helm-scroll-amount 8)                     ;; amount Helm scrolls BUFFER


)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-helm)

