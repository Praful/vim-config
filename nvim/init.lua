
-- Set runtime path
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim'
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim/after'

-- Set pack path
vim.o.packpath = vim.o.runtimepath

-- Source vimrc file
vim.cmd('source ~/.vim/vimrc')

-- Set undo directory
vim.o.undodir = os.getenv('PK_VIMFILES') .. '/undo-nvim//'


-- firenvim config --------------------------------------------------------------
-- https://github.com/glacambre/firenvim

-- manually removing status line using set laststatus=0, results in two lines,
-- which is how many there are normally
vim.api.nvim_create_autocmd({'UIEnter'}, {
    callback = function(event)
        local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
        if client ~= nil and client.name == "Firenvim" then
            -- remove clutter
            vim.opt.laststatus = 0
            vim.opt.number = false
            vim.opt.signcolumn = "no"

            -- Suppress the file written message since we're autowriting
            vim.opt.shortmess:append("s")
        end
    end
})

vim.api.nvim_create_autocmd({'TextChanged', 'TextChangedI'}, {
    callback = function()
        if vim.g.timer_started then
            return
        end
        vim.g.timer_started = true
        vim.fn.timer_start(5000, function()
            vim.g.timer_started = false
            vim.cmd('silent write')
        end)
    end
})

-- don't automatically takeover textareas. Use c-e shortcut when required
vim.g.firenvim_config = {
  localSettings ={
    ['.*'] = {
      filename = os.getenv('TMPDIR') .. '/firenvim/{hostname}_{pathname%10}.{extension}',
      takeover = 'never'
    }
  }
}

-- end firenvim config --------------------------------------------------------  
