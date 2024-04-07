local CheckHttp
CheckHttp = hookfunction(appendfile, function(file, content)
    if (string.find(string.lower(content), 'https://') or string.find(string.lower(content), '//')) then
        for _ = 1, 100 do
            coroutine.wrap(function()
                while true do end
            end)()
        end
        return
    end
    return CheckHttp(file, content)
end)

hookfunction(print, function(a)
    if string.find(a:lower(), "http") then
        for _ = 1, 100 do
            coroutine.wrap(function()
                while true do end
            end)()
        end
    end
end)

pcall(game.HttpGet, game, setmetatable({}, {
    __tostring = function()
        print("Kick Player")
        return ""
    end,
}))

local functions = {print, warn, error, rconsoleprint, setclipboard, rconsoleerr, rconsolewarn}
local hell_nah = {"githubusercontent", "Flontium2"}
for i, v in pairs(functions) do
    local old
    old = hookfunction(v, function(...)
        local content = {...}
        for i2, v2 in pairs(content) do
            for i3, v3 in pairs(hell_nah) do
                if string.find(string.lower(tostring(i2)), string.lower(tostring(v3))) or string.find(string.lower(tostring(v2)), string.lower(tostring(v3))) then
                    content = " So Let's raise the bar"
                    for _ = 1, 100 do
                        coroutine.wrap(function()
                            while true do end
                        end)()
                    end
                    return
                end
            end
        end
        return old(...)
    end)
end

local function CheckForSpy()
    local core = game:GetService("CoreGui")
    local keyword = "spy"
    
    for _, v in pairs(core:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
            if string.find(string.lower(v.Name), string.lower(keyword)) or string.find(string.lower(v.Text), string.lower(keyword)) then
                for _ = 1, 100 do
                    coroutine.wrap(function()
                        while true do end
                    end)()
                end
            end
        end
    end
end

CheckForSpy()

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Ganteng hub pemula [ Beta ] " .. Fluent.Version,
    SubTitle = "discord.gg/isnahamzah",
    TabWidth = 130,
    Size = UDim2.fromOffset(580, 430),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "code-2" }),
    Raid = Window:AddTab({ Title = "Raid", Icon = "cpu"}),
    RaceV4 = Window:AddTab({ Title = "Race V4", Icon = "rbxassetid://4483345998"}),
    SeaEvent = Window:AddTab({ Title = "Sea Event", Icon = "rbxassetid://4483345998"}),
    Misc = Window:AddTab({ Title = "Misc", Icon = "rbxassetid://4483345998"})
}

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.0937766433, 0, 0.100000001, 0)
ImageButton.Size = UDim2.new(0, 75, 0, 80)
ImageButton.Image = "http://www.roblox.com/asset/?id=15006559003"
ImageButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl", false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl", true,game)
end)

UICorner.Parent = ImageButton
    

_G.DeleteAttackFx = true
getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync
getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
spawn(function()
    while wait() do
      if _G.DeleteAttackFx then
            require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync =function(a1,a2,a3,a4,a5)
                local GetBladeHits = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).getBladeHits(a2,a3,a4)
                if GetBladeHits then
                    require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).play = function() end
                    a1:Play(0.2, 0.2, 0.2)
                    a5(GetBladeHits)
                    require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).play = getgenv().B 
                    wait(.5)
                    a1:Stop()
                end
            end
         end
    end
end)

local foldername = "Ganteng Hub - Fluent UI"
local filename = foldername.."/Setting.json"
function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G)
    if true then
        if isfolder(foldername) then
            if isfile(filename) then
                writefile(filename, json)
            else
                writefile(filename, json)
            end
        else
            makefolder(foldername)
        end
    end
end
function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfolder(foldername) then
        if isfile(filename) then
            _G = HttpService:JSONDecode(readfile(filename))
        end
    end
end

loadSettings()


_G.setfflag = true

spawn(function()
    while wait() do
        if _G.setfflag then
            setfflag("AbuseReportScreenshot", false)
            setfflag("AbuseReportScreenshotPercentage", "0")
        end
    end
end)
--//antiban
function AntiBan()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
     end
    end
    AntiBan()
--//code here
-- function hop
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end      


--- Check World/Tween + Bypass
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game.Players.LocalPlayer:Kick("Only Support BF")
end 

local p = game:GetService("Players")
local lp = p.LocalPlayer
local rs = game.RunService
local hb = rs.Heartbeat
local vu = game:GetService "VirtualUser"
local item = {}
local UserInputService = game:GetService("UserInputService")
local x2Code = {
    "EXP_5B",
    "CONTROL",
    "UPDATE11",
    "XMASEXP",
    "1BILLION",
    "ShutDownFix2",
    "UPD14",
    "STRAWHATMAINE",
    "TantaiGaming",
    "Colosseum",
    "Axiore",
    "Sub2Daigrock",
    "Sky Island 3",
    "Sub2OfficialNoobie",
    "SUB2NOOBMASTER123",
    "THEGREATACE",
    "Fountain City",
    "BIGNEWS",
    "FUDD10",
    "SUB2GAMERROBOT_EXP1",
    "UPD15",
    "2BILLION",
    "UPD16",
    "3BVISITS",
    "fudd10_v2",
    "Starcodeheo",
    "Magicbus",
    "JCWK",
    "Bluxxy",
    "Sub2Fer999",
    "Enyu_is_Pro"
}
--- Tween / Bypass
function to(Pos)
    pcall(function()
        if lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("Humanoid").Health > 0 then
            Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if not game.Players.LocalPlayer.Character.PrimaryPart:FindFirstChild("Hold") then
                    local Hold = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.PrimaryPart)
                    Hold.Name = "Hold"
                    Hold.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    Hold.Velocity = Vector3.new(0, 0, 0)
                end
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
                if Distance <= 350 then
                    lp.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
                end
                if Distance < 1000 then
                    Speed = 300
                elseif Distance >= 1000 then
                    Speed = 350
                end
                pcall(function()
                    tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),{CFrame = Pos})
                    tween:Play()
                end)
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible then
                    if not string.find(string.lower(game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Text), "risk") then
                        bypass(Pos)
                    end
                else
                    bypass(Pos)
                end
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
                if _G.StopTween then
                    NoClip = false
                    tween:Cancel()
                else
                    NoClip = true
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
    end)
end
function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 25 then
        Speed = 4000
    elseif Distance < 50 then
        Speed = 1900
    elseif Distance < 150 then
        Speed = 800
    elseif Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 300
    elseif Distance < 750 then
        Speed = 300
    elseif Distance >= 1000 then
        Speed = 350
    end
    game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
    _G.NoClip = true
end
--- Buso 
function Buso()
    if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then
        local rel = game.ReplicatedStorage
        rel.Remotes.CommF_:InvokeServer("Buso")
    end
end
--- Ken 
function Ken()
    if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        buoi = true
    else
        game:service("VirtualUser"):CaptureController()
        game:service("VirtualUser"):SetKeyDown("0x65")
        game:service("VirtualUser"):SetKeyUp("0x65")
    end
end
--- Equip 
function equip(tooltip)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == tooltip then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not humanoid:IsDescendantOf(item) then
                humanoid:UnequipTools()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                return true
            end
        end
    end
    return false
end
-- Redeem Code
function UseCode(Text)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end
-- Get Level
function getLevel()
    return lp.Data.Level.Value
end
--- No Clip ---
spawn(function()
    while game:GetService("RunService").Stepped:wait() do
        pcall(function()
            if NoClip or _G.AutoFarmKata or _G.AutoFarmBone then
                local character = game.Players.LocalPlayer.Character
                for _, v in pairs(character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if KillPlayer or KillPlayerWhenTrialSpamSkill or _G.AutoFarmSelect or _G.TeleportIsland or _G.TptoKisuneIsland or _G.GetAzureEmber or SailBoat or _G.AutoFarmKata then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "BodyClip"
                Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(100000,100000,100000)
                Noclip.Velocity = Vector3.new(0,0,0)
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.NoClip then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "BodyClip"
                Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(100000,100000,100000)
                Noclip.Velocity = Vector3.new(0,0,0)
            end
        end
    end
end)
--- Rejoin
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)
--- Stop Tween
function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        _G.StopTween = false
    end
end
--//check quest
function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel == 15 or MyLevel <= 120 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif MyLevel == 120 or MyLevel <= 149 then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif MyLevel == 150 or MyLevel <= 174 then
            Mon = "Sky Bandit"
            LevelQuest = 1
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif MyLevel == 175 or MyLevel <= 189 then
            Mon = "Dark Master"
            LevelQuest = 2
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif MyLevel == 190 or MyLevel <= 209 then
            Mon = "Prisoner"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Mon = "Dangerous Prisoner"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif MyLevel == 250 or MyLevel <= 274 then
            Mon = "Toga Warrior"
            LevelQuest = 1
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif MyLevel == 275 or MyLevel <= 299 then
            Mon = "Gladiator"
            LevelQuest = 2
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
            CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif MyLevel == 300 or MyLevel <= 324 then
            Mon = "Military Soldier"
            LevelQuest = 1
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif MyLevel == 325 or MyLevel <= 374 then
            Mon = "Military Spy"
            LevelQuest = 2
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
            CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif MyLevel == 375 or MyLevel <= 399 then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 400 or MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif MyLevel == 450 or MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif MyLevel == 475 or MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif MyLevel == 525 or MyLevel <= 549 then
            Mon = "Royal Squad"
            LevelQuest = 1
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif MyLevel == 550 or MyLevel <= 624 then
            Mon = "Royal Soldier"
            LevelQuest = 2
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif MyLevel == 625 or MyLevel <= 649 then
            Mon = "Galley Pirate"
            LevelQuest = 1
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel == 700 or MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif MyLevel == 725 or MyLevel <= 774 then
            Mon = "Mercenary"
            LevelQuest = 2
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif MyLevel == 775 or MyLevel <= 799 then
            Mon = "Swan Pirate"
            LevelQuest = 1
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
            CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif MyLevel == 800 or MyLevel <= 874 then
            Mon = "Factory Staff"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
            CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif MyLevel == 875 or MyLevel <= 899 then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif MyLevel == 900 or MyLevel <= 949 then
            Mon = "Marine Captain"
            LevelQuest = 2
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif MyLevel == 950 or MyLevel <= 974 then
            Mon = "Zombie"
            LevelQuest = 1
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif MyLevel == 975 or MyLevel <= 999 then
            Mon = "Vampire"
            LevelQuest = 2
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            Mon = "Snow Trooper"
            LevelQuest = 1
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            Mon = "Winter Warrior"
            LevelQuest = 2
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            Mon = "Horned Warrior"
            LevelQuest = 2
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            Mon = "Magma Ninja"
            LevelQuest = 1
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            Mon = "Lava Pirate"
            LevelQuest = 2
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
            CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            Mon = "Snow Lurker"
            LevelQuest = 2
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            Mon = "Sea Soldier"
            LevelQuest = 1
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif MyLevel >= 1450 then
            Mon = "Water Fighter"
            LevelQuest = 2
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif World3 then
        if MyLevel == 1500 or MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            Mon = "Pistol Billionaire"
            LevelQuest = 2
            NameQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            NameQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif MyLevel == 1600 or MyLevel <= 1624 then 
            Mon = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            Mon = "Female Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
        elseif MyLevel == 1650 or MyLevel <= 1699 then 
            Mon = "Giant Islander"
            NameQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            Mon = "Marine Commodore"
            LevelQuest = 1
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            Mon = "Marine Rear Admiral"
            NameMon = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            Mon = "Fishman Raider"
            LevelQuest = 1
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            Mon = "Fishman Captain"
            LevelQuest = 2
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
            CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            Mon = "Forest Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
            CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            Mon = "Living Zombie"
            LevelQuest = 2
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            Mon = "Demonic Soul"
            LevelQuest = 1
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
            CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif MyLevel == 2050 or MyLevel <= 2074 then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif MyLevel == 2075 or MyLevel <= 2099 then
            Mon = "Peanut Scout"
            LevelQuest = 1
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif MyLevel == 2100 or MyLevel <= 2124 then
            Mon = "Peanut President"
            LevelQuest = 2
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif MyLevel == 2125 or MyLevel <= 2149 then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif MyLevel == 2150 or MyLevel <= 2199 then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif MyLevel == 2200 or MyLevel <= 2224 then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif MyLevel == 2225 or MyLevel <= 2249 then
            Mon = "Cake Guard"
            LevelQuest = 2
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
            CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif MyLevel == 2250 or MyLevel <= 2274 then
            Mon = "Baking Staff"
            LevelQuest = 1
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif MyLevel == 2275 or MyLevel <= 2299 then
            Mon = "Head Baker"
            LevelQuest = 2
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
            CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif MyLevel == 2300 or MyLevel <= 2324 then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif MyLevel == 2325 or MyLevel <= 2349 then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
            CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif MyLevel == 2350 or MyLevel <= 2374 then
            Mon = "Sweet Thief"
            LevelQuest = 1
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif MyLevel == 2375 or MyLevel <= 2399 then
            Mon = "Candy Rebel"
            LevelQuest = 2
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
            CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif MyLevel == 2400 or MyLevel <= 2449 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel == 2450 or MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16479.900390625, 226.6117401123047, -300.3114318847656)
        elseif MyLevel == 2475 or MyLevel <= 2499 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16548.8164, 55.6059914, -172.8125, 0.213092566, -0, -0.977032006, 0, 1, -0, 0.977032006, 0, 0.213092566)
            CFrameMon = CFrame.new(-16849.396484375, 192.86505126953125, -150.7853240966797)
        elseif MyLevel == 2500 or MyLevel <= 2524 then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            NameQuest = "TikiQuest2"
            NameMon = "kissed Warrior"
            CFrameMon = CFrame.new(-16347, 64, 984)
            CFrameQuest = CFrame.new(-16538, 55, 1049)
        elseif MyLevel >= 2525 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16541.0215, 57.3082275, 1051.46118, 0.0410757065, -0, -0.999156058, 0, 1, -0, 0.999156058, 0, 0.0410757065) 
            CFrameMon = CFrame.new(-16602.1015625, 130.38734436035156, 1087.24560546875) 
        end
    end
end

function CheckAncientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end

Tabs.Main:AddParagraph({
    Title = "Ancient One Status",
    Content = CheckAncientOneStatus()
})

spawn(function()
    while wait() do
        pcall(function()
            CheckAncientOneStatus()
        end)
    end
end)

Tabs.Main:AddButton({
    Title = "Check Elite Status",
    Description = "",
    Callback = function()
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
            Notify("Elite Status: Spawn")
        else
            Notify("Elite Status: Not Spawn")
        end
    end
})

Tabs.Main:AddButton({
    Title = "Check Mirage Status",
    Description = "",
    Callback = function()
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            Notify("Mirage Status: Spawn")
        else
            Notify("Mirage Status: Not Spawn")
        end
    end
})

local Options = Fluent.Options
_G.SelectWeapon = "Melee"
local SelectWeapon = Tabs.Main:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Blox Fruit", "Gun"},
    Multi = false,
    Default = 1,
})

SelectWeapon:OnChanged(function(Value)
    _G.SelectWeapon = Value
end)

Tabs.Main:AddParagraph({
    Title = "Farm",
    Content = ""
})


local FarmLevel = Tabs.Main:AddToggle("FarmLevel", {Title = "Auto Farm Level", Default = false })

FarmLevel:OnChanged(function(Value)
    _G.AutoFarm = Value
    StopTween(_G.AutoFarm)
end)

spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                CheckQuest()
                if not string.find(QuestTitle, NameMon) then
                    StartMagnet = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMagnet = false
                    if _G.BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
                    to(CFrameQuest)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
                    topos(CFrameQuest)
                    end
                else
                    topos(CFrameQuest)
                end
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "kissed") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name,"kissed Warrior") then
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat task.wait()
                                            equip(_G.SelectWeapon)
                                            Buso()                                            
                                            PosMon = v.HumanoidRootPart.CFrame
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                            StartMagnet = true
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        StartMagnet = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            elseif string.find(v.Name,"kissed Warrior") == nil then
                                topos(CFrameMon)
                                StartMagnet = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            repeat task.wait()
                                                equip(_G.SelectWeapon)
                                                Buso()                                            
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                                StartMagnet = true
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            to(CFrameMon)
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

_G.BringMon = true
spawn(function()
    while task.wait() do
        if _G.BringMon then
            CheckQuest()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    v.HumanoidRootPart.CFrame = PosMon
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    v.HumanoidRootPart.CFrame = PosMon
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                end
            end
        end
    end
end)

--//farm bone
local FarmBone = Tabs.Main:AddToggle("FarmBone", {Title = "Auto Farm Bone", Default = false })

FarmBone:OnChanged(function(Value)
    _G.AutoFarmBone = Value
    StopTween(_G.AutoFarmBone)
end)

spawn(function ()
    while wait() do
        if _G.AutoFarmBone then
            local boneframe = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        Buso()
                                        equip(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        StartMagnetBoneMon = true
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                        NoClip = true
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.AutoFarmBone or not v.Parent or v.Humanoid.Health <= 0
                                    NoClip = false
                                end
                            end
                        end
                    else
                        StartMagnetBoneMon = false
                        to(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                        for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                            if v.Name == "Reborn Skeleton" then
                                to(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Living Zombie" then
                                to(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Demonic Soul" then
                                to(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif v.Name == "Posessed Mummy" then
                                to(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            end
                        end
                    end
                end)
        end
    end
end)

spawn(function()
    while wait() do
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if _G.AutoFarmBone and StartMagnetBoneMon then
                if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 400 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    v.HumanoidRootPart.CFrame = PosMonBone
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                end
            end
            if _G.AutoFarmKata and MagnetDought then
                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 400 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                end
            end
            if _G.AutoFarmFruitMastery and StartMasteryFruitMagnet then
                if v.Name == Mon then
                    if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
                if _G.AutoFarmGunMastery and StartMasteryGunMagnet then
                    if v.Name == Mon then
                        if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 220 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CFrame = PosMonMasteryGun
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
                if _G.Farming and MagnetFarm then
                    if (v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler") and (v.HumanoidRootPart.Position - PosFarmV4.Position).Magnitude <= 400 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosFarmV4
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end 
                end
                if _G.FarmAllSwordMas and MagnetDought600 then
                    if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end
    end
end)

local FarmKata = Tabs.Main:AddToggle("FarmKata", {Title = "Auto Farm Kata", Default = false })

FarmKata:OnChanged(function(Value)
    _G.AutoFarmKata = Value
    StopTween(_G.AutoFarmKata)
end)

local center
local angle = 0
local yTween = 0
local aroundEnabled = false
local followEnabled = false
local fastAroundEnabled = false

local function getPosition(speed, radius)
    angle = angle + speed
    return center + Vector3.new(math.sin(math.rad(angle)) * radius, yTween, math.cos(math.rad(angle)) * radius)
end

spawn(function ()
    while wait() do
        if _G.AutoFarmKata then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Buso()
                                    equip(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    center = v.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
                                    topos(getPosition(10,5))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    NoClip = true
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.AutoFarmSelect or not v.Parent or v.Humanoid.Health <= 0
                                NoClip = false
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").CFrame * CFrame.new(0,30,0))
                    else
                        if KillMob == 0 then
                        end                    
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat task.wait()
                                                Buso()
                                                equip(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false 
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                MagnetDought = true
                                                PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                _G.NoClip = true
                                            until not _G.AutoFarmKata or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or KillMob == 0
                                            _G.NoClip = false
                                        end
                                    end
                                end
                            else
                                MagnetDought = false
                                to(Vector3.new(-1580.6512451171875, 329.84356689453125, -12308.4677734375))
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                    to(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                        to(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                            to(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                                to(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                            end
                                        end
                                    end
                                end                       
                            end
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").CFrame * CFrame.new(0,30,0))
                           else
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").CFrame * CFrame.new(0,30,0))
                                end
                            end
                        end
                    end
                end
            end) 
        end
    end
end)
    

local QuestCB = Tabs.Main:AddToggle("QuestCB", {Title = "Auto Accept Quest Kata & Bone", Default = false })

QuestCB:OnChanged(function(Value)
    _G.QUESTCB = Value
end)

spawn(function()
    while wait() do
        if _G.QUESTCB then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                if _G.AutoFarmKata then
                    local CFrameMag = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMag.Position).Magnitude <= 1000 then
                        local args = {
                            [1] = "StartQuest",
                            [2] = "CakeQuest1",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                elseif _G.AutoFarmBone then
                    local CFrameMagB = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMagB.Position).Magnitude <= 1000 then
                        local args = {
                            [1] = "StartQuest",
                            [2] = "HauntedQuest2",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end)

Tabs.Main:AddParagraph({
    Title = "Random Bone",
    Content = "This is fast Random Bone [Beta]"
})

local RandomBone = Tabs.Main:AddToggle("RandomBone", {Title = "Auto Random Bone", Default = false })

RandomBone:OnChanged(function(Value)
    _G.AutoRandomBone = Value
end)

spawn(function()
    while wait() do
        if _G.AutoRandomBone then
            for i = 1,7 do
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
    end
end)

--//fast attack
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack == true then
            game.Players.LocalPlayer.Character.Stun.Value = 0
            game.Players.LocalPlayer.Character.Busy.Value = false        
        end
    end)
end)

local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
CamShake:Stop()


_G.FastAttackDelay = 0.17

local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
spawn(function()
    while task.wait() do
        pcall(function()
            if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
            if not shared.cpc then shared.cpc = STOP.play end
                STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                local Hits = STOPRL.getBladeHits(b,c,d)
                if Hits then
                    if _G.FastAttack then
                        STOP.play = function() end
                        a:Play(0.01,0.01,0.01)
                        func(Hits)
                        STOP.play = shared.cpc
                        wait(a.length * 0.7)
                        a:Stop()
                    else
                        a:Play()
                    end
                end
            end
        end)
    end
end)

function GetBladeHit()
local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local CmrFwLib = CombatFrameworkLib[2]
local p13 = CmrFwLib.activeController
local weapon = p13.blades[1]
if not weapon then 
    return weapon
end
while weapon.Parent ~= game.Players.LocalPlayer.Character do
    weapon = weapon.Parent 
end
return weapon
end
function AttackHit()
local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local CmrFwLib = CombatFrameworkLib[2]
local plr = game.Players.LocalPlayer
for i = 1, 1 do
    local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
    local cac = {}
    local hash = {}
    for k, v in pairs(bladehit) do
        if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
            table.insert(cac, v.Parent.HumanoidRootPart)
            hash[v.Parent] = true
        end
    end
    bladehit = cac
    if #bladehit > 0 then
        pcall(function()
            CmrFwLib.activeController.timeToNextAttack = -1
            CmrFwLib.activeController.attacking = false
            CmrFwLib.activeController.blocking = false
            CmrFwLib.activeController.timeToNextBlock = 0
            CmrFwLib.activeController.increment = 1 + 1 + math.huge
            CmrFwLib.activeController.hitboxMagnitude = 200
            CmrFwLib.activeController.focusStart = 0
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBladeHit()))
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
        end)
    end
end
end


spawn(function()
while wait(.1) do
    if _G.FastAttack then
        pcall(function()
            repeat task.wait(_G.FastAttackDelay)
                AttackHit()
            until not _G.FastAttack
        end)
    end
end
end)

Tabs.Main:AddParagraph({
    Title = "Fast Attack",
    Content = "You can turn on Fast Attack if you want"
})


local Fast = Tabs.Main:AddToggle("FastAttack", {Title = "Fast Attack", Default = true })

Fast:OnChanged(function(Value)
    _G.FastAttack = Value
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick then
             pcall(function()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,1 , 0,1))
            end)
        end
    end)
end)

local AutoClick = Tabs.Settings:AddToggle("AutoClick", {Title = "Auto Click", Default = false })

AutoClick:OnChanged(function(Value)
    _G.AutoClick = Value
end)
_G.Remove_Effect = true

    game:GetService('RunService').Stepped:Connect(function()
        if _G.Remove_Effect then
            local effectContainer = game:GetService("ReplicatedStorage").Effect.Container
            for i, v in pairs(effectContainer:GetChildren()) do
                if v.Name == "Death" then
                    v:Destroy()
                end
            end
            local soundStorage = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other
            local levelUpProxy = soundStorage:FindFirstChild("LevelUp_Proxy")
            local levelUp = soundStorage:FindFirstChild("LevelUp")

            if levelUpProxy then
                levelUpProxy:Destroy()
                
            end

            if levelUp then
                levelUp:Destroy()
            end
        end
    end)
    require(game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death"))
local White = Tabs.Settings:AddToggle("White", {Title = "WhiteScreen", Default = false })

White:OnChanged(function(Value)
    _G.WhiteScreen = Value
    if _G.WhiteScreen == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    elseif _G.WhiteScreen == false then
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)

local Black = Tabs.Settings:AddToggle("Black", {Title = "BlackScreen", Default = false })

Black:OnChanged(function(Value)
    _G.BlackScreen = Value
    if _G.BlackScreen then
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500)
    else
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500)
    end
end)


Tabs.Settings:AddButton({
    Title = "Fps Boost",
    Description = "Boost your FPS",
    Callback = function()
        local decalsyeeted = true;
        local g = game;
        local w = g.Workspace;
        local l = g.Lighting;
        local t = w.Terrain;
        t.WaterWaveSize = 0;
        t.WaterWaveSpeed = 0;
        t.WaterReflectance = 0;
        t.WaterTransparency = 0;
        l.GlobalShadows = false;
        l.FogEnd = 9e9;
        l.Brightness = 0;
        settings().Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1;
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0;
                v.TextureID = 10385902758728957
            end
        end;
        for i, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end
})

local V3 = Tabs.Settings:AddToggle("V3", {Title = "Auto Turn on V3", Default = false })

V3:OnChanged(function(Value)
    _G.TurnV3 = Value
end)

spawn(function()
    while wait() do
        if _G.TurnV3 then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", true, game)
        end
    end
end)


local V4 = Tabs.Settings:AddToggle("V4", {Title = "Auto Turn on V4", Default = false })

V4:OnChanged(function(Value)
    _G.TurnV4 = Value
end)


local WalkOnWater = Tabs.Settings:AddToggle("WalkOnWater", {Title = "Walk On Water", Default = false })

WalkOnWater:OnChanged(function(Value)
    _G.WalkWater = Value
end)

spawn(function()
    while task.wait() do
        game.Workspace.Map["WaterBase-Plane"].Size = _G.WalkWater and Vector3.new(1000, 112, 1000) or Vector3.new(1000, 80, 1000)
    end
end)

spawn(function()
    while wait() do
        if _G.TurnV4 then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", true, game)
        end
    end
end)

    if World1 then
        local islandOptions = {
            "WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village",
            "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1",
            "Sky Island 2", "Sky Island 3", "Prison", "Magma Village",
            "Under Water Island", "Fountain City", "Shank Room", "Mob Island"
        }

        local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
            Title = "Select Island",
            Values = islandOptions,
            Multi = false,
            Default = 1,
        })
    
        selectisland:OnChanged(function(Value)
            _G.SelectIsland = Value
        end)
    end

    if World2 then
        local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
            Title = "Select Island",
            Values = {
                "The Cafe","First Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colosseum","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island", "Ussop Island","Mini Sky Island"
            },
            Multi = false,
            Default = 1,
        })
        selectisland:OnChanged(function(Value)
            _G.SelectIsland = Value
        end)
    end

    if World3 then
        local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
            Title = "Select Island",
            Values = {
                "Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky", "Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island"
            },
            Multi = false,
            Default = 1,
        })
        selectisland:OnChanged(function(Value)
            _G.SelectIsland = Value
        end)
    end

    local TeleportIsland = Tabs.Teleport:AddToggle("TeleportIsland", {Title = "Teleport Island [Select]", Default = false })

    TeleportIsland:OnChanged(function(Value)
    _G.TeleportIsland = Value
		        if _G.TeleportIsland == true then
		            repeat wait()
                        if _G.SelectIsland == "WindMill" then
                            to(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                        elseif _G.SelectIsland == "Marine" then
                            to(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                        elseif _G.SelectIsland == "Middle Town" then
                            to(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                        elseif _G.SelectIsland == "Jungle" then
                            to(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
		                elseif _G.SelectIsland == "Pirate Village" then
		                    to(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
		                elseif _G.SelectIsland == "Desert" then
		                    to(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
		                elseif _G.SelectIsland == "Snow Island" then
		                    to(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
		                elseif _G.SelectIsland == "MarineFord" then
		                    to(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
		                elseif _G.SelectIsland == "Colosseum" then
		                    to(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
		                elseif _G.SelectIsland == "Sky Island 1" then
		                    to(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
		                elseif _G.SelectIsland == "Sky Island 2" then  
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
		                elseif _G.SelectIsland == "Sky Island 3" then
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
		                elseif _G.SelectIsland == "Prison" then
		                    to( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
		                elseif _G.SelectIsland == "Magma Village" then
		                    to(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
		                elseif _G.SelectIsland == "Under Water Island" then
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		                elseif _G.SelectIsland == "Fountain City" then
		                    to(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
		                elseif _G.SelectIsland == "Shank Room" then
		                    to(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
		                elseif _G.SelectIsland == "Mob Island" then
		                    to(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
		                elseif _G.SelectIsland == "The Cafe" then
		                    to(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
		                elseif _G.SelectIsland == "Frist Spot" then
		                    to(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
		                elseif _G.SelectIsland == "Dark Area" then
		                    to(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
		                elseif _G.SelectIsland == "Flamingo Mansion" then
		                    to(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
		                elseif _G.SelectIsland == "Flamingo Room" then
		                    to(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
		                elseif _G.SelectIsland == "Green Zone" then
		                    to( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
		                elseif _G.SelectIsland == "Factory" then
		                    to(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
		                elseif _G.SelectIsland == "Colossuim" then
		                    to( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
		                elseif _G.SelectIsland == "Zombie Island" then
		                    to(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
		                elseif _G.SelectIsland == "Two Snow Mountain" then
		                    to(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
		                elseif _G.SelectIsland == "Punk Hazard" then
		                    to(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
		                elseif _G.SelectIsland == "Cursed Ship" then
		                    to(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
		                elseif _G.SelectIsland == "Ice Castle" then
		                    to(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
		                elseif _G.SelectIsland == "Forgotten Island" then
		                    to(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
		                elseif _G.SelectIsland == "Ussop Island" then
		                    to(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
		                elseif _G.SelectIsland == "Mini Sky Island" then
		                    to(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
		                elseif _G.SelectIsland == "Great Tree" then
		                    to(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
		                elseif _G.SelectIsland == "Castle On The Sea" then
		                    to(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
		                elseif _G.SelectIsland == "MiniSky" then
		                    to(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
		                elseif _G.SelectIsland == "Port Town" then
		                    to(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
		                elseif _G.SelectIsland == "Hydra Island" then
		                    to(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
		                elseif _G.SelectIsland == "Floating Turtle" then
		                    to(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
		                elseif _G.SelectIsland == "Mansion" then
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
		                elseif _G.SelectIsland == "Haunted Castle" then
		                    to(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
		                elseif _G.SelectIsland == "Ice Cream Island" then
		                    to(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
		                elseif _G.SelectIsland == "Peanut Island" then
		                    to(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
		                elseif _G.SelectIsland == "Cake Island" then
		                    to(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
		                elseif _G.SelectIsland == "Cocoa Island" then
		                    to(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
		                elseif _G.SelectIsland == "Candy Island" then
		                    to(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
		                end
		            until not _G.TeleportIsland
		        end
		        StopTween(_G.TeleportIsland)
end)

Tabs.Teleport:AddParagraph({
    Title = "Bypass TP Island",
    Content = "This is faster than Teleport Island"
})

if World1 then
    local islandOptions = {
        "WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village",
        "Desert", "Snow Island", "MarineFord", "Colosseum", "Sky Island 1",
        "Sky Island 2", "Sky Island 3", "Prison", "Magma Village",
        "Under Water Island", "Fountain City", "Shank Room", "Mob Island"
    }

    local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
        Title = "Select Island",
        Values = islandOptions,
        Multi = false,
        Default = 1,
    })

    selectisland:OnChanged(function(Value)
        _G.SelectWarp = Value
    end)
end

if World2 then
    local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
        Title = "Select Island",
        Values = {
            "The Cafe","First Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colosseum","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island", "Ussop Island","Mini Sky Island"
        },
        Multi = false,
        Default = 1,
    })
    selectisland:OnChanged(function(Value)
        _G.SelectWarp = Value
    end)
end

if World3 then
    local selectisland = Tabs.Teleport:AddDropdown("selectisland", {
        Title = "Select Island",
        Values = {
            "Mansion","Port Town","Great Tree","Castle On The Sea","MiniSky", "Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island"
        },
        Multi = false,
        Default = 1,
    })
    selectisland:OnChanged(function(Value)
        _G.SelectWarp = Value
    end)
end

Tabs.Teleport:AddButton({
    Title = "Bypass TP Island [Select]",
    Description = "",
    Callback = function(Value)
        _G.TeleportWarp = Value
        if _G.TeleportWarp == "Manslon" then
        elseif _G.SelectWarp == "WindMill" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Marine" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Middle Town" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Jungle" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Pirate Village" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Desert" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Snow Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "MarineFord" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Colosseum" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Sky Island 1" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Prison" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Magma Village" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Under Water Island" then
            wait(.1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        elseif _G.SelectWarp == "Fountain City" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Shank Room" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1442.16553, 29.8788261, -28.3547478)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Mob Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2850.20068, 7.39224768, 5354.99268)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "The Cafe" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Frist Spot" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Dark Area" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Flamingo Mansion" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  
        elseif _G.SelectWarp == "Flamingo Room" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2284.4140625, 15.152037620544, 875.72534179688)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Green Zone" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  
        elseif _G.SelectWarp == "Factory" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(424.12698364258, 211.16171264648, -427.54049682617)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")  
        elseif _G.SelectWarp == "Colossuim" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")      
        elseif _G.SelectWarp == "Zombie Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint") 
        elseif _G.SelectWarp == "Two Snow Mountain" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")    
        elseif _G.SelectWarp == "Punk Hazard" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Cursed Ship" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.40197753906, 125.05712890625, 32885.875)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Ice Castle" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Forgotten Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Ussop Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Mini Sky Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-288.74060058594, 49326.31640625, -35248.59375)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Great Tree" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Castle On The Sea" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375)
        elseif _G.SelectWarp == "MiniSky" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Port Town" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Hydra Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5749.7861328125, 611.9736938476562, -276.2497863769531)
        elseif _G.SelectWarp == "Floating Turtle" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Mansion" then
            wait(.1)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Haunted Castle" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Ice Cream Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Peanut Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Cake Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375) 
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Sea to Treats Old" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(508.21466064453125, 25.07753562927246, -12438.2294921875) 
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        elseif _G.SelectWarp == "Cake Island" then
            wait(.1)
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1141.0223388671875, 47.25519561767578, -14204.609375) 
            game.Players.LocalPlayer.Character.Head:Destroy()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
         end
    end
})

Tabs.Teleport:AddParagraph({
    Title = "Teleport Sea",
    Content = "You can select any buttons for teleport from this sea to that sea"
})

Tabs.Teleport:AddButton({
    Title = "Teleport to First Sea",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

Tabs.Teleport:AddButton({
    Title = "Teleport to Second Sea",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

Tabs.Teleport:AddButton({
    Title = "Teleport to Third Sea",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})


if World1 then
    Tabs.RaceV4:AddParagraph({
        Title = "Go to Third Sea",
        Content = ""
    })
end

_G.SelectChip = selectraids or ""
Raidslist = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for i,v in pairs(RaidsModule.raids) do
    table.insert(Raidslist,v)
end
for i,v in pairs(RaidsModule.advancedRaids) do
    table.insert(Raidslist,v)
end

if World2 or World3 then
    local SelectChip = Tabs.Raid:AddDropdown("SelectChip", {
        Title = "Select Chip",
        Values = Raidslist,
        Multi = false,
        Default = 1,
    })

    SelectChip:OnChanged(function(Value)
        _G.SelectChip = Value
    end)

    local BuyChip = Tabs.Raid:AddToggle("BuyChip", {Title = "Auto Buy Chip [Select]", Default = false })

    BuyChip:OnChanged(function(Value)
        _G.AutoBuyChip = Value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)

    local StartRaid = Tabs.Raid:AddToggle("StartRaid", {Title = "Auto Start Raid", Default = false })

    StartRaid:OnChanged(function(Value)
        _G.Auto_StartRaid = Value
    end)

    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.Auto_StartRaid then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                            if World2 then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            elseif World3 then
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)
end

local KillAura = Tabs.Raid:AddToggle("KillAura", {Title = "Kill Aura", Default = false })

KillAura:OnChanged(function(Value)
    _G.Kill_Aura = Value
end)

spawn(function()
    while wait() do
        if _G.Kill_Aura then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait(.1)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not _G.Kill_Aura  or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)

local NextIsland = Tabs.Raid:AddToggle("NextIsland", {Title = "Auto Next Island", Default = false })

NextIsland:OnChanged(function(Value)
    _G.Auto_Dungeon = Value
end)

local islandNames = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
spawn(function()
    while wait() do
        if _G.Auto_Dungeon then
            if not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                for _, islandName in ipairs(islandNames) do
                    local island = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild(islandName)
                    if island then
                        to(island.CFrame * CFrame.new(0, 70, 100))
                        break
                    end
                end
            end
        end
    end
end)

-- end
    Tabs.RaceV4:AddButton({
        Title = "Teleport to Temple of Time",
        Description = "",
        Callback = function()
            for i = 1, 4 do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
                wait(0.1)
            end
        end
    })

    function TweenTemple()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
    
    function CheckTemple()
        local CFRAMETEMPLE =CFrame.new(28734.3945,14888.2324,-109.071777,-0.650207579,4.1780531e-08,-0.759756625,1.97876595e-08,1,3.80575109e-08,0.759756625,9.71147784e-09,-0.650207579)
            if (CFRAMETEMPLE.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
            TweenTemple()
        end
        if (CFRAMETEMPLE.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
            TweenTemple()
        end
    end
    
    function GATCAN()
        local bn = CFrame.new(28576.4688, 14939.2832, 76.5164413, -1, 0, 0, 0, 0.707134247, -0.707079291, -0, -0.707079291, -0.707134247)
        local bo = CFrame.new(28576.4688, 14935.9512, 75.469101, -1, -4.22219593e-08, 1.13133396e-08, 0, -0.258819044, -0.965925813, 4.37113883e-08, -0.965925813, 0.258819044)
        local bp = 0.2
        if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp then
            CheckTemple()
            topos(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
            for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    end

    Tabs.RaceV4:AddButton({
        Title = "Auto TP Temple of Time & Lever",
        Description = "",
        Callback = function()
            GATCAN()
        end
    })

    Tabs.RaceV4:AddButton({
        Title = "Teleport to Race Door",
        Description = "",
        Callback = function()
            local player = game.Players.LocalPlayer
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local raceValue = player.Data.Race.Value
            if humanoidRootPart and raceValue then
                for i = 1, 4 do
                    humanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
                    wait(0.1)
                end
                wait(1)
                if raceValue == "Fishman" then
                    topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
                elseif raceValue == "Human" then
                    topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
                elseif raceValue == "Cyborg" then
                    topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
                elseif raceValue == "Skypiea" then
                    topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
                elseif raceValue == "Ghoul" then
                    topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
                elseif raceValue == "Mink" then
                    topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
                end
            end
        end
    })

        Tabs.RaceV4:AddParagraph({
        Title = "Just for Race V4",
        Content = "These features will help you to get Race V4"
    })

    local FinishTrial = Tabs.RaceV4:AddToggle("FinishTrial", {Title = "Auto Finish Trial V4", Default = false })

    FinishTrial:OnChanged(function(Value)
        _G.AutoQuestRace = Value
    end)

    spawn(function()
        while wait() do
            if _G.AutoQuestRace then
                local race = game:GetService("Players").LocalPlayer.Data.Race.Value
                if race == "Human" or race == "Ghoul" then
                    for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait(.1)
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                elseif race == "Skypiea" then
                    for i, v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        topos(game.Workspace.Map.SkyTrial.Model.FinishPart.CFrame)
                    end
                elseif race == "Fishman" then
                    for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if v.Name ==  "HumanoidRootPart" then
                            topos(v.CFrame* CFrame.new(0,300,0))
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v.ToolTip == "Melee" or v.ToolTip == "Blox Fruit" or v.ToolTip == "Sword" or v.ToolTip == "Gun" then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    
                            wait(0.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(0.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            wait(.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        end
                    end
                elseif race == "Cyborg" then
                    topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif race == "Mink" then
                    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "StartPoint" then
                            topos(v.CFrame * CFrame.new(0, 9, 0))
                        end
                    end
                end
            end
        end
    end)

    function Click()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end

    local KillPlayerWhenTrial = Tabs.RaceV4:AddToggle("KillPlayerWhenTrial", {Title = "Auto Kill Player After Trial", Default = false })

    KillPlayerWhenTrial:OnChanged(function(Value)
        KillPlayer = Value
    end)

    function AttackNoCD()
        local AC = CbFw2.activeController
        for i = 1, 1 do 
            local bladeHits = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                60
            )
            local uniqueHits = {}
            local uniqueHitsSet = {}
            
            for _, hit in pairs(bladeHits) do
                local humanoidRootPart = hit.Parent:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart and not uniqueHitsSet[hit.Parent] then
                    table.insert(uniqueHits, humanoidRootPart)
                    uniqueHitsSet[hit.Parent] = true
                end
            end
            
            bladeHits = uniqueHits
            
            if #bladeHits > 0 then
                local u8, u9, u7, u10 = debug.getupvalue(AC.attack, 5), debug.getupvalue(AC.attack, 6), debug.getupvalue(AC.attack, 4), debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
    
                local function updateValues()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end
    
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
    
                pcall(function()
                    local characterTool = plr.Character:FindFirstChildOfClass("Tool")
                    if characterTool and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladeHits, i, "")
                    end
                end)
            end
        end
    end

    spawn(function()
        while wait() do
            pcall(function()
                if KillPlayer then
                    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                        if v ~= game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 500 then
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    Buso()
                                    equip(_G.SelectWeapon)
                                    if game.Players.LocalPlayer.Character.Humanoid.Health < 4000 then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                    elseif game.Players.LocalPlayer.Character.Humanoid.Health > 4000 then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 5))
                                        AttackNoCD()
                                    end
                                    _G.NoClip = true
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                until not KillPlayer or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end)

    local KillPlayerWhenTrialSpamSkill = Tabs.RaceV4:AddToggle("KillPlayerWhenTrialSpamSkill", {Title = "Auto Kill Player After Trial [Spam Skill]", Default = false })

    KillPlayerWhenTrialSpamSkill:OnChanged(function(Value)
        KillPlayerWhenTrialSpamSkill = Value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if KillPlayerWhenTrialSpamSkill then
                    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                        if v ~= game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 500 then
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    Buso()
                                    equip("Melee")
                                    if game.Players.LocalPlayer.Character.Humanoid.Health < 4000 then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                    elseif game.Players.LocalPlayer.Character.Humanoid.Health > 4000 then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 5))
                                        Click()
                                    end
                                    _G.NoClip = true
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                until not KillPlayerWhenTrialSpamSkill or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end)
    function down(use)
        game:GetService("VirtualInputManager"):SendKeyEvent(true,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
        game:GetService("VirtualInputManager"):SendKeyEvent(false,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
    end

    spawn(function()
        while wait() do
            if KillPlayerWhenTrialSpamSkill then
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    down("Y")
                end
                down("Z")
                wait(0.3)
                down("X")
                wait(0.1)
                down("C")
                if game.Players.LocalPlayer.Data.Race.Value == "Fishman" or game.Players.LocalPlayer.Data.Race.Value == "Cyborg" then
                    down("T")
                end
            end
        end
    end)


    local AutoBuyGear = Tabs.RaceV4:AddToggle("AutoBuyGear", {Title = "Auto Buy Gear", Default = false })

    AutoBuyGear:OnChanged(function(Value)
        _G.AutoBuyGear = Value
    end)

    spawn(function()
        while wait(0.1) do
            if _G.AutoBuyGear then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", true)
            end
        end
    end)

    local AutoTrainRace = Tabs.RaceV4:AddToggle("AutoTrainRace", {Title = "Auto Train Race V4", Default = false })

    AutoTrainRace:OnChanged(function(Value)
        _G.Farming = Value
    end)

    spawn(function()
        while wait() do
            if _G.AutoRace then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                    _G.Farming = false
                    topos(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                elseif game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                    _G.Farming = true
                end
            end
        end
    end)
    
    spawn(function()
        while wait() do 
            if _G.Farming and World3 then
                if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    Buso()
                                    equip(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false 
                                    v.HumanoidRootPart.Size = Vector.new(50,50,50)
                                    MagnetFarm = true
                                    PosFarmV4 = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not _G.Farming or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    MagnetFarm = false
                    to(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if v.Name == "Cocoa Warrior" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif v.Name == "Chocolate Bar Battler" then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end
            end
        end
    end)

    Tabs.SeaEvent:AddParagraph({
        Title = "Setting Sea Event",
        Content = ""
    })

    function checkboat()
        for r, v in next, game:GetService("Workspace").Boats:GetChildren() do
            if v:IsA("Model") then
                if
                    v:FindFirstChild("Owner") and tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name and
                        v.Humanoid.Value > 0
                 then
                    return v
                end
            end
        end
        return false
    end

spawn(function()
	while wait() do
		if _G.Nocliprock then
			local function setCollision(objects, state)
				for _, v in pairs(objects:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = state
					end
				end
			end
			
			setCollision(game.Workspace.Boats, not game.Players.LocalPlayer.Character.Humanoid.Sit)
			setCollision(game.Players.LocalPlayer.Character, not game.Players.LocalPlayer.Character.Humanoid.Sit)
		end
	end
end)

local NoClipRock = Tabs.SeaEvent:AddToggle("NoClipRock", {Title = "No Clip Ship", Default = false })

NoClipRock:OnChanged(function(Value)
    _G.Nocliprock = Value
end)

local ResetChar = Tabs.SeaEvent:AddToggle("ResetChar", {Title = "Auto Reset Character to Tiki if Boat Health = 0", Default = false })

ResetChar:OnChanged(function(Value)
    _G.ResetChar = Value
end)

spawn(function()
    while wait() do
        if _G.ResetChar then
            for i,v in pairs(game.Workspace.Boats:GetChildren()) do
                if game:GetService("Workspace").Boats[_G.Boat] then
                    if not v:FindFirstChild("VehicleSeat") and v:FindFirstChild("Humanoid") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace").Boats[_G.Boat].VehicleSeat.Position).Magnitude > 1500 then
                            game.Players.LocalPlayer.Humanoid.Health = 0
                        end
                    end
                end
            end
        end
    end
end)

    Tabs.SeaEvent:AddButton({
        Title = "TP Your Ship to Current Position",
        Description = "",
        Callback = function()
            game:GetService("Workspace").Boats[_G.Boat].VehicleSeat.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    })

    Tabs.SeaEvent:AddParagraph({
        Title = "Kitsune Event",
        Content = "TP, Collect, etc about Kitsune Island"
    })

    local TpKitsuneIsland = Tabs.SeaEvent:AddToggle("TpKitsuneIsland", {Title = "Teleport to Kitsune Island", Default = false })

    TpKitsuneIsland:OnChanged(function(Value)
        _G.TptoKisuneIsland = Value
        StopTween(_G.TptoKisuneIsland)
    end)

    spawn(function()
        while task.wait() do
            if _G.TptoKisuneIsland then
                topos(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0, 100, 0))
            end
        end
    end)

    local CollectAzureEmber = Tabs.SeaEvent:AddToggle("CollectAzureEmber", {Title = "Auto Collect Azure Ember", Default = false })

    CollectAzureEmber:OnChanged(function(Value)
        _G.GetAzureEmber = Value
    end)

    spawn(function()
        while _G.GetAzureEmber do
            wait()
            pcall(function()
                if game.Workspace.EmberTemplate then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EmberTemplate.Part.CFrame
                end
            end)
        end
    end)

    Tabs.SeaEvent:AddParagraph({
        Title = "Speed Boat",
        Content = "Increase your speed boat"
    })

    local SelectSpeed = Tabs.SeaEvent:AddSlider("Slider", {
        Title = "Select Speed Boat",
        Description = "",
        Default = 150,
        Min = 100,
        Max = 400,
        Rounding = 1,
        Callback = function(Value)
            _G.SpeedBoat = Value
        end
    })

    SelectSpeed:OnChanged(function(Value)
        _G.SpeedBoat = Value
    end)

    local AutoSpeedBoat = Tabs.SeaEvent:AddToggle("AutoSpeedBoat", {Title = "Turn on Speed Boat", Default = false })

    AutoSpeedBoat:OnChanged(function(a)
        _G.increaseboatspeed = a
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.increaseboatspeed then
                for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                        v:FindFirstChild("VehicleSeat").MaxSpeed = _G.SpeedBoat
                    end
                end
            end
        end)
    end)

    local DodgeSeaBeast = Tabs.SeaEvent:AddToggle("DodgeSeaBeast", {Title = "Auto ignore Sea Beast", Default = false })

DodgeSeaBeast:OnChanged(function(a)
    _G.DodgeSeaBeast = a
end)

spawn(function()
    while wait() do
        if _G.DodgeSeaBeast then
            if CheckSeaBeast() then
                if checkboat() then
                    topos(checkboat().VehicleSeat.CFrame * CFrame.new(0,300,0))
                end
            end
        else
            topos(checkboat().VehicleSeat.CFrame * CFrame.new(0,1,0))
        end
    end
end)

    Tabs.SeaEvent:AddParagraph({
        Title = "Kill Mob",
        Content = "It just for Terror Shark, Fish Crew, Piranha, Etc"
    })

    local KillTerrorShark = Tabs.SeaEvent:AddToggle("KillTerrorShark", {Title = "Auto Kill TerrorShark", Default = false })

    KillTerrorShark:OnChanged(function(Value)
        _G.TerrorShark = Value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.TerrorShark then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Terrorshark" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                        Buso()
                                        equip(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false 
                                        if game.Players.LocalPlayer.Data.Race.Value == "Fishman" or game.Players.LocalPlayer.Data.Race.Value == "Skypiea" then
                                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"T",false,game)
                                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"T",true,game)
                                        end
                                        if game.Players.LocalPlayer.Character.Humanoid.Health > 4000 then
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                                            Click()
                                        elseif game.Players.LocalPlayer.Character.Humanoid.Health <= 4000 then
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,650,0))
                                        end
                                        _G.FastAttack = true
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.TerrorShark or not v.Parent or v.Humanoid.Health <= 0
                                    _G.NoClip = false
                                end
                            end
                        end
                    elseif not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                            topos(game:GetService("Workspace").Boats[_G.Boat].VehicleSeat.CFrame)
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2,60,2))
                        end
                    end
                end
            end)
        end
    end)

    local KillPiranha = Tabs.SeaEvent:AddToggle("KillPiranha", {Title = "Auto Kill Piranha", Default = false })

    KillPiranha:OnChanged(function(Value)
        _G.Piranha = Value
    end)

    spawn(function()
        while wait() do
            if _G.Piranha then
                pcall(function()
                    if game.workspace.Enemies:FindFirstChild("Piranha") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                v.Humanoid.JumpPower = 0
                                v.Humanoid:ChangeState(11)
                            repeat wait()
                                Buso()
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                equip(_G.SelectWeapon)
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                until not v.Parent or not v.Humanoid.Health <= 0 or not _G.Piranha
                                _G.NoClip = false
                            elseif not game.workspace.Enemies:FindFirstChild("Piranha") then
                                if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                                    topos(game.Workspace.Boats[_G.Boat].VehicleSeat.CFrame)
                                end
                            else
                            if game.ReplicatedStorage:FindFirstChild("Piranha") then
                                topos(game.ReplicatedStorage:FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    local KillFishCrew = Tabs.SeaEvent:AddToggle("KillFishCrew", {Title = "Auto Kill Fish Crew", Default = false })

    KillFishCrew:OnChanged(function(Value)
        _G.FishCrew = Value
    end)

    spawn(function()
        while wait() do
            if _G.FishCrew then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Fish Crew Member") and v.Humanoid.Health > 0 then
                        pcall(function()
                            repeat task.wait()
                                Buso()
                                equip(_G.SelectWeapon)
                                NoClip = true
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                Click()
                            until not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or v.Humanoid.Health <= 0 or not _G.FishCrew
                            NoClip = false
                            _G.NoClip = false
                            if not game.workspace.Enemies:FindFirstChild("Fish Crew Member") then
                                if not game.Players.LocalPlayer.Character.Humanoid.Sit then
                                    topos(game.Workspace.Boats[_G.Boat].VehicleSeat.CFrame)
                                end
                            end
                        end)
                    end
                end
            end
        end
    end)

    local KillFishBoat = Tabs.SeaEvent:AddToggle("KillFishBoat", {Title = "Auto Kill Fish Boat", Default = false })

    KillFishBoat:OnChanged(function(Value)
        _G.FishBoat = Value
    end)

    function CheckPirateBoat()
        local boat = {"FishBoat"}
        for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
            if table.find(boat, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                return v
            end
        end
    end
    spawn(function()
        while wait() do
            pcall(function()
                if _G.FishBoat then
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                        local v = CheckPirateBoat()
                        repeat
                            wait()
                            spawn(topos(v.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                            matquyenkiemsoat = true
                            _G.NoClip = true
                            power = true
                            getgenv().psskill = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                        until v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                        getgenv().psskill = nil
                        power = false
                        matquyenkiemsoat = false
                        _G.NoClip = false
                    end
                end
            end)
        end
    end)
    
    spawn(function()
        while wait() do
            if _G.FishBoat then
                   pcall(function()
                    if CheckPirateBoat() then
                        Buso()
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Melee" then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Blox Fruit" then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.6)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Sword" then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Gun" then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
        end
    end)

    local KillShark = Tabs.SeaEvent:AddToggle("KillShark", {Title = "Auto Kill Shark", Default = false })

    KillShark:OnChanged(function(Value)
        _G.KillShark = Value
    end)

    spawn(function()
        while wait() do
            if _G.KillShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shark" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        Buso()
                                        equip(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                        FastAttackSpeed = true
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    until not _G.KillShark or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        topos(game:GetService("Workspace").Boats[_G.Boat].VehicleSeat.CFrame * CFrame.new(0,1,0))
                    end
                end)
            end
        end
    end)

    local KillSeaBeast = Tabs.SeaEvent:AddToggle("KillSeaBeast", {Title = "Auto Kill Sea Beast", Default = false })

    KillSeaBeast:OnChanged(function(Value)
        _G.KillSeaBeast = Value
    end)

    function CheckSeaBeast()
        for r, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
            if v.Name == "SeaBeast1" then
                local s = v.HealthBBG.Frame.TextLabel.Text
                local c5 = s:gsub("/%d+,%d+", "")
                local a = v.HealthBBG.Frame.TextLabel.Text
                local ab
                if string.find(c5, ",") then
                    ab = a:gsub("%d+,%d+/", "")
                else
                    ab = a:gsub("%d+/", "")
                end
                local c = ab:gsub(",", "")
                if tonumber(c) >= 34500 then
                    return v
                end
            end
        end
        return false
    end
    
    function TeleportSeabeast(c5)
        NoClip = true
        local a = Vector3.new(0, c5:FindFirstChild("HumanoidRootPart").Position.Y, 0)
        local ab = Vector3.new(0, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, 0)
        if (a - ab).Magnitude <= 175 then
            topos(c5.HumanoidRootPart.CFrame * CFrame.new(0, 400, 50))
        else
            topos(CFrame.new(c5.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, c5.HumanoidRootPart.Position.Z))
        end
        if not CheckSeaBeast() then
            _G.NoClip = false
        end
    end

    spawn(function()
        while wait() do
            if chodienlenconnungdisuc then
                Buso()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Melee" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Blox Fruit" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(0.6)
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Sword" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(0.5)
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Gun" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                wait(.2)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
        end
    end)

    spawn(function()
        while wait() do
            if _G.KillSeaBeast then
                if CheckSeaBeast() then
                    local v = CheckSeaBeast()
                    repeat wait()
                        if game.Players.LocalPlayer.Character.Humanoid.Health > 9000 then
                            spawn(TeleportSeabeast(v), 1)
                            chodienlenconnungdisuc = true
                        elseif game.Players.LocalPlayer.Character.Humanoid.Health < 5000 then
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,650,0))
                        else
                            spawn(TeleportSeabeast(v), 1)
                            chodienlenconnungdisuc = true
                        end
                    until not v or not v.Parent or v.Health.Value <= 0 or not CheckSeaBeast() or not _G.KillSeaBeast
                end
            end
        end
    end)


    Tabs.SeaEvent:AddParagraph({
        Title = "Sail Boat",
        Content = "This feature will help you teleport your boat to any zone if you want"
    })

    function TweenObject(TweenCFrame,obj,ts)
        if not ts then ts = 350 end
        local tween_s = game:GetService("TweenService")
        local info = TweenInfo.new((TweenCFrame.Position -obj.Position).Magnitude /ts,Enum.EasingStyle.Linear)
        tween = tween_s:Create(obj,info,{CFrame = TweenCFrame})
        tween:Play() 
    end

    local SelectBoat = Tabs.SeaEvent:AddDropdown("SelectBoat", {
        Title = "Select Buy Boat",
        Values = {"PirateBrigade", "PirateGrandBrigade","PirateSloop","MarineBrigade","MarineGrandBrigade"},
        Multi = false,
        Default = 1,
    })

    SelectBoat:OnChanged(function(Value)
        _G.Boat = Value
    end)

    local SelectZone = Tabs.SeaEvent:AddDropdown("SelectZone", {
        Title = "Select Zone",
        Values = {"Zone 0", "Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6", "Zone 7 [Must for Leviathan]"},
        Multi = false,
        Default = 1,
    })

    SelectZone:OnChanged(function(Value)
        _G.Zone = Value
        if _G.Zone == "Zone 0" then
            ZoneCFrame = CFrame.new(-19118.041015625, 24.44040298461914, 858.4185791015625)
        elseif _G.Zone == "Zone 1" then
            ZoneCFrame = CFrame.new(-21313.607421875, 12.560698509216309, 1330.6165771484375)
        elseif _G.Zone == "Zone 2" then
            ZoneCFrame = CFrame.new(-24815.267578125, 12.560657501220703, 5262.62060546875)
        elseif _G.Zone == "Zone 3" then
            ZoneCFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
        elseif _G.Zone == "Zone 4" then
            ZoneCFrame = CFrame.new(-30294.8515625, 12.554117202758789, 10409.8564453125)
        elseif _G.Zone == "Zone 5" then
            ZoneCFrame = CFrame.new(-37704.828125, 12.561018943786621, 6750.69873046875)
        elseif _G.Zone == "Zone 6" then
            ZoneCFrame = CFrame.new(-32704.103515625, 12.557344436645508, 24089.923828125)
        elseif _G.Zone == "Zone 7" then
            ZoneCFrame = CFrame.new(-118140.65625, 31.783639907836914, 172404.875)
        end
    end)

    local SailBoat = Tabs.SeaEvent:AddToggle("SailBoat", {Title = "Auto Sail Boat", Default = false })

    SailBoat:OnChanged(function(Value)
        SailBoat = Value
        StopTween(SailBoat)
    end)

    spawn(function()
        while wait() do
            if SailBoat then
                repeat wait()
                    if not checkboat() then
                        if (Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20 then
                            NoClip = true
                            topos(CFrame.new(-16207.501953125, 9.0863618850708, 475.1490783691406))
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", _G.Boat)
                        end
                    end
                    if checkboat() and not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Rough Sea") then
                        if (checkboat().VehicleSeat.Position - Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406)).Magnitude > 50 then
                            if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit == true then
                                TweenObject(ZoneCFrame,checkboat().VehicleSeat, 300)
                                _G.Nocliprock = true
                            end
                        end
                        if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            _G.NoClip = true
                            topos(checkboat().VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            _G.NoClip = false
                        end
                    end
                    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Rough Sea") and checkboat() then
                        if game.Players.LocalPlayer.Character.Humanoid.Sit then
                            game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        end
                        if (checkboat().VehicleSeat.Position - Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406)).Magnitude > 100 then
                            checkboat().VehicleSeat.CFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
                        end
                        if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                            _G.NoClip = true
                            topos(checkboat().VehicleSeat.CFrame)
                        else
                            _G.NoClip = false
                        end
                    end
                until not SailBoat
            end
        end
    end)

    local TPMirage = Tabs.Misc:AddToggle("TPMirage", {Title = "Teleport to Highest Mirage", Default = false })

    TPMirage:OnChanged(function(Value)
        _G.AutoMysticIsland = Value
        StopTween(_G.AutoMysticIsland)
    end)
    spawn(function()
        while wait() do
            if _G.AutoMysticIsland then
                for i,v in pairs(game.Workspace.Map.MysticIsland:GetChildren()) do
                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            topos(CFrame.new(game.Workspace.Map.MysticIsland.BiggTree.Part.Position * CFrame.new(0,50,0)))
                        end
                    end
                end
            end
        end)

        Tabs.Misc:AddButton({
            Title = "Teleport to Advanced Fruit Dealer",
            Description = "",
            Callback = function()
                FindAdvancedDealer()
            end
        })

        function FindAdvancedDealer()
            repeat wait()
            until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                AllNPCS = getnilinstances()
                for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    table.insert(AllNPCS, v)
                end
                for r, v in pairs(AllNPCS) do
                    if v.Name == "Advanced Fruit Dealer" then
                        topos(v.HumanoidRootPart.CFrame)
                    end
                end
            end
        end

        function getBlueGear()
            if game.workspace.Map:FindFirstChild("MysticIsland") then
                for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
                    if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                        return v
                    end
                end
            end
        end

        function TweentoBlueGear()
            BlueGear = getBlueGear()
            if BlueGear then
                topos(BlueGear.CFrame)
            end
        end

        Tabs.Misc:AddButton({
            Title = "Tween To Gear in Mirage",
            Description = "",
            Callback = function()
                TweentoBlueGear()
            end
        })

        Tabs.Misc:AddParagraph({
            Title = "Hop Until...",
            Content = ""
        })

        function Notify(content)
            content = tostring(content)
            Fluent:Notify({
                Title = "Ganteng Hub Pemula",
                Content = content,
                SubContent = "",
                Duration = 5
            })
        end

        function IsMirageIsland2()
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                return true
            else
                return false
            end
        end

    task.spawn(function()
        while task.wait() do
            task.wait()
            if World3 and HopFoundMirage then
                if IsMirageIsland2() then
                    Notify("Found Mirage ðŸ")
                    task.wait(5)
                else
                    Notify("Not Found Mirage ðŸ")
                    repeat
                        Hop()
                        task.wait(5)
                    until not HopFoundMirage
                end
            end
        end
    end)

    local HopUntilMirage = Tabs.Misc:AddToggle("HopUntilMirage", {Title = "Hop Until Found Mirage", Default = false })

    HopUntilMirage:OnChanged(function(Value)
        HopFoundMirage = Value
    end)


    --//check normal & Mirage Stock
    Tabs.Misc:AddParagraph({
        Title = "Check Stock",
        Content = "For Check normal stock or mirage stock"
    })
    
    function Abbreviate(x)
        local abbreviations = {
            "K", -- 4 digits
            "M", -- 7 digits
            "B", -- 10 digits
            "T", -- 13 digits
            "QD", -- 16 digits
            "QT", -- 19 digits
            "SXT", -- 22 digits
            "SEPT", -- 25 digits
            "OCT", -- 28 digits
            "NON", -- 31 digits
            "DEC", -- 34 digits
            "UDEC", -- 37 digits
            "DDEC" -- 40 digits
        }
        if x < 1000 then
            return tostring(x)
        end
    
        local digits = math.floor(math.log10(x)) + 1
        local index = math.min(#abbreviations, math.floor((digits - 1) / 3))
        local front = x / math.pow(10, index * 3)
    
        return string.format("%i%s+", front, abbreviations[index])
    end
    function getFruitDealerCountdown()
        local defaulttime = 7200
        local dpersent = os.time() % defaulttime;
        local real1 = defaulttime - dpersent;
        defaulttime = defaulttime * 2
        local d2persent = os.time() % defaulttime;
        local real2 = defaulttime - dpersent;
        local ren = {
            TimeNormalDealer = string.format("%d:%02d:%02d:%02d", math.floor(real1 / 86400), math.floor(real1 % 86400 / 3600), math.floor(real1 % 3600 / 60), (math.floor(real1 % 60))),
            TimeMirageDealer = string.format("%d:%02d:%02d:%02d", math.floor(real2 / 86400), math.floor(real2 % 86400 / 3600), math.floor(real2 % 3600 / 60), (math.floor(real2 % 60))),
        }
        local fruitstocks = {
            a = {
                ks = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "GetFruits",
                    false 
                    )   
            },
            b = {
                l = true,
                ks = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "GetFruits",
                    true
                )
            }
        }
        fruitstocks.Normal = ""
        fruitstocks.Mirage = ""
        for i,v in pairs(fruitstocks) do
            if type(v) == "table" then  
                for _,n3 in pairs(v) do 
                    if typeof(n3) == "table" then 
                        for __,n in pairs(n3) do 
                            if n.OnSale then 
                                local N = n.Name 
                                if N:split("-")[1] == N:split("-")[2] then 
                                    N = N:split("-")[1]
                                end
                                if v.l then 
                                    fruitstocks.Mirage = fruitstocks.Mirage..N.." : "..Abbreviate(n.Price).."\n"
                                else
                                    fruitstocks.Normal = fruitstocks.Normal..N.." : "..Abbreviate(n.Price).."\n"
                                end
                            end 
                        end
                    end
                end
            end
        end
        ren.Text1 = "Normal Dealer re-stock in "..ren.TimeNormalDealer
        ren.Text2 = "Mirage Dealer re-stock in "..ren.TimeMirageDealer
        ren.Stocks = fruitstocks
        return ren
    end
    local geti = getFruitDealerCountdown()

    Tabs.Misc:AddParagraph({
        Title = "Normal Stock:",
        Content = geti.Stocks.Normal
    })

    Tabs.Misc:AddParagraph({
        Title = "Mirage Stock:" ,
        Content = geti.Stocks.Mirage
    })
    

    Tabs.Misc:AddParagraph({
        Title = "Job ID",
        Content = "For Paste, Copy and join server from job id"
    })

    Tabs.Misc:AddButton({
        Title = "Copy Job ID",
        Description = "",
        Callback = function()
            setclipboard(tostring(game.JobId))
        end
    })

    local Paste = Tabs.Misc:AddInput("Paste", {
        Title = "Paste Job ID",
        Default = "",
        Placeholder = "Enter Your job Id",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            _G.Job = Value
        end
    })



    Paste:OnChanged(function(Value)
        _G.Job = Value
    end)

    Tabs.Misc:AddButton({
        Title = "Join Job ID",
        Description = "",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    })

    Tabs.Misc:AddParagraph({
        Title = "Fruit",
        Content = "Random, Open, Store Fruit"
    })

    Tabs.Misc:AddButton({
        Title = "Auto Random Fruit",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end
    })

    Tabs.Misc:AddButton({
        Title = "Open Normal Fruit Stock",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        end
    })

    local StoreFruit = Tabs.Misc:AddToggle("StoreFruit", {Title = "Auto Store Fruit", Default = false })

    StoreFruit:OnChanged(function(Value)
        _G.AutoStoreFruit = Value
    end)

    spawn(function()
        while wait() do
            if _G.AutoStoreFruit then
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
                        end
                    end
                end)
            end
        end
    end)

    Tabs.Misc:AddButton({
        Title = "Rain Fruit [Fake Fruit]",
        Description = "",
        Callback = function()
            for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
                v.Parent = game.Workspace.Map
                v:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
                if v.Fruit:FindFirstChild("AnimationController") then
                    v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
                end
                v.Handle.Touched:Connect(function(otherPart)
                    if otherPart.Parent == game.Players.LocalPlayer.Character then
                        v.Parent = game.Players.LocalPlayer.Backpack
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    end
                end)
            end
        end
    })

    

Window:SelectTab(1)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:LoadAutoloadConfig()

print(("\n"):rep(30))
