
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; [[ TODO COOL THINGS TO INCLUDE INTO OUR EMACS CONFIGURATION IN THE FUTURE ]]
	;;
	;; [[ PLUGINS TO INCLUDE ]]
	;;	DEVDOCS, EXPAND REGION, MULTIPLE CURSORS, YASSSSS
	;;
	;; [[ FIND FILE (DOTFILES FOLLOWED BY EVERYTHING ELSE IN ALPHABETICAL ORDER) ]]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; DEPENDENCIES
	;;	- CCLS, ENCHANT, FD, FZF, GREP, PKG-CONFIG, PYRIGHT, RIPGREP
	;;	- FOR MACOS (HOMEBREW)
	;;	- note:
	;;		- xargs brew install --casks < example.txt
	;;		- xargs brew install < example.txt
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(require 'package)
	(setq package-archives '(
				("melpa"  . "https://melpa.org/packages/"    )
				("elpa"   . "https://elpa.gnu.org/packages/" )
				("nongnu" . "https://elpa.nongnu.org/nongnu/")
				)
	)

	(unless
		(bound-and-true-p package--initialized)
			(setq package-enable-at-startup nil)
			(package-initialize)
	)

	(unless (package-installed-p 'use-package) (package-refresh-contents) (package-install 'use-package))
	(eval-when-compile (require 'use-package))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(add-to-list 'load-path (expand-file-name "extensions" user-emacs-directory))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMACS GENERAL SETTINGS - SANE DEFAULTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs-backups" user-emacs-directory))))  ;; set the directory for backup files
	(setq auto-save-default nil auto-save-list-file-prefix nil)  ;; disable auto-saving, ensuring emacs does not create the auto-save directory
	(setq backup-by-copying t)  ;; create backups by copying files, which avoids issues with hard links
	(setq version-control   t)  ;; use version numbers for backups

	;; create the backup directory if it does not exist
	(unless (file-exists-p  "~/.emacs-backups"  )
		(make-directory "~/.emacs-backups" t)
	)


	(setq display-line-numbers-type 'relative)  ;; enabling line numbers (relative)
	(global-display-line-numbers-mode 1)        ;; enabling line numbers
	(electric-pair-mode               1)        ;; enabling automatic parens pairing

	(menu-bar-mode -1)                          ;; disable menu bar
	(tool-bar-mode -1)                          ;; disable tool bar

	(setq-default truncate-lines   t)           ;; enabling truncated lines
	(setq mac-command-key-is-meta  t)
	(setq mac-command-modifier 'meta)

	(setq enable-recursive-minibuffers t)  ;; support opening minibuffers inside existing minibuffers
	(setq delete-by-moving-to-trash    t)  ;; extra layer of precaution against deleting wanted files
	(setq org-src-preserve-indentation t)  ;; org disable automatic indentation in source code blocks

	(setq read-extended-command-predicate #'command-completion-default-include-p)  ;; Hide commands in M-x which do not work in the current mode
	(setq tab-always-indent 'complete)  ;; support indentation + completion using TAB key. `completion-at-point' normally bound to M-TAB
	(setq insert-directory-program "/opt/homebrew/bin/gls")  ;; compel DIRED employ `gls' instead OF `ls'

	(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
	(setq inhibit-splash-screen t)


	(defun onncera-post-loading ()
		(blink-cursor-mode -1) (fringe-mode -1) (scroll-bar-mode -1) (global-hl-line-mode 1) (set-face-underline 'hl-line nil) (split-window-horizontally)
		(set-background-color "#161616") (set-foreground-color "burlywood3") (set-cursor-color "#40FF40") (set-face-background hl-line-face "midnight blue")
	)
	(add-hook 'window-setup-hook 'onncera-post-loading t)
	(add-hook 'after-init-hook (lambda ()
					(load-theme 'modus-vivendi-tritanopia t)
				   )
	)


	(set-face-italic 'font-lock-comment-face nil)
	(set-face-bold-p 'bold                   nil)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(require 'setup-completion)
	(require 'setup-company)
	(require 'setup-lsp)
	(require 'setup-prog)
	(require 'setup-lang)
	(require 'setup-checkers)
	(require 'setup-magit)
	(require 'setup-miscellaneous)
	(require 'setup-org)
	(require 'setup-colors)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(moe-theme modus-themes leuven-theme gruber-darker-theme doom-themes org-bullets undo-tree magit flycheck ccls lsp-pyright pyvenv rainbow-delimiters lsp-ui company wgrep vertico marginalia embark-consult orderless)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MartianMono Nerd Font" :foundry "nil" :slant normal :weight regular :height 120 :width condensed)))))

