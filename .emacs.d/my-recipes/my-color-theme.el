;;; My color theme.
;;; Color light and dark themes toggle
;;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Faces.html>.
;; (setq frame-background-mode 'light)
(setq frame-background-mode 'dark)
(defface my-default '((t :inherit default))
  "Face name to use for my customization."
  :group 'my-default)
(set-face-attribute 'header-line nil :inherit nil)
;; (set-face-background 'region nil)
;; (set-background-color "#0f0f0f")
(set-cursor-color "red") ;#aa0000
(cond ((equal frame-background-mode 'light)
       (set-face-attribute 'my-default nil :foreground nil :background nil)
       (setq my-lazy-highlight-background "yellow1") ;lightgoldenrod2
       (setq my-match-foreground "lightskyblue1")

       (setq my-line-number-background "gray90")
       (set-face-attribute 'lazy-highlight nil
                           :foreground my-match-foreground
                           :background "magenta3");"orchid3");"VioletRed")
       )
      ((equal frame-background-mode 'dark)
       (setq my-lazy-highlight-background "maroon4") ;red ;OrangeRed3 ;gray20 ;gray40
       (setq my-line-number-background "gray15")
       (setq my-match-foreground "lightskyblue1")
       ;; Region.
       ;; (setq my-face-reginon-background "#002b36") ;#2E3436 ;set selection background color
       ;; (set-face-attribute 'region nil :inverse-video t)
       (set-face-background 'region "#002b36")

       ;; Matches other than the current one by Isearch and Query Replace
       ;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html>.
       ;; (set-face-background 'lazy-highlight "#002b36")
       (set-face-attribute 'lazy-highlight nil
                           :foreground my-match-foreground
                           :background my-lazy-highlight-background)

       (set-face-attribute 'match nil
                           :foreground my-match-foreground
                           :background "OrangeRed3")
       (set-face-background 'highlight '"#002b36")
       (set-face-foreground 'success "Green4") ;Green1
       (set-face-foreground 'warning "red") ;DarkOrange
       ;; (set-face-attribute 'isearch-fail nil :foreground "black")
       ))
