(scroll-bar-mode -1)

(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b"))))

(setq-default left-fringe-width 7)

(setq use-dialog-box nil)

;; (prelude-require-package 'material-theme)
;; (disable-theme 'zenburn)
;; (load-theme 'material-light t)

;; (prelude-require-package 'leuven-theme)
;; (disable-theme 'zenburn)
;; (load-theme 'leuven t)

(when (or (equal system-type 'windows-nt) (equal system-type 'cygwin))
  (set-face-attribute 'default nil :font "InputMono Medium-11"))
