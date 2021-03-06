(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(blink-cursor-mode t)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-type 'bar)
 '(custom-safe-themes
   '("b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" default))
 '(fci-rule-color "#eee8d5")
 '(helm-ag-insert-at-point t)
 '(helm-external-programs-associations '(("clj" . "konsole") (nil . "konsole")))
 '(helm-ff-skip-boring-files t)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100)))
 '(hl-sexp-background-color "#efebe9")
 '(magit-diff-use-overlays nil)
 '(magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
 '(magit-push-always-verify nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   '(ggtags clojure-mode company helm ido-completing-read+ which-key conda ess anaconda-mode ipython-shell-send use-package "back-button" powerline helm-dash web-beautify textile-mode evernote-mode edit-server cmake-mode zenburn-theme yari yaml-mode web-mode volatile-highlights undo-tree solarized-theme smex smartrep smartparens slime scss-mode sass-mode ruby-tools robe rainbow-mode rainbow-delimiters projectile-rails ov operate-on-number move-text markdown-mode magit json-mode js2-mode ido-ubiquitous helm-projectile helm-descbinds helm-ag haskell-mode guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido feature-mode expand-region elisp-slime-nav easy-kill discover-my-major diminish diff-hl csv-mode company-anaconda coffee-mode cider browse-kill-ring anzu ag ace-window ace-jump-buffer))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((encoding . binary)
     (conda-project-env-name . machine-learning-a-z)
     (eval progn
           (setq projectile-project-test-cmd #'projectile-rails-minitest-test-at-point-cmd))
     (mangle-whitespace . t)
     (org-not-done-heading-regexp . "^\\(\\*+\\)\\(?: +\\(TODO\\|George\\|Nila\\|Matt\\|Shawn\\|Lena\\|Ded\\|Sasha\\|Mikhaylovsky\\|Pavel\\|Slava\\|Sergey\\|Shostak\\|Mama\\|Mikhnovets\\|WAIT\\)\\)\\(?: +\\(.*?\\)\\)?[	]*$")
     (encoding . utf-8)
     (ruby-test-implementation-filename-mapping
      ("\\(.*\\)\\(test/unit/gateways/\\)\\(.*\\)\\([^/]*\\)\\(_test\\)\\(\\.rb\\)$" "\\1lib/active_merchant/billing/gateways/\\3\\4\\6"))
     (ruby-test-specification-filename-mapping
      ("\\(.*\\)\\(lib/active_merchant/billing/gateways/\\)\\(.*\\)\\(\\.rb\\)$" "\\1test/unit/gateways/\\3_test\\4"))
     (eval when
           (fboundp 'rainbow-mode)
           (rainbow-mode 1))
     (eval font-lock-add-keywords nil
           `((,(concat "("
                       (regexp-opt
                        '("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl")
                        t)
                       "\\_>")
              1 'font-lock-variable-name-face)))
     (eval when
           (require 'rainbow-mode nil t)
           (rainbow-mode 1))))
 '(sp-base-key-bindings nil)
 '(tags-revert-without-query t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "DAMA" :family "Input Mono"))))
 '(mode-line ((t (:background "#2B2B2B" :foreground "#8FB28F" :box (:line-width -1 :style released-button) :weight normal :height 0.95 :width condensed))))
 '(mode-line-inactive ((t (:background "#383838" :foreground "#5F7F5F" :box (:line-width -1 :style released-button) :height 0.95)))))
