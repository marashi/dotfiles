hs.alert.show("HS Config loaded...")
--# constants
super = "⌃⌥"
hyper = {"cmd", "alt", "ctrl"}
empty_table = {}
windowCornerRadius = 10

--# helpers
function yabai(args, completion)
	local yabai_output = ""
	local yabai_error = ""
	-- Runs in background very fast
	local yabai_task = hs.task.new("/usr/local/bin/yabai",nil, function(task, stdout, stderr)
		--print("stdout:"..stdout, "stderr:"..stderr)
		if stdout ~= nil then yabai_output = yabai_output..stdout end
		if stderr ~= nil then yabai_error = yabai_error..stderr end
		return true
	end, args)
	if type(completion) == "function" then
		yabai_task:setCallback(function() completion(yabai_output, yabai_error) end)
	end
	yabai_task:start()
end

function delayed(fn, delay)
	return hs.timer.delayed.new(delay, fn):start()
end

toasts = {
	main = nil
}
function killToast(params)
	params = params or empty_table
	local name = params.name or "main"
	if toasts[name] ~= nil then
		hs.alert.closeSpecific(toasts[name], params.fadeOutDuration or 0.1)
		toasts[name] = nil
	end
end
function toast(str, time, params)
	killToast(params)
	params = params or empty_table
	local name = params.name or "main"
	--local toast = toasts[name]
	toasts[name] = hs.alert(str, {
		fillColor = { white = 0, alpha = 0.4 },
		strokeColor = { white = 0, alpha = 0 },
		strokeWidth = 0,
		textColor = { white = 1, alpha = 1 },
		radius = 0,
		padding = 6,
		atScreenEdge = 0,
		fadeInDuration = 0.1,
		fadeOutDuration = params.fadeOutDuration or 0.1
	}, time or 0.6)
end



--# Main chooser
local mainChooser = hs.chooser.new(function(option)
	if option ~= nil then
		if option.action == "reload" then
			hs.reload()
		elseif option.action == "toggle_gap" then
			yabai({"-m", "space", "--toggle", "padding"}, function() yabai({"-m", "space", "--toggle", "gap"}) end)
		end
	end
end):choices({
{
	text = "Toggle Gap",
	subText = "Toggles padding and gaps around the current space",
	action = "toggle_gap"
},
{
	text = "Reload",
	subText = "Reload Hammerspoon configuration",
	action = "reload"
},
})


--# bindings

--# reload config
hs.hotkey.bind(hyper, hs.keycodes.map["r"], nil, function() hs.reload() end)
--# open main chooser
hs.hotkey.bind(hyper, hs.keycodes.map["space"], nil, function() mainChooser:show() end)


--# set layout under mouse
hs.hotkey.bind(super, hs.keycodes.map["1"], function() yabai({"-m", "space", "mouse", "--layout", "bsp"}, function() toast("🖖") end) end)  --["1"]
hs.hotkey.bind(super, hs.keycodes.map["2"], function() yabai({"-m", "space", "mouse", "--layout", "stack"}, function() toast("📚") end) end)  --["2"]
hs.hotkey.bind(super, hs.keycodes.map["3"], function() yabai({"-m", "space", "mouse", "--layout", "float"}, function() toast("☁️") end) end)  --["3"]


--# rotate space
hs.hotkey.bind(hyper, hs.keycodes.map["x"], function() yabai({"-m", "space", "--rotate", "270"}, function() toast("🔲🔁") end) end)  --["."]


--# focus fullscreen
hs.hotkey.bind(hyper, hs.keycodes.map["f"], function() yabai({"-m", "window", "--toggle", "zoom-fullscreen"}) toast("🖥") end)  --["m"]


--# toggle float layout for window
hs.hotkey.bind(super, hs.keycodes.map["f"], function() yabai({"-m", "window", "--toggle", "float"}) toast("🎚☁️") end)  --["/"]

--# change window focus to direction
hs.hotkey.bind(super, hs.keycodes.map["right"], function() yabai({"-m", "window", "--focus", "east"}) toast("👉") end)  --[";"]
hs.hotkey.bind(super, hs.keycodes.map["left"], function() yabai({"-m", "window", "--focus", "west"}) toast("👈") end)  --["j"]
hs.hotkey.bind(super, hs.keycodes.map["up"], function() yabai({"-m", "window", "--focus", "north"}) toast("👆") end)  --["l"]
hs.hotkey.bind(super, hs.keycodes.map["down"], function() yabai({"-m", "window", "--focus", "south"}) toast("👇") end)  --["k"]

--# bsp ratio
hs.hotkey.bind(hyper, hs.keycodes.map["9"], function() yabai({"-m", "window", "--ratio", "abs:0.38"}) toast("🔲⅓") end)  --["7"]
hs.hotkey.bind(hyper, hs.keycodes.map["0"], function() yabai({"-m", "window", "--ratio", "abs:0.5"}) toast("🔲½") end)  --["8"]
hs.hotkey.bind(hyper, hs.keycodes.map["-"], function() yabai({"-m", "window", "--ratio", "abs:0.62"}) toast("🔲⅔") end)  --["9"]
hs.hotkey.bind(hyper, hs.keycodes.map["="], function() yabai({"-m", "space", "--balance"}) toast("🔲⚖️") end)  --["-"]

--# swap window
hs.hotkey.bind(hyper, hs.keycodes.map["left"], function() yabai({"-m", "window", "--swap", "west"}) toast("⬅️") end)  --["7"]
hs.hotkey.bind(hyper, hs.keycodes.map["down"], function() yabai({"-m", "window", "--swap", "south"}) toast("⬇️") end)  --["8"]
hs.hotkey.bind(hyper, hs.keycodes.map["up"], function() yabai({"-m", "window", "--swap", "north"}) toast("⬆️") end)  --["9"]
hs.hotkey.bind(hyper, hs.keycodes.map["right"], function() yabai({"-m", "window", "--swap", "east"}) toast("➡️") end)  --["-"]

--# move window whithin space
hs.hotkey.bind(hyper, hs.keycodes.map["h"], function() yabai({"-m", "window", "--warp", "west"}) toast("LEFT") end)  --["7"]
hs.hotkey.bind(hyper, hs.keycodes.map["j"], function() yabai({"-m", "window", "--warp", "south"}) toast("DOWN") end)  --["8"]
hs.hotkey.bind(hyper, hs.keycodes.map["k"], function() yabai({"-m", "window", "--warp", "north"}) toast("TOP") end)  --["9"]
hs.hotkey.bind(hyper, hs.keycodes.map["l"], function() yabai({"-m", "window", "--warp", "east"}) toast("RIGHT") end)  --["-"]

--# move to another space
local screenIds = hs.spaces.spacesForScreen()
hs.spaces.MCwaitTime = 0.4
hs.hotkey.bind(hyper, hs.keycodes.map["1"], function() yabai({"-m", "window", "--space", "1"}) toast("➡️1️⃣") hs.spaces.gotoSpace(screenIds[1]) end)
hs.hotkey.bind(hyper, hs.keycodes.map["2"], function() yabai({"-m", "window", "--space", "2"}) toast("➡️2️⃣") hs.spaces.gotoSpace(screenIds[2]) end)
hs.hotkey.bind(hyper, hs.keycodes.map["3"], function() yabai({"-m", "window", "--space", "3"}) toast("➡️3️⃣") hs.spaces.gotoSpace(screenIds[3]) end)
hs.hotkey.bind(hyper, hs.keycodes.map["4"], function() yabai({"-m", "window", "--space", "4"}) toast("➡️4️⃣") hs.spaces.gotoSpace(screenIds[4]) end)
hs.hotkey.bind(hyper, hs.keycodes.map["5"], function() yabai({"-m", "window", "--space", "5"}) toast("➡️5️⃣") hs.spaces.gotoSpace(screenIds[5]) end)

hs.hotkey.bind(hyper, hs.keycodes.map["t"],function() hs.application.open('alacritty') end)