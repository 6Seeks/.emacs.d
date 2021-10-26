
;; fish like
(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))

(provide 'init-eshell)
