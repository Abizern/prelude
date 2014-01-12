;;; setup-yasnippet.el --- My personal yasnippet configuration
;;
;;
;;; Commentary:
;; YASnippet setup.

;;; Code:
(require 'yasnippet)

(defvar prelude-personal-dir)
(defvar prelude-personal-snippets-dir
  (expand-file-name "snippets" prelude-personal-dir)
  "This folder houses additional YASnippet bundles added by users.")

(add-to-list 'yas-snippet-dirs prelude-personal-snippets-dir)

;; term-mode does not play well with YASnippet
(add-hook 'term-mode-hook (lambda ()
                            (yas-minor-mode -1)))

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
