(eval-after-load 'magit-blame
  '(progn
     ;; Colors - diff and more
     ;; <http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors>.
     (cond ((equal frame-background-mode 'light)
            (set-face-attribute 'magit-blame-header nil
                                :underline nil
                                :foreground "DimGray"
                                :background "gray95")
            )
           ((equal frame-background-mode 'dark)
            (set-face-attribute 'magit-blame-header nil
                                :underline nil
                                :foreground "gray40"
                                :background "gray10")
            ))

     (set-face-attribute 'magit-blame-sha1 nil
                         :inherit 'magit-blame-header)
     ))
