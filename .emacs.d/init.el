;; package manager stuff
(require 'package)
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)



; make sure all packages I want are installed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit evil)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))




;; setting the font and theme
(add-to-list 'custom-theme-load-path
             "/home/maarten/.emacs.d/themes")
(set-face-attribute 'default nil :font "Monaco-10")
(load-theme 'tomorrow-night t)

;; gotta have Vim keys
(require 'evil)
(evil-mode 1)




;; smooth scrolling
(setq scroll-step            1
      scroll-conservatively  10000)




;; no backup files
(setq make-backup-files nil)




;; show columns in the modebar
(column-number-mode t)




;; some interface enhancements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)




;; indent with 4 spaces
(setq tab-width 4)
(setq indent-tabs-mode nil)




;; automatically close braces/parentheses/etc
(require 'autopair)
(autopair-global-mode)
