;;;;;; ELPA ;;;;;;;
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
                             auto-complete autopair dtrt-indent smex
                             haskell-mode jedi clojure-mode nrepl paredit
                             ir-black-theme base16-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;;; local packages ;;;;;;
(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'custom-theme-load-path "~/.emacs.d/local/themes")

;; enable evil mode
(evil-mode 1)

;; gotta look sexy
(setq evil-default-cursor t)
(set-frame-font "Terminus 12")
(load-theme 'dotshare t)
(unless (display-graphic-p)
  (menu-bar-mode -1))

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
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(set-fill-column 80)

;; scroll by lane
(setq scroll-step            1
      scroll-conservatively  10000)

;; auto-indent with enter
(define-key global-map (kbd "RET") 'newline-and-indent)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4"))))

(require 'yasnippet)
(require 'auto-complete-config)
(require 'ido)
(require 'autopair)
(require 'dtrt-indent)
(require 'smex)
(require 'auto-complete-clang-async)

(ac-config-default)

(yas/global-mode t)
(ido-mode t)
(autopair-global-mode)
(dtrt-indent-mode t)

(setq ido-enable-flex-matching t)
(setq org-hide-emphasis-markers t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; clang complete async setup
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/local/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(add-hook 'Haskell-mode-hook (lambda () (setq evil-auto-indent nil)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
