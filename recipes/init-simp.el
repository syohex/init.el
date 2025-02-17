(dolist (my-function
         '(
           simp-project-define
           simp-project-find-file
           simp-project-rgrep
           ))
  (autoload my-function "simp" nil t))

;; (global-set-key (kbd "C-c f f") 'simp-project-find-file)
;; (global-set-key (kbd "C-c f g") 'simp-project-rgrep)

(my-init--hook
  (my-init--after-load 'simp
    (if (fboundp 'ido-mode)
        (setq simp-completing-read-command 'ido-completing-read)
      (my-init--after-load 'ido
        (setq simp-completing-read-command 'ido-completing-read)))

    (setq grep-find-ignored-directories ()) ;due to bug <https://github.com/re5et/simp/issues/2>

    (let ((rails-ignore '(.git
                          coverage
                          public/assets
                          public/images
                          public/system
                          tmp
                          vendor/cache))))

    (simp-project-define '(:has (.git) :ignore (.git)))
    (simp-project-define
     '(:type rails
             :has (config.ru app/models app/views app/controllers)
             :ignore ,rails-ignore))
    (simp-project-define
     '(:type emacs :has (init.el) :ignore (.git)))))
