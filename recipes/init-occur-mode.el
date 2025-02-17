(add-hook 'occur-mode-hook
          (lambda ()
            ;; Truncate lines <http://stackoverflow.com/questions/950340/how-do-you-activate-line-wrapping-in-emacs#950406>.
            (setq truncate-lines t)))

(add-hook 'occur-hook
          (lambda ()
            ;; <http://lists.gnu.org/archive/html/emacs-devel/2005-07/msg00411.html>
            (occur-rename-buffer t)))

(my-init--hook
  (global-set-key (kbd "M-s o") nil)
  (global-set-key (kbd "M-s o o") 'my-occur)
  (global-set-key (kbd "M-s o k") 'my-occur-kill-buffers)

  (my-init--after-load "replace"
    (define-key occur-mode-map (kbd "\C-c\C-f") nil)))

(defun my-occur (&optional arg)
  (interactive "P")
  (if arg
      (progn
        (setq current-prefix-arg 'nil)
        (call-interactively 'multi-occur-in-matching-buffers))
    (call-interactively 'occur)))

(defun my-occur-kill-buffers (&optional arg)
  (interactive "P")
  (if arg
      (progn (occur-kill-buffers) (message "All occur-mode buffers killed"))
    (occur-kill-other-buffers)
    (message "All occur-mode buffers other than the current buffer killed")))

(defun occur-kill-buffers ()
  "Kill all occur-mode buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (eq (buffer-local-value 'major-mode buffer) 'occur-mode)
      (kill-buffer buffer))))

(defun occur-kill-other-buffers ()
  "Kill all occur-mode buffers other than the current buffer."
  (interactive)
  (let ((current-buffer (current-buffer)))
    (dolist (buffer (buffer-list))
      (when (and
             (eq (buffer-local-value 'major-mode buffer) 'occur-mode)
             (not (eq buffer current-buffer)))
        (kill-buffer buffer)))))
