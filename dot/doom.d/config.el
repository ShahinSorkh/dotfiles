;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Shahin Sorkh"
      user-mail-address "sorkh.shahin@hotmail.com")

(setq doom-font (font-spec :family "Jetbrains Mono" :size 16)
      doom-big-font (font-spec :family "Jetbrains Mono" :size 19)
      doom-unicode-font (font-spec :family "Vazir Code" :size 16)
      doom-variable-pitch-font (font-spec :family "Vazirmatn" :size 16))

(setq doom-theme 'doom-one-light)

(setq display-line-numbers-type 'visual)

(setq org-directory "~/org/")

(setq evil-split-window-below t
      evil-vsplit-window-right t)
(setq evil-ex-substitute-global t)
(advice-add #'doom-modeline-segment--modals :override #'ignore)

(setq projectile-project-search-path '(("~/code" . 3)))

(after! web-mode
    (setq-hook! 'web-mode-hook lsp-svelte-plugin-svelte-format-enable nil))
(after! javascript-mode
    (setq-hook! 'typescript-mode-hook lsp-javascript-format-enable nil)
    (setq-hook! 'typescript-mode-hook lsp-typescript-format-enable nil))

(after! magit
    (setq forge-topic-list-limit -1)
    (magit-add-section-hook 'magit-status-sections-hook 'forge-insert-assigned-pullreqs nil t)
    (magit-add-section-hook 'magit-status-sections-hook 'forge-insert-assigned-issues nil t))

(after! lsp-mode
    (advice-add 'json-parse-string :around
        (lambda (orig string &rest rest)
            (apply orig (s-replace "\\u0000" "" string)
                rest)))
    (advice-add 'json-parse-buffer :around
        (lambda (&rest rest)
            (while (re-search-forward "\\u0000" nil t)
                (replace-match ""))
            (apply rest))))
