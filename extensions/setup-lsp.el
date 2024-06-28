
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - IDE CAPABILITIES TO VARIOUS PROGRAMMING LANGUAGES
;;  - ENHANCES LSP EXPERIENCE BY OFFERING A USER-FRIENDLY INTERFACE WITH FEATURES LIKE REAL-TIME
;;  	ERROR CHECKING, CODE ACTIONS, AND CODE LENSES
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-ui   :ensure t)
(use-package lsp-mode :ensure t	:init (setq lsp-keymap-prefix "C-c l")
	:config (setq lsp-idle-delay 0.100)
	:hook
	(c-mode c++-mode objc-mode python-ts-mode)
	(lsp-mode . lsp-ui-mode)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-lsp)

