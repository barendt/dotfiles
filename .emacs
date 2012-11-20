;; Add ~/emacs-lisp to load-path
(setq load-path (cons "~/.emacs-lisp" load-path))

(add-to-list 'load-path "~/.emacs-lisp/coffee-mode")
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(global-font-lock-mode 1)

(define-key key-translation-map [?\C-h] [?\C-?])

;; Display line an dcolumn numbers
(setq line-number-mode    t)
(setq column-number-mode  t)

(fset 'yes-or-no-p 'y-or-n-p)

;; show matching parens
(show-paren-mode t)

;; associate some file extensions with php-mode
(autoload 'php-mode "php-mode" "PHP Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.functs$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phl$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Key mappings
(define-key esc-map "g" 'goto-line)

;; Menu stuff
(menu-bar-mode 0)
;;(tool-bar-mode 0)

;; Don't show start-up help
(setq inhibit-startup-message t)

(setq backup-directory-alist (list (cons "." "~/.backups")))

;; Highlight current line
(global-hl-line-mode 1)

;; highlight selected text
(transient-mark-mode t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(put 'narrow-to-region 'disabled nil)

(require 'magit)

(add-to-list 'load-path "~/.emacs-lisp/ruby-mode/")
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".builder$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-hook 'php-mode-hook
          '(lambda ()
             (progn
               (setq case-fold-search t)
               (c-set-offset 'arglist-intro '+)
               (c-set-offset 'arglist-close '0)
               (set (make-local-variable 'c-basic-offset) 4)
               (setq indent-tabs-mode nil)
               )))

;; ;; yasnippet
;; (add-to-list 'load-path
;;              "~/.emacs-lisp/yasnippet-0.6.1c")
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs-lisp/yasnippet-0.6.1c")

(add-to-list 'load-path "~/.emacs-lisp/autocomplete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs-lisp/autocomplete//ac-dict")
(ac-config-default)

;; Don't disable upcase-region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Don't auto-convert DOS mode
(setq-default inhibit-eol-conversion t)

(setq js-indent-level 2)