all: genotelcontribcol otelcontribcol rpm-package

.PHONY: otelcontribcol
otelcontribcol:
	cd ./cmd/otelcontribcol && GO111MODULE=on CGO_ENABLED=0 go build -v -trimpath -o ../../bin/otelcontribcol_linux_amd64 .


.PHONY: genotelcontribcol
genotelcontribcol:
	builder --skip-compilation --config builder-config.yaml --output-path cmd/otelcontribcol

.PHONY: rpm-package
rpm-package:
	docker build -t otelcontribcol-fpm internal/buildscripts/packaging/fpm
	docker run --rm -v $(CURDIR):/repo:z -e PACKAGE=$* -e VERSION=v0.81.0 -e ARCH=amd64 otelcontribcol-fpm
