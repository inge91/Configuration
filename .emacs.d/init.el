;;;;;; ELPA ;;;;;;;
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(auctex evil magit ir-black-theme scala-mode2 prolog
                             tree-mode yasnippet scala-mode2 wrap-region cdlatex
                             color-theme-sanityinc-tomorrow)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;;; local packages ;;;;;;
(add-to-list 'load-path "~/.emacs.d/local")

;; enable evil mode
(evil-mode 1)

;; gotta look sexy
(set-frame-font "Monaco-9")
(load-theme 'sanityinc-tomorrow-night t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode -1)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

;; linebreak
(set-fill-column 80)
(auto-fill-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(org-hide-emphasis-markers t)
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'dirtree)
(require 'yasnippet)
(require 'auto-complete-config)
(require 'powerline)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(ac-config-default)
(yas/global-mode 1)

(add-to-list 'load-path "~/.emacs.d/local/ensime/elisp/")
(require 'ensime)

(powerline-default-theme)
