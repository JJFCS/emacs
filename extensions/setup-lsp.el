;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - SUMMARY
;;  	- IDE CAPABILITIES TO VARIOUS PROGRAMMING LANGUAGES
;;  	- ENHANCES LSP EXPERIENCE BY OFFERING A USER-FRIENDLY INTERFACE WITH FEATURES LIKE REAL-TIME
;;  		ERROR CHECKING, CODE ACTIONS, AND CODE LENSES
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; read-process-output-max (* 1024 1024)
;; 	sets the maximum amount of data (in bytes) emacs can read from a process output at once to 1 MB.
;;
;; 	enlarging value of read-process-output-max can improve performance when dealing with language servers
;; 	or other processes that produce a large amount of output.
;;
;; 	emacs may read process output in smaller chunks, which can be inefficient
;; 	and lead to performance bottlenecks.


(use-package lsp-mode
	:config
	(setq lsp-diagnostics-provider :flycheck) (setq lsp-idle-delay 0.100)
	(setq read-process-output-max (* 1024 1024))

	:ensure t :hook (c-mode c++-mode objc-mode python-ts-mode)
	:init (setq lsp-keymap-prefix "C-c l")
)


(use-package lsp-ui :ensure t :hook (lsp-mode . lsp-ui-mode))



(provide 'setup-lsp)

