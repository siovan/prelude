;a couple of basic display things
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(scroll-bar-mode -1)
(setq visible-bell t)
(setq display-time-day-and-date t
                display-time-24hr-format nil)
             (display-time)
(setq-default line-spacing 7)
(set-default-font "Consolas-13")
(set-fringe-style '(40 . 40))
(setq global-hl-line-mode nil)
(load-theme 'inkpot)
(setq global-undo-tree-mode 1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; other keybindings
(global-set-key (kbd "<f11>") 'window-for-writing)
(global-set-key (kbd "<f2>") 'ispell-buffer)
(global-set-key (kbd "<f3>") 'magit-status)
;(global-set-key (kbd "<f12>") 'org2blog/wp-login)
;(global-set-key (kbd "M-<f12>") 'org2blog/wp-logout)
;(global-set-key (kbd "C-<f12>") 'org2blog/wp-new-entry)

;backup file settings
(setq vc-make-backup-files t)
(setq backup-directory-alist `(("." . "~/Dropbox/emacs-backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 10
  kept-old-versions 2
  version-control t)

;;twittering mode
;(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)                ; Show icons
(setq twittering-timer-interval 30)         ; Update your timeline 
(add-hook 'twittering-edit-mode-hook (lambda () (ispell-minor-mode) (flyspell-mode)))

;;muse mode
(require 'muse-mode)     ; load authoring mode
(require 'muse-html)     ; load publishing styles I use
(require 'muse-project)  ; publish files in projects
;(require 'muse-docbook)
;(require 'muse-docbook)

;;org mode settings
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode) '("\\.org\.cpt$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-c L" 'org-insert-link-global)
(global-set-key "\C-c o" 'org-open-at-point-global)
(setq org-log-done t)
(setq org-agenda-span 7)
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      '(
      ("j" "Journal" entry (file+datetree "~/org/journal.org") "* %?\nEntered on %U\n %i\n")
      ("a" "Appointments" entry (file+headline "~/org/work.org" "Appointments") "** %^{prompt} %T\n%A\n")
      ("t" "Work Todo" entry (file+headline "~/org/work.org" "Tasks") "* TODO %?\n %i\n %a")
      ("w" "Work Notes" entry (file+headline "~/org/work.org" "Notes") "** %^{prompt}\n %u\n %a")
      ("m" "Misc Stuff" entry (file "~/org/notes.org") "** %^{prompt}\n %u\n %a")
      ("d" "Dissertation Notes" entry (file+headline "~/org/dissertation.org" "Notes") "** %^{prompt}\n %u\n %a")
      ("s" "Sidney Notes" entry (file+headline "~/org/dissertation.org" "Sidney Notes") "** %^{prompt}\n %u\n %a")
      ("o" "Wroth Notes" entry (file+headline "~/org/dissertation.org" "Wroth Notes") "** %^{prompt}\n %u\n %a")
      ("p" "Petrarch Notes" entry (file+headline "~/org/dissertation.org" "Petrarch Notes") "** %^{prompt}\n %u\n %a")
      ("k" "Shakespeare Notes" entry (file+headline "~/org/dissertation.org" "Shakespeare Notes") "** %^{prompt}\n %u\n %a")
      ("a" "Daniel/Drayton Notes" entry (file+headline "~/org/dissertation.org" "Daniel and Drayton Notes") "** %^{prompt}\n %u\n %a")
      ("r" "Dissertation references" entry (file+headline "~/org/dissertation.org" "Books") "** %^{prompt} ::ref::\n %a")
      ("b" "Bowtie idea" entry (file+headline "~/org/blog.org" "Sidney's Bowtie") "** %^{prompt}\n %u\n")
      ("h" "Hwaetageek idea" entry (file+headline "~/org/blog.org" "Hwaetageek") "** %^{prompt}\n %u\n")))
(setq org-agenda-include-diary t)
