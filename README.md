# OpenTelemetry Collector Custom Build

Make sure you have [ocb](https://opentelemetry.io/docs/collector/custom-collector/) in version v0.81.0 and go v1.19 or higher installed.

1. Get OCB

```bash
go install go.opentelemetry.io/collector/cmd/builder@v0.81.0
```

1. Generate all the collector build files

```bash
make genotelcontribcol
```

1. Build the opentelemetry collector and check the components (output is ./cmd/otelcontribcol)

```bash
make otelcontribcol
./bin/otelcontribcol_linux_amd64 components
```

1. Compile a rpm using [fpm](https://github.com/jordansissel/fpm)

```bash
make rpm-package
```
