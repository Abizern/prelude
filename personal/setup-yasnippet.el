;;; setup-yasnippet.el --- My personal yasnippet configuration
;;
;;
;;; Commentary:
;; Updating yasnippet seems to miss out the new directory.
;; Setting up the snippet dirs here means I don't have to 
;; manually update custom.el
;;

;;; Code:
(require 'yasnippet)

(defvar yas-version)

;; Change this to point to the correct yasnippet version
(setq yas-version "200131231.758")

(setq yas-snippet-dirs
      '("~/.emacs.d/personal/snippets"
        (concat "/.emacs.d/elpa/yasnippet-" yas-version)
        ))


;;; setup-yasnippet.el ends here
