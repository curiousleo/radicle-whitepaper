
SAMPLE_DIR = sections/code
OUT_DIR = out
SAMPLES = $(addprefix $(OUT_DIR)/, kv0.rad-tex kv1.rad-tex repl.rad-tex currency.rad-tex)

.PHONY: ALL
all: $(SAMPLES) LATEX

clean:
	rm $(SAMPLES)
	rm out/oscoin.pdf

$(SAMPLES): $(OUT_DIR)/%.rad-tex : $(SAMPLE_DIR)/%.rad
	echo '\begin{lstlisting}' > $@
	cat $^ >> $@
	echo '\end{lstlisting}' >> $@

.PHONY: LATEX
LATEX:
	latexmk -pdf -jobname=./out/oscoin -interaction=errorstopmode -halt-on-error oscoin.tex
