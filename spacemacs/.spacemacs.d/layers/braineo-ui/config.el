
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
(defun delete-lsp-ui-frame()
  (when (bound-and-true-p lsp-ui-mode)
    'lsp-ui-doc--delete-frame))
(add-hook 'helm-major-mode-hook 'delete-lsp-ui-frame)

;; Use all-the-icons theme
(setq neo-theme 'icons)

(defun fit-font-size-to-dpi()
  "Auto resize font for HiDPI displays"
  (let* ((resolution-height (nth 3 (frame-monitor-attribute 'geometry)))
         (physical-height (nth 1 (frame-monitor-attribute 'mm-size)))
         (font-size (ceiling (/ (* resolution-height 299.0 11) (* physical-height 1080))))
         )
    ;; Calculation base: 24inch 1080p display, resolution height 1080 physical height 299 mm font size 11
    (progn
      (setq dotspacemacs-default-font `("Source Code Pro"
                                        :size ,font-size
                                        :weight normal
                                        :width normal))
      (spacemacs/set-default-font dotspacemacs-default-font))
    ))

(defun set-font-size(size)
  "Auto resize font for HiDPI displays"
  (interactive "nfont size: ")
      (progn
      (setq dotspacemacs-default-font `("Source Code Pro"
                                        :size ,size
                                        :weight normal
                                        :width normal))
      (spacemacs/set-default-font dotspacemacs-default-font))
    )
