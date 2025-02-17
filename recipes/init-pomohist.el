(my-init--hook
  (global-set-key (my-kbd "p p") 'pomohist-go-to-prev-position-with-repeat)
  (global-set-key (my-kbd "p n") 'pomohist-go-to-next-position-with-repeat)

  (my-init--after-load 'pomohist
    (add-hook 'pre-command-hook 'pomohist)
    ;; (setq pomohist-depth 32)
    ))

(defun pomohist-go-to-prev-position-with-repeat ()
  (interactive)

  (my-with-repeat-while-press-last-key
    (pomohist-go-to-prev-position)))

(defun pomohist-go-to-next-position-with-repeat ()
  (interactive)

  (my-with-repeat-while-press-last-key
    (pomohist-go-to-next-position)))
