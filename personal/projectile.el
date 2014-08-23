(prelude-require-package 'ag)

(add-hook 'projectile-mode-hook 
          (lambda () 
            (local-set-key (kbd "C-c C-t") 'projectile-toggle-between-implementation-and-test)
            (local-set-key (kbd "C-c t") 'projectile-toggle-between-implementation-and-test)))
