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

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(after! lsp-mode
  (defun my/eslint-format ()
    (interactive
     (if-let ((eslint (-first (lambda (wks)
                                (eq 'eslint (lsp--client-server-id
                                             (lsp--workspace-client wks))))
                              (lsp-workspaces))))
         (with-lsp-workspace eslint
           (lsp-format-buffer))
       (lsp-format-buffer))))
  (setq-hook! 'typescript-mode-hook +format-with 'my/eslint-format))

(after! php
  (setq-hook! 'php-mode-hook +format-with-lsp nil)
  (setq-hook! 'php-mode-hook +format-with nil)
  (add-hook! 'php-mode-hook
    (setq php-cs-fixer-command
          (let ((local-bin (concat (doom-project-root) "vendor/bin/php-cs-fixer")))
            (if (file-exists-p local-bin)
                local-bin
              (executable-find "php-cs-fixer")))))
  (setq-hook! 'php-mode-hook php-cs-fixer-config-option
              (concat (doom-project-root) ".php-cs-fixer.dist.php"))
  (setq-hook! 'php-mode-hook php-cs-fixer-rules-level-part-options
              '("@PSR1" "@PSR2" "@PSR12" "@PSR12:risky" "@Symfony" "@Symfony:risky"))
  (setq-hook! 'php-mode-hook php-cs-fixer-rules-fixer-part-options
              '("array_indentation" "explicit_indirect_variable" "method_chaining_indentation" "-yoda_style" "-psr0"))
  (set-formatter! 'php-cs-fixer #'php-cs-fixer-before-save :modes '(php-mode)))
