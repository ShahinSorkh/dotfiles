;;; ../.dotfiles/dot/doom.d/autoload.el -*- lexical-binding: t; -*-

(defun my/is-dir (file-attrs)
  (and
   (nth 1 file-attrs)
   (not (cl-search "/.git" (nth 0 file-attrs)))))

(defun my/get-file-path (file-attrs)
  (nth 0 file-attrs))

(defun my/list-directories (directory)
  (cl-map 'list 'my/get-file-path
          (seq-filter 'my/is-dir
                      (cddr (directory-files-and-attributes directory t)))))

;;;###autoload
(defun my/find-directories-recursive (directory depth)
  "Recursively goes into `DIRECTORY' and returns all dirs found."
  (let ((found-dirs (my/list-directories directory)))
    (if (> depth 0)
        (flatten-list (merge 'list found-dirs (cl-map 'list
                                                      #'(lambda (d) (my/find-directories-recursive d (- depth 1)))
                                                      found-dirs)
                             '(lambda (&rest ...) t)))
      found-dirs)))

;;;###autoload
(defun doom/php-class-name ()
  (replace-regexp-in-string "\\.php$" "" (buffer-name)))
