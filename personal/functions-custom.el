;; ;; Word count!
(defun word-count2 (&optional filename)
  "Returns the word count of the current buffer.  If `filename' is not nil, returns the word count of that file."
  (interactive)
  (save-some-buffers) ;; Make sure the current buffer is saved
  (let ((tempfile nil))
    (if (null filename)
        (progn
          (let ((buffer-file (buffer-file-name))
                (lcase-file (downcase (buffer-file-name))))
            (if (and (>= (length lcase-file) 4) (string= (substring lcase-file -4 nil) ".tex"))
                ;; This is a LaTeX document, so DeTeX it!
                (progn
                  (setq filename (make-temp-file "wordcount"))
                  (shell-command-to-string (concat "detex < " buffer-file " > " filename))
                  (setq tempfile t))
              (setq filename buffer-file)))))
    (let ((result (car (split-string (shell-command-to-string (concat "wc -w " filename)) " "))))
      (if tempfile
          (delete-file filename))
      (message (concat "Word Count: " result))
      )))
(global-set-key (quote [f6]) 'word-count2)

(defun window-for-writing ()
"Provides a set of defaults to set the frame up for writing"
(interactive) 
(set-frame-font "Consolas-13")
(set-fringe-style '(120 . 120))
(menu-bar-mode -1)
;(set-frame-height (selected-frame) 40)
;(set-frame-width (selected-frame) 155)
)
