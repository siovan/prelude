;auc and other TeX stuff
(global-auto-revert-mode t)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
;getting reftex to work with footcite et. al.
(setq reftex-cite-format
       '((?\C-m . "\\cite[]{%l}")
        (?f . "\\footcite[][]{%l}")
         (?t . "\\textcite[]{%l}")
         (?p . "\\parencite[]{%l}")
         (?o . "\\citepr[]{%l}")
         (?n . "\\nocite{%l}")))
(setq reftex-cite-prompt-optional-args t) 

;;set xetex mode in tex/latex
'(LaTeX-command “latex -synctex=1″)
'(TeX-output-view-style '(("^pdf$" "." "okular %s.pdf")))
(add-hook 'LaTeX-mode-hook (lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))

; working to get okular as pdf viewer
(setq TeX-view-program-list '(("Okular" "okular --unique %u"))) 
(setq TeX-view-program-selection '((output-pdf "Okular") (output-dvi "Okular")))
(add-hook 'LaTeX-mode-hook '(lambda ()
                  (add-to-list 'TeX-expand-list
                       '("%u" Okular-make-url))))
(defun Okular-make-url () (concat
               "file://"
               (expand-file-name (funcall file (TeX-output-extension) t)
                         (file-name-directory (TeX-master-file)))
               "#src:"
               (TeX-current-line)
               (expand-file-name (TeX-master-directory))
               "./"
               (TeX-current-file-name-master-relative)))

;(add-hook 'find-file-hook 'TeX-fold-buffer t)
;(add-hook 'TeX-mode-hook (lambda ()
;                                  (TeX-fold-mode 1)))
;(add-hook 'find-file-hook 'TeX-fold-buffer t)
(setq TeX-command-default "XeLaTeX")
(setq TeX-save-query nil)
(setq TeX-show-compilation nil)
))
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(setq reftex-plug-into-AUCTeX t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq reftex-texpath-environment-variables
            '("./:/home/sarah/thesis-git//"))
(setq reftex-bibpath-environment-variables
          '("./:/home/sarah/thesis-git//"))
(setq reftex-default-bibliography
        (quote
         ("/home/sarah/thesis-git/thesis-main.bib" "./thesis-main.bib")))
(add-hook 'LaTeX-mode-hook '(lambda ()))
;(setq-default TeX-master "master-file")
;(add-hook 'LaTeX-mode-hook (lambda ()
;                               (TeX-fold-mode 1)))
;(add-hook 'find-file-hook 'TeX-fold-buffer t)
