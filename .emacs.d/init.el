(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
(defvar my-packages '(color-theme-sanityinc-tomorrow
		      evil
		      evil-escape
		      magit
		      org-bullets
		      undo-tree
		      vertico))

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

;;; org mode
(require 'org)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

;; fonts
(set-face-attribute 'default nil :font "Cascadia Code" :height 120)

;; theme
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-day)

