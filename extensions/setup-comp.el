
	;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  - PLACEHOLDER
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

	:init
	(helm-mode 1)

)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'setup-comp)

