-- lua/plugins/copilot-chat-remap.lua
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    -- make sure you're on main (not canary) to match LazyVim docs
    branch = "main",
    keys = {
      -- Replace the broken call to require("CopilotChat").select_prompt()
      {
        "<leader>ap",
        function()
          vim.cmd("CopilotChatPrompts")
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
    },
  },
}
