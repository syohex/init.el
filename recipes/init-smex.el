(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;this is your old M-x

(my-init--after-load 'smex
  (setq smex-key-advice-ignore-menu-bar t) ;<http://stackoverflow.com/questions/19781529/how-to-disable-emacs-messages-like-you-can-run-the-command-x-with-y#comment-29432155>
  (setq smex-history-length 200))
