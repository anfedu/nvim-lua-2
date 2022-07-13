local hl_word_under_cursor = function()
    if vim.fn.getline(".")[vim.fn.col(".")] ~= "[[:punct:][:blank:]]" then
        return vim.cmd("exec 'match' 'Search' '/\\V\\<" .. vim.fn.expand("<cword>") .. "\\>/'")
    end
    vim.cmd("match none")
end

vim.api.nvim_exec(
    [[
  "autocmd! CursorHold,CursorHoldI * call 'hl_word_under_cursor'"
]],
    true
)
