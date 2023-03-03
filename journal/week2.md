# Week 2 — Distributed Tracing

## HoneyComb

I am able to create a new dataset

In order to prove that I am able to create a new dataset, I am providing the instructions I used for creating a new dataset using Gitpod.

```
export HONEYCOMB_API_KEY=""
export HONEYCOMB_SERVICE_NAME="Cruddur"
gp env HONEYCOMB_API_KEY=""
gp env HONEYCOMB_SERVICE_NAME="Cruddur"
```

I added the following files to the requirements.txt

```
opentelemetry-api 
opentelemetry-sdk 
opentelemetry-exporter-otlp-proto-http 
opentelemetry-instrumentation-flask 
opentelemetry-instrumentation-requests
```

I installed these dependencies.

```
pip install -r requirements.txt
```

I added the following to the app.py

```
from opentelemetry import trace
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
```

```
# Initialize tracing and an exporter that can send data to Honeycomb
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)
```

```
# Initialize automatic instrumentation with Flask
app = Flask(__name__)
FlaskInstrumentor().instrument_app(app)
RequestsInstrumentor().instrument()
```

Add the following Env Vars to backend-flask in docker compose

```
OTEL_EXPORTER_OTLP_ENDPOINT: "https://api.honeycomb.io"
OTEL_EXPORTER_OTLP_HEADERS: "x-honeycomb-team=${HONEYCOMB_API_KEY}"
OTEL_SERVICE_NAME: "${HONEYCOMB_SERVICE_NAME}"
```

![two-APIs](https://user-images.githubusercontent.com/84492994/222685585-1ec9d193-6b4e-4b6c-ab71-fd254ee20803.jpg)

## X-Ray

### Instrument AWS X-Ray for Flask

Make sure aws region is set as gitpod env variable.

Add to the requirements.txt

```
aws-xray-sdk
```

Install python dependencies

```
pip install -r requirements.txt
```

Add to app.py

```
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.ext.flask.middleware import XRayMiddleware

xray_url = os.getenv("AWS_XRAY_URL")
xray_recorder.configure(service='Cruddur', dynamic_naming=xray_url)
# after flask app definition
XRayMiddleware(app, xray_recorder)
```

## Setup AWS X-Ray Resources

Add aws/json/xray.json

```
{
  "SamplingRule": {
      "RuleName": "Cruddur",
      "ResourceARN": "*",
      "Priority": 9000,
      "FixedRate": 0.1,
      "ReservoirSize": 5,
      "ServiceName": "Cruddur",
      "ServiceType": "*",
      "Host": "*",
      "HTTPMethod": "*",
      "URLPath": "*",
      "Version": 1
  }
}
```

```
aws xray create-group \
   --group-name "Cruddur" \
   --filter-expression "service(\"$backend-flask\")"
```

```
aws xray create-sampling-rule --cli-input-json file://aws/json/xray.json
```

![xray-smapling-rule](https://user-images.githubusercontent.com/84492994/222688872-b6f51983-9c92-4f8f-ab45-489e1b3a1418.jpg)

## Add Daemon Service to Docker Compose

```
xray-daemon:
    image: "amazon/aws-xray-daemon"
    environment:
      AWS_ACCESS_KEY_ID: "${AWS_ACCESS_KEY_ID}"
      AWS_SECRET_ACCESS_KEY: "${AWS_SECRET_ACCESS_KEY}"
      AWS_REGION: "us-east-1"
    command:
      - "xray -o -b xray-daemon:2000"
    ports:
      - 2000:2000/udp
```

## Implemented Rollbar

[docker-compose.yml](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/blob/main/docker-compose.yml)

![xray-daemon-traces](https://user-images.githubusercontent.com/84492994/222689036-43281988-25c2-48dc-b14f-2125a2aff148.jpg)

I added these two env vars to the backend-flask in docker-compose.yml file

```
 AWS_XRAY_URL: "*4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}*"
 AWS_XRAY_DAEMON_ADDRESS: "xray-daemon:2000"
```

## CloudWatch Logs

![xray-traces](https://user-images.githubusercontent.com/84492994/222689118-e05c2d0b-d743-4ccb-9e01-42c27c302c9b.jpg)

I am able to fix the subsegment in the xray

![xray-subsegment](https://user-images.githubusercontent.com/84492994/222689492-3342a09d-8840-4f8e-b283-3275c30deb45.jpg)

![xray-segment-traces](https://user-images.githubusercontent.com/84492994/222689550-7ea76e10-2c0f-4185-9021-3d63ffaed077.jpg)



