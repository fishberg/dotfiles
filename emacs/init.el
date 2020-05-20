;; Add MELPA repos
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install 'try'
(use-package try
  :ensure t)
;; Example:
;; M-x try
;; 2048-game
;; M-x 2048-game

;; Hides startup message
(setq inhibit-startup-message t)

;; http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html
(load-theme `tango-dark)

;; https://www.emacswiki.org/emacs/AutoSave
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; https://www.emacswiki.org/emacs/ToolBar
(tool-bar-mode -1)

;; https://www.youtube.com/watch?v=32IHE8wsqPY
;; Don't show menu
(menu-bar-mode -1)

;; Don't show scrollbar
(scroll-bar-mode -1)

;; Highlight line
;; (global-hl-line-mode +1)

;; Delete selection
(delete-selection-mode 1)

;; Show matching parenthesis
(show-paren-mode 1)

;; Enable built in ido completion (similar to helm)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Show line numbers
;; https://www.emacswiki.org/emacs/LineNumbers
(global-display-line-numbers-mode)

;; Install which-key
;; https://www.youtube.com/watch?v=49kBWM3RQQ8
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Disable bell sound
;; https://www.emacswiki.org/emacs/AlarmBell
(setq ring-bell-function 'ignore)

;; https://www.youtube.com/watch?v=v5eTK5lC0xs
;; Uses interactive buffer list in main window
(defalias 'list-buffers 'ibuffer)
;; Flag buffers to delete with D; execute delete with x
;; Same as above, but opens in other windows instead
;; (defalias 'list-buffers 'ibuffer-other-window)

;; Allows you to change windows with Shift+Arrow
;; https://www.youtube.com/watch?v=D6OUMVbPKSA
;; (windmove-default-keybindings)
;; Disable to prevent collisions with org-mode

;; Always use 'y or n' instead of 'yes or no'
;; https://www.emacswiki.org/emacs/YesOrNoP
(defalias 'yes-or-no-p 'y-or-n-p)

;; Bind ESC to behave like C-g instead of Mod
;; https://www.reddit.com/r/emacs/comments/67rlfr/esc_vs_cg/
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))




;; ORG MODE
;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
;; https://www.youtube.com/watch?v=SzA2YODtgK4

;; Adds closed time stamp when completing TODO item
(setq org-log-done 'time)

;; Bind org-capture to "C-c c"
(define-key global-map "\C-cc" 'org-capture)

;; Create a TODO template
;;(setq org-capture-templates
;;        '(("t" "Todo"
;;         entry
;;        (file "~/gtd/inbox.org")
;;         "* TODO %?\n")))
(setq org-capture-templates
        '(("t" "Todo"
         entry
        (file+headline "~/gtd/todo.org" "Inbox")
         "* TODO %?\n")))

;; Create TODO function
(defun org-capture-todo ()
  (interactive)
  (org-capture :keys "t"))

;; Add shortcut for quickly adding TODOs
(global-set-key (kbd "M-n") 'org-capture-todo)

;; Set archive location
(setq org-archive-location (concat "~/gtd/archive.org" "::* From %s"))

;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
(defun mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))
;;  (org-archive-subtree))

;;(define-key org-mode-map (kbd "C-c C-x C-s") 'mark-done-and-archive)

;; Unicode Org Mode Bullets
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

;; Change default Unicode bullet to better character
;; https://github.com/sabof/org-bullets/blob/master/org-bullets.el
;; Use setq instead of defcustom
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/defcustom.html
(setq org-bullets-bullet-list '("●"))
;; "◉" "○" "✸" "✿" "♥" "● "

;; Change org collapsed ... to arrow
;; https://endlessparentheses.com/changing-the-org-mode-ellipsis.html
;;(setq org-ellipsis "⤵")
(setq org-ellipsis "↴")

;; Change TODO keywords
;; Org preloads these, so after editing, you need to run org-mode-restart or restart Emacs
;; https://emacs.stackexchange.com/questions/30613/adding-modifying-todo-keywords
;; Local TODO keywords: https://emacs.stackexchange.com/questions/55845/use-global-local-org-mode-todo-keywords-in-a-file
;; Timestamp and Note Sequences: https://www.gnu.org/software/emacs/manual/html_node/org/Tracking-TODO-state-changes.html
;; TODO types: https://orgmode.org/manual/TODO-types.html
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
;; @ adds note
;; ! adds time stamp on change
;; change with "C-c C-t"
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)")))

;;(setq org-todo-keywords
;;      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))


;; TODO keyword colors
;; http://doc.norang.ca/org-mode.html

;;(setq org-todo-keyword-faces
;;      (quote (("TODO" :foreground "red" :weight bold)
;;              ("NEXT" :foreground "blue" :weight bold)
;;              ("DONE" :foreground "forest green" :weight bold)
;;              ("WAITING" :foreground "orange" :weight bold)
;;              ("HOLD" :foreground "magenta" :weight bold)
;;              ("CANCELLED" :foreground "forest green" :weight bold)
;;              ("MEETING" :foreground "forest green" :weight bold)
;;              ("PHONE" :foreground "forest green" :weight bold))))

;;(setq org-todo-keywords '((type "Fred" "Sara" "Lucy" "|" "DONE")))

;; Export Beamer from Org Mode
(require 'ox-beamer)

;; Export Markdown from Org Mode
(require 'ox-md)

;; Org Mode Agenda
(setq agenda-directory "~/gtd") ;; if directory is provided, will grab all org files in that directory
(setq org-agenda-files (list agenda-directory))

(global-set-key (kbd "<f12>") 'org-agenda)
