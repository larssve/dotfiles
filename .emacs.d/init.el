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
;;(package-refresh-contents)

;; add and install packages
(setq my-packages '(clojure-mode
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

(require 'evil)
(evil-mode 1)

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

(require 'rustic)
(setq rustic-lsp-client 'eglot
      ;rustic-format-on-save 'true
      ;eglot-send-changes-idle-time (* 60 60)
      )
(add-hook 'rust-mode-hook #'tree-sitter-hl-mode)

(require 'elm-mode)
(setq elm-mode-hook '(elm-indent-simple-mode))

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

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; fonts
;(set-face-attribute 'default nil :font "Cascadia Code" :height 120)
(set-face-attribute 'default nil :font "IBM Plex Mono" :height 120)

;; theme
(load-theme 'doom-one t)
;; (load-theme 'doom-tomorrow-day t)			 	


(setq-default tab-width 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "84b14a0a41bb2728568d40c545280dbe7d6891221e7fbe7c2b1c54a3f5959289" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "b186688fbec5e00ee8683b9f2588523abdf2db40562839b2c5458fcfb322c8a4" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" default))
 '(org-agenda-files '("~/test.org"))
 '(package-selected-packages
	 '(treemacs-nerd-icons treemacs-all-the-icons nerd-icons-dired all-the-icons-dired all-the-icons-ivy elm-mode racket-mode writeroom-mode vertico undo-tree paredit org-bullets neotree magit inf-clojure geiser-chicken evil-escape evil doom-themes clojure-mode all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
