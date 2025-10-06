# Reversal Dark Theme for VS Code

A clean, professional dark theme with blue accents based on the Reversal-Dark color scheme.

## Features

- **Clean Dark Interface**: Pure dark backgrounds (`#0b0b0b`) with high contrast white text
- **Blue Primary Accent**: Beautiful blue (`#5b9bf8`) for selections, buttons, and active elements
- **Semantic Colors**: Proper color coding with meaningful associations:
  - 🔴 Red (`#F44336`) for errors and critical elements
  - 🟢 Green (`#66bb6a`) for success, additions, and strings
  - 🟡 Yellow (`#ffb74d`) for warnings, classes, and highlights
  - 🔵 Blue (`#5b9bf8`) for functions, links, and primary actions
  - 🟣 Purple (`#ab47bc`) for keywords and special elements
  - 🔵 Cyan (`#26c6da`) for operators and punctuation

## Color Palette

Based on the Base16 Reversal-Dark specification:

| Color | Hex | Usage |
|-------|-----|-------|
| **Background** | `#0b0b0b` | Main editor background |
| **Foreground** | `#FFFFFF` | Primary text color |
| **Selection** | `#5b9bf8` | Text selection, primary accent |
| **Comment** | `#5b5b5b` | Comments and disabled text |
| **Error** | `#F44336` | Errors, deletions, urgent items |
| **Warning** | `#ff7043` | Warnings, modified items |
| **Success** | `#66bb6a` | Success states, additions |
| **Info** | `#5b9bf8` | Information, functions |

## Installation

### Manual Installation

1. Copy the `Dot/vscode-theme` folder to your VS Code extensions directory:
   - **Linux**: `~/.vscode/extensions/`
   - **macOS**: `~/.vscode/extensions/`
   - **Windows**: `%USERPROFILE%\.vscode\extensions\`

2. Restart VS Code

3. Open Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)

4. Run `Preferences: Color Theme`

5. Select "Reversal Dark"

### From Source

If you're using this as part of a NixOS configuration:

```nix
# The theme files are included in your Dot files configuration
# and can be symlinked to your VS Code extensions directory
```

## Compatibility

- **VS Code Version**: 1.74.0+
- **Theme Type**: Dark
- **Semantic Highlighting**: Enabled for enhanced syntax highlighting

## Screenshots

The theme provides consistent styling across all VS Code interface elements:

- **Editor**: Clean dark background with high contrast syntax highlighting
- **Activity Bar**: Minimalist with blue accent indicators
- **Side Panel**: Consistent dark theming with proper hierarchy
- **Terminal**: Matching ANSI colors for consistent experience
- **Status Bar**: Clean information display with contextual colors

## Customization

The theme can be customized by modifying the `themes/reversal-dark.json` file. All colors follow the Base16 specification for easy adaptation.

## License

Part of the Reversal-Dark theme collection. Free for personal and commercial use.
