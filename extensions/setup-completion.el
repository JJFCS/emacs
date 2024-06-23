;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  COMPLETION FRAMEWORKS (MINIBUFFER - CONSULT, EMBARK, MARGINALIA, ORDERLESS, VERTICO)
;;	- enhances the emacs search and completion experience, and also provides a united interface for project search and replace, powered by ripgrep
;;	- enabled by several modular packages focused on enhancing the built-in `completing-read' interface
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; completion style that divides the pattern into space-separated
;; components, &  matches candidates that match all of the components in any order (provides better filtering methods)
(use-package orderless
	:ensure t
	:init
	(setq completion-styles '(orderless basic)  ;; `basic' completion style is specified as fallback in addition to `orderless'
	      completion-category-defaults nil      ;; serves as a default value for `completion-category-overrides'
	      completion-category-overrides '((file (styles basic partial-completion)))  ;; `partial-completion' style lets you use wildcards for file completion & partial paths, e.g., /u/s/l for /usr/share/local
	)
)


(use-package embark-consult :ensure t :hook (embark-collect-mode . consult-preview-at-point-mode))  ;; `embark-consult' package is glue code to tie together `embark' and `consult'.
;; makes it easy to choose a command to run based on what is near point, both during a
;; minibuffer completion session and in normal buffers
(use-package embark
	:ensure t
	:bind
		(
		("C-." . embark-act )  ;; essentially acts as a keyboard-based version of a right-click contextual menu
		("C-;" . embark-dwim)  ;; alternative == `M-.'
		)
	:init (setq prefix-help-command #'embark-prefix-help-command)
)


;; provides search and navigation commands based on the emacs completion function
(use-package consult
	:ensure t
	:bind (
	("C-x b"   . consult-buffer     )  ;; orig. switch-to-buffer
	("M-g g"   . consult-goto-line  )  ;; orig. goto-line
	("M-g M-g" . consult-goto-line  )  ;; orig. goto-line
	("M-g o"   . consult-outline    )  ;; alternative: consult-org-heading
	("M-g m"   . consult-mark       )
	("M-g k"   . consult-global-mark)
	("M-g i"   . consult-imenu      )
	("M-g I"   . consult-imenu-multi)
	("M-s d"   . consult-find       )  ;; alternative: consult-fd
	("M-s c"   . consult-locate     )
	("M-s g"   . consult-grep       )
	("M-s r"   . consult-ripgrep    )
	("M-s l"   . consult-line       )

	:map isearch-mode-map
	("M-s l"   . consult-line       )  ;; needed by consult-line to detect isearch
	("M-s L"   . consult-line-multi )  ;; needed by consult-line to detect isearch

	)

	;; automatic live preview at point in the *Completions* BUFFER... especially good when you use default completion UI
	:hook (completion-list-mode . consult-preview-at-point-mode)

	:init
	(setq register-preview-delay 0)
	(setq register-preview-function #'consult-register-format)

	:config
	(setq consult-narrow-key "<") ;; configure the narrowing key... both "<" and "C-+" work reasonably well
)


;; annotations or marks placed at the margin of the page of a book or in this case helpful colorful
;; annotations placed at the margin of the minibuffer for your completion candidates
(use-package marginalia
	:ensure t
	:bind   (:map minibuffer-local-map ("M-A" . marginalia-cycle))  ;; allows you to cycle through different annotation styles provided
	:custom (marginalia-align 'right)
	:init
	;; marginalia must be activated in the :init section of use-package such that the
	;; mode gets enabled right away. Note that this forces loading the package
	(marginalia-mode 1)
)


;; provides a performant and minimalistic vertical completion
(use-package vertico
	:ensure t
	:init
		(setq vertico-cycle t)
		(vertico-mode 1)
)


;; allows you to edit a grep buffer and apply those changes to the file buffer like sed interactively
;; allows you to edit the results of a grep search while inside a `grep-mode' buffer
;; all we nned is to toggle the editable mode, make the changes, and then type C-c C-c to confirm or C-c C-k to abort.
;;
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:9a3581df-ab18-4266-815e-2edd7f7e4852
(use-package wgrep
	:ensure t
	:bind (
		:map grep-mode-map
		("e"       . wgrep-change-to-wgrep-mode)
		("C-x C-q" . wgrep-change-to-wgrep-mode)
		("C-c C-c" . wgrep-finish-edit)
	      )
)



(provide 'setup-completion)

