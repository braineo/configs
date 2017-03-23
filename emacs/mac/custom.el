;;; Package --- Custom
;;; Commentary:
;; My custom prelude Emacs config

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prelude-require-packages '(qml-mode bm nlinum elpy))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Prelude ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable whitespace mode
(setq prelude-whitespace nil)
;; Disable flyspell check
;; (setq prelude-flyspell nil)
;; Do not remove whitespace
;; (setq prelude-clean-whitespace-on-save nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Appearance ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Font as Source code pro
;; (setq default-frame-alist '((font . "Source Code Pro-12.5")))
(setq default-frame-alist '((font . "Source Code Pro-12.5")))
;; Show line number
(global-nlinum-mode t)
;; Hide scroll bar
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remap tab to autocomplete in helm mode
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
;; (define-key helm-map (kbd "RET") 'helm-execute-persistent-action) ; rebind return to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(global-set-key (kbd "C-;") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)
(global-set-key (kbd "s-<f2>") 'bm-previous)

(global-set-key (kbd "C-.") 'helm-projectile-ag)
(global-set-key (kbd "C-,") 'helm-projectile-find-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Package settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use X window clipboard
;; (xclip-mode t)

;; (global-highlight-parentheses-mode t)
;; Disable smartparens, it will freeze emacs
;; (add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t)
;; (show-smartparens-global-mode -1)


(elpy-enable)
(elpy-use-ipython)
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Auto Generated ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy zop-to-char zenburn-theme yaml-mode which-key volatile-highlights vkill undo-tree swift-mode smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters qml-mode ov operate-on-number nlinum move-text markdown-mode magit json-mode js2-mode imenu-anywhere ido-ubiquitous helm-projectile helm-descbinds helm-ag guru-mode grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido expand-region exec-path-from-shell elisp-slime-nav editorconfig easy-kill discover-my-major diminish diff-hl crux company-go company-anaconda browse-kill-ring bm beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
