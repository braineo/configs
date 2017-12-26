(defvar super-keybind-prefix "s-" "If it is not macOS, use super otherwise use hyper")

(if (spacemacs/system-is-mac) (setq super-keybind-prefix "H-"))
