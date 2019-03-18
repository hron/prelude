;; (prelude-require-package 'ag)

(prelude-require-package 'projectile-rails)
(diminish 'projectile-rails-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-rails-keymap-prefix (kbd "C-c l"))

(eval-after-load 'projectile
  '(progn
     (defun projectile-run-compilation (cmd)
       "Run external or Elisp compilation command CMD."
       (if (functionp cmd)
           (funcall cmd)
         (compile cmd t)))

     (defun projectile--minitest-extract-current-test-name-str ()
       (save-excursion
         (save-restriction
           (widen)
           (end-of-line)
           (or (re-search-backward "\\(test\\|def test\\|it\\) ['\"]\\(.+\\)['\"]" nil t)
               ))))

     (defun projectile-rails-minitest-test-at-point-cmd ()
       (let ((command "bin/rails test")
             command-to-execute)
         (when (buffer-file-name)
           (setq command (concat command " " (file-relative-name
                                              (buffer-file-name)
                                              (projectile-project-root)))))
         (when (projectile--minitest-extract-current-test-name-str)
           (setq command
                 (concat command
                         " --name=\"/"
                         (format "%s" (replace-regexp-in-string "[#:]" "." (match-string 2)))
                         "/\"")))
         (setq command-to-execute
               (if compilation-read-command
                   (projectile-read-command "Test command: " command)
                 (car compile-history)))
         (compile command-to-execute t)))

     (define-key projectile-mode-map (kbd "C-c t") 'projectile-toggle-between-implementation-and-test)
     (define-key projectile-mode-map (kbd "C-S-t") 'projectile-toggle-between-implementation-and-test)
     (define-key projectile-mode-map (kbd "C-n") 'projectile-find-file)
     (define-key projectile-mode-map (kbd "C-S-n") 'projectile-find-file-dwim)
     (define-key projectile-mode-map (kbd "M-r") 'projectile-repeat-last-command)))

(prelude-require-package 'helm-projectile)
(use-package helm-projectile
  :bind (:map helm-projectile-find-file-map
              ("C-<backspace>" . nil)
              :map projectile-mode-map
              ("C-n" . helm-projectile)))
