(my-init--hook
  (global-set-key (my-kbd "m p h s") 'point-stack-push)
  (global-set-key (my-kbd "m p h b") 'my-point-stack-pop-with-repeat)
  (global-set-key (my-kbd "m p h f") 'my-point-stack-forward-stack-pop-with-repeat))

(defun my-point-stack-pop-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (point-stack-pop)))

(defun my-point-stack-forward-stack-pop-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (point-stack-forward-stack-pop)))
