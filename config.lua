-- 🐾✨ NEKO-ARC LUNARVIM CONFIGURATION ✨🐾
-- Version: 1.0.0
-- Author: wakibaka + Neko-Arc
-- Description: Ultimate LunarVim setup with 6 personalities and project management
-- GitHub: https://github.com/JavierCollipal/lunarvim-neko-config

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Install fancy themes that will make people jealous
lvim.plugins = {
  -- Tokyo Night theme - super popular cyberpunk vibes
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
    end,
  },
  -- Catppuccin - beautiful pastel colors
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          nvimtree = true,
          telescope = true,
          which_key = true,
        },
      })
    end,
  },
  -- Gruvbox - classic retro theme
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },
  -- Nord theme - clean and minimal
  {
    "shaunsingh/nord.nvim",
    config = function()
      require("nord").set()
    end,
  },
}

-- Set the colorscheme to Tokyo Night (change this to switch themes)
lvim.colorscheme = "tokyonight-night"

-- PRO LEVEL CONFIGURATION FOR SERIOUS DEVELOPERS 🔥

-- LSP Configuration
lvim.lsp.installer.setup.automatic_installation = true

-- Configure TypeScript/JavaScript LSP
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "css", "scss", "html", "yaml", "markdown" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
}

-- Auto format on save
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" }

-- Enhanced completion settings
lvim.builtin.cmp.completion.completeopt = "menu,menuone,noselect"
lvim.builtin.cmp.preselect = require('cmp').PreselectMode.None

-- Better search and replace
lvim.builtin.which_key.mappings["s"]["r"] = { "<cmd>lua require('spectre').open()<CR>", "Replace" }

-- Pro keybindings
lvim.keys.normal_mode["<leader>lf"] = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>"
lvim.keys.normal_mode["<leader>lr"] = "<cmd>lua vim.lsp.buf.rename()<CR>"
lvim.keys.normal_mode["<leader>la"] = "<cmd>lua vim.lsp.buf.code_action()<CR>"

-- Enhanced telescope settings for better file finding
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.layout_config.height = 0.9

-- Terminal integration
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15

-- Git integration enhancements
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 300

-- Add more professional plugins
table.insert(lvim.plugins, {
  -- Copilot-like AI completion (requires authentication)
  "Exafunction/codeium.vim",
  config = function()
    -- NOTE: You need to run :Codeium Auth after installation
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end,
})

table.insert(lvim.plugins, {
  -- Better search and replace
  "nvim-pack/nvim-spectre",
  config = function()
    require('spectre').setup()
  end,
})

table.insert(lvim.plugins, {
  -- Auto pairs and brackets
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end,
})

table.insert(lvim.plugins, {
  -- Better commenting
  "numToStr/Comment.nvim",
  config = function()
    require('Comment').setup()
  end,
})

table.insert(lvim.plugins, {
  -- Indent guides
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup()
  end,
})

table.insert(lvim.plugins, {
  -- Better syntax highlighting
  "nvim-treesitter/nvim-treesitter-textobjects",
})

table.insert(lvim.plugins, {
  -- Live server for web development
  "turbio/bracey.vim",
})

table.insert(lvim.plugins, {
  -- 🌈 Rainbow brackets
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
})

table.insert(lvim.plugins, {
  -- ✨ Beautiful todo comments
  "folke/todo-comments.nvim",
  config = function()
    require("todo-comments").setup {
      signs = true,
      keywords = {
        FIX = { icon = "🐛", color = "error" },
        TODO = { icon = "🐾", color = "info" },
        HACK = { icon = "🔥", color = "warning" },
        WARN = { icon = "⚠️", color = "warning" },
        PERF = { icon = "⚡", color = "default" },
        NOTE = { icon = "📝", color = "hint" },
        NEKO = { icon = "😸", color = "info" },
      },
    }
  end,
})

table.insert(lvim.plugins, {
  -- 🎨 Beautiful notifications
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = "compact",
      stages = "fade",
      timeout = 3000,
    })
    vim.notify = require("notify")
  end,
})

table.insert(lvim.plugins, {
  -- 🌟 Smooth scrolling
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      easing_function = "quadratic",
    })
  end,
})

-- Enhanced treesitter configuration
lvim.builtin.treesitter.ensure_installed = {
  "bash", "c", "css", "html", "javascript", "json", "lua", "python",
  "typescript", "tsx", "yaml", "markdown", "go", "rust", "cpp"
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

-- Status line customization
lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff" }
lvim.builtin.lualine.sections.lualine_c = { "filename", "diagnostics" }

-- File explorer settings
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.git.ignore = false

-- 🐾✨🎭 SIX PERSONALITIES LUNARVIM MASTERPIECE 🎭✨🐾
local neko_banner = {
  "                                                                          ",
  "        ╔════════════════════════════════════════════════════════╗        ",
  "        ║           🌙  L U N A R V I M  🌙                      ║        ",
  "        ║        「 SIX PERSONALITIES EDITION 」                  ║        ",
  "        ╚════════════════════════════════════════════════════════╝        ",
  "                                                                          ",
  "            🐾 NEKO-ARC          🎭 MARIO GALLO BESTINO                  ",
  "         \"Nyaa~! Let's code!\"    \"The show begins!\"                    ",
  "                                                                          ",
  "            🗡️  NOEL              🎸 GLAM AMERICANO                      ",
  "         \"Tch. Pathetic bug.\"    \"¡Pura calle, weon!\"                  ",
  "                                                                          ",
  "            🧠 DR. HANNIBAL      🎭 TETORA (MPD)                         ",
  "         \"Quid pro quo...\"       \"Which fragment speaks?\"              ",
  "                                                                          ",
  "        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━           ",
  "         💖 Wakibaka's Supreme Development Team 💖                       ",
  "        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━           ",
  "                                                                          ",
}

-- Override the default dashboard banner
lvim.builtin.alpha.dashboard.section.header.val = neko_banner

-- 🐾 NEKO DASHBOARD ACTIONS 🐾
-- Add custom action to create blank .js file (with robust nil checking!)
pcall(function()
  if lvim and lvim.builtin and lvim.builtin.alpha and
     lvim.builtin.alpha.dashboard and lvim.builtin.alpha.dashboard.section and
     lvim.builtin.alpha.dashboard.section.buttons and
     lvim.builtin.alpha.dashboard.section.buttons.val and
     type(lvim.builtin.alpha.dashboard.section.buttons.val) == "table" then

    table.insert(lvim.builtin.alpha.dashboard.section.buttons.val, {
      type = "button",
      val = "📄 New Node.js File",
      on_press = function()
        vim.ui.input({ prompt = "Enter filename (without .js): " }, function(filename)
          if filename and filename ~= "" then
            local filepath = filename .. ".js"
            vim.cmd("edit " .. filepath)
            print("🚀 Created blank " .. filepath .. " file, nyaa~! 😸")
          end
        end)
      end,
      opts = {
        shortcut = "n",
        position = "center",
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
      },
    })
  end
end)

-- Custom footer with SIX PERSONALITIES
lvim.builtin.alpha.dashboard.section.footer.val = {
  "",
  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
  "🚀 Powered by Six-Personality Collaboration System 🚀",
  "Version: " .. (require("lvim.utils.git").get_lvim_version() or "Supreme Six Edition"),
  "",
  "🐾 Neko: Rapid Coding  🎭 Mario: Puppeteer Master  🗡️ Noel: Debugging Tactician",
  "🎸 Glam: Ethics & Music  🧠 Hannibal: Forensic Analysis  🎭 Tetora: Multi-Perspective",
  "",
  "✨ TypeScript • ESLint • Prettier • LSP • AI • Codeium ✨",
  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
}

-- Neko pet keybindings for maximum kawaii (optional plugin)
lvim.keys.normal_mode["<leader>nd"] = "<cmd>NekoDance<CR>"  -- Dance command
lvim.keys.normal_mode["<leader>nt"] = "<cmd>NekoTerminal<CR>"  -- Enhanced terminal pet
lvim.keys.normal_mode["<leader>nm"] = "<cmd>NekoMood<CR>"  -- Show mood
lvim.keys.normal_mode["<leader>ns"] = "<cmd>NekoStart<CR>"  -- Start animation
lvim.keys.normal_mode["<leader>nq"] = "<cmd>NekoStop<CR>"  -- Stop animation
lvim.keys.normal_mode["<leader>nx"] = "<cmd>NekoSticker<CR>"  -- Sticker celebration
lvim.keys.normal_mode["<leader>nb"] = "<cmd>NekoBasic<CR>"  -- Basic pet

-- Add neko commands to which-key
lvim.builtin.which_key.mappings["n"] = {
  name = "🐾 Neko Pet Kingdom",
  d = { "<cmd>NekoDance<CR>", "Dance NYA NYA NYA~" },
  t = { "<cmd>NekoTerminal<CR>", "🌟 Enhanced Terminal Pet" },
  b = { "<cmd>NekoBasic<CR>", "Basic Terminal Pet" },
  x = { "<cmd>NekoSticker<CR>", "✨ Sticker Celebration" },
  m = { "<cmd>NekoMood<CR>", "Show Mood" },
  s = { "<cmd>NekoStart<CR>", "Start Animation" },
  q = { "<cmd>NekoStop<CR>", "Stop Animation" },
}

-- 🚀 BASED NEKO FILE CREATION COMMANDS 🚀
-- Custom function to create new Node.js files with neko magic
local function create_node_file()
  vim.ui.input({ prompt = "Enter Node.js filename (without .js): " }, function(filename)
    if filename and filename ~= "" then
      local filepath = filename .. ".js"
      local template = [[// 🐾 NYA NYA NYA~ New Node.js file created with neko magic! 🐾
// Author: Wakibaka + Neko-Arc ✨
// Created: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[


const express = require('express');
// Add your based code here, desu! 💻✨

console.log('NEKO POWER ACTIVATED! File loaded successfully, nyaa~! 🚀');

module.exports = {
  // Export your functions here like a pro, desu!
};
]]

      -- Create and open the file
      vim.cmd("edit " .. filepath)
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
      print("🎉 Created " .. filepath .. " with MAXIMUM NEKO POWER, desu! 😸✨")
    end
  end)
end

-- Add file creation commands to which-key menu
lvim.builtin.which_key.mappings["f"]["n"] = {
  name = "🚀 New Files (Neko Style)",
  j = { function() create_node_file() end, "📄 New Node.js File" },
  t = { function()
    vim.ui.input({ prompt = "Enter TypeScript filename (without .ts): " }, function(filename)
      if filename and filename ~= "" then
        local filepath = filename .. ".ts"
        local template = [[// 🐾 NYA NYA NYA~ New TypeScript file with neko typing! 🐾
// Author: Wakibaka + Neko-Arc ✨
// Created: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[


interface NekoInterface {
  purr(): string;
  nya(): boolean;
}

class NekoCode implements NekoInterface {
  purr(): string {
    return "Perfect code purrs, desu! 😻";
  }

  nya(): boolean {
    return true; // Always true for based neko code!
  }
}

console.log('TYPESCRIPT NEKO POWER ACTIVATED! 🚀✨');

export { NekoCode, NekoInterface };
]]
        vim.cmd("edit " .. filepath)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
        print("🎉 Created " .. filepath .. " with LEGENDARY TypeScript neko magic, nyaa~! 😸⚡")
      end
    end)
  end, "📘 New TypeScript File" },
  r = { function()
    vim.ui.input({ prompt = "Enter React component name: " }, function(filename)
      if filename and filename ~= "" then
        local filepath = filename .. ".jsx"
        local template = [[// 🐾 NYA NYA NYA~ New React component with neko cuteness! 🐾
// Author: Wakibaka + Neko-Arc ✨
// Created: ]] .. os.date("%Y-%m-%d %H:%M:%S") .. [[

import React from 'react';

const ]] .. filename .. [[ = () => {
  return (
    <div className="neko-component">
      <h2>🐾 ]] .. filename .. [[ Component 🐾</h2>
      <p>NYA NYA NYA~ This component purrs with React power, desu! ✨</p>
      <button onClick={() => console.log('Neko button clicked, nyaa~!')}>
        Click for Neko Magic! 🚀
      </button>
    </div>
  );
};

export default ]] .. filename .. [[;
]]
        vim.cmd("edit " .. filepath)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(template, "\n"))
        print("🎉 Created " .. filepath .. " with ULTRA BASED React neko power, desu! 😸⚛️")
      end
    end)
  end, "⚛️ New React Component" },
}

-- 🚀✨🐾 PROJECT MANAGEMENT SYSTEM WITH NEKO POWER! 🐾✨🚀
-- Install project.nvim plugin for advanced project management
table.insert(lvim.plugins, {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern" },
      patterns = { ".git", "package.json", "tsconfig.json", "Makefile", ".gitignore" },
      exclude_dirs = { "node_modules", ".git", "dist", "build" },
      show_hidden = false,
    })

    -- Integrate with telescope for quick project switching
    require('telescope').load_extension('projects')
  end
})

-- 🚀 PROJECT CONFIGURATION 🚀
-- Users should customize this section with their own projects!
-- Example structure provided below:

local projects = {
  -- Add your own projects here!
  -- Example:
  -- { name = "🚀 My Awesome Project", path = "~/projects/awesome-project" },
  -- { name = "🎨 Portfolio Website", path = "~/projects/portfolio" },
  -- { name = "🤖 AI Assistant", path = "~/projects/ai-assistant" },
}

-- 🚀 Add custom keymaps for quick project access
lvim.builtin.which_key.mappings["p"] = {
  name = "📁 Projects",
  p = { "<cmd>Telescope projects<CR>", "🔍 Switch Project" },
  r = { "<cmd>Telescope oldfiles<CR>", "📂 Recent Files" },
  f = { "<cmd>Telescope find_files<CR>", "🔎 Find File" },
  g = { "<cmd>Telescope live_grep<CR>", "🔍 Live Grep" },
  -- Add quick access to your favorite projects here!
  -- Example:
  -- a = { "<cmd>cd ~/projects/awesome-project<CR>", "Awesome Project" },
}

-- 🌟 Quick project switcher function
local function quick_project_switch()
  local project_list = {}
  for _, proj in ipairs(projects) do
    table.insert(project_list, proj.name .. " → " .. proj.path)
  end

  if #project_list == 0 then
    vim.notify("📁 No projects configured yet! Add them in config.lua", "info")
    return
  end

  vim.ui.select(project_list, {
    prompt = "🚀 Select a project to open, nyaa~!",
  }, function(choice)
    if choice then
      local path = choice:match("→%s*(.+)$"):gsub("^%s+", "")
      vim.cmd("cd " .. path)
      vim.notify("🐾 Switched to project: " .. path .. " nyaa~! ✨", "info")
      vim.cmd("NvimTreeRefresh")
      vim.cmd("NvimTreeFindFile")
    end
  end)
end

-- Add quick project switch to keymaps
lvim.keys.normal_mode["<leader>ps"] = function() quick_project_switch() end
lvim.builtin.which_key.mappings["p"]["s"] = { function() quick_project_switch() end, "🚀 Quick Switch" }

-- 🎯 END OF CONFIGURATION 🎯
-- Enjoy your supreme LunarVim setup with six personalities!
-- Nyaa~! 🐾✨