
all:	ms.pdf letter.pdf

ms.pdf:	ms.md refs.bib
	pandoc -s ms.md \
	--template=preep_latex.tex \
	--filter pandoc-crossref \
	--filter pandoc-citeproc \
	-V papersize=letter \
	-V mainfont="Palatino" \
	-V mainfontoptions="Numbers=Lining" \
	-V mathfont="Palatino" \
	-V fontsize=12pt \
	-V geometry:margin=1.1in \
	-V linestretch=1.25 \
	--pdf-engine=xelatex \
	--csl=journal-of-neurophysiology.csl \
	-o ms.pdf

default.BMI_letter = /Users/plg/github/LaTeX/BMI_letter/default.BMI_letter
BMI_letter.cls = /Users/plg/github/LaTeX/BMI_letter/BMI_letter.cls

letter.pdf:	letter.md $(default.BMI_letter) $(BMI_letter.cls)
	pandoc --template=$(default.BMI_letter) --pdf-engine=xelatex letter.md -o letter.pdf

clean:	
	rm -fr ms.pdf letter.pdf


