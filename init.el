(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)


(setq package-archives '(
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ))

(setq package-check-signature nil)

(require 'package)

(unless (bound-and-true-p package--initialized)
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package restart-emacs
  :ensure t)

(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))


(use-package emacs
  :ensure t
  :config
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  )

(use-package drag-stuff
  :ensure t
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))



(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))




;;  default backends
;;  (company-bbdb company-semantic company-cmake company-capf company-clang company-files (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev)
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0
	company-show-numbers t)
  )


(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-clients-pylsp-library-directories "/home/yangtao/miniconda3/bin/")
  (setq lsp-pylsp-plugins-autopep8-enabled t)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t 
  :commands lsp-treemacs-errors-list)


;; optional if you want which-key integration
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

(use-package ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)
  )

;; ibuffer
(use-package ibuffer
  :ensure t
  :init (defalias 'list-buffers 'ibuffer))


(use-package tramp
  :ensure t
  :init
  (setq tramp-default-method "ssh"))


(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t) 
  (setq sml/theme 'respectful) 
  (sml/setup))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(smart-mode-line which-key lsp-treemacs lsp-ui lsp-mode company yasnippet exec-path-from-shell rainbow-delimiters drag-stuff gruvbox-theme restart-emacs use-package cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
