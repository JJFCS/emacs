
	;; -*- lexical-binding: t; -*-

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; [[ TODO COOL THINGS TO INCLUDE INTO OUR EMACS CONFIGURATION IN THE FUTURE ]]
	;;
	;; [[ PLUGINS TO INCLUDE ]]
	;;	AVY, DEVDOCS, EXPAND REGION, HELPFUL, MULTIPLE CURSORS
	;;	PROJECTILE, YASSSSS
	;;
	;; [[ FIND FILE (DOTFILES FOLLOWED BY EVERYTHING ELSE IN ALPHABETICAL ORDER) ]]
	;;
	;;
	;; [[ DEPENDENCIES ]]
	;;	- CCLS, CMAKE, ENCHANT, FD, FZF, GREP, PKG-CONFIG, PYRIGHT, RIPGREP
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
	(defun onncera-sane ()

	(split-window-horizontally) (toggle-frame-fullscreen)

		(blink-cursor-mode -1) (fringe-mode -1)  (menu-bar-mode -1) (scroll-bar-mode -1)  (tool-bar-mode -1)
		(electric-pair-mode 1) (global-display-line-numbers-mode 1) (global-hl-line-mode 1)
	)
	(add-hook 'emacs-startup-hook 'onncera-sane t) (add-to-list 'exec-path "/opt/homebrew/bin")

	(setq-default truncate-lines t)
	(setq inhibit-splash-screen  t)

	(setq auto-save-default nil) (setq auto-save-list-file-prefix nil) (setq make-backup-files nil)
	(setq display-line-numbers-type 'relative) (setq insert-directory-program "gls")


	;; FLASH THE MODE-LINE
	(setq visible-bell nil ring-bell-function 'double-flash-mode-line)
	(defun double-flash-mode-line ()
		(let ((flash-sec (/ 1.0 20)))
			(invert-face 'mode-line)
			(run-with-timer      flash-sec  nil #'invert-face 'mode-line)
			(run-with-timer (* 2 flash-sec) nil #'invert-face 'mode-line)
			(run-with-timer (* 3 flash-sec) nil #'invert-face 'mode-line)
		)
	)


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; COMMENT/UNCOMMENT CODE BLOCK TO USE A MIX OF PERSONAL COLORS & ANY OTHER THEME (CURRENTLY MODUS)
		(defun onncera-custom-color ()  ;; CODE BLOCK - COMBINING PERSONAL COLORS & MODUS THEME
			(set-foreground-color "burlywood3")
			(set-background-color "#161616"   )
			(set-cursor-color     "#40FF40"   )
			(set-face-background hl-line-face "midnight blue") (set-face-underline 'hl-line nil)
		)
		(add-hook 'window-setup-hook 'onncera-custom-color t)
		(add-hook 'after-init-hook (lambda ()
						(load-theme 'modus-vivendi-tritanopia t)
					   )
		)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; explanation:
	;; SCHEDULE FUNCTION TO BE CALLED WHEN EMACS HAS BEEN IDLE FOR A SPECIFIED AMOUNT OF TIME
	;;
	;; PARAMETERS OF `run-with-idle-timer'
	;; SECONDS  ( 0 ): SPECIFIES NUMBER OF SECONDS EMACS SHOULD BE IDLE BEFORE FUNCTION IS RAN... 0 MEANS FUNCTION WILL RUN AS SOON AS EMACS IS NEXT IDLE
	;; REPEAT   (NIL): SPECIFIES WHETHER TIMER SHOULD REPEAT... NIL MEANS TIMER WILL RUN ONLY ONCE
	;; FUNCTION      : FUNCTION TO BE CALLED WHEN THE IDLE TIMER EXPIRES
	;;
	;; COMMENT/UNCOMMENT CODE BLOCK TO USE A THEME
	;;	(add-hook 'window-setup-hook	(lambda ()
	;;	(run-with-idle-timer 0 nil	(lambda ()
	;;						(load-theme 'doom-1337 t)
	;;						(set-face-background hl-line-face "midnight blue") (set-face-underline 'hl-line nil)
	;;					)
	;;	)
	;;					)
	;;	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	(set-face-italic 'font-lock-comment-face nil)
	(set-face-bold-p 'bold                   nil)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		(require 'setup-colors)
		(require 'setup-company)
	;;	(require 'setup-completion)
		(require 'setup-comp)
		(require 'setup-lsp)
		(require 'setup-lang)
		(require 'setup-paramount)
		(require 'setup-prog)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(yasnippet vterm undo-fu undo-fu-session vundo rainbow-delimiters projectile multiple-cursors highlight-indent-guides flycheck expand-region avy org-bullets magit lsp-pyright pyvenv lsp-ui helm company-box company gruber-darker-theme ef-themes moe-theme modus-themes leuven-theme doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MartianMono Nerd Font" :foundry "nil" :slant normal :weight regular :height 120 :width condensed)))))

