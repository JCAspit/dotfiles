function MyFrickinColors(color)
	--[[local color = color or vim.cmd("colorscheme")
	local switch = {
		['default'] = 'rose-pine',
		['rose-pine'] = 'tokyonight',
		["tokyonight"] = 'rose-pine'
	}
	vim.cmd.colorscheme(switch[color])]]

	local color = color or 'rose-pine'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

MyFrickinColors()
