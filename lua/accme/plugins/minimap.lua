local setup, minimap = pcall(require, "minimap")
if not setup then
	return
end

minimap.setup()
