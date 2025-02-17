(defun my-kill-emacs ()
  (interactive)

  ;; First update the alist.
  ;; This loads the old save-place-file if nec.
  (save-places-to-alist)

  ;; Now save the alist in the file,
  ;; if we have ever loaded the file (including just now).
  (when save-place-loaded (save-place-alist-to-file))

  (kill-emacs))
