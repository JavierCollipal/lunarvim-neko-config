# 🐾✨ NEKO-ARC LUNARVIM CONFIGURATION ✨🐾

> **The Ultimate LunarVim Setup with Six Personalities for Supreme Coding Power!**

[![LunarVim](https://img.shields.io/badge/LunarVim-0.10.2-blue.svg)](https://www.lunarvim.org)
[![Neovim](https://img.shields.io/badge/Neovim-0.10%2B-green.svg)](https://neovim.io)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 🌟 Features

### 🎨 Four Premium Themes
- **Tokyo Night** - Cyberpunk aesthetic with perfect contrast
- **Catppuccin** - Smooth pastel colors that are easy on the eyes
- **Gruvbox** - Retro terminal vibes with hard contrast
- **Nord** - Clean, minimal Arctic theme

### 🚀 Developer Power Tools
- **TypeScript/JavaScript** full LSP support with ESLint & Prettier
- **AI Code Completion** with Codeium (free GitHub Copilot alternative)
- **Project Management** with project.nvim and Telescope integration
- **Git Integration** with inline blame and gitsigns
- **Advanced Search** with Spectre for project-wide find & replace
- **Rainbow Brackets** for better code visualization
- **Todo Comments** with custom icons and highlighting
- **Smooth Scrolling** with Neoscroll
- **Beautiful Notifications** with nvim-notify

### 🐾 Six Personality System
Experience coding with six unique personalities providing different perspectives:
- **🐾 Neko-Arc** - Rapid coding with kawaii energy
- **🎭 Mario Gallo Bestino** - Theatrical Puppeteer automation master
- **🗡️ Noel** - Precision debugging tactician
- **🎸 Glam Americano** - Ethics guardian and music enthusiast
- **🧠 Dr. Hannibal** - Forensic code analysis expert
- **🎭 Tetora** - Multi-perspective problem solver

## 📋 Prerequisites

### Required Software
```bash
# Neovim 0.10+ (REQUIRED)
# Check version:
nvim --version

# Node.js 18+ (for LSP servers)
node --version

# Git (for plugin management)
git --version

# Python 3.8+ with pip
python3 --version
pip3 --version

# C compiler (for treesitter)
gcc --version  # Linux
# or
clang --version  # macOS
```

### Optional but Recommended
```bash
# Ripgrep (for better searching)
rg --version

# fd (for better file finding)
fd --version

# lazygit (for git UI)
lazygit --version
```

## 🚀 Installation

### Step 1: Install LunarVim
```bash
# Official LunarVim installer
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

# Or if you prefer the latest version:
bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh)
```

### Step 2: Backup Your Existing Config (if any)
```bash
# Backup existing LunarVim config
mv ~/.config/lvim ~/.config/lvim.backup.$(date +%Y%m%d)
```

### Step 3: Clone This Configuration
```bash
# Clone the repository
git clone https://github.com/JavierCollipal/lunarvim-neko-config.git ~/.config/lvim-neko

# Copy the config file
mkdir -p ~/.config/lvim
cp ~/.config/lvim-neko/config.lua ~/.config/lvim/config.lua
```

### Step 4: Install Language Servers
```bash
# Open LunarVim
lvim

# Inside LunarVim, install language servers:
:LspInstall typescript
:LspInstall eslint
:LspInstall pyright
:LspInstall lua_ls
:LspInstall rust_analyzer
:LspInstall gopls
```

### Step 5: Install Formatters and Linters
```bash
# Install Prettier globally
npm install -g prettier

# Install ESLint globally
npm install -g eslint

# Python formatters
pip3 install black autopep8

# Install other tools
npm install -g @fsouza/prettierd
npm install -g eslint_d
```

### Step 6: Setup Codeium AI (Optional)
```vim
# Inside LunarVim, authenticate Codeium:
:Codeium Auth

# Follow the prompts to get your free API key
```

## ⌨️ Key Mappings

### Project Management
| Key | Description |
|-----|-------------|
| `<leader>pp` | Open project picker with Telescope |
| `<leader>ps` | Quick project switcher |
| `<leader>pf` | Find files in project |
| `<leader>pg` | Live grep in project |
| `<leader>pr` | Recent files |

### File Creation
| Key | Description |
|-----|-------------|
| `<leader>fnj` | Create new Node.js file with template |
| `<leader>fnt` | Create new TypeScript file with template |
| `<leader>fnr` | Create new React component with template |

### LSP Functions
| Key | Description |
|-----|-------------|
| `<leader>lf` | Format current file |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code actions |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Show hover documentation |

### Neko Commands (Fun!)
| Key | Description |
|-----|-------------|
| `<leader>nd` | Neko Dance animation |
| `<leader>nt` | Terminal pet |
| `<leader>nm` | Show Neko mood |
| `<leader>ns` | Start Neko animation |
| `<leader>nq` | Stop Neko animation |

### AI Completion (Codeium)
| Key | Description |
|-----|-------------|
| `<C-g>` | Accept AI suggestion |
| `<C-;>` | Next suggestion |
| `<C-,>` | Previous suggestion |
| `<C-x>` | Clear suggestion |

## 🎨 Customization

### Change Theme
Edit `~/.config/lvim/config.lua` and modify line 65:
```lua
-- Available themes:
lvim.colorscheme = "tokyonight-night"  -- Default
-- lvim.colorscheme = "tokyonight-storm"
-- lvim.colorscheme = "tokyonight-day"
-- lvim.colorscheme = "tokyonight-moon"
-- lvim.colorscheme = "catppuccin-mocha"
-- lvim.colorscheme = "catppuccin-macchiato"
-- lvim.colorscheme = "catppuccin-frappe"
-- lvim.colorscheme = "catppuccin-latte"
-- lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "nord"
```

### Add Your Projects
Edit the `projects` table in the config:
```lua
local projects = {
  { name = "🚀 My Project", path = "~/projects/my-project" },
  { name = "🎨 Portfolio", path = "~/projects/portfolio" },
  -- Add more projects here!
}
```

### Configure Format on Save
```lua
-- Enable/disable format on save
lvim.format_on_save.enabled = true

-- Add more file patterns
lvim.format_on_save.pattern = {
  "*.lua", "*.py", "*.js", "*.ts",
  "*.jsx", "*.tsx", "*.json", "*.css",
  "*.scss", "*.html", "*.md", "*.rs", "*.go"
}
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Plugins not loading
```bash
# Clear plugin cache and reinstall
rm -rf ~/.local/share/lunarvim/site/pack
lvim +LvimUpdate +LvimCacheReset +q
```

#### 2. LSP not working
```bash
# Check LSP status in LunarVim
:LspInfo

# Reinstall language server
:LspUninstall <server_name>
:LspInstall <server_name>
```

#### 3. Treesitter errors
```vim
# Inside LunarVim
:TSUpdate
:TSInstall <language>
```

#### 4. Codeium not working
```vim
# Re-authenticate
:Codeium Auth

# Check status
:Codeium Status
```

## 📚 Learning Resources

- [LunarVim Documentation](https://www.lunarvim.org/docs/intro)
- [Neovim Documentation](https://neovim.io/doc/)
- [Video Tutorials](https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6)
- [LunarVim Discord](https://discord.com/invite/Xb9B4Ny)
- [Reddit Community](https://www.reddit.com/r/lunarvim/)

## 🤝 Contributing

Feel free to fork this repository and customize it to your needs! If you have improvements or bug fixes:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📜 License

This configuration is released under the MIT License. See [LICENSE](LICENSE) file for details.

## 🙏 Credits

- [LunarVim Team](https://github.com/LunarVim/LunarVim) for the amazing base configuration
- [Neovim Community](https://neovim.io/) for the powerful editor
- All plugin authors for their incredible work
- The six personalities for their unique perspectives on code

## 💖 Support

If you enjoy this configuration, consider:
- ⭐ Starring the repository
- 🐛 Reporting issues
- 📝 Sharing your customizations
- 🎉 Spreading the word about LunarVim

---

**Made with 🐾 by Wakibaka & Neko-Arc**

*"Nyaa~! Happy coding with maximum kawaii power, desu~! ✨🚀"*