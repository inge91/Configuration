(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(auctex evil yasnippet
                      color-theme-sanityinc-tomorrow
                      ujelly-theme projectile
                      smart-mode-line
                      autopair dtrt-indent smex
                      auto-complete haskell-mode
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;;; local packages ;;;;;;
(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'custom-theme-load-path "~/.emacs.d/local/themes")

(require 'ido)
(require 'autopair)
(require 'dtrt-indent)
(require 'smex)
(require 'auto-complete-config)
(require 'yasnippet)

;; appearance
(setq evil-default-cursor t)
(set-frame-font "Cousine 10")
(load-theme 'base16-default-dark t)
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; general stuff
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(column-number-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; scroll by line
(setq scroll-step            1
      scroll-conservatively  10000)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))))

(evil-mode 1)
(ido-mode t)
(autopair-global-mode)
(dtrt-indent-mode t)
(ac-config-default)
(projectile-global-mode)
(yas-global-mode 1)

(setq ido-enable-flex-matching t)
(setq org-hide-emphasis-markers t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq sml/theme 'dark)
(sml/setup)
