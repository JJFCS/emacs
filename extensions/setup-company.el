
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company :ensure t

	:config
	(define-key company-active-map (kbd "C-y"  ) 'company-complete-selection)
	(define-key company-active-map (kbd "C-n"  ) 'company-select-next)
	(define-key company-active-map (kbd "C-p"  ) 'company-select-previous)

	(setq company-backends '(
		(company-abbrev  company-capf company-clang)
		(company-dabbrev company-dabbrev-code)
		(company-etags   company-gtags)
		(company-files   company-keywords company-yasnippet)
		)
	)

	(setq company-minimum-prefix-length 2)
	(setq company-idle-delay 0.100)

	(setq company-tooltip-minimum-width 60)
	(setq company-tooltip-maximum-width 80)

	:init
	(global-company-mode 1)

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-box :ensure t :hook (company-mode . company-box-mode)
	:config (setq company-box-doc-delay 0.100))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-company)

