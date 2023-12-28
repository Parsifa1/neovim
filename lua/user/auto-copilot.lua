vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if vim.bo.filetype == "cpp" then
            vim.cmd [[Copilot disable]]
        else
            vim.cmd[[Copilot enable]]
        end
    end
})
