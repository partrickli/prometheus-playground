docker \
  run -p 9090:9090 \
  --name prometheus \
  --mount type=bind,source="$(pwd)"/prometheus.yml,target=/prometheus.yml,readonly \
  prom/prometheus:v2.17.0 --config.file="/prometheus.yml"

docker \
  run -p 9115:9115 \
  --name blackbox-exporter \
  --mount type=bind,source="$(pwd)"/blackbox.yml,target=/blackbox.yml,readonly \
  prom/blackbox-exporter:v0.16.0 --config.file="/blackbox.yml"