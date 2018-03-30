;;; Package --- Custom
;;; Commentary:
;; My custom prelude Emacs config

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prelude-require-packages '(qml-mode bm nlinum highlight-parentheses highlight-indentation color-theme-sanityinc-tomorrow))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Prelude ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable whitespace mode
;; (setq prelude-whitespace nil)
;; Disable flyspell check
(setq prelude-flyspell nil)
;; Do not remove whitespace
(setq prelude-clean-whitespace-on-save nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Appearance ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Font as Source code pro
(setq default-frame-alist '((font . "Source Code Pro for Powerline-12.5")))
;; Show line number. Disable it due to performance issue. Also try using nlinum-mode
(global-nlinum-mode t)
;; Hide scroll bar
(scroll-bar-mode -1)
;; Whitespace mode style: Show tabs empty and trailling spaces
(setq whitespace-style '(face tabs empty trailing))
;; Transparency setting
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))
;; Disable default theme to enable custom theme
(disable-theme 'zenburn)
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remap tab to autocomplete in helm mode
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
;; (define-key helm-map (kbd "RET") 'helm-execute-persistent-action) ; rebind return to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; (global-set-key (kbd "C-;") 'bm-toggle)
;; (global-set-key (kbd "M-;") 'bm-next)
;; (global-set-key (kbd "s-;") 'bm-previous)

(global-set-key (kbd "C-.") 'helm-projectile-ag)
(global-set-key (kbd "C-,") 'helm-projectile-find-file)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Package settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use X window clipboard
;; (xclip-mode t)

(global-highlight-parentheses-mode t)

;; Comment style
(setq comment-style 'multi-line)

;; Disable smartparens for large files, it will freeze emacs when opening
(add-hook 'prelude-prog-mode-hook (lambda ()
                                    (when (> (buffer-size) 40000)
                                      (smartparens-mode -1))))
(show-smartparens-global-mode -1)

;; Disable which-function-mode in python-mode when open large files
(add-hook 'prelude-python-mode-hook (lambda ()
                                      (when (> (buffer-size) 20000)
                                        (which-function-mode -1))))

;; Elpy Setup
;; (elpy-enable)
;; (elpy-use-ipython)
;; (setq elpy-rpc-backend "jedi")

;; Highlight-indentation
(defun set-highlight-indentation-mode-background ()
  (set-face-background 'highlight-indentation-face "#1d1f21")
  (set-face-background 'highlight-indentation-current-column-face "#121314"))
(add-hook 'python-mode-hook 'highlight-indentation-mode)
(add-hook 'highlight-indentation-mode-hook 'set-highlight-indentation-mode-background)


;;;;;;;;;;;;;;;;;;;;;;;;;;;; Auto Generated ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (swift-mode company-irony irony function-args helm-gtags company-c-headers color-theme-sanityinc-tomorrow vkill exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
