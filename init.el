
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

(use-package format-all
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'format-all-mode
	    'format-all-mode-hook 'format-all-ensure-formatter)
  :bind (("C-c f" . format-all-buffer))
  )

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
  :bind (("C-c n" . company-other-backend))
  )


(use-package eglot
  :ensure t
  :init
  (add-hook 'python-mode-hook 'eglot-ensure)
  )


(add-hook 'eglot-managed-mode-hook (lambda () (setq-local company-backends '((company-keywords company-capf company-dabbrev-code) company-files))))



(use-package tex
  :ensure auctex
  :config
  (setq TeX-view-program-list '(("Evince" "evince %o")))
  (setq TeX-engine 'xelatex)
  )

(use-package reftex
  :ensure t
  :init
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  :config
  (setq reftex-toc-split-windows-horizontally t)
  (setq reftex-toc-split-windows-fraction 0.2)
  )

(use-package company-auctex
  :ensure t
  )

(use-package company-reftex
  :ensure t
  )


(add-hook 'LaTeX-mode-hook (lambda ()
			     (setq-local company-backends
					 '((company-auctex-macros company-auctex-symbols company-auctex-environments company-reftex-labels company-reftex-citations) company-ispell company-files)
					 )))




(use-package ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)
  )

;; ibuffer
(use-package ibuffer
  :init (defalias 'list-buffers 'ibuffer))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(format-all-default-formatters
   '(("Assembly" asmfmt)
     ("ATS" atsfmt)
     ("Bazel" buildifier)
     ("BibTeX" emacs-bibtex)
     ("C" clang-format)
     ("C#" clang-format)
     ("C++" clang-format)
     ("Cabal Config" cabal-fmt)
     ("Clojure" cljfmt)
     ("CMake" cmake-format)
     ("Crystal" crystal)
     ("CSS" prettier)
     ("Cuda" clang-format)
     ("D" dfmt)
     ("Dart" dart-format)
     ("Dhall" dhall)
     ("Dockerfile" dockfmt)
     ("Elixir" mix-format)
     ("Elm" elm-format)
     ("Emacs Lisp" emacs-lisp)
     ("F#" fantomas)
     ("Fish" fish-indent)
     ("Fortran Free Form" fprettify)
     ("GLSL" clang-format)
     ("Go" gofmt)
     ("GraphQL" prettier)
     ("Haskell" brittany)
     ("HTML" html-tidy)
     ("Java" clang-format)
     ("JavaScript" prettier)
     ("JSON" prettier)
     ("Jsonnet" jsonnetfmt)
     ("JSX" prettier)
     ("Kotlin" ktlint)
     ("LaTeX" latexindent)
     ("Less" prettier)
     ("Literate Haskell" brittany)
     ("Lua" lua-fmt)
     ("Markdown" prettier)
     ("Nix" nixpkgs-fmt)
     ("Objective-C" clang-format)
     ("OCaml" ocp-indent)
     ("Perl" perltidy)
     ("PHP" prettier)
     ("Protocol Buffer" clang-format)
     ("PureScript" purty)
     ("Python" yapf)
     ("R" styler)
     ("Reason" bsrefmt)
     ("ReScript" rescript)
     ("Ruby" rufo)
     ("Rust" rustfmt)
     ("Scala" scalafmt)
     ("SCSS" prettier)
     ("Shell" shfmt)
     ("Solidity" prettier)
     ("SQL" sqlformat)
     ("Svelte" prettier)
     ("Swift" swiftformat)
     ("Terraform" terraform-fmt)
     ("TOML" prettier)
     ("TSX" prettier)
     ("TypeScript" prettier)
     ("V" v-fmt)
     ("Verilog" istyle-verilog)
     ("Vue" prettier)
     ("XML" html-tidy)
     ("YAML" prettier)
     ("_Angular" prettier)
     ("_Flow" prettier)
     ("_Gleam" gleam)
     ("_Ledger" ledger-mode)
     ("_Nginx" nginxfmt)
     ("_Snakemake" snakefmt)))
 '(package-selected-packages
   '(magit use-package restart-emacs rainbow-delimiters gruvbox-theme format-all exec-path-from-shell eglot drag-stuff company-reftex company-auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
