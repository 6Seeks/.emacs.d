(setq package-archives '(
    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") 
    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))


(setq package-check-signature nil) ;个别时候会出现签名校验失败
 (require 'package) ;; 初始化包管理器
 (unless (bound-and-true-p package--initialized) 
    (package-initialize)) ;; 刷新软件源索引
 (unless package-archive-contents
     (package-refresh-contents))

(unless (package-installed-p 'use-package) 
    (package-refresh-contents) 
    (package-install 'use-package))


(eval-and-compile 
    (setq use-package-always-ensure t) ;不用每个包都手动添加:ensure t关键字 
    (setq use-package-always-defer t) ;默认都是延迟加载，不用每个包都手动添加:defer t 
    (setq use-package-always-demand nil) 
    (setq use-package-expand-minimally t) 
    (setq use-package-verbose t))


;; add lisp dir
(add-to-list 'load-path 
    (expand-file-name (concat user-emacs-directory "lisp")))



(require 'init-utf8)
(require 'init-ui)
(require 'init-gc)
(require 'init-enhance)
(require 'init-company)
(require 'init-eshell)
(require 'init-lsp)
(require 'init-latex)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(latex-preview-pane use-package py-yapf lsp-ui gruvbox-theme flycheck drag-stuff company auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
