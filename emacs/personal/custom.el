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
(setq default-frame-alist '((font . "Source Code Pro-12.5")))
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
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "243bd9824b2a2203c4cf22e306e4fba73f9e6d6f0b032176876980da471bdca5" default)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(package-selected-packages
   (quote
    (markdown-mode molokai-theme material-theme hc-zenburn-theme company-irony cmake-mode irony function-args swift-mode ggtags helm-gtags company-c-headers zop-to-char zenburn-theme which-key volatile-highlights vkill undo-tree smartrep smartparens smart-mode-line qml-mode projectile ov operate-on-number nlinum move-text magit imenu-anywhere highlight-parentheses highlight-indentation guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region exec-path-from-shell editorconfig easy-kill discover-my-major diminish diff-hl crux color-theme-sanityinc-tomorrow browse-kill-ring bm beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
