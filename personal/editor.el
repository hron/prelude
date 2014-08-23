(cua-mode +1)
(global-set-key (kbd "C-y") 'undo-tree-redo)

(global-set-key (kbd "M-<down>") 'ace-window)
(global-unset-key (kbd "C-x O"))
(global-set-key (kbd "M-<up>") (lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<down>"))
