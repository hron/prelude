(setq prelude-guru nil)
;(prelude-global-mode -1)
(setq prelude-whitespace t)

(setq dired-listing-switches "-ahl --group-directories-first")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(which-function-mode -1)
