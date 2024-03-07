local mode_n, mode_v, mode_i, mode_o, mode_nv, mode_ni, mode_nit, mode_nvo =
    { "n" }, { "v" }, { "i" }, { "o" }, { "n", "v" }, { "n", "i" }, { "n", "i", "v" }, { "n", "v", "o" }

local keymap = {
    -- stylua: ignore start
    { mode = mode_i,      from = "<a-l>",            to = "<Right>" }, -- insert模式下的方向键
    { mode = mode_i,      from = "<a-h>",            to = "<Left>" },
    { mode = mode_i,      from = "<C-f>",            to = "<cmd>lua require('luasnip').expand()<CR>"  }, -- luasnip触发键
    { mode = mode_n,      from = "n",                to = "nzzzv" }, -- 搜索保持光标
    { mode = mode_n,      from = "n",                to = "nzzzv" },
    { mode = mode_n,      from = "z",                to = "<c-w>" }, -- 分屏
    { mode = mode_n,      from = "<C-x>",            to = "<cmd>bd<CR>" }, -- buffer关闭
    { mode = mode_n,      from = "zz",               to = "za" }, -- 折叠/展开当前位置
    { mode = mode_n,      from = "zn",               to = "zR" }, -- 全部展开
    { mode = mode_n,      from = "zm",               to = "zM" }, -- 全部折叠
    { mode = mode_n,      from = "<up>",             to = "<cmd>res +5<CR>" }, -- 窗口操作
    { mode = mode_n,      from = "<down>",           to = "<cmd>res -5<CR>" },
    { mode = mode_n,      from = "<left>",           to = "<cmd>vertical resize-5<CR>" },
    { mode = mode_n,      from = "<right>",          to = "<cmd>vertical resize+5<CR>" },
    { mode = mode_v,      from = "K",                to = ":m '<-2<cr>gv=gv" }, -- 行移动
    { mode = mode_v,      from = "J",                to = ":m '>+1<cr>gv=gv" },
    { mode = mode_v,      from = "<C-c>",            to = "y" },
    { mode = mode_o,      from = "=",                to = "q" },
    { mode = mode_ni,     from = "<C-h>",            to = "<C-w>h" },
    { mode = mode_ni,     from = "<C-j>",            to = "<C-w>j" },
    { mode = mode_ni,     from = "<C-k>",            to = "<C-w>k" },
    { mode = mode_ni,     from = "<C-l>",            to = "<C-w>l" },
    { mode = mode_ni,     from = "<C-s>",            to = "<cmd>write<CR>" },
    { mode = mode_ni,     from = "<C-a>",            to = "<cmd>normal gg0vG$<CR>" },
    { mode = mode_ni,     from = "<f1>",             to = "<cmd>CompetiTest run<CR>" },
    { mode = mode_ni,     from = "<f2>",             to = "<cmd>CompetiTest add_testcase<CR>" },
    { mode = mode_ni,     from = "<f3>",             to = "<cmd>CompetiTest edit_testcase<CR>" },
    { mode = mode_ni,     from = "<f4>",             to = "<cmd>AsyncTask acm<cr>", },
    { mode = mode_ni,     from = "<f5>",             to = "<cmd>AsyncTask run<cr>", },
    { mode = mode_ni,     from = "<f6>",             to = "<cmd>AsyncTask build<cr>", },
    { mode = mode_nv,     from = "=",                to = "gq" },
    { mode = mode_nit,    from = "<a-q>",            to = "<cmd>q<CR>" }, -- 窗口关闭
    { mode = mode_nvo,    from = "H",                to = "^" },
    { mode = mode_nvo,    from = "L",                to = "$" },
    -- desc快捷键
    { mode = mode_n,      from = "<leader>p",        to = "<cmd>Lazy<CR>",                         desc = "lazy" },
    { mode = mode_n,      from = "<leader>v",        to = "<cmd>cd %:p:h<CR>",                     desc = "cd current file" },
    { mode = mode_n,      from = "<leader>sw",       to = "<cmd>set wrap!<CR>",                    desc = "toggle warp" },
    { mode = mode_n,      from = "<leader><leader>", to = "<cmd>noh<CR>",                          desc = "clear highlight" },
    { mode = mode_n,      from = "<leader>ss",       to = ":%s/\\<<C-r><C-w>\\>//g<left><left>",   desc = "global replacement", noise = true },
    -- stylua: ignore end
}
for _, mapping in ipairs(keymap) do
    if mapping.desc then
        vim.keymap.set(mapping.mode, mapping.from, mapping.to, { noremap = true, silent = true, desc = mapping.desc })
    else
        vim.keymap.set(mapping.mode, mapping.from, mapping.to, { noremap = true, silent = true })
    end
    if mapping.noise == true then
        vim.keymap.set(mapping.mode, mapping.from, mapping.to, { noremap = true })
    end
end
