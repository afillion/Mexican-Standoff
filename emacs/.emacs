(setq tab-width 4) ;setting tab width, 4 char is 42 standard

(setq c-default-style "linux")

(setq-default c-basic-offset 4  ;setting tab width to 4 and indentation offset to 4,
              tab-width 4             ;emacs will indent with tabs instead of spaces
              indent-tabs-mode t)     ;because c-basic-offset and tab-width have the same value

(electric-pair-mode 1)

(setq column-number-mode t)

(setq-default show-trailing-whitespace t)

(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backup/")))

(add-hook 'change-major-mode-after-body-hook '(lambda () (highlight-regexp "  ")))
