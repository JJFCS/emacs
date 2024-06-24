;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - SUMMARY
;;  - C/CPP/OBJC
;;
;;  - PYTHON
;;  	CD INTO .virtualenvs (stored in documents/code directory)
;;  	CREATE DIRECTORY TO STORE VENV FOR THE RELATED PROJECT
;;  	CREATE THE VIRTUAL ENV. BY RUNNING THE FOLLOWING CMD
;;  		# python -m venv venv_name
;;  	CARRY OUT VENV BY EXECUTING THE FOLLOWING FUNCTION IN EMACS (SELECT THE APPROPRIATE DIRECTORY)
;;  		# pyvenv-activate
;;  			MUST ACTIVATE VENV BEFORE LOADING PYTHON FILE & CONNECTING TO LSP SERVER
;;  	https://www.youtube.com/watch?v=IAvAlS0CuxI
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(use-package lsp-pyright
	:ensure t
	:hook (python-ts-mode . (lambda ()
					(require 'lsp-pyright)
					(lsp)
				)
	      )
)

;; simple global minor mode which will replicate the changes done by virtualenv activation inside emacs
(use-package pyvenv :ensure t)


(setq c-basic-offset 4)
(use-package ccls
	:ensure t
	:hook ((c-mode c++-mode objc-mode cuda-mode) . (lambda ()
							 (require 'ccls)
							 (lsp)
						       )
	      )
)



(provide 'setup-lang)

