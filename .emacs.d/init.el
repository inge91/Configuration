(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(evil
                      helm
                      magit
                      auctex
                      yasnippet
                      projectile
                      dtrt-indent
                      auto-complete
                      haskell-mode
                      latex-pretty-symbols
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;;; local packages ;;;;;;
(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'custom-theme-load-path "~/.emacs.d/local/themes")

(require 'dtrt-indent)
(require 'auto-complete-config)
(require 'yasnippet)
(require 'latex-pretty-symbols)
(require 'helm-config)

;; appearance
(setq evil-default-cursor t)
(set-frame-font "Dejavu Sans Mono 10")
(load-theme 'zenburn t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(setq inhibit-startup-message t)

;; no backup stuff
(setq make-backup-files nil)
(setq auto-save-default nil)

;; indent with 4 tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; scroll by line
(setq scroll-step            1
      scroll-conservatively  10000)

;; enable modes
(evil-mode 1)
(dtrt-indent-mode t)
(ac-config-default)
(projectile-global-mode)
(yas-global-mode 1)
(electric-indent-mode 1)
(electric-pair-mode 1)
(helm-mode 1)

;; addon settings
(setq org-hide-emphasis-markers t)

;; hooks
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
