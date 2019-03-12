;;; aleksei-ruby.el ---
;;
;; Copyright © 2011-2013 Aleksei Gusev
;;
;; Author: Aleksei Gusev <aleksei.gusev@gmail.com>
;; URL: https://github.com/hron/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-packages)

(prelude-require-package 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(defun gusev-robe-jump ()
  "Pushes mark and then jump"
  (interactive)
  (push-mark)
  (call-interactively 'robe-jump))

(add-hook 'robe-mode-hook (lambda ()
                            (local-set-key (kbd "C-b") 'gusev-robe-jump)
                            (local-set-key (kbd "M-.") 'gusev-robe-jump)
                            (local-set-key (kbd "<f1>") 'robe-doc)
                            (local-set-key (kbd "C-i") 'robe-doc)
                            (eldoc-mode +1)))

(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))

(defun guard (dir)
  "*Run guard in DIR."
  (interactive "DDirectory with Guardfile: ")
  (if (file-exists-p (concat dir "/Guardfile"))
      (let* ((buffer-name (concat "*guard*<" dir ">"))
             (command "resetrails; bundle exec guard"))
        (gusev-shell-run dir command buffer-name))
    (message (concat "Can't find Guardfile inside " dir))))

(defun gusev-shell-run (dir command buffer-name)
  (let* ((buffer (shell buffer-name)))
    (with-current-buffer buffer
      (shell-cd dir)
      (comint-send-string buffer (concat "cd " dir "; " command "\n")))))

(defun gusev-projectile-rails-run-test-at-cursor (command)
  "Invoke test at cursor using `async-shell-command' in the project's root."
  (interactive
   (list
    (read-shell-command "Run test at point: "
                        (concat "./bin/rails test " (file-relative-name (buffer-file-name) (projectile-project-root))))))
  (let* ((output-buffer-name "*projectile-rails-test*")
         error-buffer
         (output-buffer (get-buffer output-buffer-name)))
    (save-some-buffers +1)
    (and output-buffer (kill-buffer output-buffer))
    (projectile-with-default-dir (projectile-ensure-project (projectile-project-root))         
      (async-shell-command command output-buffer-name error-buffer))
    (setq inf-ruby-buffer output-buffer-name)
    (push (get-buffer output-buffer-name) inf-ruby-buffers)))


(prelude-require-package 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-rails-keymap-prefix (kbd "C-c l"))
(add-hook 'ruby-mode-hook
          (lambda ()
            (interactive)
            (local-set-key (kbd "C-c C-c") 'gusev-projectile-rails-run-test-at-cursor)))

(setq ruby-deep-indent-paren '(?\( t))

(add-hook 'ruby-mode-hook (lambda ()
                            (interactive)
                            (eldoc-mode -1)))

(add-hook 'ruby-mode-hook (lambda () (local-set-key (kbd "M-e") 'ruby-send-region)))

(defun ag-set-inf-ruby-buffer-to-current ()
  "Sets `inf-ruby-buffer' variable to current buffer"
  (interactive)
  (setq inf-ruby-buffer (buffer-name (current-buffer))))

;; Monkey patch to avoid binding changing when sending region for
;; eval. I usually run pry with binding is already configured, so
;; inf-ruby ruins this workflow.
(eval-after-load 'inf-ruby
  '(defun ruby-send-region (start end)
     "Send the current region to the inferior Ruby process."
     (interactive "r")
     (let (term (file (or buffer-file-name (buffer-name))) line)
       (save-excursion
         (save-restriction
           (widen)
           (goto-char start)
           (setq line (+ start (forward-line (- start)) 1))
           (goto-char start)
           (while (progn
                    (setq term (apply 'format ruby-send-terminator (random) (current-time)))
                    (re-search-forward (concat "^" (regexp-quote term) "$") end t)))))
       ;; compilation-parse-errors parses from second line.
       (save-excursion
         (let ((m (process-mark (inf-ruby-proc))))
           (set-buffer (marker-buffer m))
           (goto-char m)
           (insert ruby-eval-separator "\n")
           (set-marker m (point))))
       ;; (comint-send-string (inf-ruby-proc) (format "eval <<'%s', %s, %S, %d\n"
       ;;                                             term inf-ruby-eval-binding
       ;;                                             file line))
       (comint-send-region (inf-ruby-proc) start end)
       ;; (comint-send-string (inf-ruby-proc) (concat "\n" term "\n"))
       (comint-send-string (inf-ruby-proc) "\n")
       )))

(add-hook 'feature-mode-hook '(lambda () (flyspell-mode 1)))

;; (prelude-require-package 'rspec-mode)

(provide 'aleksei-ruby)
;;; aleksei-ruby.el ends here
