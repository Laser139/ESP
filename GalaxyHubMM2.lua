--// Loader
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

--// Window
local Window = Fluent:CreateWindow({
    Title = "Galaxy Hub | MM2",
    SubTitle = "V1.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 320),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})

--// Tab
local Tab = Window:AddTab({ Title = "Main", Icon = "rbxassetid://10709716705" })

--// ESP Variables
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ESP_Enabled = false
local ESP_Connection

-- Tool → Color + Label mapping
local toolData = {
	["AAAAA"] = {Color = Color3.fromRGB(0, 255, 0), Label = "Innocent"},
	["Gun"]   = {Color = Color3.fromRGB(0, 0, 255), Label = "Gun"},
	["Knife"] = {Color = Color3.fromRGB(255, 0, 0), Label = "Murderer"},
}

-- Remove old markers
local function clearMarkers(character)
	if not character then return end

	local h = character:FindFirstChild("ToolHighlight")
	if h then h:Destroy() end

	local head = character:FindFirstChild("Head")
	if head then
		local oldGui = head:FindFirstChild("ToolLabel")
		if oldGui then oldGui:Destroy() end
	end
end

-- Remove GunDrop highlights
local function clearGunDrops()
	for _, part in ipairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") and part.Name == "GunDrop" then
			local oldHighlight = part:FindFirstChild("GunDropHighlight")
			if oldHighlight then
				oldHighlight:Destroy()
			end
		end
	end
end

-- Apply player highlight + label
local function applyMarkers(player, color, text)
	local character = player.Character
	if not character then return end

	-- Prevent flicker if already applied
	local h = character:FindFirstChild("ToolHighlight")
	local head = character:FindFirstChild("Head")
	local label = head and head:FindFirstChild("ToolLabel")
	local textLabel = label and label:FindFirstChildOfClass("TextLabel")

	if h and textLabel and textLabel.Text == text then
		return
	end

	clearMarkers(character)

	-- Highlight
	local highlight = Instance.new("Highlight")
	highlight.Name = "ToolHighlight"
	highlight.FillColor = color
	highlight.OutlineColor = color
	highlight.FillTransparency = 0.25
	highlight.OutlineTransparency = 0
	highlight.Parent = character

	-- BillboardGui label
	if head then
		local gui = Instance.new("BillboardGui")
		gui.Name = "ToolLabel"
		gui.Size = UDim2.new(0, 100, 0, 30)
		gui.StudsOffset = Vector3.new(0, 2, 0)
		gui.AlwaysOnTop = true
		gui.Parent = head

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TextLabel"
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextColor3 = color
		textLabel.TextStrokeTransparency = 0.5
		textLabel.TextScaled = true
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.Parent = gui
	end
end

-- Apply GunDrop highlight
local function highlightGunDrops()
	for _, part in ipairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") and part.Name == "GunDrop" then
			if not part:FindFirstChild("GunDropHighlight") then
				local highlight = Instance.new("Highlight")
				highlight.Name = "GunDropHighlight"
				highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Yellow
				highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
				highlight.FillTransparency = 0.25
				highlight.OutlineTransparency = 0
				highlight.Parent = part
			end
		end
	end
end

-- Update loop
local function update()
	-- Highlight GunDrop parts
	highlightGunDrops()

	-- Players
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer then
			local character = player.Character
			local backpack = player:FindFirstChild("Backpack")
			local applied = false

			for toolName, data in pairs(toolData) do
				if (backpack and backpack:FindFirstChild(toolName)) or (character and character:FindFirstChild(toolName)) then
					applyMarkers(player, data.Color, data.Label)
					applied = true
					break
				end
			end

			if not applied and character then
				clearMarkers(character)
			end
		end
	end
end

--// ESP Toggle
Tab:AddToggle("ESPToggle", {
    Title = "ESP",
    Default = false,
    Callback = function(Value)
        ESP_Enabled = Value
        if Value then
            -- Start updating
            ESP_Connection = task.spawn(function()
                while ESP_Enabled do
                    update()
                    task.wait(1)
                end
            end)
        else
            -- Stop updating + clear
            ESP_Enabled = false
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    clearMarkers(player.Character)
                end
            end
            clearGunDrops()
        end
    end
})

--// Mobile Keyboard Button
Tab:AddButton({
    Title = "Execute Mobile Keyboard",
    Description = "CLICK THIS BUTTON BEFORE CLOSING SCRIPT. Press Left Ctrl to open script again.",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-mobile-keyboard-46169"))()
    end
})
