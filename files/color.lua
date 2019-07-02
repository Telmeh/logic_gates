-- Function to change color of display in terminal
-- XXX not currently working

function color(color)
	local no_color = "\\e[0m"; local white = "\\e[1;37m"; local black = "\\e[0;30m"; local blue = "\\e[0;34m"; local light_blue = "\\e[1;34m"; local green = "\\e[0;32m"; local light_green = "\\e[1;32m"; local cyan = "\\e[0;36m"; local light_cyan = "\\e[1;36m"; local red = "\\e[0;31m"; local light_red = "\\e[1;31m"; local purple = "\\e[0;35m"; local light_purple = "\\e[1;35m"; local brown = "\\e[0;33m"; local yellow = "\\e[1;33m"; local gray = "\\e[0;30m"; local light_gray="\\e[0;37m";
	-- It's not gonna fucking work that easily. Every time the string is parsed backslashes lose their meaning. I'd have to figure out how many times it's parsed. Etc.
	local text2 = "printf \"" .. text .. "\""
        os.exectute(text2)

end

return color
