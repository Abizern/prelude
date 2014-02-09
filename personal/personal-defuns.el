;;; personal-defuns.el --- My elisp helper functions
;;
;; I might want to shift this into a minor mode when I learn how to do that.
;;
;;; Commentary:
;; Convenience defuns that I use myself

;;; Code:

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode -1)))

(defun json-format ()
  "Reformats the JSON in the region for humans."
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(provide 'personal-defuns)
;;; personal-defuns.el ends here
