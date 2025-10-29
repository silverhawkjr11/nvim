-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- make <C-up> and <C-down> move the current line or visual selection up or down in normal, visual and insert mode
local lspconfig = require("lspconfig")

local dap = require("dap")
local dart = require("plugins.dart")
vim.lsps = lspconfig
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- make tab is insert 4 spaces then go to insert mode
vim.api.nvim_set_keymap("i", "<Tab>", "    ", { noremap = true, silent = true })

-- make <C-a> select all
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Assuming you have 'folke/todo-comments.nvim' installed via lazy.nvim
vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<CR>", { desc = "Open TodoTelescope" })
-- for telescope find buffers
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
-- copilot quick chat command
vim.api.nvim_set_keymap("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ce", ":CopilotChatExplain<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cd", ":CopilotChatDocs<CR>", { noremap = true, silent = true })
-- to comment a line and go to the next line
-- vim.api.nvim_set_keymap("n", "<leader>m", ":CommentToggle<CR>j", { noremap = true, silent = true })
-- to show suggestions code suggestions
vim.api.nvim_set_keymap("n", "<leader>ss", ":CopilotSuggest<CR>", { noremap = true, silent = true })

-- Define custom keymaps for orgmode.nvim
-- vim.keymap.set("n", "<leader>tt", "<cmd>OrgToggleCheckbox<CR>", { desc = "Toggle Checkbox" }) -- Toggle TODO checkbox
-- vim.keymap.set("n", "<leader>tn", "<cmd>OrgNextVisibleHeading<CR>", { desc = "Go to next task" }) -- Go to the next task
-- vim.keymap.set("n", "<leader>tp", "<cmd>OrgPrevVisibleHeading<CR>", { desc = "Go to previous task" }) -- Go to the previous task
-- vim.keymap.set("n", "<leader>tc", "<cmd>OrgCapture<CR>", { desc = "Capture a new task" }) -- Capture a new task
-- vim.keymap.set("n", "<leader>td", "<cmd>OrgDeadline<CR>", { desc = "Set deadline for task" }) -- Set deadline for the task
-- vim.keymap.set("n", "<leader>ts", "<cmd>OrgSchedule<CR>", { desc = "Schedule a task" }) -- Schedule a task
-- vim.keymap.set("n", "<leader>ta", "<cmd>OrgAgenda<CR>", { desc = "Open agenda view" }) -- Open agenda view
-- vim.keymap.set("n", "<leader>to", "<cmd>OrgTodoNextState<CR>", { desc = "Toggle TODO/DONE" }) -- Toggle TODO/DONE state

-- for markdown preview
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", function()
  vim.lsps.rename()
end, {})
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- return in normal mode makes a  new line and goes back to normal mode
vim.api.nvim_set_keymap("n", "<CR>", "o<Esc>", { noremap = true, silent = true })
-- In your debugging.lua config:
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue/Start" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>ds", dap.step_out, { desc = "Debug: Step Out" })

-- leader ff opens Telescope find_files
-- vim.keymap.set("n", "<leader>ff", ":Telescope file_browser<CR>", { noremap = true, silent = true })

-- keymap to launch file_browser at current file's folder

-- load once, e.g. in your telescope setup file
-- Correct way to require the actions
local fb_actions = require("telescope._extensions.file_browser.actions")

-- Your existing code with the fix
vim.keymap.set("n", "<leader>ff", function()
  local telescope = require("telescope")
  local fb = telescope.extensions.file_browser

  fb.file_browser({
    path = vim.fn.expand("%:p:h"),
    cwd = vim.fn.expand("%:p:h"),
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "insert",
    layout_config = { height = 40 },
    mappings = {
      ["n"] = {
        -- parent dir
        ["h"] = fb_actions.goto_parent_dir,
        ["<BS>"] = fb_actions.goto_parent_dir,
        -- create (this should work now)
        ["c"] = fb_actions.create,
      },
      ["i"] = {
        -- parent dir from insert
        ["<A-h>"] = fb_actions.goto_parent_dir,
        -- create from insert
        ["<A-c>"] = fb_actions.create,
      },
    },
  })
end, { noremap = true, silent = true, desc = "Telescope File Browser (here)" })
