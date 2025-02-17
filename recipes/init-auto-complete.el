(my-init--hook
  ;; <http://stackoverflow.com/questions/23232982/emacs-cannot-load-auto-complete-package#23234880>.
  (ac-config-default)

  ;; The common sources for all modes
  ;; <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>.
  (custom-set-variables
   '(ac-sources
     '(ac-source-abbrev
       ac-source-words-in-buffer
       ac-source-words-in-same-mode-buffers
       ac-source-files-in-current-dir
       ac-source-filename
       ac-source-dictionary
       ac-source-yasnippet)))

  (my-init--after-load 'auto-complete-config
    (add-to-list 'ac-dictionary-directories
                 (expand-file-name (concat user-emacs-directory
                                           "my-auto-complete/dict")
                                   default-directory))
    (dolist (mode '( ;<http://stackoverflow.com/questions/10779636/emacs-auto-complete-key-binding-didnt-work>
                    autoconf-mode
                    awk-mode
                    c-mode
                    change-log-mode
                    cider-mode
                    cider-repl-mode
                    clojure-mode
                    coffee-mode
                    conf-colon-mode
                    conf-mode
                    conf-space-mode
                    conf-unix-mode
                    conf-windows-mode
                    conf-xdefaults-mode
                    css-mode
                    diff-mode
                    dockerfile-mode
                    ebuild-mode
                    emacs-lisp-mode
                    ferm-mode
                    fish-mode
                    git-commit-mode
                    gitconfig-mode
                    gitignore-mode
                    haml-mode
                    haskell-mode
                    html-mode
                    inf-ruby-mode
                    jade-mode
                    java-mode
                    js-mode
                    js2-mode
                    json-mode
                    less-css-mode
                    lisp-mode
                    lua-mode
                    magit-log-edit-mode
                    makefile-gmake-mode
                    markdown-mode
                    mustache-mode
                    nginx-mode
                    nroff-mode
                    nxml-mode
                    org-mode
                    perl-mode
                    php-mode
                    python-mode
                    rhtml-mode
                    ruby-mode
                    rust-mode
                    sass-mode
                    scss-mode
                    sgml-mode
                    sh-mode
                    shell-mode
                    sieve-mode
                    slim-mode
                    sql-interactive-mode
                    sql-mode
                    text-mode
                    toml-mode
                    web-mode
                    xml-mode
                    yaml-mode
                    ))
      (add-to-list 'ac-modes mode))
    (ac-linum-workaround) ;<https://github.com/auto-complete/auto-complete/blob/da864398a96805a2c79ac61fadeebd420ccb3cdc/doc/manual.md#linum-mode-tries-to-display-the-line-numbers-even-for-the-comletion-menu--linum-mode-bug>
    (setq ac-ignore-case nil) ;preserve capitalization <http://stackoverflow.com/questions/15637536/how-do-i-preserve-capitalization-when-using-autocomplete-in-emacs>
    (setq ac-disable-faces (quote (font-lock-doc-face))))

  (my-init--after-load 'auto-complete
    ;; Remove auto-complet from enter/return keys
    ;; <http://stackoverflow.com/questions/18461584/emacs-autocomplete-disable-ret-to-enter#18462502>.
    (define-key ac-completing-map "\r" nil)
    (define-key ac-completing-map [return] nil))

  (my-init--add-mode-to-hooks (lambda ()
                           (add-to-list 'ac-sources
                                        'ac-source-css-property))
                         '(less-css-mode-hook
                           sass-mode-hook
                           scss-mode-hook)))
