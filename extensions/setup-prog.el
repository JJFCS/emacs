
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


(provide 'setup-prog)

