; load evil and start it
(add-to-list 'load-path "~/.emacs.d/personal/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/personal/evil-surround")
(require 'surround)
(global-surround-mode 1)
(global-visual-line-mode 1)

(add-to-list 'load-path "~/.emacs.d/personal/undo-tree")
(require 'undo-tree)

;keybindings
(define-key evil-motion-state-map "k" 'previous-linedefine-key)
(define-key evil-motion-state-map "j" 'next-line)
(define-key evil-motion-state-map "0" 'beginning-of-visual-line)
(define-key evil-motion-state-map "$" 'end-of-visual-line)
(define-key evil-motion-state-map "gk" 'evil-previous-line)
(define-key evil-motion-state-map "gj" 'evil-next-line)
(define-key evil-motion-state-map "gs" 'ispell-word)
(define-key evil-motion-state-map "Q" 'transpose-chars)
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-prev-line)
