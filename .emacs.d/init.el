;; configure basic visuals
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
;(setq-default mode-line-format nil)
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setq-default tab-width 2)
(setq inhibit-startup-screen t)


;;(setq visible-bell 1)
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

;; buffer spacing
;(setq line-spacing 0.1) 
;(setq header-line-format " ")

;; add melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;;(package-refresh-contents)

;; add and install packages
(defvar my-packages '(alchemist
										clojure-mode
										cider
										company
										doom-themes
										doom-modeline
										eglot
										elm-mode
										evil
										evil-escape
										geiser-chicken
										magit
										org-bullets
										org-roam
										paredit
										racket-mode
										rustic
										svelte-mode
										treemacs
										treemacs-nerd-icons
										tree-sitter
										tree-sitter-langs
										undo-tree
										vertico))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; configure packages
(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(require 'vertico)
(vertico-mode)

(require 'undo-tree)
(global-undo-tree-mode)
(defvar evil-undo-system 'undo-tree)

(require 'evil)
(evil-mode 1)
(evil-define-key 'normal org-mode-map (kbd "<tab>") 'org-cycle)

(require 'evil-escape)
(setq-default evil-escape-key-sequence "jk")
(evil-escape-mode)

(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(require 'nerd-icons)
(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'org)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-roam)
(global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)

(require 'rustic)
(setq rustic-analyzer-command '("~/.cargo/bin/rust-analyzer"))
(setq rustic-cargo-bin "~/.cargo/bin/cargo")
(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
(setq rustic-lsp-client 'eglot
      ;rustic-format-on-save 'true
      ;eglot-send-changes-idle-time (* 60 60)
      )
															 
(add-hook 'rust-mode-hook #'tree-sitter-hl-mode)

(defun add-eval-last-sexp (eval-f)
	(lambda ()
		(interactive)
		(local-set-key (kbd "C-c j") eval-f)))

;;(require 'racket-mode)
;;(global-set-key (kbd "C-c C-j") 'racket-eval-last-sexp)
;;(require 'cider)
;;(add-hook 'racket-mode-hook
;;					(lambda () (local-set-key (kbd "C-c C-j") 'racket-eval-last-sexp)))
;;(add-hook 'clojure-mode-hook
;;					(lambda () (local-set-key (kbd "C-c j") #'cider-eval-last-sexp)))

(require 'company)
(setq company-idle-delay 0.2)

(require 'treemacs)
(require 'treemacs-nerd-icons)
(treemacs-load-theme "nerd-icons")
(treemacs)

;(doom-themes-org-config)
(defvar org-agenda-block-separator "")
(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis " ..." ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; fonts
;(set-face-attribute 'default nil :font "Cascadia Code" :height 120)
(set-face-attribute 'default nil :font "IBM Plex Mono" :height 120)

;; theme
;; (load-theme 'doom-one t)
(load-theme 'doom-tomorrow-day t)			 	

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
