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

(defun guard (dir)
  "*Run guard in DIR."
  (interactive "DDirectory with Guardfile: ")
  (when (file-exists-p (concat dir "Guardfile"))
    (let* ((buffer-name (concat "*guard*<" dir ">"))
           (command "resetrails; bundle exec guard"))
      (gusev-shell-run dir command buffer-name))))

(defun gusev-shell-run (dir command buffer-name)
  (let* ((buffer (shell buffer-name)))
    (with-current-buffer buffer
      (shell-cd dir)
      (comint-send-string buffer (concat "cd " dir "; " command "\n")))))

(provide 'aleksei-ruby)
;;; aleksei-ruby.el ends here
