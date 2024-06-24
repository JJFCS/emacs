;; MAGNAR DEFAULT BLACK THEME (https://github.com/magnars/emacsd-reboot/blob/main/default-black-theme.el)

;; [[ MULTIPLE CURSORS ---> TSODING CONFIG... TAKE INSPIRATION FROM KEYBINDINGS ]]
;; 	(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; 	(global-set-key (kbd "C->")         'mc/mark-next-like-this)
;; 	(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
;; 	(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
;; 	(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
;; 	(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; [[ DIRED ---> TSODING CONFIG... TAKE INSPIRATION ]]
;; 	(require 'dired-x)
;; 	(setq dired-omit-files
;; 		(concat dired-omit-files "\\|^\\..+$"))
;; 	(setq-default dired-dwim-target t)
;; 	(setq dired-listing-switches "-alh")

;; [[ OMIT UNINTERESTING FILES FROM DIRED ]]
;; 	(require 'dired-x)
;; 	(setq-default dired-omit-files-p t)
;; 	(setq dired-omit-files
;; 		(concat dired-omit-files "\\|^\\..+$"))

;; [[ WORD-WRAP... ADAPT FOR ORG-MODE  ]]
;; 	(defun rc/enable-word-wrap ()
;; 		(interactive)
;; 		(toggle-word-wrap 1))
;; 	(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)



;;  - TODO ---> FIND FILE (DOTFILES FOLLOWED BY EVERYTHING ELSE IN ALPHABETICAL ORDER)

;; -*- lexical-binding: t; -*-

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

(add-to-list 'load-path (expand-file-name "extensions" user-emacs-directory))

(require 'setup-checkers)
(require 'setup-colors)
(require 'setup-company)
(require 'setup-completion)
(require 'setup-lang)
(require 'setup-lsp)
(require 'setup-magit)
(require 'setup-miscellaneous)
(require 'setup-org)
(require 'setup-prog)

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

(global-hl-line-mode 1)

(setq enable-recursive-minibuffers t)  ;; support opening minibuffers inside existing minibuffers
(setq delete-by-moving-to-trash    t)  ;; extra layer of precaution against deleting wanted files
(setq org-src-preserve-indentation t)  ;; org disable automatic indentation in source code blocks

(setq read-extended-command-predicate #'command-completion-default-include-p)  ;; Hide commands in M-x which do not work in the current mode
(setq undo-limit 10000000)  ;; emacs remembers up to 10000000 undo actions for each BUFFER
(setq tab-always-indent 'complete)  ;; support indentation + completion using TAB key. `completion-at-point' normally bound to M-TAB

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
