;;;###autoload
(define-minor-mode tdd-mode
  "Test-Driven development global minor mode.

Runs `tdd-test-function' every time a buffer is saved, and
adjusts a mode line indicator depending on the success or failure
of that compilation command."
  :global t
  (cond
   (tdd-mode
    (tdd-add-mode-line-format)
    (tdd-success)
    (add-hook 'compilation-finish-functions 'tdd-compilation-finish)
    (add-hook 'compilation-start-hook 'tdd-compilation-start)
    (add-hook 'after-save-hook 'tdd-after-save))
   (t
    (tdd-remove-mode-line-format)
    (setq tdd-mode-line-format "")
    (remove-hook 'compilation-finish-functions 'tdd-compilation-finish)
    (remove-hook 'compilation-start-hook 'tdd-compilation-start)
    (remove-hook 'after-save-hook 'tdd-after-save))))
