
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest.native
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ToolTest.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build



	@echo "\n====TOOL TEST ====\n"
	@echo "\n==== INITIAL GRAPH TOOL TEST ====\n"
	@cat graphs/graph1
	@echo "\n==== EXECUTING TOOL TEST ADD 3 TO ARC 0 2 ====\n"
	./ToolTest.native graphs/graph1 1 2 outfile
	@echo "\n==== RESULT OF TOOL TEST ==== (content of outfile) \n"
	@cat outfile
	


	@echo "\n====FORD FULKERSON TEST SIMPLE GRAPH ====\n"
	@echo "\n==== INITIAL GRAPH Fulkerson easy graph  TEST====\n"
	@cat graphs/graph_easy
	@echo "\n==== EXECUTING FORD FULKERSON ====\n"
	./ftest.native graphs/graph_easy 0 3 outfile
	@echo "\n==== RESULT OF FORD FULKERSON ==== (content of outfile) \n"
	@cat outfile
	dot -Tsvg graph.dot > graph_simple.svg



	@echo "\n====FORD FULKERSON TEST CIRCULAR GRAPH ====\n"
	@echo "\n==== INITIAL GRAPH Fulkerson Circular ====\n"
	@cat graphs/graph_circulaire
	@echo "\n==== EXECUTING FORD FULKERSON ====\n"
	./ftest.native graphs/graph_circulaire 0 3 outfile
	@echo "\n==== RESULT OF FORD FULKERSON ==== (content of outfile) \n"
	@cat outfile
	dot -Tsvg graph.dot > graph_circular.svg

	@echo "\n====FORD FULKERSON TEST CIRCULAR GRAPH ====\n"
	@echo "\n==== INITIAL GRAPH Fulkerson Complex ====\n"
	@cat graphs/graph_complex
	@echo "\n==== EXECUTING FORD FULKERSON ====\n"
	./ftest.native graphs/graph_complex 0 6 outfile
	@echo "\n==== RESULT OF FORD FULKERSON ==== (content of outfile) \n"
	@cat outfile
	dot -Tsvg graph.dot > graph_complex.svg








	

clean:
	-rm -rf _build/
	-rm ftest.native
	-rm ToolTest.native
	-rm graph.dot
	-rm graph_complex.svg
	-rm graph_circular.svg
	-rm graph_simple.svg
	-rm outfile

