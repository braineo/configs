;;; packages.el --- braineo layer packages file for Spacemacs.
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
;; added to `braineo-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `braineo/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `braineo/pre-init-PACKAGE' and/or
;;   `braineo/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst braineo-packages
  '(crux
    xclip
    helm
    anzu)
  "The list of Lisp packages required by the braineo layer.

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

(defun braineo/init-crux ()
  :defer t
  :config
  (progn
    (crux-reopen-as-root-mode)))

(defun braineo/init-xclip ()
  :defer t
  :config
  (progn
    (xclip-mode)))

(defun braineo/post-init-helm ()
  :defer t
  :config
  (progn
    (defun braineo-helm-swoop-keybindings ()
      (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))

    (with-eval-after-load 'helm-swoop
      (braineo-helm-swoop-keybindings))

    (setq helm-split-window-inside-p t)))

(defun braineo/init-anzu ()
  :defer t
  :config
  (progn
    (defun braineo-anzu-keybindings ()
      (define-key isearch-mode-map (kbd "M-%") 'anzu-isearch-query-replace)
      (define-key isearch-mode-map (kbd "C-M-%") 'anzu-isearch-query-replace-regexp))
    (with-eval-after-load 'anzu
      (braineo-anzu-keybindings))))

;;; packages.el ends here
