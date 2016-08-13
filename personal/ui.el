(scroll-bar-mode -1)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b"))))

(setq-default left-fringe-width 7)

(setq use-dialog-box nil)

(prelude-require-package 'color-theme-solarized)
