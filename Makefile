# This is just my personal scripts for development

build:
	docker build -t docker-selenium-lambda .
bash:
	docker run --rm -it --entrypoint '' docker-selenium-lambda bash
run:
	docker run -p 7000:8080 --rm -it docker-selenium-lambda
test:
	curl -XPOST "http://localhost:7000/2015-03-31/functions/function/invocations" -d '{}'
