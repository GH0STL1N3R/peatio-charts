VERSION := $(shell cat VERSION)
IMAGE   := gcr.io/hc-public/peatio/charts:$(VERSION)

.PHONY: default build push run ci deploy

default: build run

build:
	@echo '> Building "peatio-charts" docker image...'
	@docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)

run:
	@echo '> Starting "peatio-charts" container...'
	@docker run -d $(IMAGE)

ci:
	@fly -t ci set-pipeline -p peatio-charts -c config/pipelines/review.yml -n
	@fly -t ci unpause-pipeline -p peatio-charts

deploy:
	@helm install ./config/charts/peatio-charts --set "image.tag=$(VERSION)"
