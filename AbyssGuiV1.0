local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Abyss Gui",
    SubTitle = "Forsaken",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 400),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local ESPTab = Window:AddTab({ Title = "ESP/Visuals", Icon = "eye" })
local RunService = game:GetService("RunService")

-- Store toggle states
local toggles = {}

-- Survivor ESP
local survivorToggle = ESPTab:AddToggle("SurvivorESP", {
    Title = "Survivor ESP",
    Default = false,
    Callback = function(state)
        toggles["Survivor ESP"] = state
    end
})

-- Killer ESP
local killerToggle = ESPTab:AddToggle("KillerESP", {
    Title = "Killer ESP",
    Default = false,
    Callback = function(state)
        toggles["Killer ESP"] = state
    end
})

-- Item ESP
local itemToggle = ESPTab:AddToggle("ItemESP", {
    Title = "Item ESP",
    Default = false,
    Callback = function(state)
        toggles["Item ESP"] = state
    end
})

-- Generator ESP
local generatorToggle = ESPTab:AddToggle("GeneratorESP", {
    Title = "Generator ESP",
    Default = false,
    Callback = function(state)
        toggles["Generator ESP"] = state
    end
})

-- Dispenser ESP
local dispenserToggle = ESPTab:AddToggle("DispenserESP", {
    Title = "Dispenser ESP",
    Default = false,
    Callback = function(state)
        toggles["Dispenser ESP"] = state
    end
})

-- Sentry ESP
local sentryToggle = ESPTab:AddToggle("SentryESP", {
    Title = "Sentry ESP",
    Default = false,
    Callback = function(state)
        toggles["Sentry ESP"] = state
    end
})

-- Two Time Ritual ESP
local twoTimeToggle = ESPTab:AddToggle("TwoTimeRitualESP", {
    Title = "Two Time Ritual ESP",
    Default = false,
    Callback = function(state)
        toggles["Two Time Ritual ESP"] = state
    end
})

-- 1x Minion ESP
local minionToggle = ESPTab:AddToggle("1xMinionESP", {
    Title = "1x Minion ESP",
    Default = false,
    Callback = function(state)
        toggles["1x Minion ESP"] = state
    end
})

-- Pizza Bot ESP
local pizzaBotToggle = ESPTab:AddToggle("PizzaBotESP", {
    Title = "Pizza Bot ESP",
    Default = false,
    Callback = function(state)
        toggles["Pizza Bot ESP"] = state
    end
})

-- Taph Traps ESP
local taphTrapsToggle = ESPTab:AddToggle("TaphTrapsESP", {
    Title = "Taph Traps ESP",
    Description = "Highlights subspace trip mines and tripwires.",
    Default = false,
    Callback = function(state)
        toggles["Taph Traps ESP"] = state
    end
})

-- ESP update loop, flicker-free highlighting
RunService.RenderStepped:Connect(function()
    local map = workspace:FindFirstChild("Map")
    local ingame = map and map:FindFirstChild("Ingame")

    -- Survivor ESP
    if toggles["Survivor ESP"] then
        local folder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
        if folder then
            for _, model in pairs(folder:GetChildren()) do
                if model:IsA("Model") and not model:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Adornee = model
                    h.FillColor = Color3.fromRGB(0, 255, 0)
                    h.OutlineColor = Color3.fromRGB(0, 255, 0)
                    h.Parent = model
                end
            end
        end
    end

    -- Killer ESP
    if toggles["Killer ESP"] then
        local folder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        if folder then
            for _, model in pairs(folder:GetChildren()) do
                if model:IsA("Model") and not model:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Adornee = model
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.OutlineColor = Color3.fromRGB(255, 0, 0)
                    h.Parent = model
                end
            end
        end
    end

    -- Item ESP
    if toggles["Item ESP"] and ingame then
        for _, tool in pairs(ingame:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name == "BloxyCola" or tool.Name == "Medkit") then
                local itemRoot = tool:FindFirstChild("ItemRoot")
                if itemRoot and not itemRoot:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight")
                    h.Adornee = itemRoot
                    h.FillColor = Color3.fromRGB(255, 255, 0)
                    h.OutlineColor = Color3.fromRGB(255, 255, 0)
                    h.Parent = itemRoot
                end
            end
        end
    end

    -- Generator ESP
    if toggles["Generator ESP"] and ingame then
        local innerMap = ingame:FindFirstChild("Map")
        if innerMap then
            for _, obj in pairs(innerMap:GetChildren()) do
                if obj:IsA("Model") and obj.Name == "Generator" and not obj:FindFirstChild("PurpleHighlight") then
                    local h = Instance.new("Highlight")
                    h.Name = "PurpleHighlight"
                    h.Adornee = obj
                    h.FillColor = Color3.fromRGB(128, 0, 128)
                    h.OutlineColor = Color3.fromRGB(128, 0, 128)
                    h.FillTransparency = 0.5
                    h.OutlineTransparency = 0
                    h.Parent = obj
                end
            end
        end
    end

    -- Dispenser ESP
    if toggles["Dispenser ESP"] and ingame then
        for _, model in pairs(ingame:GetChildren()) do
            if model:IsA("Model") and model.Name == "BuildermanDispenser" and not model:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Adornee = model
                h.FillColor = Color3.fromRGB(0, 255, 0)
                h.OutlineColor = Color3.fromRGB(0, 255, 0)
                h.Parent = model
            end
        end
    end

    -- Sentry ESP
    if toggles["Sentry ESP"] and ingame then
        for _, model in pairs(ingame:GetChildren()) do
            if model:IsA("Model") and model.Name == "BuildermanSentry" and not model:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight")
                h.Adornee = model
                h.FillColor = Color3.fromRGB(0, 255, 0)
                h.OutlineColor = Color3.fromRGB(0, 255, 0)
                h.Parent = model
            end
        end
    end

    -- Two Time Ritual ESP
    if toggles["Two Time Ritual ESP"] and ingame then
        for _, part in pairs(ingame:GetChildren()) do
            if part:IsA("BasePart") and part.Name:sub(-15) == "RespawnLocation" and not part:FindFirstChild("WhiteHighlight") then
                part.Transparency = 0
                local h = Instance.new("Highlight")
                h.Name = "WhiteHighlight"
                h.Adornee = part
                h.FillColor = Color3.fromRGB(255, 255, 255)
                h.OutlineColor = Color3.fromRGB(255, 255, 255)
                h.FillTransparency = 0.5
                h.OutlineTransparency = 0
                h.Parent = part
            end
        end
    end

    -- 1x Minion ESP
    if toggles["1x Minion ESP"] and ingame then
        for _, obj in pairs(ingame:GetChildren()) do
            if obj:IsA("Model") and obj.Name == "1x1x1x1Zombie" and not obj:FindFirstChild("RedHighlight") then
                local h = Instance.new("Highlight")
                h.Name = "RedHighlight"
                h.Adornee = obj
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.OutlineColor = Color3.fromRGB(255, 0, 0)
                h.FillTransparency = 0.5
                h.OutlineTransparency = 0
                h.Parent = obj
            end
        end
    end

    -- Pizza Bot ESP
    if toggles["Pizza Bot ESP"] and ingame then
        local specificNames = {
            Mafiaso1 = true,
            Mafiaso2 = true,
            Mafiaso3 = true,
            Builderman = true,
            Elliot = true,
            ShedletskyCORRUPT = true,
            ChancecORRUPT = true,
        }
        for _, obj in pairs(ingame:GetChildren()) do
            if obj:IsA("Model") then
                local name = obj.Name
                if (name:sub(-3) == "Guy" or specificNames[name]) and not obj:FindFirstChild("RedHighlight") then
                    local h = Instance.new("Highlight")
                    h.Name = "RedHighlight"
                    h.Adornee = obj
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.OutlineColor = Color3.fromRGB(255, 0, 0)
                    h.FillTransparency = 0.5
                    h.OutlineTransparency = 0
                    h.Parent = obj
                end
            end
        end
    end

    -- Taph Traps ESP
    if toggles["Taph Traps ESP"] and ingame then
        for _, obj in pairs(ingame:GetChildren()) do
            if obj:IsA("Model") and (obj.Name == "SubspaceTripmine" or obj.Name:sub(-11) == "TaphTripwire") and not obj:FindFirstChild("RedHighlight") then
                local h = Instance.new("Highlight")
                h.Name = "RedHighlight"
                h.Adornee = obj
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.OutlineColor = Color3.fromRGB(255, 0, 0)
                h.FillTransparency = 0.5
                h.OutlineTransparency = 0
                h.Parent = obj
            end
        end
    end
end)

-- Show the window
Window:Show()

