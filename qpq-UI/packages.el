;;; packages.el --- qpq-UI layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: qpq <qpq@qpq-pc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `qpq-UI-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `qpq-UI/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `qpq-UI/pre-init-PACKAGE' and/or
;;   `qpq-UI/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst qpq-UI-packages
  '(solarized-theme
    all-the-icons
    all-the-icons-dired)
  )

(defun qpq-UI/init-solarized-theme ()
  (use-package solarized-theme))

(defun qpq-UI/init-all-the-icons ()
  (use-package all-the-icons))

(defun qpq-UI/init-all-the-icons-dired ()
  (use-package all-the-icons-dired
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))



;;; packages.el ends here
