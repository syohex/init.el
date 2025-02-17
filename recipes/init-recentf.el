;;; Recentf (open recent files)
;;; <http://stackoverflow.com/questions/3527150/open-recent-in-emacs#answer-3527488>,
;;; <http://emacswiki.org/RecentFiles>.

(my-init--hook
  (recentf-mode t)

  (my-init--after-load 'recentf-mode
    (setq recentf-auto-cleanup 'never ;if you make extensive use of Tramp, recentf will track those files too, and do it's periodic cleanup thing which can be a real mess since the files are remote
          recentf-max-menu-items 100
          recentf-max-saved-items 1000)))
