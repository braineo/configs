(defun on-frame-open (&optional frame)
  ;; "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))

(defun fit-font-size-to-dpi()
  "Auto resize font for HiDPI displays"
  (let* ((resolution-height (nth 3 (frame-monitor-attribute 'geometry)))
         (physical-height (nth 1 (frame-monitor-attribute 'mm-size)))
         (font-size (ceiling (/ (* resolution-height 299.0 11) (* physical-height 1080)))))
    ;; Calculation base: 24inch 1080p display, resolution height 1080 physical height 299 mm font size 11
    (progn
      (setq dotspacemacs-default-font `("Source Code Pro"
                                        :size ,font-size
                                        :weight normal
                                        :width normal))
      (spacemacs/set-default-font dotspacemacs-default-font))))

(defun set-font-size(font-size)
  "Auto resize font for HiDPI displays"
  (interactive "nfont size: ")
  (spacemacs/set-default-font (append dotspacemacs-default-font `(:size ,font-size))))

(defun braineo-ui/line-number-maybe-on ()
  (when (spacemacs/enable-line-numbers-p)
    (display-line-numbers-mode)))
