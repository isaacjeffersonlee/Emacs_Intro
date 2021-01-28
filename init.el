;; Default Emacs bindings to note:
;; Note: C-<key> means hold Control and press that key
;; M-<key> means hold Meta i.e alt and the key
;; S-<key> is shift e.t.c
;; To highlight text, either use mouse cursor or C-space
;; To Comment text, highlight it and then press C-x C-;
;; To cut the text, press C-w.
;; To copy the text, press M-w.
;; To paste the text, press C-y.
;; To search C-s
;; To type a command, M-x
;; To find a file C-x C-f
;; To save a file C-x C-s
;; To zoom in and out C-x C-+ or C-x C--
;; Window commands
    ;; C-x 0 delete the current window
    ;; C-x 1 maximize the current window
    ;; C-x 2 split the current window horizontally
    ;; C-x 3 split the current window vertically
    ;; C-x ^ make selected window taller
    ;; C-x } make selected window wider
    ;; C-x - shrink window if larger than buffer

;; R specific bindings
;; To open an R interpreter do M-x R
;; To send the whole buffer (currently opened file) to the interpreter C-c C-l
;; To send the currently selected region to the buffer (more useful) C-c C-c
;; -------------------------- ## PACKAGE MANAGER ##  --------------------------

(require 'package)
(setq package-enable-at-startup nil)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; ------------------------- ## THEMES & UI ##  -------------------------------


(tool-bar-mode 1)
(menu-bar-mode 1)          
(set-fringe-mode 10)       ; Set a slight margin
(setq visible-bell nil)
(global-display-line-numbers-mode)
(setq-default cursor-type 'bar) ; thin cursor

(use-package doom-modeline :ensure t :init)
(doom-modeline-mode 1)
(setq all-the-icons-color-icons t)

(use-package doom-themes :ensure t :init)
(load-theme 'doom-palenight t)	       

;; ------------------------- ## Useful packages ##  ------------------------------


(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode t))

(define-key global-map (kbd "C-z") 'undo-tree-undo)
(define-key global-map (kbd "C-r") 'undo-tree-redo)

;; Escape quits, instead of C-g default
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Prompts for M-x
(use-package ivy
  :ensure t
  :init
  :diminish
  :config
  (ivy-mode 1))

(use-package smart-comment
  :ensure t
  :init
  :bind ("M-;" . smart-comment))       

;; Parenthesis auto completion
(use-package smartparens
   :ensure t
   :init
   (smartparens-global-mode))

;; Parenthesis matching
(use-package paren
  :ensure t
  :init
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))


;; Autocompletion
(use-package company
        :ensure t
        :init)
(add-hook 'after-init-hook 'global-company-mode)
(setq-local company-backends '((company-capf company-dabbrev-code)))
(setq company-idle-delay 0)


;; ------------------------- ## R specific packages ##  ------------------------------

(use-package ess
:ensure t
:init)

(use-package ess-smart-equals
:ensure t
:init   (setq ess-smart-equals-extra-ops '(percent))
:after  (:any ess-r-mode inferior-ess-r-mode ess-r-transcript-mode)
:config (ess-smart-equals-activate))

(use-package ess-R-data-view
:ensure t
:init)


;; ------------------------- ## CUSTOM SET VARIABLES  ##  ---------------------
;; DON'T EDIT THIS PART

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ess-R-data-view ess-smart-equals ess company ivy undo-tree redo smart-comment doom-themes doom-modeline smartparens use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
