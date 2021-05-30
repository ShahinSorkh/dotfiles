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

;; (provide 'tdd)
