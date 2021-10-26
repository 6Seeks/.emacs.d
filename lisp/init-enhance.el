;; yes -> y; no --> n
(use-package emacs :config (defalias 'yes-or-no-p 'y-or-n-p))
;; 箭头移动代码块
(use-package drag-stuff 
  :bind (("<M-up>". drag-stuff-up) 
         ("<M-down>" . drag-stuff-down)))




;; Ido ( instead of ivy & counsel & swiper)
(setq-default ido-auto-merge-work-directories-length -1
	      ido-enable-flex-matching t
	      isearch-lazy-count t
	      lazy-count-prefix-format "%s/%s: ")
(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".class"))
(fido-mode t)




;; python format
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

;; WindMove
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; eldoc
(add-hook 'prog-mode 'eldoc-mode)

(provide 'init-enhance)
