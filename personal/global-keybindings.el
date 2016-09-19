(global-unset-key (kbd "C-x p"))
(global-unset-key (kbd "C-x M-m"))
(global-set-key (kbd "C-x m") 'shell)
(global-set-key [f5] 'shell)
(global-unset-key [f12])
(global-set-key [f11] 'magit-status)
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-set-key [remap other-window] 'other-window)
(global-set-key (kbd "C-c g") 'helm-ag)
(global-set-key (kbd "S-SPC") 'helm-projectile)
(add-hook 'dired-mode-hook '(lambda ()
                              (local-set-key (kbd "S-SPC") 'helm-projectile)))
(global-set-key (kbd "S-M-SPC") 'helm-resume)
(global-set-key [f6] 'toggle-truncate-lines)
(global-set-key [f1] 'yari-helm)
(global-set-key [f2] 'winner-undo)
(global-set-key [f3] 'winner-redo)

(global-set-key "\C-xk" 'kill-this-buffer)

(global-set-key (kbd "C-c D") 'prelude-delete-file-and-buffer)
(global-set-key (kbd "C-M-5") 'anzu-query-replace-at-cursor-thing)
(global-set-key (kbd "C-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "RET") 'electric-newline-and-maybe-indent)
(global-set-key (kbd "C-j")
                '(lambda ()
                   (interactive)
                   (next-line)
                   (join-line)))

(global-set-key [f9] 'gusev-projectile-compile-project)
(defun gusev-projectile-compile-project (arg &optional dir)
  "Run project compilation command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG."
  (interactive "P")
  (let* ((project-root (projectile-project-root))
         (default-directory (or dir (projectile-compilation-dir)))
         (default-cmd (projectile-compilation-command default-directory))
         (compilation-cmd (if (or compilation-read-command arg)
                              (projectile-read-command "Compile command: "
                                                       default-cmd)
                            default-cmd)))
    (puthash default-directory compilation-cmd projectile-compilation-cmd-map)
    (save-some-buffers (not compilation-ask-about-save)
                       (lambda ()
                         (projectile-project-buffer-p (current-buffer)
                                                      project-root)))
    (compile compilation-cmd t)))


(defun gusev-clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-M-x") 'gusev-clear-shell)))

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'save-some-buffers)

(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-pop)

(global-set-key (kbd "C-w") 'kill-this-buffer)
(global-set-key (kbd "C-b") 'helm-mini)

(global-set-key (kbd "C-d") 'helm-dash-at-point)

(defun gusev-touch-current-file ()
  (interactive)
  (when (buffer-file-name)
    (if (buffer-modified-p)
        (save-buffer)
      (progn
        (shell-command (concat dired-touch-program " " (buffer-file-name)))
        (revert-buffer nil t)
        (message (concat "Touched " (buffer-file-name)))))))

(global-set-key (kbd "C-S-t") 'gusev-touch-current-file)
