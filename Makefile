NAME :=myway

${NAME}.pdf : ${NAME}.tex
	echo "latex编译一遍"
	xelatex --shell-escape $<
	
	echo "编译aux文件"
	bibtex ${NAME}.aux
	
	echo "编译两遍tex文件"
	xelatex --shell-escape $<
	xelatex --shell-escape $<
	evince ${NAME}.pdf
	
clean:
	rm -f *.gz
	rm -f *.aux *.log *.synctex 
	rm -f *.aux *.tex.bak *.toc 
	rm -f *.bbl *.blg
	rm -r *.out *.pyg
