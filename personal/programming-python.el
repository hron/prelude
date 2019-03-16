(prelude-require-package 'use-package)
(prelude-require-package 'ipython-shell-send)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

(use-package ipython-shell-send
  :bind (:map python-mode-map ([remap python-shell-send-region] . ipython-shell-send-region)))
