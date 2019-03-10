(cua-mode +1)

(global-set-key (kbd "M-<down>") 'other-window)
(global-unset-key (kbd "C-x O"))
(global-set-key (kbd "M-<up>") (lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "S-<up>"))
(global-unset-key (kbd "S-<right>"))
(global-unset-key (kbd "S-<left>"))
(global-unset-key (kbd "S-<down>"))

(global-set-key (kbd "C-e") 'helm-mini)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
(global-set-key (kbd "C-p") help-map)
(global-set-key (kbd "C-h") 'er/expand-region)
(global-set-key (kbd "C-S-h") (lambda () (interactive) (er/expand-region -1)))
(global-set-key (kbd "<home>") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-M-l") 'indent-region)

(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(global-set-key (kbd "<escape>") 'keyboard-quit)

(global-set-key (kbd "M-`") 'magit-status)
(global-set-key (kbd "C-d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-S-d") 'crux-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "RET") 'indent-new-comment-line)
(global-set-key (kbd "M-S-<left>") 'pop-global-mark) 

(electric-pair-mode +1)

(define-key helm-map (kbd "<escape>") 'helm-keyboard-quit)
(define-key helm-map (kbd "C-p") help-map)

(define-key helm-moccur-mode-map (kbd "RET") 'helm-moccur-mode-goto-line-ow)

(global-set-key (kbd "C-M-<down>") 'next-error)
(global-set-key (kbd "C-M-<up>") (lambda () (interactive) (next-error -1)))

(setq select-enable-clipboard t)
(setq select-active-regions nil)

(horizontal-scroll-bar-mode -1)

(add-hook 'prog-mode-hook 'turn-off-smartparens-mode t)
(add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-mode t)
(add-hook 'emacs-lisp-mode-hook 'turn-off-smartparens-strict-mode t)
(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "C-/") 'comment-dwim)))
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)

(setq set-mark-command-repeat-pop t)

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

(electric-indent-mode +1)
;; Turn off electric indent in haml mode
(add-hook 'haml-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))
(add-hook 'ruby-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(setq-default truncate-lines t)
(setq helm-truncate-lines t)

(setq prelude-auto-save nil)
(add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)

(setq comment-empty-lines t)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;; (when (executable-find "ag")
;;   (setq helm-grep-default-command "ag --nocolor --nogroup %p %f"
;;         helm-grep-default-recurse-command "ag --nocolor --nogroup %p %f"))

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(prelude-require-package 'helm)
(require 'helm)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-a")  'helm-select-action) ; list actions using C-a
(define-key helm-map (kbd "C-z") 'undo-tree-undo)
(define-key helm-map (kbd "C-v") 'cua-paste)

(require 'helm-files)
(define-key helm-find-files-map (kbd "C-<backspace>") nil)
(define-key helm-find-files-map (kbd "C-z") 'undo-tree-undo)
(define-key helm-read-file-map (kbd "C-<backspace>") nil)

(prelude-require-package 'helm-projectile)
(require 'helm-projectile)
(define-key helm-projectile-find-file-map (kbd "C-<backspace>") nil)

(prelude-require-package 'helm-dash)
(setq helm-dash-docsets-path "C:/Users/aleks/AppData/Local/Zeal/Zeal/docsets")

;; Magit rebinds global keys, so we have to workaround this by making
;; local key bindings.
(add-hook 'magit-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-w") 'kill-this-buffer)
             (local-set-key (kbd "S-SPC") 'helm-projectile)))

(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

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


(setq company-active-map
      (let ((keymap (make-sparse-keymap)))
        (define-key keymap "\e\e\e" 'company-abort)
        (define-key keymap "\C-g" 'company-abort)
        (define-key keymap (kbd "M-n") 'company-select-next)
        (define-key keymap (kbd "M-p") 'company-select-previous)
        (define-key keymap (kbd "<down>") 'company-select-next-or-abort)
        (define-key keymap (kbd "<up>") 'company-select-previous-or-abort)
        (define-key keymap [remap scroll-up-command] 'company-next-page)
        (define-key keymap [remap scroll-down-command] 'company-previous-page)
        (define-key keymap [down-mouse-1] 'ignore)
        (define-key keymap [down-mouse-3] 'ignore)
        (define-key keymap [mouse-1] 'company-complete-mouse)
        (define-key keymap [mouse-3] 'company-select-mouse)
        (define-key keymap [up-mouse-1] 'ignore)
        (define-key keymap [up-mouse-3] 'ignore)
        (define-key keymap [tab] 'company-complete-selection)
        (define-key keymap (kbd "TAB") 'company-complete-selection)
        (define-key keymap (kbd "<f1>") 'company-show-doc-buffer)
        (define-key keymap (kbd "C-h") 'company-show-doc-buffer)
        (define-key keymap "\C-w" 'company-show-location)
        (define-key keymap "\C-F" 'company-filter-candidates)
        (dotimes (i 10)
          (define-key keymap (read-kbd-macro (format "M-%d" i)) 'company-complete-number))
        keymap))


(require 'prelude-packages)

