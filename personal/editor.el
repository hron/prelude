(cua-mode +1)
(global-set-key (kbd "C-y") 'undo-tree-redo)

(global-set-key (kbd "M-<down>") 'other-window)
(global-unset-key (kbd "C-x O"))
(global-set-key (kbd "M-<up>") (lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<down>"))

(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(setq x-select-enable-clipboard t)
(setq select-active-regions nil)

;; (setq sp-keymap (make-sparse-keymap))
;; (setq sp-base-key-bindings 'smartparens)
;; (sp-use-smartparens-bindings)
(setq sp-override-key-bindings '(("M-s" . nil)
                                 ("M-<up>" . nil)
                                 ("M-<down>" . nil)
                                 ("M-r" . nil)
                                 ("C-)" . nil)
                                 ("C-<right>" . nil)
                                 ("C-}" . nil)
                                 ("C-<left>" . nil)
                                 ("C-(" . nil)
                                 ("C-M-<left>" . nil)
                                 ("C-{" . nil)
                                 ("C-M-<right>" . nil)
                                 ("M-S" . nil)
                                 ("S-<space>" . nil)
                                 ))
(sp--update-override-key-bindings)

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(setq set-mark-command-repeat-pop t)

(setq browse-url-generic-program "xdg-open")
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-new-window-flag 1)

(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)

(setq shell-prompt-pattern "^.*[#$%>] *")

(setq magit-status-buffer-switch-function 'switch-to-buffer)

(setq compilation-error-regexp-alist
      '(
        ;; Forget all errors on each guard run.
        ("^\\(?:[0-9][0-9]:[0-9][0-9]:[0-9][0-9] - INFO - \\)?Running" nil nil nil nil nil
         (0 (progn (compilation-forget-errors)
                   nil)))
        ;; Bottom messages of rspec run
        ("\\(?:^rspec\\(?: -p [^[:space:]]+\\)?\\|#\\)\\(?: \\)\\([^\(].*\\):\\([1-9][0-9]*\\)" 1 2)
        ;; Bottom messages of cucumber run
        ;;   ("\\(?:^cucumber\\(?: -p [^[:space:]]+\\)?\\|#\\)\\(?:
        ;; \\)\\([^\(].*\\):\\([1-9][0-9]*\\)" 1 2)
        ;; Ruby
        ("^[\t ]*\\(?:from \\)?\\([^\(\n][^[:space:]\n]*\\):\\([1-9][0-9]*\\)\\(:in `.*'\\)?.*$" 1 2)
        ;; Ruby's Test::Unit
        ("[\t ]*\\[\\([^\(].*\\):\\([1-9][0-9]*\\)\\(\\]\\)?:" 1 2)
        cucumber
        gnu
        bash
        gcc-include
        ))
(setq comint-scroll-to-bottom-on-output 'others)
(add-hook 'compilation-mode-hook '(lambda () (local-set-key "\C-cg" 'ag)))

(require 'desktop)
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (ido-last-directory-list  . 100)
                (ido-work-directory-list  . 100)
                (ido-work-file-list       . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))
(add-hook 'desktop-before-save-hook 'clean-buffer-list)
(setq-default desktop-path '("." "~/.emacs.d"))
(setq desktop-save 'ask-if-new)
(desktop-save-mode 1)

