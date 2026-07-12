return {
  'nvim-telescope/telescope.nvim',
  version = '0.2.1',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = 'n', desc = 'Telescope find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', mode = 'n', desc = 'Telescope live grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', mode = 'n', desc = 'Telescope buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', mode = 'n', desc = 'Telescope help tags' },
    { '<leader>gs', '<cmd>Telescope git_status<cr>', mode = 'n', desc = 'Telescope git status' },
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
}
