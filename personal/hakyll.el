;;; hakyll.el --- Convenience functions for working with Hakyll.
;;
;;; Commentary:
;; Convenience functions for working with Hakyll.

;;; Code:

(defun hakyll-site-location ()
  "Return the location of the Hakyll files."
  "~/Sites/hblog/")

(defun hakyll-new-post (title tags)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive "sTitle: \nsTags: ")
  (let ((file-name (hakyll-post-title title)))
    (set-buffer (get-buffer-create file-name))
    (markdown-mode)
    (insert
     (format "---\ntitle: %s\ntags: %s\ndescription: \n---\n\n" title tags))
    (write-file
     (expand-file-name file-name (concat (hakyll-site-location) "posts")))
    (switch-to-buffer file-name)))

(defun hakyll-new-note (title)
  "Create a new Note with TITLE."
  (interactive "sTitle: ")
  (let ((file-name (hakyll-note-title title)))
    (set-buffer (get-buffer-create file-name))
    (markdown-mode)
    (insert (format "---\ntitle: %s\ndescription: \n---\n\n" title))
    (write-file
     (expand-file-name file-name (concat (hakyll-site-location) "notes")))
    (switch-to-buffer file-name)))

(defun hakyll-post-title (title)
  "Return a file name based on TITLE for the post."
  (concat
   (format-time-string "%Y-%m-%d")
   "-"
   (replace-regexp-in-string " " "-" (downcase title))
   ".markdown"))

(defun hakyll-note-title (title)
  "Return a file name based on TITLE for the note."
  (concat
   (replace-regexp-in-string " " "-" (downcase title))
   ".markdown"))

;;; hakyll.el ends here
