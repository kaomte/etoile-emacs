;;; etoile-apps.el --- Configuration of applications for etoile

;; Copyright © 2019 Jacob Salzberg

;; Author: Jacob Salzberg <jssalzbe@ncsu.edu>
;; URL: https://github.com/jsalzbergedu/etoile-apps
;; Version: 0.1.0
;; Keywords: etoile apps

;; This file is not a part of GNU Emacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Configuration of applications for etoile

;; Org
;; TODO split into + packages
(use-package git
  :straight t
  :defer t)

(use-package org
  :defer t
  :straight nil
  :init
  (straight-use-package 'org-plus-contrib)
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (setq org-default-notes-file "~/.emacs.d/notes.org")
  (push "~/.emacs.d/agenda.org" org-agenda-files)
  :config
  (setq org-indent-indentation-per-level 1
	org-ellipsis ":"
	org-fontify-done-headline t
	org-fontify-quote-and-verse-blocks t
	org-fontify-whole-heading-line t
	org-startup-indented t
        org-src-fontify-natively t)
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t)
                                                           (emacs-lisp . t)
                                                           (scheme . t)
                                                           (coq . t)
                                                           (haskell . t)
                                                           (racket . t)
                                                           (pie . t)
                                                           (dot . t)
                                                           (jupyter . t)
                                                           (makefile . t)))

  ;;(ein:org-register-lang-mode "ein-c++" 'c++)
  ;; (require 'org-mks) ;; for some reason capture doesnt work without this
  :commands (org-mode))

(use-package org-macs
  :demand t
  :straight nil
  :after org)

(use-package org-capture
  :demand t
  :straight nil
  :after (org org-macs)
  :commands org-capture
  :general
  (:states '(normal motion)
           "SPC c" 'org-capture)
  :hook ((org-capture-mode . (lambda ()
                               (add-hook 'after-save-hook 'org-capture-finalize nil t)))))

(use-package org-agenda
  :demand t
  :after org)

(use-package ob-plantuml
  :init
  (setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  :straight nil
  :demand t
  :after org)

(use-package tramp
  :straight nil
  :defer t
  :init
  (defun sudo-edit ()
    "Edit with sudo"
    (interactive)
    (find-alternate-file (concat "/sudo::" buffer-file-name)))
  :config
  (setq tramp-auto-save-directory "~/.emacs.d/tramp-auto-saves")
  (add-to-list 'backup-directory-alist
	       (cons tramp-file-name-regexp nil)))

;; Silver Searcher
(use-package ag
  :straight (ag :type git
                :host github
                :repo "Wilfred/ag.el")
  :defer t)


(use-package ansi-term
  :straight nil
  :defer t
  :general
  (:keymaps '(ansi-term) :states '(normal motion)
            "p" 'term-paste)
  :init
  (setq comint-move-point-for-output nil)
  (setq comint-scroll-show-maximum-output nil)
  :config (add-hook 'term-mode-hook (lambda ()
				      (evil-local-set-key 'normal (kbd "p") 'term-paste))))


;; eww
(use-package eww
  :straight nil
  :defer t
  :config
  (add-hook 'eww-mode-hook (lambda () (setq word-wrap t))))

;; Get back to exwm later

(use-package exwm
  :straight t
  :defer t)

(use-package exwm-config
  :demand t
  :after (exwm)
  :config
  (advice-add 'exwm-config-ido :override (lambda () t))
  (push (cons (kbd "<escape>") #'evil-normal-state) exwm-input-global-keys)
  :commands exwm-config-default)


;; Direnv
(use-package direnv
  :straight t
  :demand t
  :config
  (direnv-mode)
  (setq direnv-always-show-summary nil)
  ;; (push X direnv-non-file-modes)
  :if (= (call-process "which" nil nil nil "direnv") 0))

;; Shell-pop
(use-package shell-pop
  :straight t
  :defer t
  :init (setq shell-pop-window-position "full"))

(provide 'etoile-apps)
;;; etoile-apps.el ends here
