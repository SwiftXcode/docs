# Makefile

all:
	mkdocs build
	
run:
	mkdocs serve

publish: all
	git add docs
	git commit -m "update website" docs
	git push
