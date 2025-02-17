(my-init--hook
  (custom-set-variables '(winner-dont-bind-my-keys t))

  (when (fboundp 'winner-mode) (winner-mode t))

  (my-init--after-load 'winner
    (global-set-key (my-kbd "w u") 'my-winner-undo)
    (global-set-key (my-kbd "w r") 'my-winner-redo)))

(defun my-winner-undo ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'winner-undo)))

(defun my-winner-redo ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'winner-redo)))
