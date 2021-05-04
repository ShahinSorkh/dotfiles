;;; packages/tdd.el -*- lexical-binding: t; -*-

(defgroup tdd nil
  "Test-Driven Development Indicator."
  :prefix "tdd-"
  :group 'productivity)

(defvar tdd-mode-line-map (let ((map (make-sparse-keymap)))
                            (define-key map [mode-line mouse-1]
                              'tdd-display-buffer)
                            map)
  "Keymap used on the mode line indicator")

(defcustom tdd-test-function #'recompile
  "Test function to run.

It will be run without arguments, whenever a buffer is saved. It
should run in compilation major mode, because checking for
success or failure depends the mode hooks.

The default if (recompile)"
  :type 'function
  :group 'tdd)

(defcustom tdd-success-symbol "✔"
  "Mode line symbol to show when tests passed."
  :type 'string
  :group 'tdd)

(defcustom tdd-success-face 'compilation-mode-line-exit
  "Face to use for `tdd-success-symbol'."
  :type 'face
  :group 'tdd)

(defcustom tdd-failure-symbol "✖"
  "Mode line symbol to show when tests failed."
  :type 'string
  :group 'tdd)

(defcustom tdd-failure-face 'compilation-mode-line-fail
  "Face to use for `tdd-failure-symbol'."
  :type 'face
  :group 'tdd)

(defcustom tdd-waiting-symbol "✱"
  "Mode line symbol to show when tests are running."
  :type 'string
  :group 'tdd)

(defcustom tdd-waiting-face 'compilation-mode-line-run
  "Face to use for `tdd-waiting-symbol'."
  :type 'face
  :group 'tdd)

(defvar tdd-compilation-in-progress nil
  "Non-nil if we already started a compilation process.

Sadly, `get-buffer-process' does not work for preventing
duplicate compilation runs.")

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

(defun tdd-display-buffer ()
  "Display the compilation buffer."
  (interactive)
  (let ((compilation-buffer (get-buffer
                             (compilation-buffer-name "compilation"
                                                      nil nil))))
    (when compilation-buffer
      (display-buffer compilation-buffer))))

(defun tdd-add-mode-line-format ()
  "Add `tdd-mode-line-format' to `mode-line-format'."
  (let ((global-mode-line (default-value 'mode-line-format)))
    (when (not (memq 'tdd-mode-line-format global-mode-line))
      (setq-default mode-line-format
                    (cons (car global-mode-line)
                          (cons 'tdd-mode-line-format
                                (cdr global-mode-line)))))))

(defun tdd-remove-mode-line-format ()
  "Add `tdd-mode-line-format' to `mode-line-format'."
  (let ((global-mode-line (default-value 'mode-line-format)))
    (when (memq 'tdd-mode-line-format global-mode-line)
      (setq-default mode-line-format
                    (delq 'tdd-mode-line-format
                          global-mode-line)))))

(defun tdd-after-save ()
  "Function run in `after-save-hook' to start the compilation."
  (when (not tdd-compilation-in-progress)
    (setq tdd-compilation-in-progress t)
    (let ((compilation-ask-about-save nil)
          (compilation-save-buffers-predicate (lambda () nil)))
      (save-window-excursion
        (funcall tdd-test-function)))))

(defun tdd-compilation-start (proc)
  "Function run from `compilation-start-hook'."
  (setq tdd-compilation-in-progress t)
  (tdd-waiting))

(defun tdd-compilation-finish (buf msg)
  "Function run from `compilation-finish-functions'."
  (setq tdd-compilation-in-progress nil)
  (if (string-match "exited abnormally" msg)
      (tdd-failure)
    (tdd-success)))

(provide 'tdd)
