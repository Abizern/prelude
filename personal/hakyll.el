;;; hakyll.el --- Convenience functions for working with Hakyll.
;;
;;; Commentary:
;; Convenience functions for working with Hakyll.

;;; Code:

;; Hardcode location of Hakyll site.
(defvar hakyll-site-location)
(setq hakyll-site-location "~/Sites/hblog/")

(defun hakyll-new-post (title tags)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive "sTitle: \nsTags: ")
  (let ((file-name (hakyll-title title)))
    (set-buffer (get-buffer-create file-name))
    (progn (markdown-mode))
    (insert (format "---\ntitle: %s\ntags: %s\ndescription: \n---\n\n" title tags))
    (write-file (expand-file-name file-name (concat hakyll-site-location "posts")))
    (switch-to-buffer file-name)
    ))

(defun hakyll-new-note (title)
  "Create a new Note with TITLE."
  (interactive "sTitle: ")
  )

(defun hakyll-title (title)
  "Return a name based on TITLE to use for the file name."
  (concat (format-time-string "%Y-%m-%d") "-" (replace-regexp-in-string " " "-" title) ".markdown")
  )

;;; hakyll.el ends here
