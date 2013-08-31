;;; personal-gpg.el --- Personal gpg Settings
;;
;;; Commentary:
;;  Personal settings for dealing with files and gpg

;;; Code:

;; Auto encrypt and decrypt
(require 'epa-file)

;; Set up environment variables
(setq epg-gpg-program "/usr/local/bin/gpg")


(provide 'personal-gpg)
;;; personal-gpg.el ends here
