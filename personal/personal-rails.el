;;; personal-rails.el --- Personal Rails Settings
;;
;;; Commentary:
;;  Personal settings for editing files related to Ruby on Rails

;;; Code:

;; Set up to use rhtml mode for erb files
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))


(provide 'personal-rails)
;;; personal-rails.el ends here
