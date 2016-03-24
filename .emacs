(require `package)
(add-hook `haskell-mode-hook `haskell-indentation-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (mac-classic)))
 '(custom-safe-themes
   (quote
    ("340cc9a442b03408f8cf6ac2bcb74ccfc36f2a1f2e8347a1cf8d42286e983e8e" "7c77ba7d52ba6d69d8b9bac7e8c66425346e82d41c1a82622b163122b89e2578" "8758e3a25189203524150b5e3ea47090e98a46c82e370b9a07382dfe1747dca2" "b71a530e1ffb78e2032aee8eb81a6e328ce583145f83980c79237045fb6f7346" "b60a98bf8ef40529504797cf2fb049c16e65d3f30509d2e583d424104cf17577" "00db1d741836d2db2956bc0b24befa4b5a45a31f3f32bb9990684fb2b307fc47" "2ee278edf0eeace3f86159e2602d5116fd8f343acb6a71486b4789f13f2a99f0" "6f27828949412801cc4ee78240eea316c0d05ce93274ff9851f75334c637fde6" "1c7c3a5b599aa7e063dfb7bbbe602fea9ce020e9d12a761bea4f4734718f8825" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "8da88e2ef68cae21a3944ee58f1efe99e7598919ca2a83f4a1ea46c9220cc3e4" "f1ee3126c1aba9f3ba35bb6f17cb2190557f2223646fd6796a1eb30a9d93e850" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "68b7d8301bf8121abb8a92bbe7c247fbc3e64a0adfdda534daefd18f18c44a55" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "3f51d45b0963fbba3372aa512877d519c1bf913e7f1696ec6a498178b3c2c252" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(setq column-number-mode t)

;; Drag stuff
(add-to-list 'load-path "~/.emacs.d/elpa/drag-stuff-0.1.0/")
(require 'drag-stuff)
(drag-stuff-global-mode t)

;; Disable splash
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized-master")
(load-theme 'tango t)

;; Column Marker
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'column-marker)
(add-hook 'global-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Uses spaces instead of tabs when indenting
(setq-default indent-tabs-mode nil)

;; Rainbow Delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; NeoTree
(add-to-list 'load-path "~/.emacs.d/elpa/emacs-neotree-dev/")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; smex
(add-to-list 'load-path "~/.emacs.d/elpa/smex-master/")
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Undo Tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Smooth Scrolling (mainly for Terminal mode)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse  
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Minimap Mode
(require 'minimap)
(global-set-key [f9] 'minimap-toggle)

;; Web Mode
(require 'web-mode)
(add-hook 'web-mode-hook
	  (lambda () ""	    
	    (setq web-mode-markup-indent-offset 2)
	    (setq web-mode-css-indent-offset 2)
	    (setq web-mode-code-indent offset 2)
	    (setq web-mode-indent-style 2)))
