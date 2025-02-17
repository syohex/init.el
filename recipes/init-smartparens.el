(my-init--hook
  (my-init--add-mode-to-hooks (lambda ()
                          (turn-on-smartparens-mode)
                          (turn-on-show-smartparens-mode))
                        '(cider-repl-mode-hook
                          clojure-mode-hook))

  (my-init--after-load 'smartparens
    (sp-with-modes sp--lisp-modes (sp-local-pair "'" nil :actions nil)) ;adds `' as a local pair in lisp <https://github.com/Fuco1/smartparens/issues/286#issuecomment-32324743>, <https://github.com/Fuco1/smartparens/wiki/Pair-management#local-pair-definitions>
    (define-key sp-keymap (my-kbd "m s u") 'sp-unwrap-sexp)
    (define-key sp-keymap (my-kbd "m s s f") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (my-kbd "m s s b") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "M-(") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "(")))
    (define-key sp-keymap (kbd "M-[") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "[")))
    ;; (define-key sp-keymap (kbd "m s s k a") 'sp-splice-sexp-killing-around)
    (define-key sp-keymap (kbd "M-{") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "{")))))
