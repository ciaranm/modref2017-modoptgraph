all : tables graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' talk

TABLES =

GRAPHS =

tables : $(TABLES)

graphs : $(GRAPHS)

gen-graph-%.tex : graph-%.gnuplot
	gnuplot $<

gen-graph-%.pdf : graph-%.gnuplot $(DATA)
	gnuplot $<
	sed -i -e '5,18s/^\(\\path.*\)/\% \1/' gen-graph-$*.tex # epic haxx
	latexmk -pdf gen-graph-$*

