;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - TODO ---> FIND FILE (DOTFILES FOLLOWED BY EVERYTHING ELSE IN ALPHABETICAL ORDER)
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



;; modeline
;; (use-package doom-modeline :ensure t :init (setq doom-modeline-height 30) (doom-modeline-mode 1))


;; rainbow delimiters:
;; 	color delimiters such as parentheses, brackets or braces according to their depth
;;		each successive level is highlighted in a different color for easy spot matching of delimiters
(use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))



(provide 'setup-etcetera)

