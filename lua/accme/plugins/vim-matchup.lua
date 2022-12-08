local setup, matchup = pcall(require, "vim-matchup")
if not setup then
	return
end

matchup.setup()

vim.g.matchup_matchparen_offscreen = { method = "popup" }
