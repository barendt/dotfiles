;; Add ~/emacs-lisp to load-path
(setq load-path (cons "~/.emacs-lisp" load-path))

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
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-agenda-files (list "~/org-mode-files/todo.org"
                             "~/org-mode-files/designteam.org"
                             "~/org-mode-files/somis.org"
                             "~/org-mode-files/randomreminders.org"))

(add-hook 'php-mode-hook
          '(lambda ()
             (progn
               (setq case-fold-search t)
               (c-set-offset 'arglist-intro '+)
               (c-set-offset 'arglist-close '0)
               (set (make-local-variable 'c-basic-offset) 4)
               (setq indent-tabs-mode nil)
               )))
