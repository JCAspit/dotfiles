require('cloak').setup({
	enabled = true,
	cloak_character = '*',
	highlight_group = 'Comment',
	cloak_length = nil,
	try_all_patterns = true,
	cloak_telescope = true,
	cloak_on_leave = true,
	patterns = {
		{
			file_pattern = '.env*',
			cloak_pattern = '=.+',
			replace = nil,
		},
	}
})
