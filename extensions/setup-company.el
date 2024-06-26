
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - PLACEHOLDER
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
	:ensure t
	:config
	
	(define-key company-active-map (kbd "C-y"  ) 'company-complete-selection)
	(define-key company-active-map (kbd "C-n"  ) 'company-select-next)
	(define-key company-active-map (kbd "C-p"  ) 'company-select-previous)

	(setq company-backends '(
		(company-capf company-clang)
		(company-dabbrev company-dabbrev-code)
		(company-files company-keywords)
		)
	)

	(setq company-minimum-prefix-length 2)
	(setq company-idle-delay 0.100)

	(setq company-tooltip-minimum-width 100)
	(setq company-tooltip-maximum-width 120)

	;; minimum spacing between a candidate and annotation ~ aligns annotations to the right side of the tooltip
	(setq company-tooltip-annotation-padding 3) (setq company-tooltip-align-annotations t)

	:init
	(global-company-mode 1)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-box :ensure t :hook (company-mode . company-box-mode)
	:config (setq company-box-doc-delay 0.100))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-company)

