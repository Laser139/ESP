-- ✅ Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Galaxy Hub",
    SubTitle = "MM2",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local MainTab = Window:AddTab({
    Title = "Main",
    Icon = "home"
})

---------------------------------------------------------
-- ESP SCRIPT
---------------------------------------------------------
local Players = game:GetService("Players")
local runService = game:GetService("RunService")
local ESPEnabled = false

local toolData = {
    ["AAAAA"] = {Color = Color3.fromRGB(0, 255, 0), Label = "Innocent"},
    ["Gun"]   = {Color = Color3.fromRGB(0, 0, 255), Label = "Sheriff"}, -- renamed
    ["Knife"] = {Color = Color3.fromRGB(255, 0, 0), Label = "Murderer"},
}

local function ensureMarkers(player, color, text)
    local character = player.Character
    if not character then return end

    local highlight = character:FindFirstChild("ToolHighlight")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "ToolHighlight"
        highlight.FillTransparency = 0.25
        highlight.OutlineTransparency = 0
        highlight.Parent = character
    end
    highlight.FillColor = color
    highlight.OutlineColor = color

    local head = character:FindFirstChild("Head")
    if head then
        local gui = head:FindFirstChild("ToolLabel")
        if not gui then
            gui = Instance.new("BillboardGui")
            gui.Name = "ToolLabel"
            gui.Size = UDim2.new(0, 100, 0, 30)
            gui.StudsOffset = Vector3.new(0, 2, 0)
            gui.AlwaysOnTop = true
            gui.Parent = head

            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "Text"
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextScaled = true
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.Parent = gui
        end

        gui.Text.Text = text
        gui.Text.TextColor3 = color
    end
end

local function clearMarkers(player)
    local character = player.Character
    if not character then return end
    local h = character:FindFirstChild("ToolHighlight")
    if h then h:Destroy() end
    local head = character:FindFirstChild("Head")
    if head then
        local gui = head:FindFirstChild("ToolLabel")
        if gui then gui:Destroy() end
    end
end

local function hasTool(player, toolName)
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    return (backpack and backpack:FindFirstChild(toolName)) or (character and character:FindFirstChild(toolName))
end

local function update()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            if ESPEnabled then
                local applied = false
                for toolName, data in pairs(toolData) do
                    if hasTool(player, toolName) then
                        ensureMarkers(player, data.Color, data.Label)
                        applied = true
                        break
                    end
                end
                if not applied then
                    clearMarkers(player)
                end
            else
                clearMarkers(player)
            end
        end
    end
end

runService.RenderStepped:Connect(update)

---------------------------------------------------------
-- FLUENT TOGGLE
---------------------------------------------------------
MainTab:AddToggle("ESP", {
    Title = "ESP",
    Default = false,
    Description = "Wait for round to start to reveal Murderer and Sheriff",
    Callback = function(value)
        ESPEnabled = value
        if value then
            print("✅ ESP enabled")
        else
            print("❌ ESP disabled")
        end
    end
})

---------------------------------------------------------
-- FLUENT BUTTON
---------------------------------------------------------
MainTab:AddButton({
    Title = "Execute Mobile Keyboard",
    Description = "Press Left Ctrl to open script again",
    Callback = function()
        print("✅ Executing Mobile Keyboard...")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Delta-keyboard-49109"))()
    end
})
