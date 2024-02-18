-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = "*",
--     command = "set noro"
-- })

-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
--     callback = function()
--         if vim.bo.modified and not vim.bo.readonly and vim.fn.expand "%" ~= "" and vim.bo.buftype == "" then
--             vim.api.nvim_command "silent update"
--         end
--     end,
-- })

-- set no comment in next line
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "set formatoptions-=ro",
})

-- set wrap only for markdown
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local ft = { "markdown", "typst" }
        for _, v in ipairs(ft) do
            if vim.bo.filetype == v then
                vim.wo.wrap = true
                return
            end
            vim.wo.wrap = false
        end
    end,
})