require("bufferline").setup{
  options = {
    indicator = { icon = ' ', style = 'icon' },
    modified_icon = '*',
    left_trunc_marker = '...',
    right_trunc_marker = '...',
    max_name_length = 10,
    tab_size = 10,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    separator_style = { '│', '│' },
    always_show_bufferline = false,
  },
}

vim.cmd([[
  highlight clear BufferLineBackground
  highlight clear BufferLineBufferSelected
  highlight clear BufferLineBufferVisible
  highlight clear BufferLineFill
  highlight clear BufferLineIndicatorSelected
  highlight clear BufferLineModified
  highlight clear BufferLineModifiedSelected
  highlight clear BufferLineSeparator

  highlight BufferLineBackground guibg=#191919 guifg=#404040
  highlight BufferLineBufferSelected guibg=#191919
  highlight BufferLineFill guifg=#404040
  highlight BufferLineSeparator guibg=#191919 guifg=#000000

  highlight link BufferLineBufferVisible BufferLineBackground
  highlight link BufferLineIndicatorSelected BufferLineBufferSelected
  highlight link BufferLineModified BufferLineBackground
  highlight link BufferLineModifiedSelected BufferLineBufferSelected
]])
