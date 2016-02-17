;;; personal.el --- Emacs Prelude: Personal settings
;;
;;; Commentary:
;; Personal settings to augment those of Prelude
;; Install Emacs through homebrew with --cocoa --srgb

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
(setq-default fill-column 120)

;; Turn off whitespace mode
(setq prelude-whitespace nil)

;;; Set up for working with Lisp
(setq slime-default-lisp 'clisp)

;;; Set up for working with Ruby

;; Bind RET to newline-and-indent (bored of usig C-j all the time)
(add-hook 'ruby-mode-hook '(lambda ()
                             (local-set-key (kbd "RET") 'newline-and-indent)))

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
(add-to-list 'auto-mode-alist '("\\.swift$" . swift-mode))


;; Tell gist to use curl
(setq gist-use-curl t)

;; Give me back my command and alt key bindings
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Make sure the packages I like are installed
(prelude-require-packages '(haskell-mode
                            ghc
                            ghci-completion
                            markdown-mode
                            sass-mode
                            textile-mode
                            windresize
                            web-mode
                            flycheck-haskell))

;; Deleted files should be moved to trash
(setq delete-by-moving-to-trash t)

;; Cursor settings
(add-to-list 'default-frame-alist '(cursor-color . "gold1"))
(setq-default cursor-type 'bar)

;; Fix for visual bell in the middle of the screen
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;; If I'm running emacs, then I want it to be a server
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'personal)
;;; personal.el ends here
