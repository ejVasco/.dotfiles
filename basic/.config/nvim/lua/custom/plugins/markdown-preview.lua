return {

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_browser = 'vivaldi' -- Set your preferred browser
      vim.g.mkdp_auto_start = 1 -- Auto-start preview when opening Markdown files
    end,
  },
}
