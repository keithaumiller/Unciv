# Unciv Developer Quick Start Guide

This guide will get you up and running with Unciv development as quickly as possible.

## Prerequisites

- **Java 17+** - Required for building and running Unciv
- **Git** - For version control and collaboration
- **IDE** - Android Studio (recommended) or IntelliJ IDEA

## Quick Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yairm210/Unciv.git
   cd Unciv
   ```

2. **Run the setup script:**
   ```bash
   ./setup-dev.sh
   ```

3. **Start coding!** Use one of these commands:
   ```bash
   ./run-desktop.sh     # Run the game
   ./run-tests.sh       # Run tests
   ./build-all.sh       # Build everything
   ```

## Project Structure

```
Unciv/
├── core/           # 99% of the game logic (platform-independent)
├── desktop/        # Desktop-specific code and launchers
├── android/        # Android-specific code and assets
├── server/         # Multiplayer server code
├── tests/          # Test suite
└── docs/           # Documentation
```

## Key Development Commands

| Command | Description |
|---------|-------------|
| `./gradlew desktop:run` | Run the desktop version |
| `./gradlew tests:test` | Run the test suite |
| `./gradlew build` | Build all components |
| `./gradlew desktop:dist` | Create a distributable JAR |
| `./gradlew detekt` | Run code quality checks |

## IDE Setup (Android Studio/IntelliJ)

1. **Open Project:** File → Open → Select the Unciv folder
2. **Wait for Gradle sync** to complete
3. **Create Run Configuration:**
   - Run → Edit Configurations → Add (+) → Application
   - Name: "Desktop"
   - Main class: `com.unciv.app.desktop.DesktopLauncher`
   - Module: `Unciv.desktop.main`
   - Working directory: `$ProjectFileDir$/android/assets`

## Common Issues & Solutions

### "Could not resolve Android dependencies"
- **Solution:** You don't need Android SDK for desktop development. The build will automatically skip Android components if the SDK isn't found.

### "No such file or directory" error
- **Solution:** Make sure your working directory is set to `$ProjectFileDir$/android/assets` in your run configuration.

### Java version issues
- **Solution:** Ensure you're using Java 17 or later. Check with `java -version`.

## Making Your First Contribution

1. **Find an issue** on GitHub or identify a bug/improvement
2. **Create a branch:** `git checkout -b feature/your-feature-name`
3. **Make your changes** and test them
4. **Run tests:** `./run-tests.sh`
5. **Create a pull request** with your changes

## Useful Resources

- [Building Locally (Detailed)](docs/Developers/Building-Locally.md)
- [Project Structure](docs/Developers/Project-structure-and-major-classes.md)
- [Contributing Guidelines](CODE_OF_CONDUCT.md)
- [Discord Community](https://discord.gg/bjrB4Xw)

## Development Tips

- **Code Style:** The project uses ktlint and detekt for code quality
- **Testing:** Write tests for new features in the `tests/` directory
- **Performance:** Profile your changes, especially in the core game loop
- **Assets:** Game assets are in `android/assets/` and are shared across platforms

## Need Help?

- Check existing documentation in `docs/`
- Search for similar issues on GitHub
- Ask questions on our Discord server
- Look at recent pull requests for examples

Happy coding! 🎮