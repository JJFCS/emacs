
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  COMPLETION FRAMEWORKS (MINIBUFFER - CONSULT, EMBARK, MARGINALIA, ORDERLESS, VERTICO)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; completion style that divides the pattern into space-separated
;; components, &  matches candidates that match all of the components in any order
(use-package orderless
	:ensure t
	:init
	(setq completion-styles '(orderless basic)
	      completion-category-defaults nil
	      completion-category-overrides '(
					(file (styles basic partial-completion))
				)
	)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package embark-consult :ensure t :hook (embark-collect-mode . consult-preview-at-point-mode))
(use-package embark
	:ensure t
	:bind
		(
		("C-." . embark-act )  ;; essentially acts as a right-click contextual menu
		("C-;" . embark-dwim)  ;; alternative == `M-.'
		)
	:init (setq prefix-help-command #'embark-prefix-help-command)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package consult
	:ensure t

	:hook (completion-list-mode . consult-preview-at-point-mode)
	
	:init
	(setq register-preview-delay 0)
	(setq register-preview-function #'consult-register-format)

	:config
	(setq consult-narrow-key "<")
	
	:bind (
	("C-x b"   . consult-buffer     )
	("M-g g"   . consult-goto-line  )
	("M-g M-g" . consult-goto-line  )
	("M-g o"   . consult-outline    )
	("M-g m"   . consult-mark       )
	("M-g k"   . consult-global-mark)
	("M-g i"   . consult-imenu      )
	("M-g I"   . consult-imenu-multi)
	("M-s d"   . consult-find       )
	("M-s c"   . consult-locate     )
	("M-s g"   . consult-grep       )
	("M-s r"   . consult-ripgrep    )
	("M-s l"   . consult-line       )

	:map isearch-mode-map
	("M-s l"   . consult-line       )
	("M-s L"   . consult-line-multi )

	)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; annotations or marks placed at the margin of the page of a book or in this case helpful colorful
;; annotations placed at the margin of the minibuffer for your completion candidates
(use-package marginalia
	:ensure t
	:bind   (:map minibuffer-local-map ("M-A" . marginalia-cycle))  ;; cycle through different annotation styles
	:custom (marginalia-align 'right)
	:init
	(marginalia-mode 1)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vertico
	:ensure t
	:init
		(setq vertico-cycle t)
		(vertico-mode 1)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; allows you to edit a grep buffer & apply those changes to the file buffer like sed interactively
;; allows you to edit the results of a grep search while inside a `grep-mode' buffer
;; all we need is to toggle editable mode, make changes, then type C-c C-c to confirm or C-c C-k to abort
(use-package wgrep
	:ensure t
	:bind (
		:map grep-mode-map
		("e"       . wgrep-change-to-wgrep-mode)
		("C-x C-q" . wgrep-change-to-wgrep-mode)
		("C-c C-c" . wgrep-finish-edit)
	      )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-completion)

