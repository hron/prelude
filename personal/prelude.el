(setq prelude-guru nil)
(prelude-global-mode -1)

(setq dired-listing-switches "-ahl --group-directories-first")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
