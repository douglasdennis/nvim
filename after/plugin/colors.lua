function ApplyColorScheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

ApplyColorScheme()
