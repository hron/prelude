(prelude-require-package 'use-package)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

(prelude-require-package 'ipython-shell-send)
(use-package ipython-shell-send
  :bind (:map python-mode-map
              ([remap python-shell-send-region] . ipython-shell-send-region)
              ([remap python-shell-send-buffer] . ipython-shell-send-buffer)
              ([remap python-shell-send-defun] . ipython-shell-send-defun)))

(use-package anaconda-mode
  :bind (:map anaconda-mode-map
              ("C-i" . anaconda-mode-show-doc)
              ("C-b" . anaconda-mode-find-definitions)))

(prelude-require-package 'company-anaconda)
(use-package company-anaconda)

(prelude-require-package 'conda)
(use-package conda)
