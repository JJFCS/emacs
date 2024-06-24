;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - PLACEHOLDER
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(use-package undo-tree
	:ensure t
	:config
	(global-undo-tree-mode 1)
	(setq undo-tree-history-directory-alist '(
							("." . "~/.cache/emacs-undo")
						 )
	)
)


;; color delimiters such as parentheses, brackets or braces according to their depth
;; each successive level is highlighted in a different color for easy spot matching of delimiters
(use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))



(provide 'setup-miscellaneous)

