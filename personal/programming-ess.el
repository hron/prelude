(prelude-require-package 'ess)

(use-package ess
  :bind (:map ess-mode-map
              ("M-e" . ess-eval-region)))
