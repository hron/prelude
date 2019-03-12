(global-unset-key (kbd "C-x p"))
(global-unset-key (kbd "C-x M-m"))
(global-set-key (kbd "C-x m") 'shell)
(global-set-key [f5] 'shell)
(global-unset-key [f12])
(global-set-key [f11] 'magit-status)
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-set-key [remap other-window] 'other-window)
(global-set-key (kbd "S-SPC") 'helm-projectile)
(add-hook 'dired-mode-hook '(lambda ()
                              (local-set-key (kbd "S-SPC") 'helm-projectile)))
(global-set-key (kbd "S-M-SPC") 'helm-resume)
(global-set-key (kbd "S-<return>") 'helm-resume)
(global-set-key [f6] 'toggle-truncate-lines)
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

(defun gusev-clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-M-x") 'gusev-clear-shell)))

(global-set-key (kbd "C-s") (lambda () (interactive) (save-some-buffers +1)))

(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-v") 'cua-paste)

(global-set-key (kbd "C-w") 'kill-this-buffer)

(global-set-key (kbd "M-S-<left>") 'previous-buffer) 
(global-set-key (kbd "M-S-<right>") 'next-buffer) 
