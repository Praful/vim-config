
-- Set runtime path
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim'
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim/after'

-- Set pack path
vim.o.packpath = vim.o.runtimepath

-- Source vimrc file
vim.cmd('source ~/.vim/vimrc')

-- Set undo directory
vim.o.undodir = os.getenv('PK_VIMFILES') .. '/undo-nvim//'

-- vim.o.laststatus = 0
-- if vim.g.started_by_firenvim == true then
  -- vim.o.laststatus = 0
-- end
--

-- firenvim config
-- https://github.com/glacambre/firenvim

-- manually removing status line using set laststatus=0, results in two lines,
-- which is how many there are normally
vim.api.nvim_create_autocmd({'UIEnter'}, {
    callback = function(event)
        local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
        if client ~= nil and client.name == "Firenvim" then
            vim.o.laststatus = 0
        end
    end
})

