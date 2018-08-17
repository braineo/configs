(defvar super-keybind-prefix "s-" "If it is not macOS, use super otherwise use hyper")

(if (spacemacs/system-is-mac) (setq super-keybind-prefix "H-"))

(setq lsp-python-server-args `("-v" "--log-file" ,(concat user-home-directory ".pyls.log")))

(defun lsp-set-cfg ()
  (let ((lsp-cfg `(:pyls ((:configurationSources . ("flake8"))
                          (:plugins (:pydocstyle (:enabled . t)
                                                 (:ignore . ("D1"))))))))
    ;; TODO: check lsp--cur-workspace here to decide per server / project
    (lsp--set-configuration lsp-cfg)))

(add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)
