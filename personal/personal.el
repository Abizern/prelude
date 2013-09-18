;;; personal.el --- Emacs Prelude: Personal settings
;;
;;; Commentary:
;; Personal settings to augment those of Prelude

;;; Code:

;; Turn on auto-fill in text modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; Set Menlo 12 as my default font
(set-frame-font "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; Set up what my default browser is
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; Load my paths so that eshell knows what I can do
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Make sure there is a final newline
(setq-default require-final-newline t)

;; Turn off long line highlighting.
(setq whitespace-line-column 250)

;; But it would be nice to autoflow long paragraphs
(setq-default fill-column 80)

;; Turn off whitespace mode
(setq prelude-whitespace nil)

;;; Set up for working with Lisp
(setq slime-default-lisp 'clisp)

;;; Set up for working with Ruby

;; Bind RET to newline-and-indent (bored of usig C-j all the time)
(add-hook 'ruby-mode-hook '(lambda ()
                             (local-set-key (kbd "RET") 'newline-and-indent)))

;; YASnippet

;;; Remove binding of <tab> key from Markdown cycle
;;; This way I can use YASnippets in my markdown files.
(defun markdown-unset-tab ()
  "markdown-mode-hook"
  (define-key markdown-mode-map (kbd "<tab>") nil))
(add-hook 'markdown-mode-hook '(lambda() (markdown-unset-tab)))

;;; Use ido-mode for choosing snippets
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))

;;; Use YASnippet globally
(yas-global-mode 1)

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Enable erase-buffer
(put 'erase-buffer 'disabled nil)

;; I like to use 4 spaces instead of tabs
(setq c-default-style "bsd"
      c-basic-offset 4)

(setq indent-tabs-mode nil)

(setq c-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq objc-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))

(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))


;; Tell gist to use curl
(setq gist-use-curl t)

;; Give me back my command and alt key bindings
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Let's try Solarized as the theme
;;(load-theme 'solarized-dark t)

;; Make sure the packages I like are installed
(prelude-require-packages '(haskell-mode ghc ghci-completion markdown-mode solarized-theme sass-mode textile-mode inf-ruby windresize ace-jump-mode exec-path-from-shell yasnippet))

;; Deleted files should be moved to trash
(setq delete-by-moving-to-trash t)

;; Cursor settings
(add-to-list 'default-frame-alist '(cursor-color . "gold1"))
(setq-default cursor-type 'bar)


;; If I'm running emacs, then I want it to be a server
(require 'server)
(unless (server-running-p)
  (server-start))
