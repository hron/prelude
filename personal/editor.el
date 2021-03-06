(prelude-require-package 'use-package)
(cua-mode +1)

(global-set-key (kbd "M-<down>") 'other-window)
(global-unset-key (kbd "C-x O"))
(global-set-key (kbd "M-<up>") (lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<down>"))

(global-set-key (kbd "C-S-z") 'undo-tree-redo)
(global-set-key (kbd "C-h") 'er/expand-region)
(global-set-key (kbd "C-S-h") (lambda () (interactive) (er/expand-region -1)))
(global-set-key (kbd "<home>") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-M-l") 'indent-region)

(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(global-set-key (kbd "<escape>") 'keyboard-quit)

(global-set-key (kbd "C-d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-S-d") 'crux-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "RET") 'indent-new-comment-line)

(electric-indent-mode +1)
(electric-pair-mode +1)

(define-key global-map (kbd "C-p")  help-map)

(prelude-require-package 'helm)
(use-package helm
  :init
  (setq helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match    t
        helm-M-x-fuzzy-match      t)
  (when (executable-find "ack-grep")
    (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
          helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))
  ;; (when (executable-find "ag")
  ;;   (setq helm-grep-default-command "ag --nocolor --nogroup %p %f"
  ;;         helm-grep-default-recurse-command "ag --nocolor --nogroup %p %f"))
  :config
  (require 'subr-x)
  (defvar helm-source-emacs-process
    (helm-build-sync-source "Emacs Process"
      :init (lambda ()
              (let (tabulated-list-use-header-line)
                (list-processes--refresh)))
      :candidates (lambda () (mapcar
                              (lambda (process)
                                (concat (process-name process)
                                        " ["
                                        (string-join (process-command process) " ")
                                        "] "))
                              (process-list)))
      :persistent-action (lambda (elm)
                           (delete-process (get-process elm))
                           (helm-delete-current-selection))
      :persistent-help "Kill Process"
      :action (helm-make-actions "Kill Process"
                                 (lambda (_elm)
                                   (cl-loop for p in (helm-marked-candidates)
                                            do (delete-process (get-process p)))))))
  :bind (("C-e" . helm-mini)
         ("C-<f2>" . helm-list-emacs-process)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
         ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
         ("C-a" . helm-select-action) ; list actions using C-a
         ("C-z" . undo-tree-undo)
         ("<escape>" . helm-keyboard-quit)
         :map helm-moccur-mode-map
         ("RET" . helm-moccur-mode-goto-line-ow)))

(global-set-key (kbd "C-M-<down>") 'next-error)
(global-set-key (kbd "C-M-<up>") (lambda () (interactive) (next-error -1)))

(setq select-enable-clipboard t)
(setq select-active-regions nil)

(horizontal-scroll-bar-mode -1)

(add-hook 'prog-mode-hook 'turn-off-smartparens-mode t)
(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "C-/") 'comment-dwim)))
(prelude-require-package 'ggtags)
(use-package ggtags
  :hook (prog-mode . ggtags-mode))

(global-eldoc-mode +1)

(add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-mode t)
(add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-strict-mode t)
(add-hook 'emacs-lisp-mode-hook
          (lambda () (local-set-key (kbd "C-b") 'elisp-slime-nav-find-elisp-thing-at-point)))
(add-hook 'emacs-lisp-mode-hook (lambda () (electric-indent-local-mode -1)))
(remove-hook 'minibuffer-setup-hook 'conditionally-enable-smartparens-mode)

(define-key minibuffer-inactive-mode-map (kbd "<escape>") 'keyboard-quit)

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(setq set-mark-command-repeat-pop t)

(setq browse-url-new-window-flag 1)

(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)

(setq shell-prompt-pattern "^.*[#$%>] *")

(setq compilation-error-regexp-alist
      '(
        ;; Bottom messages of rspec run
        ("\\(?:^rspec\\(?: -p [^[:space:]]+\\)?\\|#\\)\\(?: \\)\\([^\(].*\\):\\([1-9][0-9]*\\)" 1 2)
        ;; Bottom messages of cucumber run
        ;;   ("\\(?:^cucumber\\(?: -p [^[:space:]]+\\)?\\|#\\)\\(?:
        ;; \\)\\([^\(].*\\):\\([1-9][0-9]*\\)" 1 2)
        ;; Ruby
        ("^[\t ]*\\(?:from \\)?\\([^\(\n][^[:space:]\n]*\\):\\([1-9][0-9]*\\)\\(:in `.*'\\)?.*$" 1 2)
        ;; Ruby's Test::Unit
        ("[\t ]*\\[\\([^\(].*\\):\\([1-9][0-9]*\\)\\(\\]\\)?:" 1 2)
        ;; Pry's binding.pry
        ;; From: /home/aleksei/src/hms-dev/baweb/app/models/air/book_a_seat/reservation.rb @ line 429 Air::BookASeat::Reservation#number_of_seats_must_be_available:
        ("\\(?:^From: \\|#\\)\\([^\(].*\\) @ line \\([1-9][0-9]*\\)" 1 2)
        cucumber
        gnu
        bash
        gcc-include
        ))
(setq comint-scroll-to-bottom-on-output 'others)
;; for zsh extended history...
(setq comint-input-ring-separator "\\(\n\\|:[[:space:]]+[[:digit:]]+:[[:digit:]]+;\\)")

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

;; Turn off electric indent in haml mode
(add-hook 'haml-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))
(add-hook 'ruby-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(setq-default truncate-lines t)

(setq prelude-auto-save nil)
(add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)

(setq comment-empty-lines t)


(require 'helm-files)
(define-key helm-find-files-map (kbd "C-<backspace>") nil)
(define-key helm-find-files-map (kbd "C-z") 'undo-tree-undo)
(define-key helm-read-file-map (kbd "C-<backspace>") nil)


(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

(when (equal system-type 'windows-nt)
  (setq fakecygpty-program (expand-file-name "vendor/fakecygpty/fakecygpty.exe" prelude-dir)
        fakecygpty-qkill-program (expand-file-name "vendor/fakecygpty/qkill.exe" prelude-dir))
  (if (file-executable-p fakecygpty-program)
      (progn
        (require 'fakecygpty)
        (fakecygpty-activate))
    (message "Compile fakecygpty.exe in .emacs.d/vendor/fakecygpty")))

;; Flycheck for ruby is really slow on windows
(when (equal system-type 'windows-nt)
  (global-flycheck-mode -1))

(require 'company)
(define-key company-active-map (kbd "<escape>") 'company-abort)

(setq search-exit-option 'edit)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "S-<return>") 'isearch-repeat-backward)
(define-key isearch-mode-map [return] 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "<escape>") 'isearch-exit)
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
(define-key minibuffer-local-isearch-map (kbd "<escape>") 'exit-minibuffer)
(define-key minibuffer-local-isearch-map (kbd "C-f") 'isearch-forward-exit-minibuffer)
(define-key minibuffer-local-isearch-map (kbd "C-r") 'isearch-backward-exit-minibuffer)
(define-key minibuffer-local-isearch-map (kbd "C-v") 'isearch-yank-kill)
;; (remove-hook 'isearch-mode-hook 'isearch-yank-kill)

(defvar gusev-diminish-modes
  '(company-mode
    editorconfig-mode
    projectile-mode
    projectile-rails-mode
    super-save-mode
    which-key-mode
    helm-mode
    prelude-mode
    compilation-in-progress
    robe-mode
    global-robe-mode
    flycheck-mode
    flyspell-mode
    beacon-mode
    subword-mode
    abbrev-mode)
  "A list of minor modes to hide in mode-line")
(add-hook 'subword-mode-hook (lambda () (diminish 'subword-mode)))
(add-hook 'abbrev-mode-hook (lambda () (diminish 'abbrev-mode)))
(add-hook 'dired-omit-mode-hook (lambda () (diminish 'dired-omit-mode)))
(mapc 'diminish gusev-diminish-modes)

(define-key comint-mode-map (kbd "C-r") 'comint-history-isearch-backward)

;; (define-key transient-base-map (kbd "<escape>") 'transient-quit-one)
(use-package transient
  :bind (:map transient-base-map ("<escape>" . transient-quit-one)))

(prelude-require-package 'magit)
(setq magit-status-buffer-switch-function 'switch-to-buffer)
(global-set-key (kbd "M-`") 'magit-status)
(use-package magit
  :bind (:map magit-mode-map ("C-w" . kill-this-buffer)))

(require 'prelude-packages)
