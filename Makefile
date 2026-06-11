# KivotOS Build System
#
# Build KivotOS ISO images using live-build.
# The live-build configuration lives in the kivotos/ directory.
#
# Usage:
#   make help        - Show this help
#   make build       - Build ISO (native, requires live-build)
#   make docker-build - Build ISO in Docker
#   make nspawn-build - Build ISO in Debian nspawn container
#   make clean       - Clean build artifacts
#   make deep-clean  - Full cleanup including output ISOs
#   make serve-docs  - Preview docs site locally

LB_ROOT   := ./kivotos
ISO_DIR   := ./builds
ARCH      := amd64
DATE      := $(shell date +%Y-%m-%d)

.PHONY: all build docker-build nspawn-build clean deep-clean serve-docs help

# Default: show help
all: help

# --- Native Build ---

build:
	@echo "============================================================"
	@echo "  KivotOS ISO Build (native)"
	@echo "  Using config: $(LB_ROOT)/auto/config"
	@echo "============================================================"
	@echo ""
	@echo "[1/4] Cleaning previous build..."
	cd $(LB_ROOT) && sudo lb clean --purge
	@echo ""
	@echo "[2/4] Configuring build environment..."
	cd $(LB_ROOT) && sudo lb config
	@echo ""
	@echo "[3/4] Building ISO (this will take a while)..."
	cd $(LB_ROOT) && sudo lb build
	@echo ""
	@echo "[4/4] Moving ISO to $(ISO_DIR)/..."
	mkdir -p $(ISO_DIR)
	mv $(LB_ROOT)/KivotOS-amd64.hybrid.iso $(ISO_DIR)/KivotOS-$(DATE)-$(ARCH).hybrid.iso
	@echo ""
	@echo "============================================================"
	@echo "  Build complete!"
	@echo "  ISO: $(ISO_DIR)/KivotOS-$(DATE)-$(ARCH).hybrid.iso"
	@echo "============================================================"

# --- Docker Build ---

docker-build:
	@echo "============================================================"
	@echo "  KivotOS ISO Build (Docker)"
	@echo "============================================================"
	@echo ""
	@if ! command -v docker >/dev/null 2>&1; then \
		echo "ERROR: docker not found. Install Docker first."; \
		exit 1; \
	fi
	@echo "No Dockerfile yet. Run native build or set up a Dockerfile."
	@echo "See docs/BUILD.md for details."
	@exit 1

# --- nspawn Build (per AGENTS.md) ---

nspawn-build:
	@echo "============================================================"
	@echo "  KivotOS ISO Build (nspawn)"
	@echo "============================================================"
	@echo ""
	@if ! command -v systemd-nspawn >/dev/null 2>&1; then \
		echo "ERROR: systemd-nspawn not found. Install systemd-container."; \
		exit 1; \
	fi
	@echo "nspawn build requires manual Debian container setup."
	@echo "See docs/BUILD.md for instructions."
	@echo "TL;DR: sudo debootstrap trixie /var/lib/machines/kivotos-build &&"
	@echo "  sudo systemd-nspawn -D /var/lib/machines/kivotos-build"
	@echo "  # inside: apt install live-build git && make build"

# --- Cleanup ---

clean:
	@echo "Cleaning build artifacts..."
	cd $(LB_ROOT) && sudo lb clean --purge
	@echo "Done."

deep-clean: clean
	@echo "Removing output ISOs..."
	rm -rf $(ISO_DIR)
	@echo "Done."

# --- Docs ---

serve-docs:
	@echo "Installing VitePress dependencies..."
	cd docs && bun install
	@echo ""
	@echo "Starting docs dev server at http://localhost:8080"
	@echo "Press Ctrl+C to stop."
	cd docs && bun run dev --port 8080

# --- Help ---

help:
	@echo "KivotOS Build System"
	@echo ""
	@echo "Targets:"
	@echo "  make            - Show this help"
	@echo "  make build      - Build ISO natively (requires live-build)"
	@echo "  make docker-build - Build ISO in Docker (requires Dockerfile)"
	@echo "  make nspawn-build - Build ISO in Debian nspawn container"
	@echo "  make clean      - Clean build artifacts"
	@echo "  make deep-clean - Full cleanup including output ISOs"
	@echo "  make serve-docs - Preview docs at http://localhost:8080"
	@echo ""
	@echo "Config: $(LB_ROOT)/auto/config"
	@echo "Output: $(ISO_DIR)/KivotOS-$(DATE)-$(ARCH).hybrid.iso"
	@echo ""
	@echo "Build docs: docs/guide/build-guide.md"
