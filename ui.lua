local streamList = KeijinRadio_Streams
local currentStream = nil
local isPlaying = false

KeijinRadioFrame = CreateFrame("Frame", "KeijinRadioFrame", UIParent)
KeijinRadioFrame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
KeijinRadioFrame:SetBackdropColor(0, 0, 0, 0.75)
KeijinRadioFrame:SetWidth(260)
KeijinRadioFrame:SetHeight(170)
KeijinRadioFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
KeijinRadioFrame:SetMovable(true)
KeijinRadioFrame:EnableMouse(true)
KeijinRadioFrame:RegisterForDrag("LeftButton")
KeijinRadioFrame:SetScript("OnDragStart", function() KeijinRadioFrame:StartMoving() end)
KeijinRadioFrame:SetScript("OnDragStop", function() KeijinRadioFrame:StopMovingOrSizing() end)
KeijinRadioFrame:Hide()

local title = KeijinRadioFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -10)
title:SetText("KeijinRadio")

local label = KeijinRadioFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
label:SetPoint("TOPLEFT", 20, -35)
label:SetText("Select Station")

local dropdownButton = CreateFrame("Button", "KeijinRadioDropdownButton", KeijinRadioFrame, "UIPanelButtonTemplate")
dropdownButton:SetWidth(160)
dropdownButton:SetHeight(22)
dropdownButton:SetPoint("TOP", 0, -55)

local dropdownText = dropdownButton:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
dropdownText:SetPoint("CENTER", dropdownButton, "CENTER", 0, 0)
dropdownText:SetText("Choose Station")

local menuFrame = CreateFrame("Frame", "KeijinRadioDropdownMenu", UIParent, "UIDropDownMenuTemplate")

local toggleButton
local muteCheckbox

local function CreateMenu()
  local menu = {}
  for name, url in pairs(streamList) do
    table.insert(menu, {
      text = name,
      arg1 = name,
      arg2 = url,
      func = function(nameArg, urlArg)
        dropdownText:SetText(nameArg or "?")

        local wasPlaying = isPlaying
        local newStream = urlArg

        if not newStream then
          DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[KeijinRadio]|r Error: No stream URL provided.")
          return
        end

        currentStream = newStream
        DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Selected: " .. (nameArg or "unknown"))

        if wasPlaying and not muteCheckbox:GetChecked() then
          PlayMusic(currentStream)
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Stream changed.")
        elseif not isPlaying and not muteCheckbox:GetChecked() then
          PlayMusic(currentStream)
          toggleButton:SetText("Stop")
          isPlaying = true
          DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Stream started.")
        end
      end
    })
  end
  return menu
end

dropdownButton:SetScript("OnClick", function()
  UIDropDownMenu_Initialize(menuFrame, function()
    for _, item in ipairs(CreateMenu()) do
      UIDropDownMenu_AddButton(item)
    end
  end, "MENU")
  ToggleDropDownMenu(1, nil, menuFrame, dropdownButton, 0, 0)
end)

toggleButton = CreateFrame("Button", nil, KeijinRadioFrame, "UIPanelButtonTemplate")
toggleButton:SetWidth(80)
toggleButton:SetHeight(22)
toggleButton:SetPoint("BOTTOMLEFT", 15, 15)
toggleButton:SetText("Stop")
isPlaying = true
toggleButton:SetScript("OnClick", function()
  if isPlaying then
    StopMusic()
    toggleButton:SetText("Start")
    isPlaying = false
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Stream stopped.")
  elseif currentStream and not muteCheckbox:GetChecked() then
    PlayMusic(currentStream)
    toggleButton:SetText("Stop")
    isPlaying = true
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Stream resumed.")
  end
end)

local muteLabel = KeijinRadioFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
muteLabel:SetPoint("BOTTOMRIGHT", -20, 48)
muteLabel:SetText("Mute")

muteCheckbox = CreateFrame("CheckButton", nil, KeijinRadioFrame, "UICheckButtonTemplate")
muteCheckbox:SetPoint("BOTTOMRIGHT", -20, 30)
muteCheckbox:SetWidth(24)
muteCheckbox:SetHeight(24)

local function applyMuteState(checked)
  if checked then
    StopMusic()
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Muted.")
  elseif currentStream and isPlaying then
    PlayMusic(currentStream)
    DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinRadio]|r Unmuted.")
  end
end

muteCheckbox:SetScript("OnClick", function()
  local checked = muteCheckbox:GetChecked()
  applyMuteState(checked)
end)

muteCheckbox:SetChecked(false)
