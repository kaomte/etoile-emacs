;;; etoile.el --- A modular emacs config using the straight package manager -*- lexical-binding: t -*-

;; Copyright © 2019 Jacob Salzberg

;; Author: Jacob Salzberg <jssalzbe@ncsu.edu>
;; URL: https://github.com/jsalzbergedu/etoile-emacs
;; Version: 0.1.0
;; Keywords: etoile emacs config

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
;; The entry point for the etoile config

;;; Code:
(use-package etoile-themes
  :straight (etoile-themes :type git
                           :host github
                           :repo "kaomte/etoile-emacs"
                           :files ("etoile-themes/*.el"))
  :demand t)

(use-package etoile-keybindings
  :straight (etoile-keybindings :type git
                                :host github
                                :repo "kaomte/etoile-emacs"
                                :files ("etoile-keybindings/*.el"))
  :demand t)

(use-package etoile-programming
  :straight (etoile-programming :type git
                                :host github
                                :repo "kaomte/etoile-emacs"
                                :files ("etoile-programming/*.el"))
  :demand t)

(use-package etoile-apps
  :straight (etoile-apps :type git
                         :host github
                         :repo "kaomte/etoile-emacs"
                         :files ("etoile-apps/*.el"))
  :demand t)

(provide 'etoile)
;;; etoile.el ends here
