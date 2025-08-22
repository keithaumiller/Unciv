# Unciv Development Makefile
# Provides convenient shortcuts for common development tasks

.PHONY: help setup run test build clean lint docs

# Default target
help:
	@echo "🎮 Unciv Development Commands"
	@echo ""
	@echo "Setup:"
	@echo "  setup     Setup development environment"
	@echo ""
	@echo "Development:"
	@echo "  run       Run desktop version"
	@echo "  test      Run test suite"
	@echo "  build     Build all components"
	@echo "  lint      Run code quality checks"
	@echo ""
	@echo "Maintenance:"
	@echo "  clean     Clean build artifacts"
	@echo "  docs      Build documentation"
	@echo ""
	@echo "For more commands: ./gradlew tasks"

# Setup development environment
setup:
	@echo "🔧 Setting up development environment..."
	@chmod +x ./setup-dev.sh
	@./setup-dev.sh

# Run the desktop version
run:
	@echo "🚀 Starting Unciv Desktop..."
	@./gradlew desktop:run

# Run tests
test:
	@echo "🧪 Running tests..."
	@./gradlew tests:test

# Build all components
build:
	@echo "🔨 Building Unciv..."
	@./gradlew build

# Run code quality checks
lint:
	@echo "🔍 Running code quality checks..."
	@./gradlew detekt

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@./gradlew clean

# Build documentation (if using mkdocs)
docs:
	@echo "📚 Building documentation..."
	@if command -v mkdocs >/dev/null 2>&1; then \
		mkdocs build; \
	else \
		echo "mkdocs not installed. Install with: pip install mkdocs"; \
	fi

# Create a distributable JAR
dist:
	@echo "📦 Creating distributable JAR..."
	@./gradlew desktop:dist

# Quick development cycle: clean, build, test
dev: clean build test
	@echo "✅ Development cycle complete!"

# Install dependencies (mainly for CI)
deps:
	@echo "📦 Installing dependencies..."
	@./gradlew dependencies

# Check for dependency updates
deps-check:
	@echo "🔍 Checking for dependency updates..."
	@./gradlew dependencyUpdates || echo "dependencyUpdates task not available"