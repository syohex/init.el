(eval-after-load 'highlight-symbol
  '(progn
     (setq highlight-symbol-idle-delay 0.7)
     (set-face-background 'highlight-symbol-face my-lazy-highlight-background)
     ;; (global-set-key (kbd "C-c d y ") 'highlight-symbol-at-point)
     (global-set-key (kbd "C-c d y n") 'highlight-symbol-next-with-repeat)
     (global-set-key (kbd "C-c d y p") 'highlight-symbol-prev-with-repeat)
     (global-set-key (kbd "C-c d y r") 'highlight-symbol-query-replace)
     (defun highlight-symbol-next-with-repeat ()
       (interactive)
       (my-with-repeat-while-press-last-key
         (highlight-symbol-next)))
     (defun highlight-symbol-prev-with-repeat ()
       (interactive)
       (my-with-repeat-while-press-last-key
         (highlight-symbol-prev)))
     ))
(dolist (hook '(
                awk-mode-hook
                coffee-mode-hook
                conf-mode-hook
                conf-space-mode-hook
                conf-xdefaults-mode-hook
                css-mode-hook
                emacs-lisp-mode-hook
                haml-mode-hook
                haskell-mode-hook
                html-mode-hook
                ibuffer-mode-hook
                java-mode-hook
                js-mode-hook
                lisp-mode-hook
                lua-mode-hook
                makefile-gmake-mode-hook
                markdown-mode-hook
                nxml-mode-hook
                org-mode-hook
                perl-mode-hook
                php-mode-hook
                rhtml-mode-hook
                ruby-mode-hook
                sass-mode-hook
                scss-mode-hook
                sgml-mode-hook
                sh-mode-hook
                shell-mode-hook
                sql-mode-hook
                xml-mode-hook
                yaml-mode-hook
                ))
  (add-hook hook 'highlight-symbol-mode))
