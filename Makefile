# KivotOS Build System

LB_ROOT  := ./kivotos
ISO_DIR  := ./builds
ARCH     := amd64
DATE     := $(shell date +%Y-%m-%d)
ISO_NAME := KivotOS-$(DATE)-$(ARCH).hybrid.iso

# Hooks to remove after lb config (not needed for KivotOS)
REMOVE_HOOKS := \
	5040-update-nvidia-alternative.hook.chroot \
	5050-dracut.hook.chroot \
	9000-remove-gnome-icon-cache.hook.chroot

.PHONY: all init build clean deep-clean verify help

all: help

init:
	@echo "Initializing KivotOS build environment..."
	mkdir -p $(LB_ROOT)
	cd $(LB_ROOT) && lb config
	@echo "Cleaning unnecessary hooks..."
	@for hook in $(REMOVE_HOOKS); do \
		rm -f $(LB_ROOT)/config/hooks/normal/$$hook; \
		rm -f $(LB_ROOT)/config/hooks/live/$$hook; \
		echo "  removed: $$hook"; \
	done
	@sudo chown -R $(USER):$(USER) $(LB_ROOT)/config
	@echo "Done. Edit $(LB_ROOT)/auto/config then run: make build"

build:
	cd $(LB_ROOT) && sudo lb clean --purge
	cd $(LB_ROOT) && lb config
	cd $(LB_ROOT) && sudo lb build
	mkdir -p $(ISO_DIR)
	mv $(LB_ROOT)/*.hybrid.iso $(ISO_DIR)/$(ISO_NAME)
	@echo "Done: $(ISO_DIR)/$(ISO_NAME)"

clean:
	cd $(LB_ROOT) && sudo lb clean --purge

deep-clean: clean
	rm -rf $(ISO_DIR)

verify:
	@sha256sum $(ISO_DIR)/$(ISO_NAME) 2>/dev/null || echo "No ISO found. Run: make build"

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "  init        Init build environment + clean hooks"
	@echo "  build       Build ISO"
	@echo "  clean       Clean build artifacts"
	@echo "  deep-clean  Clean + remove ISOs"
	@echo "  verify      SHA256 checksum"
