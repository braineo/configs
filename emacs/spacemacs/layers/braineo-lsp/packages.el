;;; packages.el --- braineo-lsp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
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
;; added to `braineo-lsp-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `braineo-lsp/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `braineo-lsp/pre-init-PACKAGE' and/or
;;   `braineo-lsp/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst braineo-lsp-packages
  '((company-lsp :requires company)
    (helm-xref :requires helm)
    (ivy-xref :requires ivy)
    lsp-mode
    lsp-ui)
  "The list of Lisp packages required by the braineo-lsp layer.

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

(defun braineo-lsp/init-company-lsp ()
  (use-package company-lsp
    :defer t
    :init
    ;; Language servers have better idea filtering and sorting,
    ;; don't filter results on the client side.
    (setq company-transformers nil
          company-lsp-async t
          company-lsp-cache-candidates nil)
    ;; (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)
    ))

(defun braineo-lsp/init-helm-xref ()
  (use-package helm-xref
    :defer t
    :init
    (progn
      ;; This is required to make xref-find-references not give a prompt.
      ;; xref-find-references asks the identifier (which has no text property) and then passes it to lsp-mode, which requires the text property at point to locate the references.
      ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=29619
      (setq xref-prompt-for-identifier
            '(not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references spacemacs/jump-to-definition))

      ;; Use helm-xref to display xref.el results.
      (setq xref-show-xrefs-function #'helm-xref-show-xrefs)
      )))

(defun braineo-lsp/init-ivy-xref ()
  (use-package ivy-xref
    :defer t
    :init
    (progn
      (setq xref-prompt-for-identifier
            '(not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references spacemacs/jump-to-definition))

      ;; Use ivy-xref to display xref.el results.
      (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
      )))

(defun braineo-lsp/init-lsp-mode ()
  (use-package lsp-mode
    :config
    (progn
      (add-hook 'lsp-mode-hook #'lsp-ui-mode)

      ;; Disable lsp-flycheck.el in favor of lsp-ui-flycheck.el
      (setq lsp-enable-flycheck nil)

      (spacemacs|diminish lsp-mode " Ⓛ" " L")
      )))

(defun braineo-lsp/init-lsp-ui ()
  (use-package lsp-ui
    :config
    (progn
      (braineo-lsp//sync-peek-face)
      (add-hook 'spacemacs-post-theme-change-hook #'braineo-lsp//sync-peek-face)
      )))

;;; packages.el ends here
