-- colors

white = "\\e[1;37m"
purple = "\\e[0;35m"
text = "Hi" .. white .. "hey" .. purple .. "yo"
text2 = '"' .. text .. '"'
print(text2)
text3 = "printf " .. text2
os.execute(text3)
-- Ok, I'll have to use the os.execute() function to get colors in the terminal
-- Dodam kolory. W jednej linijce?
