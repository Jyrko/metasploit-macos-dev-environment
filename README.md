# Metasploit Development Environment

Simple Docker-based development environment for the Metasploit Framework project.

I have created it as I want to run it on macos, but haven't really found alternatives, maybe this repo someday will receive 1 star from someone, dunno xD. Or maybe there are some limitations I am not aware of yet, who knows 

## Prerequisites

- Docker
- [Mutagen](https://mutagen.io/) and [Mutagen Compose](https://mutagen.io/documentation/orchestration/compose)
- Make

## Installation

Install Mutagen and Mutagen Compose:
```bash
brew install mutagen-io/mutagen/mutagen
brew install mutagen-io/mutagen/mutagen-compose
```

## Quick Start

1. **Initialize the environment:**
   ```bash
   make init
   ```
   This builds the Docker image and installs bundle dependencies.

2. **Start a shell inside the container:**
   ```bash
   make inside
   ```
   This starts the container with Mutagen sync and opens a bash shell.

3. **Run Metasploit console:**
   ```bash
   # Inside the container
   ./msfconsole
   ```

## Available Make Commands

- `make build` - Build the Docker image
- `make bundle` - Install bundle dependencies
- `make init` - Build and install dependencies (runs build + bundle)
- `make inside` - Start container with ports and open bash shell

## Manual Commands

If you prefer using mutagen-compose directly:

```bash
# Build the image
mutagen-compose -f docker-compose.yml build

# Install dependencies
mutagen-compose -f docker-compose.yml run --rm metasploit-framework bundle install

# Open shell
mutagen-compose -f docker-compose.yml run --service-ports --rm metasploit-framework bash
```

## How It Works

- Uses Mutagen for two-way file synchronization between host and container
- Syncs `../metasploit-framework` (host) with `/metasploit-framework` (container)
- Ruby 3.3.8 installed via ruby-build
- Bundle gems stored in persistent volume
- Platform: linux/amd64 (for Apple Silicon compatibility)


## Troubleshooting

- **Mutagen sync issues**: Check `mutagen sync list` and restart if needed
- **Bundle install fails**: Run `make bundle` again or check volume permissions
- **Platform errors on Apple Silicon**: The Dockerfile specifies `linux/amd64` platform
