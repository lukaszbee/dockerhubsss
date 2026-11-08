#checkov:skip=CKV_DOCKER_2:This interactive shell image does not run a long-lived service.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# hadolint ignore=DL3005,DL3008
RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        htop \
        vim-tiny \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --system app \
    && useradd --system --gid app --create-home --home-dir /home/app app

USER app:app

CMD ["bash"]
