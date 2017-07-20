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
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))
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
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(elpy-eldoc-show-current-function t)
 '(elpy-rpc-backend "jedi")
 '(fci-rule-color "#383838")
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (irony function-args company-c-headers ggtags helm-gtags color-theme-sanityinc-tomorrow zop-to-char zenburn-theme yaml-mode which-key volatile-highlights vkill undo-tree swift-mode smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters qml-mode ov operate-on-number nlinum move-text markdown-mode magit json-mode js2-mode imenu-anywhere ido-ubiquitous helm-projectile helm-descbinds helm-ag guru-mode grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido expand-region exec-path-from-shell elpy elisp-slime-nav editorconfig easy-kill discover-my-major diminish diff-hl crux company-go company-anaconda browse-kill-ring bm beacon anzu ace-window)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
