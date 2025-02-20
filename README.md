Base project for Ocaml project on Ford-Fulkerson. This project contains some simple configuration files to facilitate editing Ocaml in VSCode.

To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.
Then open VSCode in the root directory of this repository (command line: `code path/to/ocaml-maxflow-project`).

Features :
 - full compilation as VSCode build task (Ctrl+Shift+b)
 - highlights of compilation errors as you type
 - code completion
 - automatic indentation on file save


A makefile provides some useful commands:
 - `make build` to compile. This creates an ftest.native executable
 - `make demo` to run the `ftest` program with some arguments
 - `make format` to indent the entire project
 - `make edit` to open the project in VSCode
 - `make clean` to remove build artifacts

In case of trouble with the VSCode extension (e.g. the project does not build, there are strange mistakes), a common workaround is to (1) close vscode, (2) `make clean`, (3) `make build` and (4) reopen vscode (`make edit`).

Concernant les Tool Test :

Afin de vérifier les fonctions de Tools, faire make demo. Après l'exécution de ftest, il y a l'exécution de ToolTest qui vérifie l'utilisation de la fonction gmap et add arc, (ici on ajoute un arc du noeud 0 au noeud 4  de cout 13 sur le graph 1) et affiche le résultat à l'écran. Afin de tester clone_nodes, décommenter la ligne de test.

Concernant Ford Fulkerson: 
Les tests sont réalisés en faisant make demo ( ils sont à la suite des tests sur Tool).
Application de notre algorithme sur 3 types de graph : simple, circulaire et complexe. 
On obtient des fichiers .svg qui sont comparables avec les résultats trouvés sur le site :

https://www-m9.ma.tum.de/graph-algorithms/flow-ford-fulkerson/index_en.html

Sinon : 
dans la console, affichage des noeuds et des arcs obtenus avant et après exécution de l'algortihme. 
