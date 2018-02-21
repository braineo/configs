
;; Set editor transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; When it is macOS and verison number is higher than 26.0
(when (and (spacemacs/system-is-mac) (>= emacs-major-version 26))
  (setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . 'nil))))

(defun on-frame-open (&optional frame)
  ;; "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'on-frame-open)

;; Temporarily fix: after lsp-ui shows up, helm is not updating
(add-hook 'helm-major-mode-hook 'lsp-ui-doc--delete-frame)
