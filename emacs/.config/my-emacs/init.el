;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

;;; Code:

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)
(set-face-attribute 'default nil :font "Fira Mono" :height 90)
(set-fontset-font t 'symbol "Apple Color Emoji")
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)
(load-theme 'tango-dark)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
		nov-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; initialize package sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;;; Commentary:
;;

(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(explicit-shell-file-name "/usr/bin/zsh")
 '(package-selected-packages
   '(ligo-mode deferred counsel-dash dash-docs php-cs-fixer all-the-icons-dired dired-sidebar company nov-mode lsp-ui lsp-mode flycheck web-mode php-mode nov projectile general doom-themes helpful ivy-rich which-key rainbow-delimiters doom-modeline counsel ivy use-package))
 '(tab-bar-show nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package unicode-fonts
   :ensure t
   :config
    (unicode-fonts-setup))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package dash-docs)
(use-package counsel-dash
  :config
  (setq counsel-dash-docsets-path "~/.var/app/org.zealdocs.Zeal/data/Zeal/Zeal/docsets"))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-zenburn t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :commands
  (dired-sidebar-show-sidebar
   dired-sidebar-hide-sidebar
   dired-sidebar-toggle-sidebar))
(defun custom/dired-sort-directories-first ()
"Sort dired listings with directories first."
(save-excursion
    (let (buffer-read-only)
    (forward-line 2)
    (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(defadvice dired-readin
(after dired-after-updating-hook first () activate)
"Sort dired listings with directories first before adding marks."
(custom/dired-sort-directories-first))


(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(load "~/Code/tezos/emacs/michelson-mode.el" nil t)

(use-package flycheck
  :diminish flycheck-mode
  :hook (after-init . global-flycheck-mode))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(defun my-nov-font-setup ()
  "Ebook text width."
    (setq-default nov-text-width 80))
(add-hook 'nov-mode-hook 'my-nov-font-setup)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(use-package web-mode
  :commands web-mode
  :mode
  (("\\.html\\'"        . web-mode)
   ("\\.phtml\\'"       . web-mode)
   ("\\.tpl\\.php\\'"   . web-mode)
   ("\\.html\\.twig\\'" . web-mode))
  :config
  (add-to-list 'web-mode-engines-alist
               '("django" . "\\.html\\.twig\\'")))

(use-package php-mode
     :commands php-mode
     :mode "\\.php\\'"
     :custom
     (php-manual-path "~/.local/share/doc/php-doc/html"))
(add-hook 'before-save-hook 'php-cs-fixer-before-save)
(add-hook 'php-mode-hook (lambda () (setq-local counsel-dash-docsets '("Symfony"))))

(use-package lsp-mode
  :commands (lsp)
  :hook (php-mode . lsp)
  :custom
  (lsp-ui-doc-use-webkit t)
  ;; Setup licence key.
  (lsp-intelephense-licence-key (replace-regexp-in-string "\n\\'" "" (shell-command-to-string "pass license/intelephense")))
  (lsp-headerline-breadcrumb-enable nil))

(with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(setq browse-url-browser-function #'eww-browse-url)

(provide 'init)

;;; init.el ends here
