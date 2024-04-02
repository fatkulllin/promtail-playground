.PHONY: run, run-echo, pull
.ONESHELL: run, run-echo, pull

pull:
	curl -O -L "https://github.com/grafana/loki/releases/download/v2.9.4/loki-linux-amd64.zip"
	unzip -o "loki-linux-amd64.zip"
	chmod a+x "loki-linux-amd64"
	rm -f loki-linux-amd64.zip

run:
	./promtail-linux-amd64 -dry-run -inspect -config.file=config.yaml 

run-echo:
	cat test.log | ./promtail-linux-amd64 -dry-run -stdin -inspect -config.file=config.yaml 