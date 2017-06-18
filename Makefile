#######
#
# Auto-generate the CV/resume pdf and clean up latex crap
#
# Author: Joao Moreira
#
######

# Name of resume file with pdf extension instead of tex
RESUME = resume.pdf

# LaTeX input files
RESUME_DIR = ./sections
RESUME_INPUTS = $(wildcard $(RESUME_DIR)/*.tex)

# Tools
LATEXMK = latexmk
XELATEX = -pdfxe -xelatex
# We need to exclude `recorder` option because otherwise latexmk seems to ignore
# changes in files passed as \input{} to $RESUME
LATEXMKOPT = -recorder- -silent
RM = rm -f

.PHONY: decrap clean

all: $(RESUME)

# Compile the resume tex file
$(RESUME): %.pdf:%.tex $(RESUME_INPUTS)
	$(LATEXMK) $(LATEXMKOPT) $(XELATEX) $<
	@echo
	@echo "Successfully compiled $@!"
	@echo

# Remove all latex temporary files
decrap:
	$(LATEXMK) $(LATEXMKOPT) -c
	cd $(RESUME_DIR) && $(LATEXMK) $(LATEXMKOPT) -c
	$(RM) *.synctex.gz *.xdv
	@echo
	@echo "Removed latex temporary files."
	@echo

# Remove all auto-generated pdfs in addition to the latex temporary files
clean: decrap
	$(LATEXMK) $(LATEXMKOPT) -C
	@echo
	@echo "Removed all compiled pdf files."
	@echo


