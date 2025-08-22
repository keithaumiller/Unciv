# VS Code Configuration for Unciv Development

This directory contains VS Code configuration files to make Unciv development easier.

## Setup

1. **Copy the configuration files:**
   ```bash
   cp -r .vscode.example .vscode
   ```
   (Note: .vscode/ is gitignored so these won't be committed)

2. **Install recommended extensions:**
   - [Kotlin Language](https://marketplace.visualstudio.com/items?itemName=fwcd.kotlin)
   - [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)
   - [Gradle for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-gradle)

## Available Commands

### Run/Debug
- **F5**: Run Unciv Desktop
- **Ctrl+F5**: Debug Unciv Desktop

### Tasks (Ctrl+Shift+P → "Tasks: Run Task")
- **Run Desktop**: Start the game
- **Build All**: Build the entire project
- **Run Tests**: Execute test suite
- **Clean**: Clean build artifacts
- **Lint**: Run code quality checks

### Debugging

The debug configuration includes:
- Increased memory allocation
- Proper working directory
- Console logging disabled for better performance

## Project Structure in VS Code

```
Unciv/
├── core/           # Main game logic
├── desktop/        # Desktop launcher
├── tests/          # Test files
└── android/assets/ # Game assets (working directory)
```

## Tips

- Use **Ctrl+Shift+P** to access the command palette
- The integrated terminal will open in the project root
- Build artifacts are excluded from search for better performance
- Save files and mods directories are hidden from the explorer

## Troubleshooting

**If Java/Kotlin support isn't working:**
1. Install the Java Extension Pack
2. Restart VS Code
3. Open Command Palette → "Java: Reload Projects"

**If tasks aren't showing:**
1. Make sure you're in the project root
2. Open Command Palette → "Tasks: Configure Task"
3. Verify tasks.json is in .vscode/