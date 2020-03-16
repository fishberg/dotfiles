(package-initialize)

(setq inhibit-startup-message t)

;; http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html
(load-theme `tango-dark)

;; https://www.emacswiki.org/emacs/AutoSave
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; https://www.emacswiki.org/emacs/ToolBar
(tool-bar-mode -1)
