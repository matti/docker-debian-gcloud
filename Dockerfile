FROM debian:bookworm-slim

RUN set eux ; \
  apt-get update ; apt-get upgrade -y

RUN set -eux ; \
  apt-get update ; apt-get install -y \
  apt-transport-https ca-certificates gnupg curl

RUN set -eux ; \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

RUN set -eux ; \
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN set -eux ; \
  apt-get update ; apt-get install -y \
  google-cloud-cli
