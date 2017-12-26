;; easy-kill
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

;; bm
(global-set-key (kbd "C-<f2>") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)
(global-set-key (kbd "s-<f2>") 'bm-previous)

;; fold
(global-set-key (kbd "C-<tab>") 'evil-toggle-fold)

;; anzu-mode enhances isearch & query-replace by showing total matches and current match position
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
