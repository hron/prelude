(prelude-require-package 'use-package)
(prelude-require-package 'ess)

(use-package ess-mode
  :bind (:map ess-mode-map
              ("M-e" . ess-eval-region)))
