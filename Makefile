.PHONY: notebook notebookRun

notebook:
	docker build . -t jupyter-notebook

notebookRun:
	docker run -ti --name notebook -p "8888:8888" jupyter-notebook
