FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    less \
    && rm -rf /var/lib/apt/lists/*

RUN useradd \
    --create-home \
    --uid 1000 \
    --shell /bin/bash claude \
    && mkdir -p /workspace \
    && chown claude:claude /workspace

USER claude

ENV HOME=/home/claude
ENV PATH="/home/claude/.local/bin:${PATH}"

RUN curl -fsSL https://claude.ai/install.sh | bash

ENV DISABLE_AUTOUPDATER=1

WORKDIR /workspace

CMD ["claude"]