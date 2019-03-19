(setq prelude-guru nil)
;(prelude-global-mode -1)
(setq prelude-whitespace t)

(use-package whitespace
  :init
  (setq whitespace-line-column nil)
  :diminish whitespace-mode)

(setq dired-listing-switches "-ahl --group-directories-first")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(which-function-mode -1)
