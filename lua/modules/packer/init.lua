vim.cmd("packadd packer.nvim")

local packer = require("packer")

packer.init({
    display = {
        open_cmd = "leftabove 80vnew [packer]",
    },
    profile = {
        enable = true,
        threshold = 1,
    },
})

packer.startup(function()
    use({ "wbthomason/packer.nvim", opt = true })

    -- Auto pairs
    -- use({ "windwp/nvim-autopairs" })
    use({ "jiangmiao/auto-pairs" })
    use({ "tpope/vim-surround" })

    -- use({ "machakann/vim-sandwich" })

    -- syntax
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow",
        },
    })

		-- completion
    use({ "neoclide/coc.nvim" })

    -- Indentline
    -- use({
    --     "lukas-reineke/indent-blankline.nvim",
    --     branch = "lua",
    -- })

    -- Commentary
    use({ "terrortylor/nvim-comment" })

    -- Explorer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- multiple cursor
    use("terryma/vim-multiple-cursors")

    -- emmet
    use("mattn/emmet-vim")

    -- statusline
    use({
        "glepnir/galaxyline.nvim",
        branch = "main", -- your statusline
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- colorshcme
    use("glepnir/zephyr-nvim")
    use("norcalli/nvim-colorizer.lua")

		-- react snippets
		use("epilande/vim-react-snippets")

		-- git
    use 'nvim-lua/plenary.nvim'
    use 'ruifm/gitlinker.nvim'
end)

return packer
