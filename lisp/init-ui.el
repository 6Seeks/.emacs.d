;; 关掉菜单栏、工具栏、滚动条等
(menu-bar-mode -1) 
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; 关掉启动界面
(setq inhibit-startup-screen t)



;; 采用的主题是 gruvbox-theme
(use-package gruvbox-theme 
	     :init (load-theme 'gruvbox-dark-soft t))



;; 行号
(use-package emacs 
    :config 
    (setq display-line-numbers-type 'relative) 
    (global-display-line-numbers-mode t))

(provide 'init-ui)
