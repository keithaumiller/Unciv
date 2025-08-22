#!/bin/bash

# IDE Configuration Setup Script
# Sets up IDE configurations for different editors

set -e

echo "🔧 Setting up IDE configurations for Unciv development..."

# Check if we're in the right directory
if [ ! -f "build.gradle.kts" ]; then
    echo "❌ Error: This script must be run from the Unciv root directory"
    exit 1
fi

# Function to setup VS Code
setup_vscode() {
    echo "📝 Setting up VS Code configuration..."
    
    if [ -d ".vscode" ]; then
        echo "⚠️  .vscode directory already exists. Creating backup..."
        mv .vscode .vscode.backup.$(date +%s)
    fi
    
    mkdir -p .vscode
    
    # Copy our template configurations
    if [ -d ".vscode.example" ]; then
        cp -r .vscode.example/* .vscode/
        echo "✅ VS Code configuration copied from template"
    else
        echo "❌ No VS Code template found"
        return 1
    fi
}

# Function to setup IntelliJ/Android Studio
setup_intellij() {
    echo "💡 Setting up IntelliJ IDEA/Android Studio hints..."
    
    mkdir -p .idea/runConfigurations
    
    cat > .idea/runConfigurations/Desktop.xml << 'EOF'
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="Desktop" type="Application" factoryName="Application">
    <option name="MAIN_CLASS_NAME" value="com.unciv.app.desktop.DesktopLauncher" />
    <module name="Unciv.desktop.main" />
    <option name="VM_PARAMETERS" value="-Xmx4096m -Xms256m -XX:MaxMetaspaceSize=256m" />
    <option name="WORKING_DIRECTORY" value="$PROJECT_DIR$/android/assets" />
    <method v="2">
      <option name="Make" enabled="true" />
    </method>
  </configuration>
</component>
EOF
    
    echo "✅ IntelliJ run configuration created"
    echo "💡 Import this project in IntelliJ/Android Studio and the 'Desktop' run configuration will be available"
}

# Function to create development environment variables
setup_env() {
    echo "🌱 Setting up development environment..."
    
    cat > .env.development << 'EOF'
# Development environment variables for Unciv
# Source this file or copy variables to your shell profile

# Java heap size for development
export JAVA_OPTS="-Xmx4096m -Xms256m -XX:MaxMetaspaceSize=256m"

# Gradle options for faster builds
export GRADLE_OPTS="-Dorg.gradle.daemon=true -Dorg.gradle.parallel=true -Dorg.gradle.caching=true"

# Development flags
export UNCIV_DEV_MODE=true
export UNCIV_FAST_BUILD=true

# Useful aliases for Unciv development
alias unciv-run="./gradlew desktop:run"
alias unciv-test="./gradlew tests:test"
alias unciv-build="./gradlew build"
alias unciv-clean="./gradlew clean"
alias unciv-lint="./gradlew detekt"

echo "🎮 Unciv development environment loaded!"
echo "Available commands: unciv-run, unciv-test, unciv-build, unciv-clean, unciv-lint"
EOF
    
    echo "✅ Development environment file created (.env.development)"
    echo "💡 Source this file with: source .env.development"
}

# Main setup logic
echo ""
echo "Which IDE configurations would you like to set up?"
echo "1) VS Code"
echo "2) IntelliJ IDEA/Android Studio"
echo "3) Development environment variables"
echo "4) All of the above"
echo "5) Skip IDE setup"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        setup_vscode
        ;;
    2)
        setup_intellij
        ;;
    3)
        setup_env
        ;;
    4)
        setup_vscode || echo "⚠️  VS Code setup failed"
        setup_intellij
        setup_env
        ;;
    5)
        echo "⏭️  Skipping IDE setup"
        ;;
    *)
        echo "❌ Invalid choice. Skipping IDE setup."
        ;;
esac

echo ""
echo "🎉 IDE configuration setup complete!"
echo ""
echo "📝 What's next:"
echo "  - Open your preferred IDE and import the project"
echo "  - Check that run configurations are working"
echo "  - Start coding! 🚀"
echo ""
echo "💡 Tips:"
echo "  - For VS Code: Install the recommended extensions"
echo "  - For IntelliJ: Make sure Kotlin plugin is enabled"
echo "  - Use the debug configurations for easier development"