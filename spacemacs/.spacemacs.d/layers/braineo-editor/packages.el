;;; packages.el --- braineo-editor layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: mujin <mujin@desktop25>
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
;; added to `braineo-editor-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `braineo-editor/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `braineo-editor/pre-init-PACKAGE' and/or
;;   `braineo-editor/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst braineo-editor-packages
  '(easy-kill
    smartparens
    bm)
  "The list of Lisp packages required by the braineo-editor layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun braineo-editor/init-easy-kill ())

(defun braineo-editor/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :init
    (progn
      (add-hook 'prelude-prog-mode-hook (lambda ()
                                          (when (> (buffer-size) 40000)
                                            (smartparens-mode -1)
                                            (show-smartparens-global-mode -1)))))))

(defun braineo-editor/post-init-bm ()
  (use-package bm
    :defer t
    :init (progn
            (setq bm-buffer-persistence nil))))


;;; packages.el ends here
