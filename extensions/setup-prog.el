;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - SUMMARY
;;  	- RAINBOW DELIMITERS
;;  		- color delimiters such as parentheses, brackets or braces according to their depth.
;;  		- each successive level is highlighted in a different color for
;;  			easy spot matching of delimiters.
;;
;;  	- TREESITTER
;;  		- RUN THE FOLLOWING CMD TO INSTALL THE APPROPRIATE TREESITTER LANGUAGE PARSER
;;  			# M-x treesit-install-language-grammar
;;  		- a parser generator tool and an incremental parsing library.
;;  		- can build a concrete syntax tree for a source file
;;  			and efficiently update the syntax tree as the source file is edited.
;;
;;  - NOTE
;;  	- ONLY PYTHON WORKING :/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))


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
(setq treesit-extra-load-path '("~/.emacs.d/onncera-language-grammars"))



(provide 'setup-prog)

