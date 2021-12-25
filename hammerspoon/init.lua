hs.hotkey.bind({"cmd"}, "space", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)

hs.hotkey.bind({"cmd"}, "t", function()
  local teams = hs.application.find('teams')
  if teams:isFrontmost() then
    teams:hide()
  else
    hs.application.launchOrFocus("/Applications/Microsoft Teams.app")
  end
end)

hs.hotkey.bind({"cmd"}, "g", function()
  local chrome = hs.application.find('chrome')
  if chrome:isFrontmost() then
    chrome:hide()
  else
    hs.application.launchOrFocus("/Applications/Google Chrome.app")
  end
end)