FROM node:20-slim

# Install basic development tools.
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Enable pnpm via Corepack.
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

# Install Gemini CLI and Claude Code.
RUN pnpm add -g @google/gemini-cli @anthropic-ai/claude-code

# Set the working directory.
WORKDIR /workspace

# Start with bash and choose the agent interactively.
CMD ["/bin/bash"]
