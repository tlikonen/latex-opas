;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((fill-column . 72)
         (indent-tabs-mode . nil)))
 (latex-mode . ((eval . (outline-minor-mode))
                (eval . (auto-fill-mode))
                (TeX-engine . luatex)
                (TeX-master . "kaytannollista-latexia.tex")
                (TeX-open-quote . "''")
                (LaTeX-verbatim-environments-local
                 . ("koodilohkosis" "koodilohko"))
                (font-latex-quotes . nil)))
 (bibtex-mode . ((bibtex-dialect . biblatex)
                 (bibtex-text-indentation . 20)
                 (bibtex-contline-indentation . 21)))
 (makefile-mode . ((indent-tabs-mode . t)))
 (markdown-mode . ((eval . (auto-fill-mode)))))
