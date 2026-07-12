return {
  'lewis6991/gitsigns.nvim',
  version = '2.1.0',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map('n', '<leader>hs', gitsigns.stage_hunk, 'Gitsigns stage hunk')
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Gitsigns stage hunk')

      map('n', '<leader>hr', gitsigns.reset_hunk, 'Gitsigns reset hunk')
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Gitsigns reset hunk')

      map('n', '<leader>hp', gitsigns.preview_hunk, 'Gitsigns preview hunk')
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'Gitsigns preview hunk inline')

      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, 'Gitsigns blame line')

      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Gitsigns toggle current line blame')
      map('n', '<leader>tw', gitsigns.toggle_word_diff, 'Gitsigns toggle word diff')
    end,
  },
}
