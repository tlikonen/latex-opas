;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((fill-column . 72)
         (indent-tabs-mode . nil)))
 (latex-mode . ((mode . auto-fill)
                (mode . outline-minor)
                (TeX-engine . luatex)
                (TeX-master . "kaytannollista-latexia.tex")
                (TeX-open-quote . "''")
                (LaTeX-verbatim-environments-local
                 . ("koodilohkosis" "koodilohko"))
                (font-latex-quotes . nil)))
 (bibtex-mode . ((bibtex-dialect . biblatex)
                 (bibtex-text-indentation . 17)
                 (bibtex-contline-indentation . 18)
                 ;; Seuraavaa ei tarvita enää Emacs 28:ssa:
                 (fill-prefix . "                  ")))
 (makefile-mode . ((indent-tabs-mode . t)))
 (markdown-mode . ((mode . auto-fill))))
