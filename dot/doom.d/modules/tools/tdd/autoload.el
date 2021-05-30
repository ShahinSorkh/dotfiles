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

;;;###autoload
(defun tdd-success ()
  "Set the TDD indicator to green."
  (interactive)
  (setq tdd-mode-line-format
        (propertize tdd-success-symbol
                    'face tdd-success-face
                    'keymap tdd-mode-line-map
                    'mouse-face 'mode-line-highlight
                    'help-echo (concat "Tests succeeded\n"
                                       "mouse-1: Switch to test buffer"))))

;;;###autoload
(defun tdd-failure ()
  "Set the TDD indicator to red."
  (interactive)
  (setq tdd-mode-line-format
        (propertize tdd-failure-symbol
                    'face tdd-failure-face
                    'keymap tdd-mode-line-map
                    'mouse-face 'mode-line-highlight
                    'help-echo (concat "Tests failed\n"
                                       "mouse-1: Switch to test buffer"))))

;;;###autoload
(defun tdd-waiting ()
  "Set the TDD indicator to mark an ongoing compilation run."
  (interactive)
  (setq tdd-mode-line-format
        (propertize tdd-waiting-symbol
                    'face tdd-waiting-face
                    'keymap tdd-mode-line-map
                    'mouse-face 'mode-line-highlight
                    'help-echo (concat "Tests running\n"
                                       "mouse-1: Switch to test buffer"))))

;;;###autoload
(defun tdd-display-buffer ()
  "Display the compilation buffer."
  (interactive)
  (let ((compilation-buffer (get-buffer
                             (compilation-buffer-name "compilation"
                                                      nil nil))))
    (when compilation-buffer
      (display-buffer compilation-buffer))))

;;;###autoload
(defun tdd-add-mode-line-format ()
  "Add `tdd-mode-line-format' to `mode-line-format'."
  (let ((global-mode-line (default-value 'mode-line-format)))
    (when (not (memq 'tdd-mode-line-format global-mode-line))
      (setq-default mode-line-format
                    (cons (car global-mode-line)
                          (cons 'tdd-mode-line-format
                                (cdr global-mode-line)))))))

;;;###autoload
(defun tdd-remove-mode-line-format ()
  "Add `tdd-mode-line-format' to `mode-line-format'."
  (let ((global-mode-line (default-value 'mode-line-format)))
    (when (memq 'tdd-mode-line-format global-mode-line)
      (setq-default mode-line-format
                    (delq 'tdd-mode-line-format
                          global-mode-line)))))

;;;###autoload
(defun tdd-after-save ()
  "Function run in `after-save-hook' to start the compilation."
  (when (not tdd-compilation-in-progress)
    (setq tdd-compilation-in-progress t)
    (let ((compilation-ask-about-save nil)
          (compilation-save-buffers-predicate (lambda () nil)))
      (save-window-excursion
        (funcall tdd-test-function)))))

;;;###autoload
(defun tdd-compilation-start (proc)
  "Function run from `compilation-start-hook'."
  (setq tdd-compilation-in-progress t)
  (tdd-waiting))

;;;###autoload
(defun tdd-compilation-finish (buf msg)
  "Function run from `compilation-finish-functions'."
  (setq tdd-compilation-in-progress nil)
  (if (string-match "exited abnormally" msg)
      (tdd-failure)
    (tdd-success)))
