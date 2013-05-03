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
                             tree-mode yasnippet scala-mode2 wrap-region 
                             color-theme-sanityinc-tomorrow auto-complete
                             autopair dtrt-indent)
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
(set-frame-font "Cousine-9")
(load-theme 'noctilux t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/Org/thesis.org")))
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
(require 'ido)
(require 'autopair)
(require 'dtrt-indent)
(require 'smex)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(ac-config-default)
(ac-set-trigger-key "TAB")

(yas/global-mode t)
(ido-mode t)
(autopair-global-mode)
(dtrt-indent-mode t)

(add-to-list 'load-path "~/.emacs.d/local/ensime/elisp/")
(require 'ensime)

(setq ido-enable-flex-matching t)
(setq org-hide-emphasis-markers t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

