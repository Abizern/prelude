;;; hakyll.el --- Convenience functions for working with Hakyll.
;;
;;; Commentary:
;; Convenience functions for working with Hakyll.

;;; Code:

(defvar hakyll-site-location "~/Sites/hblog/"
  "The location of the Hakyll files.")

(defun hakyll-new-post (title tags)
  "Create a new Hakyll post for today with TITLE and TAGS."
  (interactive "sTitle: \nsTags: ")
  (let ((file-name (hakyll-file-name-with-date title)))
    (set-buffer (get-buffer-create file-name))
    (insert
     (format "---\ntitle: %s\ntags: %s\ndescription: \n---\n\n"
             title
             (downcase tags)))
    (write-file
     (expand-file-name file-name (concat hakyll-site-location "posts")))
    (switch-to-buffer file-name)))

(defun hakyll-new-talk (title)
  "Create a new Hakyll talk for today with TITLE."
  (interactive "sTitle: ")
  (let ((file-name (hakyll-file-name-with-date title)))
    (set-buffer (get-buffer-create file-name))
    (insert
     (format "---\ntitle: %s\ndescription: \n---\n\n" title))
    (write-file
     (expand-file-name file-name (concat hakyll-site-location "talks")))
    (switch-to-buffer file-name)))


(defun hakyll-new-note (title)
  "Create a new Note with TITLE."
  (interactive "sTitle: ")
  (let ((file-name (hakyll-file-name title)))
    (set-buffer (get-buffer-create file-name))
    (insert (format "---\ntitle: %s\ndescription: \n---\n\n" title))
    (write-file
     (expand-file-name file-name (concat hakyll-site-location "notes")))
    (switch-to-buffer file-name)))


(defun hakyll-new-source (title)
  "Create a new Source post with TITLE."
  (interactive "sTitle: ")
  (let ((file-name (hakyll-file-name title)))
    (set-buffer (get-buffer-create file-name))
    (insert (format "---\ntitle: %s\ndescription: \n---\n\n" title))
    (write-file
     (expand-file-name file-name (concat hakyll-site-location "source")))
    (switch-to-buffer file-name)))


(defun hakyll-file-name-with-date (title)
  "Return a file name based on TITLE for the post."
  (concat
   (format-time-string "%Y-%m-%d")
   "-"
   (replace-regexp-in-string " " "-" (downcase title))
   ".markdown"))

(defun hakyll-file-name (title)
  "Return a file name based on TITLE for the note."
  (concat
   (replace-regexp-in-string " " "-" (downcase title))
   ".markdown"))

(provide 'hakyll)
;;; hakyll.el ends here
