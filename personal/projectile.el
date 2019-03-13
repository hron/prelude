;; (prelude-require-package 'ag)

(prelude-require-package 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-rails-keymap-prefix (kbd "C-c l"))

(eval-after-load 'projectile
  '(progn
     (defun projectile-run-compilation (cmd)
       "Run external or Elisp compilation command CMD."
       (if (functionp cmd)
           (funcall cmd)
         (compile cmd t)))

     (defun projectile-rails-test-at-point-cmd ()
       (let* ((current-file-relative-path
               (file-relative-name (buffer-file-name) (projectile-project-root)))
              (command (concat "./bin/rails test " current-file-relative-path)))         
         (compile (projectile-read-command "Test command: " command) t)))
     
     (define-key projectile-mode-map (kbd "C-c t") 'projectile-toggle-between-implementation-and-test)
     (define-key projectile-mode-map (kbd "C-S-t") 'projectile-toggle-between-implementation-and-test)
     (define-key projectile-mode-map (kbd "C-n") 'projectile-find-file)
     (define-key projectile-mode-map (kbd "C-S-n") 'projectile-find-file-dwim)
     (define-key projectile-mode-map (kbd "M-r") 'projectile-repeat-last-command)))
