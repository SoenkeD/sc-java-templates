sc=~/go/bin/sc

.PHONY: sc
sc:
	$(sc) gen --root $(PWD) --name templates

.PHONY: export
export:
	$(sc) export --root $(PWD)

.PHONY: compile
compile:
	javac -d bin src/*.java

.PHONY: run
run:
	java -cp ./bin src/Main


.PHONY: exec
exec: compile run