local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
	"lua",
	"css",
	"scss",
	"javascript",
	"html",
	-- html = {
	-- 	mode = "foreground",
	-- },
})
