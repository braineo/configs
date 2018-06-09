
;; Set editor transparency
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;; When it is macOS and verison number is higher than 26.0
(when (and (spacemacs/system-is-mac) (>= emacs-major-version 26))
  (setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . dark))))

(add-hook 'after-make-frame-functions 'on-frame-open)

;; Use all-the-icons theme
(setq neo-theme 'icons)
