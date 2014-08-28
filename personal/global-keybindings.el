(global-unset-key (kbd "C-x p"))
(global-unset-key (kbd "C-x M-m"))
(global-set-key (kbd "C-x m") 'shell)
(global-set-key [f5] 'shell)
(global-unset-key [f12])
(global-set-key [f11] 'magit-status)
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
(global-set-key [remap other-window] 'other-window)
(global-set-key (kbd "C-c g") 'ag)
(global-set-key (kbd "S-SPC") 'helm-prelude)
(global-set-key [f6] 'toggle-truncate-lines)
(global-set-key [f2] 'winner-undo)
(global-set-key [f3] 'winner-redo)

(global-set-key "\C-xk" 'kill-this-buffer)

(global-set-key (kbd "C-c D") 'prelude-delete-file-and-buffer)

(global-set-key [f9] '(lambda (command &optional comint)
			(interactive
                         (list
                          (let ((command (eval compile-command)))
                            (if (or compilation-read-command current-prefix-arg)
				(compilation-read-command command)
                              command))
                          (consp current-prefix-arg)))
			(setq comint (not comint))
			(compile command comint)))

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
