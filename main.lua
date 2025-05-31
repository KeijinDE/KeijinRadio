DEFAULT_CHAT_FRAME:AddMessage("|cff88ff88[KeijinAddons] KeijinRadio v0.5.0 – Use /radio")

SLASH_KEIJINRADIO1 = "/radio"
SlashCmdList["KEIJINRADIO"] = function()
  if KeijinRadioFrame:IsShown() then
    KeijinRadioFrame:Hide()
  else
    KeijinRadioFrame:Show()
  end
end
