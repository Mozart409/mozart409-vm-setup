# mozart409-nvim

A highly customizable Neovim configuration focused on productivity and efficiency for developers. This setup includes a selection of powerful plugins, keybindings, and configurations designed to streamline your workflow. Based on [kickstart-nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master).

## Features

- **Plugin Management**: Uses [Lazy](https://github.com/folke/lazy.nvim) for efficient plugin management.
- **Code Completion**: Enhanced with LSP (Language Server Protocol) support and the [cmp](https://github.com/hrsh7th/nvim-cmp) plugin.
- **File Navigation**: Integrated with Telescope for quick file and code searching.
- **Syntax Highlighting**: Utilizes Tree-sitter for modern syntax parsing.
- **Custom Keybindings**: Pre-configured shortcuts for common tasks to boost productivity.

## Installation

1. Clone this repository into your Neovim config directory:
   ```bash
   git clone https://github.com/a-mader/mozart409-nvim.git ~/.config/nvim
   ```
## Configuration

The configuration is organized into several key files:

- **init.lua**: The main entry point for Neovim.
- **lazy-lock.json**: Locks plugins to ensure consistent packages.
- **lua/**: Contains all the Lua configurations, including:
  - `cmp-setup.lua`: Configures the completion system.
  - `keymaps.lua`: Manages custom keybindings.
  - `lsp-setup.lua`: Sets up Language Server Protocol configurations.
  - `telescope-setup.lua`: Configures the Telescope plugin.

## Plugin Management

Plugins are managed using [Lazy](https://github.com/folke/lazy.nvim). To add or remove plugins:

1. Add new plugins to `lua/custom/plugins`.
2. Run `:Lazy install` in Neovim to install them or close and open Neovim.

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository, create a feature branch, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
