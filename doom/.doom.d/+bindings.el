;;; ~/Develop/configs/doom/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map! :g "M-v" #'scroll-down-command
      ;; easy kill
      [remap kill-ring-save] #'easy-kill
      [remap mark-sexp] #'easy-mark
      ;; Prettier query replace
      [remap query-replace] #'anzu-query-replace
      [remap query-replace-regexp] #'anzu-query-replace-regexp
      ;; Better kill-ring
      :g "M-y" #'helm-show-kill-ring
      ;; Quick search and open file
      :g "C-." #'helm-projectile-ag
      :g "C-," #'helm-projectile-find-file
      ;; Magit!
      :g "C-x g" #'magit-status
      :g "s-m m" #'magit-status
      :g "s-m l" #'magit-log
      :g "s-m f" #'magit-log-buffer-file
      :g "s-m b" #'magit-blame
      ;; Shoot like a sniper
      :g "C-c j" 'avy-goto-word-or-subword-1
      ;; Multiple cursors
      :g "C->" #'mc/mark-next-like-this
      :g "C-<" #'mc/mark-previous-like-this
      ;; Move to the beginning/end of line, code or comment
      :g "C-a" #'mwim-beginning-of-code-or-line
      :g "C-e" #'mwim-end-of-code-or-line
      ;; Collection of Ridiculously Useful eXtensions for Emacs WOW
      :g "M-o" #'crux-smart-open-line
      :g "C-c n" #'crux-cleanup-buffer-or-region
      :g "C-c f" #'helm-recentf
      :g "C-M-z" #'crux-indent-defun
      :g "C-c u" #'crux-view-url
      :g "C-c e" #'crux-eval-and-replace
      :g "C-c s" #'crux-swap-windows
      :g "C-c D" #'crux-delete-file-and-buffer
      :g "C-c d" #'crux-duplicate-current-line-or-region
      :g "C-c M-d" #'crux-duplicate-and-comment-current-line-or-region
      :g "C-c r" #'crux-rename-buffer-and-file
      :g "C-c t" #'crux-visit-term-buffer
      :g "C-c k" #'crux-kill-other-buffers
      :g "C-c TAB" #'crux-indent-rigidly-and-copy-to-clipboard
      :g "C-c I" #'crux-find-user-init-file
      :g "C-c S" #'crux-find-shell-init-file
      ;; Move text
      :g [(control shift up)]  #'move-text-up
      :g [(control shift down)]  #'move-text-down
      :g [(meta shift up)]  #'move-text-up
      :g [(meta shift down)]  #'move-text-down


      (:map helm-swoop-map
          :n "n" #'circe-command-NAMES))



(provide '+bindings)

;;; +bindings.el ends here
