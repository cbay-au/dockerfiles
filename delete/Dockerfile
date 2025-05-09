FROM ubuntu:22.04

# Install system dependencies (including build tools and Python)
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    gnupg \
    sudo \
    xz-utils \
    build-essential \
    python3-minimal \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (required by code-server)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install code-server globally with --unsafe-perm
RUN npm install -g code-server --unsafe-perm

# Create a workspace directory
WORKDIR /workspace

# Expose the port used by code-server
EXPOSE 8080

# Set default command to run code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "."]
