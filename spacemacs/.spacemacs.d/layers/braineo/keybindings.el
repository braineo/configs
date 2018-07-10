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
(global-set-key (kbd "C-c f")  'helm-recentf)
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
(global-set-key (kbd (concat super-keybind-prefix "p")) 'projectile-command-map)
;; make some use of the Super key
;; (global-set-key (kbd "s-g") 'god-local-mode)
(global-set-key (kbd (concat super-keybind-prefix "r")) 'helm-recentf)
(global-set-key (kbd (concat super-keybind-prefix "j")) 'crux-top-join-line)
(global-set-key (kbd (concat super-keybind-prefix "k")) 'crux-kill-whole-line)
(global-set-key (kbd (concat super-keybind-prefix "o")) 'crux-smart-open-line-above)
(global-set-key (kbd (concat super-keybind-prefix "m m")) 'magit-status)
(global-set-key (kbd (concat super-keybind-prefix "m l")) 'magit-log)
(global-set-key (kbd (concat super-keybind-prefix "m f")) 'magit-log-buffer-file)
(global-set-key (kbd (concat super-keybind-prefix "m b")) 'magit-blame)
(global-set-key [remap kill-whole-line] 'crux-kill-whole-line)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Indentation help
(global-set-key (kbd "C-^") 'crux-top-join-line)
;; Start proced in a similar manner to dired
(unless (eq system-type 'darwin)
    (global-set-key (kbd "C-x p") 'proced))

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'smex)

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)

;; A quick major mode help with discover-my-major
(define-key 'help-command (kbd "C-m") 'discover-my-major)

(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)

(define-key 'help-command (kbd "C-i") 'info-display-manual)

;; replace zap-to-char functionality with the more powerful zop-to-char
(global-set-key (kbd "M-z") 'zop-up-to-char)
(global-set-key (kbd "M-Z") 'zop-to-char)

;; kill lines backward
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)
                                        (indent-according-to-mode)))

;; Activate swoop easily inside isearch
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; Better kill-ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd (concat super-keybind-prefix ".")) 'avy-goto-word-or-subword-1)
(global-set-key (kbd (concat super-keybind-prefix "w")) 'ace-window)

;; Quick search and open file
(global-set-key (kbd "C-.") 'helm-projectile-ag)
(global-set-key (kbd "C-,") 'helm-projectile-find-file)

;; Bookmark line and jump back and forth
(global-set-key (kbd "C-<f2>") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)

;; fold
(global-set-key (kbd "C-<tab>") 'evil-toggle-fold)

;; anzu-mode enhances isearch & query-replace by showing total matches and current match position
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; Multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
