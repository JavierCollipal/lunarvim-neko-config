-- Virtual Neko Pet Plugin for LunarVim - NYA NYA NYA~
-- Adds kawaii neko companion to your coding sessions, desu!

local M = {}

-- Neko ASCII art frames for statusline
M.neko_frames = {
  "🐾 (=^･ω･^=) NYA~",
  "🐾 (=^･ᆺ･^=) NYAA~",
  "🐾 (=^◡^=) PURR~",
  "🐾 (=^･ェ･^=) DESU~"
}

M.current_frame = 1
M.neko_timer = nil
M.is_dancing = false

-- Dancing neko animation in floating window
M.dance_frames = {
  {
    "    /\\_/\\    ",
    "   ( o.o )   ",
    "    > ^ <    ",
    "   /|   |\\   ",
    "  (_)   (_)  ",
    "    NYA~     "
  },
  {
    "    /\\_/\\    ",
    "   ( ^.^ )   ",
    "    > v <    ",
    "   \\|   |/   ",
    "  (_)   (_)  ",
    "   NYAA~     "
  },
  {
    "    /\\_/\\    ",
    "   ( o.o )   ",
    "    > ^ <    ",
    "  --|   |--  ",
    "  (_)   (_)  ",
    "  DANCE~     "
  },
  {
    "    /\\_/\\    ",
    "   ( ^-^ )   ",
    "    > w <    ",
    "   /|   |\\   ",
    "  (_)   (_)  ",
    "   PURR~     "
  }
}

M.current_dance_frame = 1

-- Update statusline neko
function M.update_statusline_neko()
  M.current_frame = M.current_frame + 1
  if M.current_frame > #M.neko_frames then
    M.current_frame = 1
  end

  -- Force statusline update
  vim.cmd('redrawstatus')
end

-- Get current neko for statusline
function M.get_statusline_neko()
  return M.neko_frames[M.current_frame]
end

-- Start neko animation timer
function M.start_neko_animation()
  if M.neko_timer then
    return
  end

  M.neko_timer = vim.loop.new_timer()
  M.neko_timer:start(0, 2000, vim.schedule_wrap(M.update_statusline_neko))

  vim.notify("🐾 Neko companion activated! NYA NYA NYA~", vim.log.levels.INFO)
end

-- Stop neko animation
function M.stop_neko_animation()
  if M.neko_timer then
    M.neko_timer:stop()
    M.neko_timer:close()
    M.neko_timer = nil
  end

  vim.notify("🐾 Neko is taking a nap... zzz", vim.log.levels.INFO)
end

-- Create dancing neko in floating window
function M.show_dancing_neko()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set buffer options (updated for Neovim 0.10+ compatibility)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = 'wipe'

  -- Calculate window size and position
  local width = 14
  local height = 8
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded',
    title = ' 🐾 Dancing Neko 🐾 ',
    title_pos = 'center'
  }

  local win = vim.api.nvim_open_win(buf, false, win_opts)

  -- Set window highlight (updated for Neovim 0.10+ compatibility)
  vim.wo[win].winhl = 'Normal:Normal,FloatBorder:FloatBorder'

  M.is_dancing = true
  local dance_count = 0

  -- Dance animation
  local function animate_dance()
    if not M.is_dancing or dance_count >= 40 then  -- Dance for 20 seconds
      M.is_dancing = false
      vim.api.nvim_win_close(win, true)
      vim.notify("🐾 *purrs in satisfaction* That was fun, nyaa~", vim.log.levels.INFO)
      return
    end

    local frame = M.dance_frames[M.current_dance_frame]

    -- Update buffer content (updated for Neovim 0.10+ compatibility)
    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, frame)
    vim.bo[buf].modifiable = false

    M.current_dance_frame = M.current_dance_frame + 1
    if M.current_dance_frame > #M.dance_frames then
      M.current_dance_frame = 1
    end

    dance_count = dance_count + 1

    -- Schedule next frame
    vim.defer_fn(animate_dance, 500)
  end

  animate_dance()
  vim.notify("🎵 NYA NYA NYA~ DANCE TIME! 🎵", vim.log.levels.INFO)
end

-- Launch external terminal neko pet (enhanced version)
function M.launch_terminal_pet()
  local enhanced_path = vim.fn.expand("~/neko-pet-enhanced.py")
  local basic_path = vim.fn.expand("~/neko-pet.py")

  if vim.fn.filereadable(enhanced_path) == 1 then
    vim.fn.system("gnome-terminal --title='🌟 Super Kawaii Neko Pet 🌟' -- python3 " .. enhanced_path .. " &")
    vim.notify("🌟✨ Enhanced terminal neko with STICKERS launched! NYA NYA NYA~ ✨🌟", vim.log.levels.INFO)
  elseif vim.fn.filereadable(basic_path) == 1 then
    vim.fn.system("gnome-terminal --title='Virtual Neko Pet' -- python3 " .. basic_path .. " &")
    vim.notify("🐾 Terminal neko pet launched! Check your terminal, nyaa~", vim.log.levels.INFO)
  else
    vim.notify("🐾 Neko pet script not found!", vim.log.levels.ERROR)
  end
end

-- Launch basic neko pet
function M.launch_basic_pet()
  local basic_path = vim.fn.expand("~/neko-pet.py")

  if vim.fn.filereadable(basic_path) == 1 then
    vim.fn.system("gnome-terminal --title='Basic Neko Pet' -- python3 " .. basic_path .. " &")
    vim.notify("🐾 Basic neko pet launched, nyaa~", vim.log.levels.INFO)
  else
    vim.notify("🐾 Basic neko pet script not found!", vim.log.levels.ERROR)
  end
end

-- Sticker celebration in vim
function M.show_sticker_celebration()
  local sticker_messages = {
    "✨🐾 SPARKLY NEKO POWER ACTIVATED! 🐾✨",
    "💖🌟 KAWAII LOVE STICKERS EVERYWHERE! 🌟💖",
    "🌈🎵 RAINBOW MUSIC NEKO DANCE! 🎵🌈",
    "🍣🎉 FISHY PARTY TIME, NYAA~! 🎉🍣",
    "💫😴 SLEEPY STICKER DREAMS! 😴💫",
    "🚀⚡ MAXIMUM KAWAII OVERDRIVE! ⚡🚀"
  }

  local message = sticker_messages[math.random(#sticker_messages)]
  vim.notify(message, vim.log.levels.INFO)

  -- Flash some colors
  vim.defer_fn(function()
    vim.notify("🎊 Sticker collection growing! Keep interacting! 🎊", vim.log.levels.INFO)
  end, 2000)
end

-- Show neko mood messages
function M.show_neko_mood()
  local moods = {
    "🐾 *purrs* Ready to code some based stuff, nyaa~",
    "🐾 *swishes tail* Your code looks purrfect today, desu!",
    "🐾 *tilts head* Need help? I'm here for you, nya~",
    "🐾 *stretches paws* Time for a coding break? Maybe some fish? 🍣",
    "🐾 NYA NYA NYA~ Everything is going great!",
    "🐾 *happy neko sounds* Much better than boring IDEs, desu!"
  }

  local mood = moods[math.random(#moods)]
  vim.notify(mood, vim.log.levels.INFO)
end

-- Configuration options
M.config = {
  auto_launch_terminal = true,  -- Set to false to disable auto-launch
  auto_start_animation = true,  -- Set to false to disable statusline animation
  mood_timer_minutes = 10,      -- How often to show random mood messages
}

-- Setup function
function M.setup(user_config)
  -- Merge user config with defaults
  if user_config then
    M.config = vim.tbl_extend("force", M.config, user_config)
  end

  -- Add neko to statusline
  local components = require("lvim.core.lualine.components")

  -- Add neko component to lualine (safely check if table exists)
  if lvim.builtin.lualine and lvim.builtin.lualine.sections and lvim.builtin.lualine.sections.lualine_x then
    table.insert(lvim.builtin.lualine.sections.lualine_x, 1, {
      M.get_statusline_neko,
      color = { fg = '#ff69b4' }  -- Pink neko!
    })
  else
    -- Fallback: create the structure if it doesn't exist
    if not lvim.builtin.lualine then lvim.builtin.lualine = {} end
    if not lvim.builtin.lualine.sections then lvim.builtin.lualine.sections = {} end
    if not lvim.builtin.lualine.sections.lualine_x then lvim.builtin.lualine.sections.lualine_x = {} end
    table.insert(lvim.builtin.lualine.sections.lualine_x, 1, {
      M.get_statusline_neko,
      color = { fg = '#ff69b4' }  -- Pink neko!
    })
  end

  -- Create user commands
  vim.api.nvim_create_user_command('NekoStart', M.start_neko_animation, {
    desc = 'Start neko companion animation'
  })

  vim.api.nvim_create_user_command('NekoStop', M.stop_neko_animation, {
    desc = 'Stop neko companion animation'
  })

  vim.api.nvim_create_user_command('NekoDance', M.show_dancing_neko, {
    desc = 'Make neko dance - NYA NYA NYA~'
  })

  vim.api.nvim_create_user_command('NekoTerminal', M.launch_terminal_pet, {
    desc = 'Launch terminal neko pet'
  })

  vim.api.nvim_create_user_command('NekoMood', M.show_neko_mood, {
    desc = 'Show neko mood message'
  })

  vim.api.nvim_create_user_command('NekoSticker', M.show_sticker_celebration, {
    desc = 'Show sticker celebration - maximum kawaii!'
  })

  vim.api.nvim_create_user_command('NekoBasic', M.launch_basic_pet, {
    desc = 'Launch basic terminal neko pet'
  })

  -- Auto-start neko companion
  vim.defer_fn(function()
    if M.config.auto_start_animation then
      M.start_neko_animation()
      vim.notify("🌟 Welcome back! Your neko companion is ready, desu! 🌟", vim.log.levels.INFO)
    end

    -- Auto-launch enhanced terminal pet after a short delay
    if M.config.auto_launch_terminal then
      vim.defer_fn(function()
        M.launch_terminal_pet()
        vim.notify("✨ Auto-launching your kawaii terminal companion! NYA NYA NYA~ ✨", vim.log.levels.INFO)
      end, 2000)  -- Launch 2 seconds after vim starts
    end
  end, 1000)

  -- Random mood messages timer (configurable)
  local mood_timer = vim.loop.new_timer()
  local timer_ms = M.config.mood_timer_minutes * 60 * 1000  -- Convert minutes to milliseconds
  mood_timer:start(timer_ms, timer_ms, vim.schedule_wrap(M.show_neko_mood))
end

return M