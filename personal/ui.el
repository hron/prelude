(scroll-bar-mode -1)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b"))))

(fringe-mode '(12 . 12))

(setq use-dialog-box nil)

(when (or (equal system-type 'windows-nt) (equal system-type 'cygwin))
  (set-face-attribute 'default nil :font "InputMono-11"))

;; (prelude-require-package 'material-theme)
;; (disable-theme 'zenburn)
;; (load-theme 'material-light t)

(prelude-require-package 'powerline)
(powerline-default-theme)
