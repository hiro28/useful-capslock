-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

local appShortCuts = {

	A = 'Safari',
    D = 'Dash',
    E = 'evernote',
    S = 'Slack',
    X = 'Xcode',
    M = 'Messages'
}

-- Bind Shortcuts to app
for key, app in pairs(appShortCuts) do
    k:bind({}, key, function() hs.application.launchOrFocus(app) end, function() k:exit() end)
end

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)