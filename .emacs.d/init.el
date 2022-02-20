(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default))
 '(package-selected-packages '(org-bullets magit vertico evil-escape evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; configure basic visuals
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
;(setq-default mode-line-format nil)

;; buffer spacing
;(setq line-spacing 0.1) 
;(setq header-line-format " ")

;; add melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;(package-refresh-contents)

;; add and install packages
(defvar my-packages '(all-the-icons
		      clojure-mode
		      doom-themes
		      evil
		      evil-escape
		      geiser-chicken
		      inf-clojure
		      kotlin-mode
		      magit
		      neotree
		      org-bullets
		      paredit
		      undo-tree
		      vertico
		      writeroom-mode))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; configure packages
;;; vertico
(require 'vertico)
(vertico-mode)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;;; evil
(require 'evil)
(evil-mode 1)

(require 'evil-escape)
(setq-default evil-escape-key-sequence "jk")
(evil-escape-mode)

(require 'all-the-icons)
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)
(setq neo-theme 'icons)

(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;;; org mode
(require 'org)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;; writeroom
(require 'writeroom-mode)

;(doom-themes-org-config)
(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis " ..." ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

;; fonts
;(set-face-attribute 'default nil :font "Cascadia Code" :height 120)
(set-face-attribute 'default nil :font "IBM Plex Mono" :height 120)

;; theme
(load-theme 'doom-ayu-mirage t)
