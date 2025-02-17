(my-init--hook
  (global-set-key (my-kbd "b m c a") 'mc/mark-all-like-this)
  (global-set-key (my-kbd "b m c n") 'my-mc/mark-next-like-this)
  (global-set-key (my-kbd "b m c p") 'my-mc/mark-previous-like-this))

(defun my-mc/mark-next-like-this ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'mc/mark-next-like-this)))

(defun my-mc/mark-previous-like-this ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'mc/mark-previous-like-this)))
