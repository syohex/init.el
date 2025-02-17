;; Ruby with Emacs and Rbenv
;; <http://blog.senny.ch/blog/2013/02/11/use-the-right-ruby-with-emacs-and-rbenv>.
(custom-set-variables '(rbenv-modeline-function 'my-rbenv--modeline-with-face))

(my-init--hook (global-rbenv-mode))

(defun my-rbenv--modeline-with-face (current-ruby)
  (unless (equal current-ruby "system")
    (list (propertize current-ruby 'face 'rbenv-active-ruby-face))))
