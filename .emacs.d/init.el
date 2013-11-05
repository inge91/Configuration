; el-get settings
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

; make sure it's installed
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

; make sure my favorite packages are installed
(defvar my-packages '(auctex yasnippet auto-complete autopair dtrt-indent
			     smex haskell-mode))

(dolist (p my-packages)
  (when (not (el-get-package-exists-p p))
    (el-get-install p)))

(setq el-get-user-package-directory "~/.emacs.d/el-get-init/")
(el-get 'sync)

;;;;;; local packages ;;;;;;
(add-to-list 'load-path "~/.emacs.d/local")
(add-to-list 'custom-theme-load-path "~/.emacs.d/local/themes")

; appearance settings
(set-frame-font "Source Code Pro 10")
(unless (display-graphic-p)
  (menu-bar-mode -1))
(load-theme 'underwater t)

; behaviour settings
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

; linebreak
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(set-fill-column 80)

; scroll by line
(setq scroll-step            1
      scroll-conservatively  10000)

; auto-indent with enter
(define-key global-map (kbd "RET") 'newline-and-indent)

; built-in packages
; ido
(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)

; org
(setq org-hide-emphasis-markers t)
(setq org-agenda-files '("~/Dropbox/Org"))
