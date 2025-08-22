#!/bin/bash

# Unciv Developer Setup Script
# This script helps set up a development environment for Unciv

set -e

echo "🎮 Setting up Unciv development environment..."

# Check if we're in the right directory
if [ ! -f "build.gradle.kts" ]; then
    echo "❌ Error: This script must be run from the Unciv root directory"
    exit 1
fi

# Check Java version
echo "☕ Checking Java version..."
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 17 or later."
    exit 1
fi

JAVA_VERSION=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
if [ "$JAVA_VERSION" -lt 17 ]; then
    echo "❌ Java 17 or later is required. Current version: $JAVA_VERSION"
    exit 1
fi
echo "✅ Java version: $JAVA_VERSION"

# Make gradlew executable
chmod +x ./gradlew

# Check if we can access network (for downloading dependencies)
echo "🌐 Checking network connectivity..."
if curl -s --head https://google.com > /dev/null; then
    echo "✅ Network connectivity OK"
    
    # Try to run gradle tasks to download dependencies
    echo "📦 Downloading dependencies..."
    if ./gradlew tasks > /dev/null 2>&1; then
        echo "✅ Dependencies downloaded successfully"
    else
        echo "⚠️  Some dependencies could not be downloaded. You may need to:"
        echo "   - Check your internet connection"
        echo "   - Configure proxy settings if behind a corporate firewall"
        echo "   - Install Android SDK for Android development"
    fi
else
    echo "⚠️  No network connectivity. Running in offline mode."
fi

# Create useful aliases and scripts
echo "🔧 Setting up development tools..."

# Create a simple run script for desktop
cat > run-desktop.sh << 'EOF'
#!/bin/bash
# Quick script to run Unciv desktop version
echo "🚀 Starting Unciv Desktop..."
./gradlew desktop:run
EOF
chmod +x run-desktop.sh

# Create a test script
cat > run-tests.sh << 'EOF'
#!/bin/bash
# Quick script to run Unciv tests
echo "🧪 Running Unciv tests..."
./gradlew tests:test
EOF
chmod +x run-tests.sh

# Create a build script
cat > build-all.sh << 'EOF'
#!/bin/bash
# Quick script to build all Unciv components
echo "🔨 Building Unciv..."
./gradlew build
EOF
chmod +x build-all.sh

echo ""
echo "🎉 Development environment setup complete!"
echo ""
echo "📋 Available commands:"
echo "  ./run-desktop.sh    - Run the desktop version"
echo "  ./run-tests.sh      - Run the test suite"
echo "  ./build-all.sh      - Build all components"
echo "  ./gradlew tasks     - See all available Gradle tasks"
echo "  ./setup-ide.sh      - Set up IDE configurations"
echo ""
echo "📚 Documentation:"
echo "  docs/Developers/Building-Locally.md - Detailed build instructions"
echo "  docs/Developers/Project-structure-and-major-classes.md - Code overview"
echo ""
echo "🔧 IDE Setup:"
echo "  For Android Studio/IntelliJ:"
echo "  1. Open this folder as a project"
echo "  2. Set up run configuration with:"
echo "     - Main class: com.unciv.app.desktop.DesktopLauncher"
echo "     - Working directory: \$ProjectFileDir\$/android/assets"
echo "     - Module: Unciv.desktop.main"
echo ""
echo "Happy coding! 🚀"