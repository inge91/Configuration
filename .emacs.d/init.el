;; package manager stuff
(require 'package)
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; add the user-installed folder to the path
(add-to-list 'load-path "/home/maarten/emacs.d/user-installed")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "70c8f79afe93cfbadb793121feca839d2070c203cf1536bee79fe3cffbac4e87" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "4870e6cb6f0a70c14ee73db30b69a8a1f08d6ec9a689c366e88636fb81e8022d" "e992575f7c09459bfc190e6776b8f5f96964023e98267a87fb3094e7c9686776" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setting the font and theme
(add-to-list 'custom-theme-load-path
	     "/home/maarten/.emacs.d/themes")
(set-face-attribute 'default nil :font "Inconsolata-11")
(load-theme 'monokai t)

;; gotta have Vim keys
(require 'evil)
(evil-mode 1)

;; paredit in Clojure mode
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; AUCTex settings
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)

;; python modes
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;; nicer autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)

;; word-wrapping
(auto-fill-mode t)
(setq fill-column 80)

;; yasnippet snippet engine
(require 'yasnippet)
(yas/global-mode 1)

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
