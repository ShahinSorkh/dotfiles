;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shahin Sorkh"
      user-mail-address "sorkh.shahin@hotmail.com")

(set-email-account! "sorkh.shahin@hotmail.com"
                    '((mu4e-sent-folder                 . "/sorkh.shahin@hotmail.com/Sent")
                      (mu4e-drafts-folder            . "/sorkh.shahin@hotmail.com/Drafts")
                      (mu4e-trash-folder             . "/sorkh.shahin@hotmail.com/Deleted")
                      (mu4e-refile-folder            . "/sorkh.shahin@hotmail.com/All")
                      (mu4e-compose-signature        . "\nBest regards,\nShSo")
                      (smtpmail-smtp-server          . "smtp.office365.com")
                      (smtpmail-smtp-user            . "sorkh.shahin@hotmail.com")
                      (mu4e-compose-signature-auto-include t))
                    t)
(set-email-account! "ali.zakeri2008@gmail.com"
                    '((mu4e-sent-folder                 . "/ali.zakeri2008@gmail.com/Sent Mail")
                      (mu4e-drafts-folder            . "/ali.zakeri2008@gmail.com/Drafts")
                      (mu4e-trash-folder             . "/ali.zakeri2008@gmail.com/Trash")
                      (mu4e-refile-folder            . "/ali.zakeri2008@gmail.com/All Mails")
                      (mu4e-compose-signature        . "\nBest regards,\nShSo")
                      (smtpmail-smtp-server          . "smtp.gmail.com")
                      (smtpmail-smtp-user            . "ali.zakeri2008@gmail.com")
                      (mu4e-compose-signature-auto-include nil))
                    nil)
(set-email-account! "shahin@malltina.com"
                    '((mu4e-sent-folder                 . "/shahin@malltina.com/Sent Items")
                      (mu4e-drafts-folder            . "/shahin@malltina.com/Drafts")
                      (mu4e-trash-folder             . "/shahin@malltina.com/Deleted Items")
                      (mu4e-refile-folder            . "/shahin@malltina.com/All Items")
                      (mu4e-compose-signature        . "\nBest regards,\nShSo")
                      (smtpmail-smtp-server          . "mail.malltina.com")
                      (smtpmail-smtp-user            . "shahin@malltina.com")
                      (mu4e-compose-signature-auto-include t))
                    nil)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
      doom-unicode (font-spec :family "Vazir Mono" :size 13)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-horizon)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-noter-notes-search-path '("~/org/notes/"))
(setq deft-directory "~/org/"
      deft-recursive t)
(setq org-journal-date-format "%y-%m-%d"
      org-journal-file-type "org"
      org-journal-file-format "YYYYMMDD.org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(when (featurep! :editor format)
  (add-hook 'before-save-hook #'+format/buffer))

(after! projectile
  (setq projectile-project-search-path (my/find-directories-recursive "~/code" 3))
  (setq projectile-auto-discover t))

(after! company
  (setq +lsp-company-backends '(:separate company-tabnine company-capf :with company-yasnippet))
  (setq company-idle-delay 1)
  (setq company-tooltip-width-grow-only t)
  (setq company-show-quick-access t))

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup))

(after! php
  (setq-hook! php-mode php-cs-fixer-config-option
              (concat (projectile-project-root) ".php-cs-fixer.dist.php")))

(after! format-all
  (define-format-all-formatter php-cs-fixer
    (:executable)
    (:install "composer require --dev friendsofphp/php-cs-fixer")
    (:modes php-mode)
    (:format
     (format-all--buffer-native 'php-mode #'php-cs-fixer-fix))))

;; (setf (alist-get 'markdown-mode +spell-excluded-faces-alist)
;;       '(markdown-code-face
;;         markdown-reference-face
;;         markdown-link-face
;;         markdown-url-face
;;         markdown-markup-face
;;         markdown-html-attr-value-face
;;         markdown-html-attr-name-face
;;         markdown-html-tag-name-face))

