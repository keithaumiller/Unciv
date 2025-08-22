# Contributing to Unciv

Thanks for your interest in contributing to Unciv! This guide will help you get started.

## Quick Start for Contributors

1. **Fork the repository** on GitHub
2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/Unciv.git
   cd Unciv
   ```
3. **Set up development environment:**
   ```bash
   ./setup-dev.sh
   ```
4. **Create a feature branch:**
   ```bash
   git checkout -b feature/amazing-feature
   ```
5. **Make your changes and test them:**
   ```bash
   make test
   ```
6. **Commit and push:**
   ```bash
   git commit -m "Add amazing feature"
   git push origin feature/amazing-feature
   ```
7. **Create a Pull Request** on GitHub

## Types of Contributions

### 🐛 Bug Fixes
- Look for issues labeled "bug" or "good first issue"
- Include test cases that reproduce the bug
- Keep fixes minimal and focused

### ✨ New Features
- Discuss major features in an issue first
- Follow the existing code style and patterns
- Add appropriate tests and documentation

### 📚 Documentation
- Improve existing docs or add missing documentation
- Fix typos and clarify confusing sections
- Add examples and better explanations

### 🧪 Testing
- Add tests for existing functionality
- Improve test coverage
- Add performance tests for critical paths

## Development Workflow

### Before You Start
- Check if someone else is already working on the issue
- Comment on the issue to indicate you're working on it
- Make sure you understand the requirements

### Writing Code
- Follow the existing code style (enforced by ktlint/detekt)
- Write clear, descriptive commit messages
- Keep commits focused and atomic
- Test your changes thoroughly

### Testing Your Changes
```bash
# Run all tests
make test

# Run specific module tests
./gradlew core:test
./gradlew desktop:test

# Run the game to test manually
make run

# Check code quality
make lint
```

### Submitting Changes
- Ensure all tests pass
- Update documentation if needed
- Write a clear pull request description
- Link to related issues

## Code Style Guidelines

- **Kotlin**: Follow [Kotlin coding conventions](https://kotlinlang.org/docs/coding-conventions.html)
- **Formatting**: Use the project's .editorconfig settings
- **Naming**: Use descriptive names for classes, methods, and variables
- **Comments**: Write comments for complex logic, not obvious code
- **Architecture**: Follow the existing patterns in the codebase

## Project Structure

```
core/       - Platform-independent game logic (99% of code)
desktop/    - Desktop-specific code and launcher
android/    - Android-specific code and assets
server/     - Multiplayer server implementation
tests/      - Test suite
docs/       - Documentation
```

## Common Development Tasks

| Task | Command |
|------|---------|
| Run game | `make run` or `./run-desktop.sh` |
| Run tests | `make test` or `./run-tests.sh` |
| Build all | `make build` or `./build-all.sh` |
| Code quality | `make lint` |
| Clean build | `make clean` |

## Getting Help

- **Documentation**: Check `docs/` directory first
- **Discord**: Join our [Discord server](https://discord.gg/bjrB4Xw)
- **Issues**: Search existing GitHub issues
- **Code**: Look at recent pull requests for examples

## Recognition

- All contributors are recognized in our credits
- Regular contributors may be invited to join the core team
- Your GitHub profile will show your contributions

## Questions?

Don't hesitate to ask questions! We're here to help:
- Comment on the issue you're working on
- Join our Discord community
- Open a discussion on GitHub

Thanks for contributing to Unciv! 🎮