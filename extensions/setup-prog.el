
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - TREESITTER (only python working :/)
;;  	- RUN THE FOLLOWING CMD TO INSTALL THE APPROPRIATE TREESITTER LANGUAGE PARSER
;;		# M-x treesit-install-language-grammar
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flycheck :ensure t :config (add-hook 'after-init-hook #'global-flycheck-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-indent-guides :ensure t :defer t
	:config
	(setq highlight-indent-guides-method 'bitmap)
	(setq highlight-indent-guides-bitmap-function #'highlight-indent-guides--bitmap-line)

	:hook (prog-mode . highlight-indent-guides-mode)
	)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq treesit-language-source-alist
	'(
		(bash   "https://github.com/tree-sitter/tree-sitter-bash"    )
		(c      "https://github.com/tree-sitter/tree-sitter-c"       )
		(cpp    "https://github.com/tree-sitter/tree-sitter-cpp"     )
		(css    "https://github.com/tree-sitter/tree-sitter-css"     )
		(csharp "https://github.com/tree-sitter/tree-sitter-c-sharp" )
		(go     "https://github.com/tree-sitter/tree-sitter-go"      )
		(html   "https://github.com/tree-sitter/tree-sitter-html"    )
		(java   "https://github.com/tree-sitter/tree-sitter-java"    )
		(python "https://github.com/tree-sitter/tree-sitter-python"  )
		(rust   "https://github.com/tree-sitter/tree-sitter-rust"    )
	 )
)
(setq treesit-extra-load-path '("~/.emacs.d/emacs-language-grammars"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo-fu --> simple undo/redo
;; undo-fu-session --> storing undo on file save
;; vundo --> situations where a tree is needed
;;
(use-package vundo :ensure t :defer t)
(use-package undo-fu-session
	:ensure t
	:init
	(setq undo-fu-session-directory
		(expand-file-name "emacs-undo/undo-fu-session/" user-emacs-directory))
	(setq undo-fu-session-incompatible-files '
		("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))

	:config
	(undo-fu-session-global-mode)
	)


(use-package undo-fu :ensure t
	:bind (
	("C-/" . undo-fu-only-undo)
	("C-?" . undo-fu-only-redo)
	)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-prog)

