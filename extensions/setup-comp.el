
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - HELM IS AN EMACS FRAMEWORK FOR INCREMENTAL COMPLETIONS AND NARROWING SELECTIONS
;;  - https://github.com/abo-abo/swiper-helm
;;  - https://github.com/doomemacs/doomemacs
;;	- INSPIRED BY DOOM EMACS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm :ensure t

	:bind (

	([remap apropos]                     . helm-apropos)
	([remap find-library]                . helm-locate-library)
	([remap bookmark-jump]               . helm-bookmarks)
	([remap execute-extended-command]    . helm-M-x)
	([remap find-file]                   . helm-find-files)
	([remap ibuffer-find-file]           . helm-find-files)
	([remap locate]                      . helm-locate)
	([remap imenu]                       . helm-semantic-or-imenu)
	([remap noop-show-kill-ring]         . helm-show-kill-ring)
	([remap persp-switch-to-buffer]      . +helm/workspace-mini)
	([remap switch-to-buffer]            . helm-buffers-list)
	([remap projectile-find-file]        . +helm/projectile-find-file)
	([remap projectile-recentf]          . helm-projectile-recentf)
	([remap projectile-switch-project]   . helm-projectile-switch-project)
	([remap projectile-switch-to-buffer] . helm-projectile-switch-to-buffer)
	([remap recentf-open-files]          . helm-recentf)
	([remap yank-pop]                    . helm-show-kill-ring)

	)

	:config
	(setq helm-M-x-show-short-doc                t)
	(setq helm-M-x-fuzzy-match                   t)
	(setq helm-apropos-fuzzy-match               t)
	(setq helm-bookmark-show-location            t)
	(setq helm-buffers-fuzzy-matching            t)
	(setq helm-completion-in-region-fuzzy-match  t)
	(setq helm-eshell-fuzzy-match                t)
	(setq helm-ff-fuzzy-matching                 t)
	(setq helm-file-cache-fuzzy-match            t)
	(setq helm-flx-for-helm-locate               t)
	(setq helm-imenu-fuzzy-match                 t)
	(setq helm-lisp-fuzzy-completion             t)
	(setq helm-locate-fuzzy-match                t)
	(setq helm-locate-library-fuzzy-match        t)
	(setq helm-projectile-fuzzy-match            t)
	(setq helm-recentf-fuzzy-match               t)
	(setq helm-semantic-fuzzy-match              t)

	:init
	(helm-mode 1)

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-descbinds :ensure t :hook (helm-mode . helm-descbinds-mode)
	:config
	;; HACK: Upstream claims that the two packages are incompatible, but changing
	;;    `prefix-help-command' seems to smooth the incompatibility over. More testing is needed
	(setq prefix-help-command #'helm-descbinds))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-flx :ensure t :hook (helm-mode . helm-flx-mode)
	:config
	(setq helm-flx-for-helm-find-files t) (setq helm-flx-for-helm-locate t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-projectile :ensure t

	:commands (
		helm-projectile-find-file
		helm-projectile-recentf
		helm-projectile-switch-project
		helm-projectile-switch-to-buffer

	)

	:init
	(helm-projectile-on)

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-c-yasnippet :ensure t :defer t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package swiper-helm :ensure t :defer t

	:config
	;; NOT MODIFYING SOURCE CODE, SIMPLY WRAPPING ADDITIONAL BEHAVIOR AROUND ORIGINAL FUNCTION
	(defun my-swiper-helm-horizontal-split (orig-fun &rest args)
		"SPLIT WINDOWS HORIZONTALLY FOR `swiper-helm-default-display-buffer'"
		(when (one-window-p)
			(split-window-horizontally))
		(apply orig-fun args))
	(advice-add 'swiper-helm-default-display-buffer :around #'my-swiper-helm-horizontal-split)

	:bind (

		("C-s" . swiper-helm)

	)

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-comp)

