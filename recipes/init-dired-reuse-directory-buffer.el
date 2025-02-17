;;; Reuse directory buffer
;;; <http://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer>.
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file ".."))) ;was dired-up-directory
            ))
