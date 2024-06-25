
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  COMPLETION FRAMEWORKS (MINIBUFFER - CONSULT, EMBARK, MARGINALIA, ORDERLESS, VERTICO)
;;	- enhances the emacs search and completion experience, and also provides a united interface for project search and replace, powered by ripgrep
;;	- enabled by several modular packages focused on enhancing the built-in `completing-read' interface
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; completion style that divides the pattern into space-separated
;; components, &  matches candidates that match all of the components in any order
(use-package orderless
	:ensure t
	:init
	(setq completion-styles '(orderless basic)  ;; `basic' completion style is specified as fallback in addition to `orderless'
	      completion-category-defaults nil      ;; serves as a default value for `completion-category-overrides'
	      completion-category-overrides '((file (styles basic partial-completion)))  ;; `partial-completion' style lets you use wildcards for file completion & partial paths, e.g., /u/s/l for /usr/share/local
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
;; consult provides search & navigation commands based on emacs's completion function
;; explanation: `completion-list-mode . consult-preview-at-point-mode'
;;	automatic live preview at point in *COMPLETIONS* BUFFER
;;	relevant when you use default completion UI
;;
;;
;; explanation (IN ORDER): `consult-outline', `consult-find', `consult-line'
;;	Search through the headings of the file
;;	Search for file names recursively
;;	Search the current buffer
;;
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
;; provides a performant and minimalistic vertical completion
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

