;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Shahin Sorkh"
      user-mail-address "sorkh.shahin@hotmail.com")

(setq doom-font (font-spec :family "Jetbrains Mono" :size 13)
      doom-big-font (font-spec :family "Jetbrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13))

(setq doom-theme 'doom-one-light)

(setq display-line-numbers-type 'visual)

(setq org-directory "~/org/")

(setq evil-split-window-below t
      evil-vsplit-window-right t)
(setq evil-ex-substitute-global t)
(advice-add #'doom-modeline-segment--modals :override #'ignore)

(setq-hook! 'web-mode-hook lsp-svelte-plugin-svelte-format-enable nil)
(setq-hook! 'typescript-mode-hook lsp-javascript-format-enable nil)
(setq-hook! 'typescript-mode-hook lsp-typescript-format-enable nil)

