;;; setup-yasnippet.el --- My personal yasnippet configuration
;;
;;
;;; Commentary:
;; YASnippet setup.

;;; Code:
(require 'yasnippet)

;;; Remove binding of <tab> key from Markdown cycle
;;; This way I can use YASnippets in my markdown files.
(defvar markdown-mode-map)
(defun markdown-unset-tab ()
  "Markdown-mode-hook."
  (define-key markdown-mode-map (kbd "<tab>") nil))
(add-hook 'markdown-mode-hook '(lambda() (markdown-unset-tab)))

;;; Use ido-mode for choosing snippets
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))

;;; Use YASnippet globally
(yas-global-mode 1)

;;; setup-yasnippet.el ends here
