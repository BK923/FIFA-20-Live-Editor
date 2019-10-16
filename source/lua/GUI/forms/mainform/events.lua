require 'lua/GUI/consts';
require 'lua/GUI/forms/mainform/consts';
require 'lua/GUI/forms/mainform/helpers';
-- MainForm Events

-- Make window dragable
function MainTopPanelMouseDown(sender, button, x, y)
    MainWindowForm.dragNow()
end

-- SHOW CE
SHOW_CE = true

-- Make window resizeable
RESIZE_MAIN_WINDOW = {
    allow_resize = false
}
function MainWindowResizeMouseDown(sender, button, x, y)
    RESIZE_MAIN_WINDOW = {
        allow_resize = true,
        w = MainWindowForm.Width,
        h = MainWindowForm.Height,
        mx = x,
        my = y
    }
end

function LabelLatestLEVerClick()
    if not LATEST_VER then
        return
    end

    shellExecute(string.format(
        "https://www.patreon.com/xAranaktu/posts?tag=v%s", LATEST_VER
    ))

end

function MainWindowResizeMouseMove(sender, x, y)
    if RESIZE_MAIN_WINDOW['allow_resize'] then
        RESIZE_MAIN_WINDOW['w'] = x - RESIZE_MAIN_WINDOW['mx'] + MainWindowForm.Width
        RESIZE_MAIN_WINDOW['h'] = y - RESIZE_MAIN_WINDOW['my'] + MainWindowForm.Height
    end
end
function MainWindowResizeMouseUp(sender, button, x, y)
    RESIZE_MAIN_WINDOW['allow_resize'] = false
    MainWindowForm.Width = RESIZE_MAIN_WINDOW['w']
    MainWindowForm.Height = RESIZE_MAIN_WINDOW['h']
end

-- stay on top
function MainWindowAlwaysOnTopClick(sender)
    if MainWindowForm.FormStyle == "fsNormal" then
        MainWindowForm.AlwaysOnTop.Visible = false
        MainWindowForm.AlwaysOnTopOn.Visible = true
        MainWindowForm.FormStyle = "fsSystemStayOnTop"
    else
        MainWindowForm.AlwaysOnTop.Visible = true
        MainWindowForm.AlwaysOnTopOn.Visible = false
        MainWindowForm.FormStyle = "fsNormal"
    end
end

-- OnShow -> MainMenuForm
function MainMenuFormShow(sender)
    if HIDE_CE_SCANNER then
        set_ce_mem_scanner_state()
    end

    -- Load Img if attached to the game process
    if BASE_ADDRESS then
        local stream = load_headshot(
            tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['PLAYERID']).Value),
            tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['HEADTYPECODE']).Value),
            tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['HAIRCOLORCODE']).Value)
        )
        MainWindowForm.PlayersEditorImg.Picture.LoadFromStream(stream)
        stream.destroy()
    end
end

function MainFormRemoveLoadingPanel()
    MainWindowForm.LoadingPanel.Visible = false

    -- load headshot
    local stream = load_headshot(
        tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['PLAYERID']).Value),
        tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['HEADTYPECODE']).Value),
        tonumber(ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['HAIRCOLORCODE']).Value)
    )
    MainWindowForm.PlayersEditorImg.Picture.LoadFromStream(stream)
    stream.destroy()
end


-- Minimize
function MainMinimizeClick(sender)
    MainWindowForm.WindowState = "wsMinimized" 
end

-- Close
function MainExitClick(sender)
    -- Deactivate scripts on Exit while in DEBUG MODE
    if DEBUG_MODE then
        deactive_all(getAddressList().getMemoryRecordByDescription('Scripts'))

        -- Deactivate CURRENT_DATE_SCRIPT
        ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['CURRENT_DATE_SCRIPT']).Active = false
    end
    -- Deactivate "GUI" script
    ADDR_LIST.getMemoryRecordByID(CT_MEMORY_RECORDS['GUI_SCRIPT']).Active = false
end

-- Show Settings Form
function MainSettingsClick(sender)
    SETTINGS_INDEX = 0
    SettingsForm.show()
end

-- Hide/Show CE
function CEClick(sender)
    SHOW_CE = not SHOW_CE
    getMainForm().Visible = SHOW_CE
end

-- Show Players Editor Form
function PlayersEditorBtnClick(sender)
    MainWindowForm.hide()
    PlayersEditorForm.show()
end
function PlayersEditorLabelClick(sender)
    MainWindowForm.hide()
    PlayersEditorForm.show()
end
function PlayersEditorImgClick(sender)
    MainWindowForm.hide()
    PlayersEditorForm.show()
end

-- Show Schedule Editor Form
function ScheduleEditorImgClick(sender)
    MainWindowForm.hide()
    MatchScheduleEditorForm.show()
end
function ScheduleEditorLabelClick(sender)
    MainWindowForm.hide()
    MatchScheduleEditorForm.show()
end
function ScheduleEditorBtnClick(sender)
    MainWindowForm.hide()
    MatchScheduleEditorForm.show()
end

-- Show Transfer Players Form
function PlayersTransferImgClick(sender)
    MainWindowForm.hide()
    TransferPlayersForm.show()
end
function PlayersTransferBtnClick(sender)
    MainWindowForm.hide()
    TransferPlayersForm.show()
end
function PlayersTransferLabelClick(sender)
    MainWindowForm.hide()
    TransferPlayersForm.show()
end

-- Show Match-fixing Form
function MatchFixingImgClick(sender)
    MainWindowForm.hide()
    MatchFixingForm.show()
end
function MatchFixingBtnClick(sender)
    MainWindowForm.hide()
    MatchFixingForm.show()
end
function MatchFixingLabelClick(sender)
    MainWindowForm.hide()
    MatchFixingForm.show()
end

-- Patreon Button
function PatreonClick(sender)
    shellExecute("https://www.patreon.com/xAranaktu")
end

-- Discord Button
function DiscordClick(sender)
    shellExecute("https://discord.gg/Nb3HX2W")
end
