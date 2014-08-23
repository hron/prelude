(scroll-bar-mode -1)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b"))))

(disable-theme 'zenburn)
(prelude-require-package 'solarized-theme)
(load-theme 'solarized-light t)

(setq-default left-fringe-width 7)
