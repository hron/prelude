;; (prelude-require-package 'ag)

(defun gusev-projectile-rerun ()
  (interactive)
  "Rerun the latest shell command."
  (gusev-projectile-rails-run-test-at-cursor (first shell-command-history)))

(add-hook 'projectile-mode-hook 
          (lambda () 
            (local-set-key (kbd "C-c t") 'projectile-toggle-between-implementation-and-test)
            (local-set-key (kbd "C-S-t") 'projectile-toggle-between-implementation-and-test)
            (local-set-key (kbd "C-S-n") 'projectile-find-file)
            (local-set-key (kbd "M-r") 'gusev-projectile-rerun)))
