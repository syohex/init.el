;;; init-emacs-lisp-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(my-init--hook
  (my-init--add-mode-to-patterns 'emacs-lisp-mode "/Cask\\'")

  (my-init--after-load 'lisp-mode
    (define-key emacs-lisp-mode-map (kbd "C-c C-z") 'ielm)
    (define-key emacs-lisp-mode-map (my-kbd "! b") 'my-eval-buffer)
    (define-key emacs-lisp-mode-map (my-kbd "! r") 'my-eval-region)
    (define-key emacs-lisp-mode-map (my-kbd "c f") 'byte-compile-file)))

(defun my-eval-buffer ()
  (interactive)
  (message (format "Eval: %s" (buffer-name)))
  (eval-buffer))

(defun my-eval-region (start end)
  (interactive "r")
  (message "Eval region")
  (eval-region start end))

;;; init-emacs-lisp-mode.el ends here
