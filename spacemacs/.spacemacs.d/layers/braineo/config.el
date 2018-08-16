(defvar super-keybind-prefix "s-" "If it is not macOS, use super otherwise use hyper")

(if (spacemacs/system-is-mac) (setq super-keybind-prefix "H-"))

(setq lsp-python-server-args '("-v" "--log-file" "~/.pyls.log"))
;; (lsp--set-configuration `(:pyls , (:configurationSources . ("pycodestyle", "pyflakes"))))

(defun lsp-set-cfg ()
  (let ((lsp-cfg `(:pyls (:configurationSources . ("flake8")))))
    ;; TODO: check lsp--cur-workspace here to decide per server / project
    (lsp--set-configuration lsp-cfg)))

(add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)
