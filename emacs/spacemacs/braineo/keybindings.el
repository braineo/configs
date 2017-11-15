(global-set-key (kbd "C-c o") 'crux-open-with)
;; mimic popular IDEs binding, note that it doesn't work in a terminal session

(global-set-key [(shift return)] 'crux-smart-open-line)
(global-set-key (kbd "M-o") 'crux-smart-open-line)
(global-set-key [(control shift return)] 'crux-smart-open-line-above)
(global-set-key [(control shift up)]  'move-text-up)
(global-set-key [(control shift down)]  'move-text-down)
(global-set-key [(meta shift up)]  'move-text-up)
(global-set-key [(meta shift down)]  'move-text-down)
(global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
(global-set-key (kbd "C-c f")  'crux-recentf-ido-find-file)
(global-set-key (kbd "C-M-z") 'crux-indent-defun)
(global-set-key (kbd "C-c u") 'crux-view-url)
(global-set-key (kbd "C-c e") 'crux-eval-and-replace)
(global-set-key (kbd "C-c s") 'crux-swap-windows)
(global-set-key (kbd "C-c D") 'crux-delete-file-and-buffer)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c M-d") 'crux-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
(global-set-key (kbd "C-c TAB") 'crux-indent-rigidly-and-copy-to-clipboard)
(global-set-key (kbd "C-c I") 'crux-find-user-init-file)
(global-set-key (kbd "C-c S") 'crux-find-shell-init-file)
(global-set-key (kbd "C-c i") 'imenu-list-minor-mode)
;; extra prefix for projectile
(global-set-key (kbd "s-p") 'projectile-command-map)
;; make some use of the Super key
;; (global-set-key (kbd "s-g") 'god-local-mode)
(global-set-key (kbd "s-r") 'crux-recentf-ido-find-file)
(global-set-key (kbd "s-j") 'crux-top-join-line)
(global-set-key (kbd "s-k") 'crux-kill-whole-line)
(if (not (spacemacs/system-is-mac))
    (progn
      (global-set-key (kbd "s-m m") 'magit-status)
      (global-set-key (kbd "s-m l") 'magit-log)
      (global-set-key (kbd "s-m f") 'magit-log-buffer-file)
      (global-set-key (kbd "s-m b") 'magit-blame))
  (global-set-key (kbd "H-m m") 'magit-status)
  (global-set-key (kbd "H-m l") 'magit-log)
  (global-set-key (kbd "H-m f") 'magit-log-buffer-file)
  (global-set-key (kbd "H-m b") 'magit-blame))

(global-set-key (kbd "s-o") 'crux-smart-open-line-above)
