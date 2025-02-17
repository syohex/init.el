(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point-or-region)

(my-init--hook
  (my-init--after-load 'etags-select
    (define-key etags-select-mode-map (kbd "C-g")
      'etags-select-quit)

    (define-key etags-select-mode-map (kbd "C-n")
      'etags-select-next-tag)

    (define-key etags-select-mode-map (kbd "C-p")
      'etags-select-previous-tag)

    (define-key etags-select-mode-map (kbd "M-RET")
      'etags-select-goto-tag-other-window)

    (define-key etags-select-mode-map (kbd "RET")
      'etags-select-goto-tag)))

(defun etags-select-find-tag-at-point-or-region ()
  "Finds tag at point or selected region using etags-select."
  (interactive)
  (require 'etags-select)
  (if (region-active-p)
      (etags-select-find
       (buffer-substring (region-beginning) (region-end)))
    (etags-select-find-tag-at-point)))
