
;; -*- lexical-binding: t; -*-

;; ORG & BABEL ARE INCLUDED WITH EMACS SO NO DOWNLOAD IS NEEDED
(require 'org)
(require 'ob-tangle)

;; Load modules in this exact order
(dolist (module '("main" "bespoke" "appearances" "emacs" "programming" "keybindings"))
        (org-babel-load-file (expand-file-name (concat "modules/" module ".org") user-emacs-directory)))
