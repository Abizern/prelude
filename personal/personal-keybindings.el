;;; personal-keybindings.el --- Emacs Prelude: personal keybindings
;;
;;; Commentary:
;;  Personal settings to augment those of Prelude

;;; Code:

;;; I like to use shell, not eshell
(global-set-key (kbd "C-x m") 'shell)

;;; This overrides the keybinding from Prelude-osx.el
(global-set-key (kbd "C-c C-w") 'backward-kill-word)

;;; org-mode
;;;; Keybinding for org-agenda
(define-key global-map (kbd "C-c a") 'org-agenda)
;;;; Don't keep track of when a TODO item is finished
(setq org-log-done nil)

;;; recentf
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-c C-r") 'recentf-open-files)

;;; Movement by line
;;;; Remaps goto-line so that line numbers are turned on only when needed.
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;;; Join the next line to this one
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;;; Move more quickly
;;;; move about in steps of 5 with C-S insteard of just C-
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-line -5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

;;; Key-chords

(key-chord-define-global "kk" 'just-one-space)
(key-chord-define-global "KK" 'delete-horizontal-space)


(provide 'personal-keybindings)
;;; personal-keybindings.el ends here
