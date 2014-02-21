(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(auctex
                      evil
                      yasnippet
                      projectile
                      dtrt-indent
                      smex
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

(require 'ido)
(require 'dtrt-indent)
(require 'smex)
(require 'auto-complete-config)
(require 'yasnippet)
(require 'latex-pretty-symbols)

;; appearance
(setq evil-default-cursor t)
(set-frame-font "Gohufont 10")
(load-theme 'base16-tomorrow-dark t)
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
(ido-mode t)
(dtrt-indent-mode t)
(ac-config-default)
(projectile-global-mode)
(yas-global-mode 1)
(electric-indent-mode 1)
(electric-pair-mode 1)

;; addon settings
(setq ido-enable-flex-matching t)
(setq org-hide-emphasis-markers t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
