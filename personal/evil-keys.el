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
(undo-tree-mode 1)

;keybindings
(define-key evil-motion-state-map "k" 'previous-line)
(define-key evil-motion-state-map "j" 'next-line)
(define-key evil-motion-state-map "0" 'beginning-of-visual-line)
(define-key evil-motion-state-map "$" 'end-of-visual-line)
(define-key evil-motion-state-map "gk" 'evil-previous-line)
(define-key evil-motion-state-map "gj" 'evil-next-line)
(define-key evil-motion-state-map "gs" 'ispell-word)
(define-key evil-motion-state-map "Q" 'transpose-chars)
(define-key evil-motion-state-map "Q" 'transpose-chars)
(define-key evil-motion-state-map "\C-r" 'undo-tree-redo)
; keybindings with leaders
; these have big problems because they make the ; unavailable
(define-key evil-normal-state-map ";b" 'ido-switch-buffer)
(define-key evil-visual-state-map ";;" 'comment-or-uncomment-region)
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-prev-line)

(defun personal-reftex-toc-keys ()
  (interactive)
(define-key reftex-toc-map "j" 'reftex-toc-next)
(define-key reftex-toc-map "k" 'reftex-toc-previous))
(add-hook 'reftex-toc-mode-hook 'personal-reftex-toc-keys)
;; (defun personal-reftex-keys ()
;;   (interactive)
;;   (define-key evil-motion-state-map ";t" 'reftex-toc))
;; (add-hook 'reftex-mode-hook 'personal-reftex-keys)
 
;; (setq evil-leader/leader ","
;;       evil-leader/in-all-states t)
;; (require 'evil-leader)
;; (evil-leader/set-key
;;   "c" 'comment-or-uncomment-region
;;   )

;; (evil-leader/set-key
;;   "e" 'cofi/file
;;   "E" 'cofi/file-alternate
;;   "o" 'cofi-find-at-alias
;;   "O" 'cofi-find-helm-at-alias
;;   "b" 'cofi/buffer
;;   "B" 'cofi/buffer-alternate
;;   "w" 'save-buffer
;;   "W" 'save-some-buffers
;;   "k" 'kill-buffer-and-window
;;   "K" (cmd (kill-buffer (current-buffer)))
;;   "<" 'cofi-cd-alias
;;   "d" 'dired-jump
;;   "D" 'cofi-dired-alias

;;   "m" 'compile

;;   "n" 'split-window-horizontally
;;   "c" 'delete-window
;;   "N" 'make-frame-command
;;   "C" 'delete-frame

;;   "g" 'magit-status
;;   "h" 'monky-status

;;   "s" 'cofi/switch-file
;;   ";" 'cofi/end-prog-line

;;   "." 'evil-ex)
