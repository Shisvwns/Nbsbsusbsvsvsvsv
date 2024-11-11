local PlaceId = game.PlaceId
local plr = game.Players.LocalPlayer
local WS = game.Workspace
local Rc = game.ReplicatedStorage
local CommF = Rc.Remotes["CommF_"]
if plr.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat
        wait()
        if plr.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Team == "Pirates" then
                for i, v in pairs(
                    getconnections(
                        plr.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated
                    )
                ) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire()
                    end
                    v.Function()
                end
            else
                for i, v in pairs(
                    getconnections(
                        plr.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated
                    )
                ) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire()
                    end
                    v.Function()
                end
            end
        end
    until plr.Team ~= nil and game:IsLoaded()
end
repeat wait()
until game:GetService("Players").LocalPlayer:FindFirstChild("WeaponAssetCache")
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "sitink hub", Text = "Loading...", Duration = 5})
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),WS.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),WS.CurrentCamera.CFrame)
end)

---------------------------------------------// Anti Htpp Spy \\ ---------------------------------------------------------------------------------------------------------------------------------------------

local oldwrite
oldwrite = hookfunction(writefile, function(file, content)
    if(string.find(string.lower(content), 'https://') or string.find(string.lower(content), '//')) then
        return
    end

    return oldwrite(file, content)
end)

local oldappend
oldappend = hookfunction(appendfile, function(file, content)
    if(string.find(string.lower(content), 'https://') or string.find(string.lower(content), '//')) then
        return
    end

    return oldappend(file, content)
end)

game.DescendantAdded:Connect(function(c)
    if c and c:IsA('TextLabel') or c:IsA('TextButton') or c:IsA('Message') then
        if string.find(string.lower(c.Text), 'https://') then
            c:Destroy()
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/V3.5"))()
local ScreenStatus = Instance.new("ScreenGui")
local MainStatus = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local TitleStatus = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
if PlaceId == 2753915549 then
    Old_World = true
elseif PlaceId == 4442272183 then
    New_World = true
elseif PlaceId == 7449423635 then
    Third_World = true
else
    plr:Kick("Sitink Hub \n CAI DIT ME MAY NHAM GAME ROI")
end

Bulon = {
    ["Select Weapon"] = "Melee",
    ["Tween Speed"] = 180,
    ["Anti Flag Reset"] = true
}

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

spawn(function()
    while task.wait() do
        hookfunction(require(Rc.Effect.Container:FindFirstChild("Death")), function() return nil end)
        hookfunction(require(Rc.Effect.Container:FindFirstChild("Respawn")), function() return nil end)
        Rc.Assets.GUI.DamageCounter.Enabled = false
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LoadSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("Sitink Hub") then
            makefolder("Sitink Hub")
        end
        if not isfolder("Sitink Hub/Blox Fruits/") then
            makefolder("Sitink Hub/Blox Fruits/")
        end
        if not isfile("Sitink Hub/Blox Fruits/" .. plr.Name .. ".json") then
            writefile(
                "Sitink Hub/Blox Fruits/" .. plr.Name .. ".json",
                game:GetService("HttpService"):JSONEncode(Bulon)
            )
        else
            local x =
                game:GetService("HttpService"):JSONDecode(
                readfile("Sitink Hub/Blox Fruits/" .. plr.Name .. ".json")
            )
            for y, z in pairs(x) do
                Bulon[y] = z
            end
        end
    else
        return
    end
end
function SaveSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfile("Sitink Hub/Blox Fruits/" .. plr.Name .. ".json") then
            LoadSettings()
        else
            local x =
                game:GetService("HttpService"):JSONDecode(
                readfile("Sitink Hub/Blox Fruits/" .. plr.Name .. ".json")
            )
            local A = {}
            for y, z in pairs(Bulon) do
                A[y] = z
            end
            writefile(
                "Sitink Hub/Blox Fruits/" .. plr.Name .. ".json",
                game:GetService("HttpService"):JSONEncode(A)
            )
        end
    else
        return
    end
end
LoadSettings()

function HopServer(bO)
    if not bO then
        bO = 10
    end
    ticklon = tick()
    repeat
        wait()
    until tick() - ticklon >= 1
    local function Hop()
        for r = 1, math.huge do
            if ChooseRegion == nil or ChooseRegion == "" then
                ChooseRegion = "Singapore"
            else
                plr.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = ChooseRegion
            end
            local bP = Rc.__ServerBrowser:InvokeServer(r)
            for k, v in pairs(bP) do
                if k ~= game.JobId and v["Count"] < bO then
                    SvJob = k
                    Library:MakeNotify({
                        Title = "Sitink Hub",
                        Content = "Join Server Job Id : ".. SvJob .. "!!!",
                        Description = "Hop Server",
                        Time = 5 
                    })
                    Rc.__ServerBrowser:InvokeServer("teleport", SvJob)
                    wait(6)
                end
            end
        end
        return false
    end
    if not getgenv().Loaded then
        local function bQ(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                        v.Visible = false
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(
                    function()
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                    end
                )
            end
        end
        for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            bQ(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
        getgenv().Loaded = true
    end
    while not Hop() do
        wait()
    end
end

function DetectTeleporter(vcs)
    vcspos = vcs.Position
    min = math.huge
    min2 = math.huge
    local y = game.PlaceId
    if y == 2753915549 then
        OldWorld = true
    elseif y == 4442272183 then
        NewWorld = true
    elseif y == 7449423635 then
        ThreeWorld = true
    end
    if ThreeWorld then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    min3 = (vcspos - plr.Character.HumanoidRootPart.Position).Magnitude
    if min2 + 32 <= min3 and GetDistance(vcspos) > 5000 then
        return choose
    end
end

function requestEntrance(ac)
    args = {
        "requestEntrance",
        ac
    }
    Rc.Remotes.CommF_:InvokeServer(unpack(args))
    oldcframe = plr.Character.HumanoidRootPart.CFrame
    char = plr.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character:FindFirstChild("PartTele").CFrame = plr.Character.HumanoidRootPart.CFrame
    end
end
function WaitHRP(q0) 
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9) 
end 
function GetBackback(Item)
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if ((typeof(Item) == "table" and table.find(Item, v.Name)) or (typeof(Item) == "string" and v.Name == Item)) then
            return v
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if ((typeof(Item) == "table" and table.find(Item, v.Name)) or (typeof(Item) == "string" and v.Name == Item)) then
            return v
        end
    end
end
function Tween(Pos)
    pcall(function()
        if plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
            Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            plr.Character:WaitForChild("HumanoidRootPart", 9)
            plr.Character:WaitForChild("Head", 9)
            if not Pos then return end
            if not plr.Character:FindFirstChild("PartTele") then
                local PartTele = Instance.new("Part", plr.Character) -- Create part
                PartTele.Size = Vector3.new(10,1,10)
                PartTele.Name = "PartTele"
                PartTele.Anchored = true
                PartTele.Transparency = 1
                PartTele.CanCollide = false
                PartTele.CFrame = WaitHRP(plr).CFrame 
                PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                    task.wait(0.01)
                    WaitHRP(plr).CFrame = PartTele.CFrame
                end)
            end
            tween = game:GetService("TweenService"):Create(plr.Character.PartTele, TweenInfo.new(Distance / Bulon["Tween Speed"], Enum.EasingStyle.Linear) , {CFrame = Pos})
            local NearestEntraceFunction = DetectTeleporter(Pos)
            if NearestEntraceFunction then
                try = 0
                repeat wait()
                    pcall(function()
                        tween:Cancel()
                    end)
                    requestEntrance(NearestEntraceFunction)
                    try = try + 1
                until not DetectTeleporter(Pos) or try >= 10
                if try >= 10 then
                    if not GetBackback("God's Chalice") and not GetBackback("Fist Of Darkness") then
                        plr.Character.Humanoid.Health = 0
                    end
                end
            end
            if Distance <= 250 then
                tween:Cancel()
                plr.Character.PartTele.CFrame = Pos
            end
            if plr.Character.Humanoid.Sit == true then
                plr.Character.Humanoid.Sit = false
                plr.Character.PartTele.CFrame = CFrame.new(plr.Character.PartTele.CFrame.X, plr.Character.PartTele.CFrame.Y + 30, plr.Character.PartTele.CFrame.Z)
            end
            tween:Play()
        end
    end)
end

function GetPosBypass(c)
    for i, v in pairs(WS["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren()) do
        if v:IsA("Model") then
            if (v.Part.Position - c.Position).Magnitude < 1500 then
                return v
            end
        end
    end
end
function DetectFruitBackback()
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            if not v:FindFirstChild("Level") then
                return true
            end
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            if not v:FindFirstChild("Level") then
                return true
            end
        end
    end
    return false
end
function BypassTo(TeruIsNigga)
    pcall(function()
        if not DetectFruitBackback() then
            local Nigga = DetectTeleporter(TeruIsNigga)
            if Nigga then
                requestEntrance(Nigga)
            end
            if GetDistance(TeruIsNigga.Position) > 4500 then
                repeat wait()
                    if plr.Character:FindFirstChild("PartTele") then
                        plr.Character:FindFirstChild("PartTele").CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    end
                    plr.Character:FindFirstChild("Head"):Destroy()
                    plr.Character.HumanoidRootPart.CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    plr.Character:WaitForChild("Humanoid"):ChangeState(15)
                    wait(2)
                    plr.Character.PrimaryPart.CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    wait(3)
                until GetDistance(TeruIsNigga.Position) <= 4500 or not plr.Character:FindFirstChild("Humanoid") or plr.Character:FindFirstChild("Humanoid").Health <= 0
            end
        elseif DetectFruitBackback() then
            Tween(TeruIsNigga)
        end
    end)
end

function ToBypass(gay)
    if GetDistance(gay.Position) > 4500 then
        repeat wait()
            BypassTo(gay)
        until GetDistance(gay.Position) <= 4500 or not plr.Character:FindFirstChild("Humanoid") or plr.Character:FindFirstChild("Humanoid").Health <= 0
    elseif GetDistance(gay.Position) < 4500 then
        Tween(gay)
    end
end

spawn(function()
    while task.wait() do
        if plr.Character:FindFirstChild("Humanoid").Health <= 0 or not plr.Character:FindFirstChild("HumanoidRootPart") then
            if plr.Character:FindFirstChild("PartTele") then
                plr.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)
spawn(function()
    while task.wait() do
        if plr.Character:FindFirstChild("PartTele") then
            if (plr.Character.HumanoidRootPart.Position - plr.Character:FindFirstChild("PartTele").Position).Magnitude >= 100 then
                plr.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)

function DetectMob(MobName)
    for i, v in pairs(WS.Enemies:GetChildren()) do
        local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        if ((typeof(MobName) == "table" and (table.find(MobName, v.Name) or table.find(MobName, stringgsub))) or (v.Name == MobName or MobName == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            return v
        end
    end
end

function DetectMob2(MobName2)
    for i, v in pairs(WS.Enemies:GetChildren()) do
        local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        if ((typeof(MobName2) == "table" and (table.find(MobName2, v.Name) or table.find(MobName2, stringgsub))) or (v.Name == MobName2 or MobName2 == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            return v
        end
    end
    for i, v in pairs(Rc:GetChildren()) do
        local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        if ((typeof(MobName2) == "table" and (table.find(MobName2, v.Name) or table.find(MobName2, stringgsub))) or (v.Name == MobName2 or MobName2 == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            return v
        end
    end
end

function GetWP(MeleeorSword)
    Nahfck = ""
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == MeleeorSword then
            Nahfck = v.Name
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == MeleeorSword then
            Nahfck = v.Name
        end
    end
    return Nahfck
end

function EquipWeapon(Giet)
    if Bulon["Select WP"] == "" or Bulon["Select WP"] == nil then
        Bulon["Select WP"] = "Melee"
    end
    Giet = GetWP(Bulon["Select WP"])
    local bucac = plr.Backpack:FindFirstChild(Giet)
    if bucac then
        plr.Character.Humanoid:EquipTool(bucac)
    end
end

function UnEquipWeapon(Giet)
    if Bulon["Select WP"] == "" or Bulon["Select WP"] == nil then
        Bulon["Select WP"] = "Melee"
    end
    Giet = GetWP(Bulon["Select WP"])
    if plr.Character:FindFirstChild(Giet) then
        plr.Character:FindFirstChild(Giet).Parent = plr.Backpack
    end
end

function Buso()
    if not plr.Character:FindFirstChild("HasBuso") then
        local args = {[1] = "Buso"}
        Rc.Remotes.CommF_:InvokeServer(unpack(args))
    end
end

function BringMob(huh)
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name == huh and v.Parent and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 350 then
            v.HumanoidRootPart.CFrame = BringPos
            v.Humanoid.JumpPower = 0
            v.Humanoid.WalkSpeed = 0
            v.HumanoidRootPart.Transparency = 1
            v.HumanoidRootPart.CanCollide = false
            v.Head.CanCollide = false
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            if not v.HumanoidRootPart:FindFirstChild("Lock") then
                local lock = Instance.new("BodyVelocity")
                lock.Parent = v.HumanoidRootPart
                lock.Name = "Lock"
                lock.MaxForce = Vector3.new(100000, 100000, 100000)
                lock.Velocity = Vector3.new(0, 0, 0)
            end
            sethiddenproperty(plr, "SimulationRadius", math.huge)
            v.Humanoid:ChangeState(11)
        end
    end
end

function CancelTween()
    if plr.Character.Head:FindFirstChild("BodyVelocity") then
        plr.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
    end
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character:FindFirstChild("PartTele"):Destroy()
    end
    NoClip = false
    return Tween(plr.Character.HumanoidRootPart.CFrame)
end

function KillMob(V1, StopFunction)
    pcall(function()
        thismob = DetectMob2(V1)
        if thismob:FindFirstChild("HumanoidRootPart") and thismob.Parent and thismob:FindFirstChild("Humanoid") and thismob.Humanoid.Health > 0 then
            repeat task.wait()
                Buso()
                EquipWeapon()
                Tween(thismob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                BringPos = thismob.HumanoidRootPart.CFrame
                BringMob(V1)
                NoClip = true
            until not thismob.Parent or not thismob:FindFirstChild("Humanoid") or thismob:FindFirstChild("Humanoid").Health <= 0 or not thismob:FindFirstChild("HumanoidRootPart") or StopFunction()
            NoClip = false
            CancelTween()
        end
    end)
end

spawn(function()
    while wait() do
        pcall(function()
            if NoClip == true then
                if not plr.Character.Head:FindFirstChild("Nigga") then
                    local Bucaccho = Instance.new("BodyVelocity", plr.Character.Head)
                    Bucaccho.P = 1500
                    Bucaccho.Name = "Nigga"
                    Bucaccho.MaxForce = Vector3.new(0, 100000, 0)
                    Bucaccho.Velocity = Vector3.new(0, 0, 0)
                end
                for i, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                if plr.Character.Head:FindFirstChild("Nigga") then
                    plr.Character.Head:FindFirstChild("Nigga"):Destroy()
                end
            end
        end)
    end
end)

function DisableTween(nigga)
    if not nigga then
        NoClip = false
        if plr.Character.Head:FindFirstChild("BodyVelocity") then
            plr.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
        if plr.Character:FindFirstChild("PartTele") then
            plr.Character:FindFirstChild("PartTele"):Destroy()
        end
        NoClip = false
        return Tween(plr.Character.HumanoidRootPart.CFrame)
    end
end

local QuestKhac = {"BartiloQuest", "CitizenQuest"}
local function S()
    local Lvl = plr.Data.Level.Value
    local T = Lvl
    local min = 0
    if Lvl >= 1 and Lvl <= 9 then
        if tostring(plr.Team) == "Marines" then
            Mob1 = "Trainee"
            Mob2 = "MarineQuest"
            Mob3 = 1
        elseif tostring(plr.Team) == "Pirates" then
            Mob1 = "Bandit"
            Mob2 = "BanditQuest1"
            Mob3 = 1
        end
    end
    local GuideModule = require(Rc.GuideModule)
    local Quests = require(Rc.Quests)
    for i, v in pairs(GuideModule["Data"]["NPCList"]) do
        for i1, v1 in pairs(v["Levels"]) do
            if Lvl >= v1 then
                if not levelreq then
                    levelreq = 0
                end
                if v1 > levelreq then
                    npcpos = i["CFrame"]
                    Mob3 = i1
                    levelreq = v1
                end
                if #v["Levels"] == 3 and Mob3 == 3 then
                    npcpos = i["CFrame"]
                    Mob3 = 2
                    levelreq = v["Levels"][2]
                end
            end
        end
    end
    for i, v in pairs(Quests) do
        for i1, v1 in pairs(v) do
            for O, P in pairs(v1.Task) do
                if v1["LevelReq"] == levelreq and v1.Task[O] > 1 and not table.find(QuestKhac, tostring(i)) then
                    Mob2 = i
                    for i2, v2 in pairs(v1["Task"]) do
                        Mob1 = i2
                    end
                end
            end
        end
    end
    if Mob2 == "MarineQuest2" then
        Mob2 = "MarineQuest2"
        Mob3 = 1
        Mob1 = "Chief Petty Officer"
        levelreq = 120
    elseif Mob2 == "ImpeMob3" then
        Mob2 = "PrisonerQuest"
        Mob3 = 2
        Mob1 = "Dangerous Prisoner"
        levelreq = 210
    elseif Mob2 == "SkyExp1Quest" then
        if Mob3 == 1 then
        elseif Mob3 == 2 then
        end
    elseif Mob2 == "Area2Quest" and Mob3 == 2 then
        Mob2 = "Area2Quest"
        Mob3 = 1
        Mob1 = "Swan Pirate"
        levelreq = 775
    end
end

local Q = require(Rc.Quests)
local a3 = require(Rc:WaitForChild("GuideModule"))
function CheckDataQuest()
    for r, v in next, a3.Data do
        if r == "QuestData" then
            return true
        end
    end
    return false
end
function CheckNameMobDoubleQuest()
    local a
    if CheckDataQuest() then
        for r, v in next, a3.Data.QuestData.Task do
            a = r
        end
    end
    return a
end
function KillAura()
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade") then
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                repeat wait()
                    v.Humanoid.Health = 0
                    sethiddenproperty(plr, "SimulationRadius", math.huge)
                until not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent 
            end
        end
    end
end
function CheckDoubleQuestSkidcuaYMF()
    S()
    local a5 = {}
    if
        plr.Data.Level.Value >= 10 and Bulon["Double Quest"] and CheckDataQuest() and
            CheckNameMobDoubleQuest() == Mob1 and
            #CheckNameMobDoubleQuest() > 2
     then
        for r, v in pairs(Q) do
            for M, N in pairs(v) do
                for O, P in pairs(N.Task) do
                    if tostring(O) == Mob1 then
                        for a6, a7 in next, v do
                            for a8, a9 in next, a7.Task do
                                if a8 ~= Mob1 and a9 > 1 then
                                    if a7.LevelReq <= plr.Data.Level.Value then
                                        a5["Name"] = tostring(a8)
                                        a5["Mob2"] = r
                                        a5["ID"] = a6
                                    else
                                        a5["Name"] = Mob1
                                        a5["Mob2"] = Mob2
                                        a5["ID"] = Mob3
                                    end
                                    return a5
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        a5["Name"] = Mob1
        a5["Mob2"] = Mob2
        a5["ID"] = Mob3
        return a5
    end
    a5["Name"] = Mob1
    a5["Mob2"] = Mob2
    a5["ID"] = Mob3
    return a5
end
function MobLevel1OrMobLevel2()
    local aa = {}
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if
            not table.find(aa, v.Name) and v:IsA("Model") and v.Name ~= "PirateBasic" and
                v.Name ~= "FishBoat" and
                not string.find(v.Name, "Brigade") and
                v:FindFirstChild("Humanoid") and
                v.Humanoid.Health > 0 and
                v:FindFirstChild("HumanoidRootPart")
         then
            table.insert(aa, v.Name)
        end
    end
    for r, v in pairs(aa) do
        local ab = v
        v = tostring(v:gsub(" %pLv. %d+%p", ""))
        if tostring(v) == CheckNameMobDoubleQuest() then
            return tostring(ab)
        end
    end
    return false
end

local GuideModule = require(Rc.GuideModule)
function NpcPos()
    for i,v in pairs(GuideModule["Data"]["NPCList"]) do
        if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
            return i["CFrame"]
        end
    end
end

Mob = ""
Mob1 = ""
if game.Workspace:FindFirstChild("MobSpawns") then
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "MobSpawns" then
            v:Destroy()
        end
    end
end
local CreateFoldermmb = Instance.new("Folder")
CreateFoldermmb.Parent = game.Workspace
CreateFoldermmb.Name = "MobSpawns"

function RemoveLevelTitle(v)
    return tostring(tostring(v):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
end 
spawn(
    function()
        while wait() do 
            for i,v in pairs(game.workspace.MobSpawns:GetChildren()) do  
                v.Name = RemoveLevelTitle(v.Name)
            end
        end
    end
)
function MobDepTrai()
    MobDepTraiTable = {}
    for i, v in pairs(WS["_WorldOrigin"].EnemySpawns:GetChildren()) do
        table.insert(MobDepTraiTable, v)
    end
    local tablefoldermmb = {}
    for i, v in next, require(Rc.Quests) do
        for i1, v1 in next, v do
            for i2, v2 in next, v1.Task do
                if v2 > 1 then
                    table.insert(tablefoldermmb, i2)
                end
            end
        end
    end
    for i, v in pairs(getnilinstances()) do
        if table.find(tablefoldermmb, RemoveLevelTitle(v.Name)) then
            table.insert(MobDepTraiTable, v)
        end
    end
    return MobDepTraiTable
end
local MobSpawnList = MobDepTrai()
function ReloadFolderMob()
    for i, v in next, game.Workspace.MobSpawns:GetChildren() do
        v:Destroy()
    end
    for i, v in pairs(MobSpawnList) do
        if v then
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                MobNew = Instance.new("Part")
                MobNew.CFrame = v.HumanoidRootPart.CFrame
                MobNew.Name = v.Name
                MobNew.Anchored = true
                MobNew.Transparency = 1
                MobNew.CanCollide = false
                MobNew.Parent = game.Workspace.MobSpawns
            elseif v:IsA("Part") then
                MobNew = v:Clone()
                MobNew.Parent = game.Workspace.MobSpawns
            end
        end
    end
end
ReloadFolderMob()
function GetMobSpawnList(a)
    a = RemoveLevelTitle(a)
    k = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if v.Name == a then
            table.insert(k, v)
        end
    end
    return k
end
function EquipTool(c)
    local tool = plr.Backpack:FindFirstChild(c)
    if tool then
        wait(0.5)
        plr.Character.Humanoid:EquipTool(tool)
    end
end
function GetMob()
    local tablegetmob = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if not table.find(tablegetmob, v.Name) then
            table.insert(tablegetmob, v.Name)
        end
    end
    if string.find(WS["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(tablegetmob) do
            local b = v
            v = tostring(v:gsub(" %pLv. %d+%p", ""))
            if v == CheckNameMobDoubleQuest() then
                return b
            end
        end
    else
        return CheckNameMobDoubleQuest()
    end
end
function DetectFruit()
    for i,v in pairs(WS:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function GetMobName(Name)
    local tablegetmob = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if not table.find(tablegetmob, v.Name) then
            table.insert(tablegetmob, v.Name)
        end
    end
    if string.find(WS["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(tablegetmob) do
            local b = v
            v = tostring(v:gsub(" %pLv. %d+%p", ""))
            if v == Name then
                return b
            end
        end
    else
        return Name
    end
end

function GetDistance(a)
    if typeof(a) == "CFrame" then
        return (a.Position - plr.Character.HumanoidRootPart.Position).Magnitude
    elseif typeof(a) == "Vector3" then
        return (a - plr.Character.HumanoidRootPart.Position).Magnitude
    end
end

function GetQuest()
    if (NpcPos().Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
        Rc.Remotes["CommF_"]:InvokeServer("StartQuest", tostring(CheckDoubleQuestSkidcuaYMF().Mob2), CheckDoubleQuestSkidcuaYMF().ID)
    else
        ToBypass(NpcPos())
    end
end

function SendKey(Name, Hold)
    if Hold == nil then
        Hold = 0
    end
    game:service("VirtualInputManager"):SendKeyEvent(true, Name, false, game)
    wait(Hold)
    game:service("VirtualInputManager"):SendKeyEvent(false, Name, false, game)
end
function DetectChest()
    local Distochest = math.huge
    local nahidwin 
    for i, v in pairs(WS:GetChildren()) do
        if string.find(v.Name, "Chest") then
            if GetDistance(v.Position) < Distochest then
                Distochest = GetDistance(v.Position)
                nahidwin = v
            end
        end
    end
    if not nahidwin then
        for i, v in pairs(WS:GetChildren()) do
            if string.find(v.Name, "Chest") and v:IsA("Part") then
                if GetDistance(v.Position) < Distochest then
                    Distochest = GetDistance(v.Position)
                    nahidwin = v
                end
            end
        end
    end
    return nahidwin
end

function ClaimQuestRaceV3()
    if Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
        Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
        return
    elseif Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 2 then 
        Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
        return
    elseif Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == -1 then 
        task.wait(2)
        return 
    end
end

ScreenStatus.Name = "Screen Status"
ScreenStatus.Parent = plr:WaitForChild("PlayerGui")

MainStatus.Name = "Main Status"
MainStatus.Parent = ScreenStatus
MainStatus.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainStatus.BackgroundTransparency = 0.100
MainStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainStatus.BorderSizePixel = 0
MainStatus.Position = UDim2.new(0.293686479, 0, 0.137651816, 0)
MainStatus.Size = UDim2.new(0, 394, 0, 65)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = MainStatus

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255, 65, 68)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.5
UIStroke.Parent = MainStatus

TitleStatus.Name = "Title Status"
TitleStatus.Parent = MainStatus
TitleStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleStatus.BackgroundTransparency = 1.000
TitleStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleStatus.BorderSizePixel = 0
TitleStatus.Size = UDim2.new(1, 0, 0, 40)
TitleStatus.Font = Enum.Font.GothamBold
TitleStatus.Text = "Status : Not Farm"
TitleStatus.TextColor3 = Color3.fromRGB(255, 71, 74)
TitleStatus.TextSize = 15.000

TextLabel.Parent = MainStatus
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 17, 0, 33)
TextLabel.Size = UDim2.new(0, 377, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(238, 55, 255)
TextLabel.TextSize = 14.000
TextLabel.TextYAlignment = Enum.TextYAlignment.Top

function SetTitleStatus(cac)
    TitleStatus.Text = cac
end

function SetDescStatus(nigga)
    TextLabel.Text = nigga
end

function GetBoss()
    local Bubu = {}
    if Old_World then
        if Bulon["Select Bosses"] == "The Gorilla King" then
            Bubu["Boss"] = "The Gorilla King"
            Bubu["NameBoss"] = "The Gorrila King"
            Bubu["Boss2"] = "JungleQuest"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            Bubu["PosSpawn"] = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        elseif Bulon["Select Bosses"] == "Bobby" then
            Bubu["Boss"] = "Bobby"
            Bubu["NameBoss"] = "Bobby"
            Bubu["Boss2"] = "BuggyQuest1"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            Bubu["PosSpawn"] = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif Bulon["Select Bosses"] == "The Saw" then
            Bubu["Boss"] = "The Saw"
            Bubu["NameBoss"] = "The Saw"
            Bubu["PosSpawn"] = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif Bulon["Select Bosses"] == "Yeti" then
            Bubu["Boss"] = "Yeti"
            Bubu["NameBoss"] = "Yeti"
            Bubu["Boss2"] = "SnowQuest"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            Bubu["PosSpawn"] = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Bulon["Select Bosses"] == "Mob Leader" then
            Bubu["Boss"] = "Mob Leader"
            Bubu["NameBoss"] = "Mob Leader"
            Bubu["PosSpawn"] = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
        elseif Bulon["Select Bosses"] == "Vice Admiral" then
            Bubu["Boss"] = "Vice Admiral"
            Bubu["NameBoss"] = "Vice Admiral"
            Bubu["Boss2"] = "MarineQuest2"
            Bubu["ID"] = 2
            Bubu["PosQuest"] = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            Bubu["PosSpawn"] = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif Bulon["Select Bosses"] == "Saber Expert" then
            Bubu["NameBoss"] = "Saber Expert"
            Bubu["Boss"] = "Saber Expert"
        elseif Bulon["Select Bosses"] == "Warden" then
            Bubu["Boss"]  = "Warden"
            Bubu["NameBoss"] = "Warden"
            Bubu["Boss2"] = "ImpelQuest"
            Bubu["ID"] = 1
            Bubu["PosSpawn"] = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
            Bubu["PosQuest"] = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif Bulon["Select Bosses"] == "Chief Warden" then
            Bubu["Boss"] = "Chief Warden"
            Bubu["NameBoss"] = "Chief Warden"
            Bubu["Boss2"] = "ImpelQuest"
            Bubu["ID"] = 2
            Bubu["PosSpawn"] = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
            Bubu["PosQuest"] = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        elseif Bulon["Select Bosses"] == "Swan" then
            Bubu["Boss"] = "Swan"
            Bubu["Boss2"] = "ImpelQuest"
            Bubu["ID"] = 3
            Bubu["PosSpawn"] = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            Bubu["PosQuest"] = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
        end
    elseif New_World then
        if Bulon["Select Bosses"] == "Diamond" then
            Bubu["Boss"]  = "Diamond"
            Bubu["Boss2"]  = "Area1Quest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(5114.279296875, 9.9028310775757, 719.58941650391)
            Bubu["PosSpawn"] = CFrame.new(1372.8155517578, 87.272789001465, -1298.3576660156)
        elseif Bulon["Select Bosses"] == "Jeremy" then
            Bubu["Boss"]  = "Jeremy"
            Bubu["Boss2"]  = "ColosseumQuest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(-1576.1173095703, 7.5093946456909, -2983.3073730469)
            Bubu["PosSpawn"] = CFrame.new(-1237.6115722656, 5.8017029762268, -3076.7185058594)
        elseif Bulon["Select Bosses"] == "Fajita" then
            Bubu["Boss"]  = "Fajita"
            Bubu["Boss2"]  = "MarineQuest3"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(-2446.7399902344, 74.964782714844, -3216.4799804688)
            Bubu["PosSpawn"] = CFrame.new(-2358.8688964844, 73.1103515625, -3305.2399902344)
        elseif Bulon["Select Bosses"] == "Don Swan" then
            Bubu["Boss"]  = "Don Swan"
            Bubu["Boss2"]  = "SwanQuest"
            Bubu["ID"]  = 1
            Bubu["PosQuest"]  = CFrame.new(2290.9819335938, 15.177939414978, 663.39105224609)
            Bubu["PosSpawn"] = CFrame.new(2271.7482910156, 15.152039527893, 663.30853271484)
        elseif Bulon["Select Bosses"] == "Cyborg" then
            Bubu["Boss"]  = "Cyborg"
            Bubu["Boss2"]  = "FactoryStaffQuest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(597.17254638672, 73.060737609863, 474.56732177734)
            Bubu["PosSpawn"] = CFrame.new(624.68786621094, 73.00171661377, 472.27352905273)
        elseif Bulon["Select Bosses"] == "Smoke Admiral" then
            Bubu["Boss"]  = "Smoke Admiral"
            Bubu["Boss2"]  = "IceCastleQuest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(5402.6586914063, 28.211332321167, -6198.9243164063)
            Bubu["PosSpawn"] = CFrame.new(5646.5595703125, 28.211324691772, -6097.9428710938)
        elseif Bulon["Select Bosses"] == "Stone" then
            Bubu["Boss"]  = "Stone"
            Bubu["Boss2"]  = "FountainQuest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(5147.8564453125, 10.195321083069, 4139.7041015625)
            Bubu["PosSpawn"] = CFrame.new(4951.8032226563, 10.195321083069, 4094.3051757813)
        elseif Bulon["Select Bosses"] == "Darkbeard" then
            Bubu["Boss"]  = "Darkbeard"
            Bubu["PosSpawn"] = CFrame.new(3840.9926757813, 23.209297180176, -3635.8227539063)
        elseif Bulon["Select Bosses"] == "Tide Keeper" then
            Bubu["Boss"]  = "Tide Keeper"
            Bubu["Boss2"]  = "ForgottenQuest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(-3050.3786621094, 238.84680175781, -10184.040039063)
            Bubu["PosSpawn"] = CFrame.new(-3005.2346191406, 238.84678649902, -10158.969726563)
        elseif Bulon["Select Bosses"] == "Train Head" then
            Bubu["Boss"]  = "Train Head"
            Bubu["Boss2"]  = "Area2Quest"
            Bubu["ID"]  = 3
            Bubu["PosQuest"]  = CFrame.new(-3950.6845703125, 90.447479248047, 1931.6348876953)
            Bubu["PosSpawn"] = CFrame.new(-3954.6694335938, 89.685485839844, 1931.3693847656)
        end
    elseif Third_World then
        if Bulon["Select Bosses"] == "Stone" then
            Bubu["Boss"] = "Stone"
            Bubu["Boss2"] = "PiratePortQuest"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            Bubu["PosSpawn"] = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif Bulon["Select Bosses"] == "Island Empress" then
            Bubu["Boss"] = "Island Empress"
            Bubu["Boss2"] = "AmazonQuest2"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
            Bubu["PosSpawn"] = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
        elseif Bulon["Select Bosses"] == "Kilo Admiral" then
            Bubu["Boss"] = "Kilo Admiral"
            Bubu["Boss2"] = "MarineTreeIsland"
            Bubu["ID"] = 3
            Bubu["PosQuest"] = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            Bubu["PosSpawn"] = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        end
    end
    return Bubu
end

function NameMelee()
    for r, v in next, plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
    for r, v in next, plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
end

function NameSword()
    for r, v in next, plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
    for r, v in next, plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
end
function checkskillDF()
    if not plr.PlayerGui.Main.Skills:FindFirstChild(plr.Data.DevilFruit.Value) then
        equipweapon(plr.Data.DevilFruit.Value)
        return false
    end
    for r, v in next, plr.PlayerGui.Main.Skills[plr.Data.DevilFruit.Value]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                if v.Name ~= "F" and v.Name ~= "V" then
                    return v.Name
                end
            end
        end
    end
end
function checkskillSword()
    if not NameSword() then
        return
    end
    if not plr.PlayerGui.Main.Skills:FindFirstChild(NameSword()) then
        equipweapon(NameSword())
        return false
    end
    for r, v in next, plr.PlayerGui.Main.Skills[NameSword()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function NameGun()
    dick = plr.Backpack or plr.Character
    for r, v in pairs(dick:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == "Gun" then
            return v.Name
        end
    end
end
function checkskillGun()
    if not NameGun() then
        return nil
    end
    if not plr.PlayerGui.Main.Skills:FindFirstChild(NameGun()) then
        equipweapon(NameGun())
        return false
    end
    for r, v in next, plr.PlayerGui.Main.Skills[NameGun()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function equipweapon(aq)
    local c6 = tostring(aq)
    local c7 = plr.Backpack:FindFirstChild(c6)
    local c8 = plr.Character:FindFirstChild("Humanoid") or plr.Character:WaitForChild("Humanoid")
    if c7 then
        c8:EquipTool(c7)
    end
end
function checkskillMelee()
    if not plr.PlayerGui.Main.Skills:FindFirstChild(NameMelee()) then
        equipweapon(NameMelee())
        return false
    end
    for r, v in next, plr.PlayerGui.Main.Skills[NameMelee()]:GetChildren() do
        if v:IsA("Frame") then
            if
                v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and
                    v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or
                    v.Cooldown.Size == UDim2.new(1, 0, 1, -1)
             then
                return v.Name
            end
        end
    end
end
function EquipWeaponName(m)
    if not m then
        return
    end
    ToolSe = m
    if plr.Backpack:FindFirstChild(ToolSe) then
        local bi = plr.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        plr.Character.Humanoid:EquipTool(bi)
    end
end

function IsWpSKillLoaded(bW)
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills:FindFirstChild(bW) then
        return true
    end
end

function EquipAllWeapon()
    u3 = {"Melee", "Blox Fruit", "Sword", "Gun"}
    u3_2 = {}
    for r, v in pairs(u3) do
        u3_3 = GetWP(v)
        table.insert(u3_2, u3_3)
    end
    for r, v in pairs(u3_2) do
        if not IsWpSKillLoaded(v) then
            print(v)
            EquipWeaponName(v)
        end
    end
end

function SendKeyEvents(c9, ca)
    if ca == nil then
        game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
        wait()
        game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
    else
        game:service("VirtualInputManager"):SendKeyEvent(true, c9, false, game)
        wait(ca)
        game:service("VirtualInputManager"):SendKeyEvent(false, c9, false, game)
    end
end

spawn(
    function()
        while wait() do
            if SpamSkill then
                sword = checkskillSword()
                meele = checkskillMelee()
                df = checkskillDF()
                gun = checkskillGun()
                if
                    df and Bulon["Use Devil Fruit"] and
                        not string.find(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value, "Portal") and
                        df ~= "F"
                 then
                    EquipWeaponName(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                    local condimebeo = checkskillDF()
                    if condimebeo then
                        SendKeyEvents(condimebeo)
                    end
                elseif checkskillMelee() and Bulon["Use Melee"] then
                    EquipWeaponName(NameMelee())
                    local condimebeo = checkskillMelee()
                    if condimebeo then
                        SendKeyEvents(condimebeo)
                    end
                elseif checkskillSword() and Bulon["Use Sword"] then
                    EquipWeaponName(NameSword())
                    local condimebeo = checkskillSword()
                    if condimebeo then
                        SendKeyEvents(condimebeo)
                    end
                elseif checkskillGun() and Bulon["Use Gun"] then
                    local condimebeo = checkskillGun()
                    EquipWeaponName(NameGun())
                    if condimebeo then
                        SendKeyEvents(condimebeo)
                    end
                else
                    EquipAllWeapon()
                end
            end
        end
    end
)

function TweenTemple()
    if GetDistance(CFrame.new(28734.3945, 14888.2324, -109.071777)) > 1500 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
    if GetDistance(CFrame.new(28734.3945, 14888.2324, -109.071777)) > 1500 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
end

function PullLever()
    local bo = CFrame.new(28576.4688, 14935.9512, 75.469101)
    local bp = 0.2
    if
        WS.Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or
            WS.Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp
     then
        TweenTemple()
        Tween(WS.Map["Temple of Time"].Lever.Part.CFrame)
        for r, v in pairs(WS.Map["Temple of Time"].Lever:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MoonTextureId()
    if Old_World then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif New_World then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif Third_World then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end

local timehop = 30 * 60
spawn(function()
    while wait() do
        if Bulon["Auto Farm"] and Bulon["Anti Flag Reset"] then
            repeat wait()
                wait(timehop)
                HopServer()
                Library:MakeNotify({
                    Title = "Sitink Hub",
                    Content = "Hop Server To Bypass Flag Reset Level!!!",
                    Description = "Notification",
                    Time = 5 
                })
                wait(6)
            until GetBackback("God's Chalice") or GetBackback("Fist Of Darkness") or MoonTextureId() == "http://www.roblox.com/asset/?id=9709149431" or MoonTextureId() == "http://www.roblox.com/asset/?id=9709149052" or Bulon["Auto Farm"] == false or Bulon["Anti Flag Reset"] == false
        end
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall =
    newcclosure(
    function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if AimSkill then
                        args[2] = AimPos
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end
)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Windows = Library:MakeWindow({
	Name = "Sitink Hub", 
	Description = "- Blox Fruit", 
	LogoInfo = "rbxassetid://18448428761",
	NameInfo = "Owner Info",
    NamePlayers = "! Nightx",
    InfoColor = Color3.fromRGB(255, 38, 42),
    LogoPlayers = "rbxassetid://18448428761",
	InfoDesc = "Name : Lương Minh Nghĩa | Birthday : 12/08/2011 | discord.gg/JURvkuHr28"
})

local ShopTab = Windows:MakeTab({Name = "Shop"})
local StatusServerTab = Windows:MakeTab({Name = "Status & Server"})
local SettingsFarmTab = Windows:MakeTab({Name = "Settings Farm"})
local MainFarmTab = Windows:MakeTab({Name = "Main Farm"})
local GetItemTab = Windows:MakeTab({Name = "Get Item"})
local FruitandRaidTab = Windows:MakeTab({Name = "Fruits & Raid"})
local UpgradedRaceTab = Windows:MakeTab({Name = "Upgraded Race"})

-- // Shop \\ --

local SH = ShopTab:MakeSection({
    Title = "World Teleporter",
    Content = "Old World, New World, Third World"
})

SH:MakeButton({
    Name = "Teleport To Old World",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})

SH:MakeButton({
    Name = "Teleport To New Wold",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

SH:MakeButton({
    Name = "Teleport To Third World",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})

local Muado = ShopTab:MakeSection({
    Title = "Shop",
    Content = ""
})

local ToggleRandomBone = Muado:MakeToggle({
    Name = "Auto Random Suprise",
    Description = "",
    Default = Bulon["Auto Random Suprise"],
    Callback = function(Value)
        Bulon["Auto Random Suprise"] = Value
        SaveSettings()
    end
})

Muado:MakeButton(
    {
        Name = "Buy Buso Haki",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        end
    }
)

Muado:MakeButton(
    {
        Name = "Buy Geppo Haki",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        end
    }
)

Muado:MakeButton(
    {
        Name = "Buy Flash Step(Soru)",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        end
    }
)

Muado:MakeButton(
    {
        Name = "Buy Observation(Ken) Haki",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
        end
    }
)

spawn(function()
    while task.wait() do
        if Bulon["Auto Random Suprise"] then
            Rc.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)

-- // Status & Server \\ --

local SttSv = StatusServerTab:MakeSection({
    Title = "Status Server",
    Content = "Status Client Time, Elite Spawn, Nigga"
})

local TimeClient = SttSv:MakeParagraph({
    Title = "Client Time",
    Description = "Client Time = 0 Hours 0 Minutes 0 Seconds"
})

spawn(function()
    while wait() do
        local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local Hour = math.floor(GameTime / (60 ^ 2)) % 24
        local Minute = math.floor(GameTime / (60 ^ 1)) % 60
        local Second = math.floor(GameTime / (60 ^ 0)) % 60
        TimeClient:Set({Content = "Client Time : ".. Hour .. " Hours " .. Minute .. " Minutes " .. Second .. " Seconds"})
    end
end)

local EliteStt = SttSv:MakeParagraph({
    Title = "Elite Status : Not Spawned",
    Content = ""
})

local MobElite = {
    "Diablo",
    "Urban",
    "Deandre"
}

function DetectElite()
    for i, v in pairs(Rc:GetChildren()) do
        if table.find(MobElite, v.Name) then
            if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if table.find(MobElite, v.Name) then
            if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
end

spawn(function()
    while wait() do
        if DetectElite() then
            EliteStt:Set({Title = "Elite Status : Spawned"})
        else
            EliteStt:Set({Title = "Elite Status : Not Spawned"})
        end
    end
end)

local MirageStt = SttSv:MakeParagraph({
    Title = "Mirage Status : Not Found",
    Content = ""
})

function DetectMirage()
    if WS.Map:FindFirstChild("MysticIsland") then
        return true
    else
        return false
    end
end

spawn(function()
    while wait() do
        if DetectMirage() then
            MirageStt:Set({Title = "Mirage Status : Spawned"})
        else
            MirageStt:Set({Title = "Mirage Status : Not Found"})
        end
    end
end)


local Sv = StatusServerTab:MakeSection({
    Title = "Server",
    Content = "Copy Job Id, Join Job Id, Put Job Id,..."
})

Sv:Section("Hopping")

local ToggleHopMoon = Sv:MakeToggle({
    Name = "Hop Sever Find Moon 3/4 or 4/4",
    Description = "",
    Default = Bulon["Hop Sever Find Moon 3/4 or 4/4"],
    Callback = function(Value)
        Bulon["Hop Sever Find Moon 3/4 or 4/4"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["Hop Sever Find Moon 3/4 or 4/4"] then
            if MoonTextureId() == "http://www.roblox.com/asset/?id=9709149431" or MoonTextureId() == "http://www.roblox.com/asset/?id=9709149052" then
                Library:MakeNotify({
                    Title = "Sitink Hub",
                    Content = "Turn Off p Sever Find Moon 3/4 or 4/4 Please!!!",
                    Description = "Notification",
                    Time = 5 
                })
                wait(6)
            elseif MoonTextureId() ~= "http://www.roblox.com/asset/?id=9709149431" and MoonTextureId() ~= "http://www.roblox.com/asset/?id=9709149052" then
                HopServer()
            end
        end
    end
end)

local ToggleHopMirage = Sv:MakeToggle({
    Name = "Hop Server Find Mirage Island",
    Description = "",
    Default = Bulon["Hop Server Find Mirage Island"],
    Callback = function(Value)
        Bulon["Hop Server Find Mirage Island"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["Hop Server Find Mirage Island"] then
            if WS.Map:FindFirstChild("MysticIsland") then
                Library:MakeNotify({
                    Title = "Sitink Hub",
                    Content = "Turn Off Hop Server Find Mirage Island Please!!!",
                    Description = "Notification",
                    Time = 5 
                })
                wait(6)
            elseif not WS.Map:FindFirstChild("MysticIsland") then
                HopServer()
            end
        end
    end
end)

Sv:Section("Server")

Sv:MakeTextBox({
    Name = "Put Job Id Here",
    Default = "...",
    Callback = function(Value)
        JobId = Value
    end
})

Sv:MakeButton({
    Name = "Copy Job Id",
    Description = "",
    Callback = function()
        setclipboard(game.JobId)
    end
})

Sv:MakeButton({
    Name = "Join Job Id",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, JobId, plr)
    end
})

Sv:MakeButton({
    Name = "Hop Server",
    Description = "",
    Callback = function()
        HopServer()
    end
})

Sv:MakeButton({
    Name = "Hop Server Low Players",
    Description = "",
    Callback = function()
        HopServer(6)
    end
})

Sv:MakeButton({
    Name = "Rejoin",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
    end
})

-- // Settings Farm \\ --

local StFarm = SettingsFarmTab:MakeSection({
    Title = "Dropdown Selected",
    Content = "Select Fast Delay, Weapons"
})

local DropdownSelectWP = StFarm:MakeDropdown({
    Name = "Select Weapon",
    Description = "",
    Options = {"Melee", "Sword"},
    Default = Bulon["Select WP"],
    Callback = function(Value)
        Bulon["Select WP"] = Value
        SaveSettings()
    end
})

local DropdownSelectDelay = StFarm:MakeDropdown({
    Name = "Select FastAttack Delay",
    Description = "",
    Options = {"0.1", "0.2", "0.3"},
    Default = Bulon["DelayAttack"],
    Callback = function(Value)
        Bulon["DelayAttack"] = Value
        SaveSettings()
    end
})

local Delay = 0
spawn(function()
    while wait() do
        if Bulon["DelayAttack"] then
            if Delay == 0 or Bulon["DelayAttack"] == nil or Bulon["DelayAttack"] == "" then
                Delay = 0.175
            elseif Bulon["DelayAttack"] == "0.3" then
                Delay = 0.15
            elseif Bulon["DelayAttack"] == "0.2" then
                Delay = 0.1
            elseif Bulon['DelayAttack'] == "0.1" then
                Delay = 0.05
            end
        end
    end
end)

local DropdownSelectSpeed = StFarm:MakeDropdown({
    Name = "Tween Speed",
    Description = "",
    Options = {"350", "325", "300", "270", "180"},
    Default = Bulon["Tween Speed"],
    Callback = function(Value)
        Bulon["Tween Speed"] = Value
        SaveSettings()
    end
})

local StToggle = SettingsFarmTab:MakeSection({
    Title = "Toggle Selected",
    Content = "Toggle Auto Buso, Observation, ..."
})

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]

function CurrentWeapon()
    local ac = CombatFrameworkR.activeController
    local ret = ac.blades[1]
    if not ret then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
    end
    pcall(
        function()
            while ret.Parent ~= game.Players.LocalPlayer.Character do
                ret = ret.Parent
            end
        end
    )
    if not ret then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
    end
    return ret
end
function Attack2()
    if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
        return nil
    end
    local ac = CombatFrameworkR.activeController
    ac.hitboxMagnitude = 55
    if ac and ac.equipped then
        for indexincrement = 1, 1 do
            local bladehit = require(Rc.CombatFramework.RigLib).getBladeHits(
            game.Players.LocalPlayer.Character,
            { game.Players.LocalPlayer.Character.HumanoidRootPart },
            60
        )
            if #bladehit > 0 then
                local AcAttack8 = debug.getupvalue(ac.attack, 5)
                local AcAttack9 = debug.getupvalue(ac.attack, 6)
                local AcAttack7 = debug.getupvalue(ac.attack, 4)
                local AcAttack10 = debug.getupvalue(ac.attack, 7)
                local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                local NumberAc13 = AcAttack7 * 798405
                (function()
                    NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                    AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                    AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                end)()
                AcAttack10 = AcAttack10 + 1
                debug.setupvalue(ac.attack, 5, AcAttack8)
                debug.setupvalue(ac.attack, 6, AcAttack9)
                debug.setupvalue(ac.attack, 4, AcAttack7)
                debug.setupvalue(ac.attack, 7, AcAttack10)
                for k, v in pairs(ac.animator.anims.basic) do
                    v:Play()
                end
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(CurrentWeapon()))
                    Rc.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                end
            end
        end
    end
end

function DoAttack()
    pcall(function()
        Attack2()
    end)
end

spawn(function()
    while wait(Delay) do
        DoAttack()
    end
end)

local ToggleAntiFlagReset = StToggle:MakeToggle({
    Name = "Anti Flags Reset",
    Description = "Hop Server Per 30 Minutes If Farm",
    Default = Bulon["Anti Flag Reset"],
    Callback = function(Value)
        Bulon["Anti Flag Reset"] = Value
        SaveSettings()
    end
})

local ToggleAutoBuso = StToggle:MakeToggle({
    Name = "Auto Buso",
    Description = "Auto Turn On Buso",
    Default = true,
    Callback = function(Value)
        Bulon["Auto Buso"] = Value
    end
})

local ToggleAutoObservation = StToggle:MakeToggle({
    Name = "Auto Observation",
    Description = "",
    Default = Bulon['Auto Observation'],
    Callback = function(Value)
        Bulon["Auto Observation"] = Value
        SaveSettings()
    end
})

local ToggleAutoV4 = StToggle:MakeToggle({
    Name = "Auto Awakening Race",
    Description = "",
    Default = Bulon["Auto Awakening Race"],
    Callback = function(Value)
        Bulon["Auto Awakening Race"] = Value
        SaveSettings()
    end
})

function Ken()
    if plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("ScreenGui") and plr.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        return
    else
        wait(1)
        game:service("VirtualUser"):CaptureController()
        game:service("VirtualUser"):SetKeyDown("0x65")
        wait(2)
        game:service("VirtualUser"):SetKeyUp("0x65")
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Buso"] then
            Buso()
        end
        if Bulon['Auto Observation'] then
            Ken()
        end
        if Bulon["Auto Awakening Race"] then
            if plr.Character:FindFirstChild("RaceEnergy") and plr.Character.RaceEnergy.Value >= 1 and not plr.Character.RaceTransformed.Value then
                SendKey("Y")
            end
        end
    end
end)

StatsOptions = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}
local DropdownSelectStats = StToggle:MakeDropdown({
    Name = "Select Stats",
    Description = "Select Stats To Add",
    Options = StatsOptions,
    Default = Bulon["SelectStats"],
    Callback = function(Value)
        Bulon["SelectStats"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["SelectStats"] ~= nil and Bulon["SelectStats"] ~= "" then
            if game:GetService("Players").LocalPlayer.Data.Stats[Bulon["SelectStats"]].Level.Value <= 2549 then
                local args = {
                    [1] = "AddPoint",
                    [2] = Bulon["SelectStats"],
                    [3] = 9999
                }
                Rc.Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

StToggle:Section("Use Skill")

local ToggleUseDF = StToggle:MakeToggle({
    Name = "Use Devil Fruit",
    Description = "",
    Default = Bulon["Use Devil Fruit"],
    Callback = function(Value)
        Bulon["Use Devil Fruit"] = Value
        SaveSettings()
    end
})

local ToggleUseMelee = StToggle:MakeToggle({
    Name = "Use Melee",
    Description = "",
    Default = Bulon["Use Melee"],
    Callback = function(Value)
        Bulon["Use Melee"] = Value
        SaveSettings()
    end
})

local ToggleUseSword = StToggle:MakeToggle({
    Name = "Use Sword",
    Description = "",
    Default = Bulon["Use Sword"],
    Callback = function(Value)
        Bulon["Use Sword"] = Value
        SaveSettings()
    end
})

local ToggleUseGun = StToggle:MakeToggle({
    Name = "Use Gun",
    Description = "",
    Default = Bulon["Use Gun"],
    Callback = function(Value)
        Bulon["Use Gun"] = Value
        SaveSettings()
    end
})

StToggle:Section("Use Skill Trial")

local ToggleUseSkillZ = StToggle:MakeToggle({
    Name = "Use Skill Z",
    Description = "",
    Default = Bulon["Skill Z"],
    Callback = function(Value)
        Bulon["Skill Z"] = Value
        SaveSettings()
    end
})

local ToggleUseSkillX = StToggle:MakeToggle({
    Name = "Use Skill X",
    Description = "",
    Default = Bulon["Skill X"],
    Callback = function(Value)
        Bulon["Skill X"] = Value
        SaveSettings()
    end
})

local ToggleUseSkillC = StToggle:MakeToggle({
    Name = "Use Skill C",
    Description = "",
    Default = Bulon["Skill C"],
    Callback = function(Value)
        Bulon["Skill C"] = Value
        SaveSettings()
    end
})

-- // Main Farm \\ --

local MFarm = MainFarmTab:MakeSection({
    Title = "Main Farm",
    Content = "Auto Farm Bosses, Level, Cake Prince, Bones, ..."
})

local tablecodes = {
    "ADMINHACKED",
    "fruitconcepts",
    "krazydares",
    "kittgaming",
    "TRIPLEABUSE",
    "KITT_RESET",
    "Fudd10",
    "fudd10_v2",
    "Bignews",
    "Sub2CaptainMaui",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "TheGreatAce",
    "SEATROLLING",
    "TRIPLEABUSE",
    "24NOADMIN",
    "ADMIN_TROLL",
    "Axiore",
    "Bignews",
    "Bluxxy",
    "CHANDLER",
    "Enyu_is_Pro",
    "Fudd10",
    "fudd10_v2",
    "JCWK",
    "kittgaming",
    "KITT_RESET",
    "Magicbus",
    "NEWTROLL",
    "SECRET_ADMIN",
    "KITT_RESET",
    "JULYUPDATE_RESET",
    "staffbattle",
    "Sub2CaptainMaui",
    "SUB2GAMERROBOT_RESET1",
    "KittGaming",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "StarcodeHEO",
    "Bluxxy",
    "fudd10_v2",
    "FUDD10",
    "BIGNEWS",
    "THEGREATACE",
    "SUB2GAMERROBOT_EXP1",
    "Sub2OfficialNoobie",
    "StrawHatMaine",
    "SUB2NOOBMASTER123",
    "Sub2UncleKizaru",
    "SUB2DAIGROCK",
    "Axiore",
    "TantaiGaming"
}

MFarm:MakeButton({
    Name = "Redeem All Codes",
    Callback = function()
        for i, v in pairs(tablecodes) do
            Rc.Remotes.Redeem:InvokeServer(v)
        end
    end
})

local DropMethodFarm = MFarm:MakeDropdown({
    Name = "Select Method Farm",
    Description = "",
    Options = {"Level Farm", "Bones Farm", "Cake Prince"},
    Default = Bulon["Select Method Farm"],
    Callback = function(Value)
        Bulon["Select Method Farm"] = Value
        SaveSettings()
    end
})

local ToggleAutoFarm = MFarm:MakeToggle({
    Name = "Auto Farm",
    Description = "Start Auto Farm Method Farm Your Selected",
    Default = Bulon["Auto Farm"],
    Callback = function(Value)
        Bulon["Auto Farm"] = Value
        if Bulon["Auto Farm"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Farm"])
    end
})

local ToggleFarmNearest = MFarm:MakeToggle({
    Name = "Kill Aura",
    Description = "",
    Default = Bulon["FarmNearest"],
    Callback = function(Value)
        Bulon["FarmNearest"] = Value
        if Bulon["FarmNearest"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["FarmNearest"])
    end
})

spawn(function()
    while wait() do
        if Bulon["FarmNearest"] then
            for i, v in pairs(WS.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.HumanoidRootPart.Position) <= 3000 then
                    repeat wait()
                        SetTitleStatus("Status : Farm Nearest Mob")
                        KillMob(v.Name, function()
                            return Bulon["FarmNearest"] == false or not v.Parent or v:FindFirstChild("Humanoid").Health <= 0
                        end)
                    until Bulon["FarmNearest"] == false or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                end
            end
        end
    end
end)

local ToggleDoubleQuest = MFarm:MakeToggle({
	Name = "Double Quet",
	Default = Bulon["Double Quest"],
	Callback = function(Value)
		Bulon["Double Quest"] = Value
        SaveSettings()
	end
})

local ToggleAcceptQuest = MFarm:MakeToggle({
	Name = "Accept Quest",
	Default = Bulon['Accept Quest'],
	Callback = function(Value)
		Bulon['Accept Quest'] = Value
        SaveSettings()
	end
})

local TableMobBones = {
    "Reborn Skeleton",
    "Posessed Mummy",
    "Living Zombie",
    "Demonic Soul",
}

local TableMobCakes = {
    "Baking Staff",
    "Cookie Crafter",
    "Cake Guard",
    "Head Baker"
}

function CheckGlassCake()
    if WS.Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
        return true
    end
    return false
end

function DetectCastleRaiding()
    for i, v in pairs(Rc:GetChildren()) do
        if v.Name ~= 'FishBoat' and not string.find(v.Name, "Brigade") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - CFrame.new(-5496.17432, 313.768921, -2841.53027).Position).Magnitude <= 1500 and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name ~= 'FishBoat' and not string.find(v.Name, "Brigade") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - CFrame.new(-5496.17432, 313.768921, -2841.53027).Position).Magnitude <= 1500 and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

function GetInventory(uwu)
    for k, v in pairs(Rc.Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == uwu then
            return v
        end
    end
end

function CheckSaberDoor()
    for r, v in next, WS.Map.Jungle.Final:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
end

function CheckButtonJungle()
    for r, v in pairs(WS.Map.Jungle.QuestPlates:GetChildren()) do
        if v:IsA("Model") then
            if v.Button:FindFirstChild("TouchInterest") then
                return v
            end
        end
    end
end

function CanGoNewWorld()
    if plr.Data.Level.Value >= 700 and Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
        return true
    end
    if plr.Data.Level.Value < 700 or Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 then
        return false
    end
    return false
end
local TableDauBuoiAcMin = {
    "rip_indra",
    "rip_indra True Form"
}
local BartiloProgess = Rc.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
function CanGoThirdSea()
    if BartiloProgess == 3 then
        if plr.Data.Level.Value >= 1500 then
            if Rc.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
                return false
            elseif not Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then
                if DetectMob2("Don Swan") then
                    return true
                end
            elseif Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                return true
            end
        end
    end
end
function IsIslandRaid(nu)
    if WS["_WorldOrigin"].Locations:FindFirstChild("Island " .. nu) then
        min = 4500
        for i, v in pairs(WS["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for i, v in pairs(WS["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {5,4,3,2,1}
    for i, v in next, TableIslandsRaid do
        if
            IsIslandRaid(v) and
                (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                    4500
         then
            return IsIslandRaid(v)
        end
    end
end
local EliteProgess = Rc.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
IsStackFarm = false
NiggaRaid = false
MultiFarm = false
IsCastleRaid = false
function StackFunc()
    if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then IsStackFarm = true return end
    if NiggaRaid or getNextIsland() or plr.PlayerGui.Main.Timer.Visible == true then IsStackFarm = true return end
    if Bulon["Auto Raid"] and getNextIsland() or plr.PlayerGui.Main.Timer.Visible == true or NiggaRaid then IsStackFarm = true return end
    if Bulon["Auto DarkDagger"] and DetectMob2(TableDauBuoiAcMin) then IsStackFarm = true return end
    if Bulon["Auto Third Sea"] and CanGoThirdSea() then IsStackFarm = true return end
    if Bulon["Auto Yama"] and EliteProgess >= 30 and not GetInventory("Yama") then IsStackFarm = true return end
    if Bulon["Auto Bartilo Quest"] and BartiloProgess ~= 3 and New_World and plr.Data.Level.Value >= 850 then IsStackFarm = true return end
    if Bulon["Auto New World"] and CanGoNewWorld() and Old_World then IsStackFarm = true return end
    if Bulon["Auto Find DF"] and DetectFruit() then IsStackFarm = true return end
    if Bulon["AUTO POLE"] and not GetInventory("Pole (1st From)") and DetectMob2("Thunder God") and Old_World then IsStackFarm = true return end
    if Bulon["AUTO SABER"] and not GetInventory("Saber") and Old_World and not CheckSaberDoor() and plr.Data.Level.Value >= 200 then IsStackFarm = true return end
    if Bulon["AUTO SABER"] and not GetInventory("Saber") and Old_World and CheckSaberDoor() and not DetectMob2("Saber Expert") and plr.Data.Level.Value >= 200 then IsStackFarm = false return end
    if Bulon["AUTO SABER"] and not GetInventory("Saber") and Old_World and CheckSaberDoor() and DetectMob2("Saber Expert") and plr.Data.Level.Value >= 200 then IsStackFarm = true return end
    if Bulon["Auto Find DF"] and DetectFruit() then IsStackFarm = true return end
    if Bulon["Auto Elite"] and DetectElite() and Third_World then IsStackFarm = true return end
    if Bulon["Auto Factory"] and DetectMob2("Core") and New_World then IsStackFarm = true return end
    if Bulon['Auto Castle Raid'] and IsCastleRaid and Third_World then IsStackFarm = true return end
    IsStackFarm = false
    MultiFarm = false
end

function DetectQuestComplete()
    for a, a in pairs(
        game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()
    ) do
        if a.Name == "NotificationTemplate" then
            if string.lower(a.Text):find("quest completed") then
                return true
            end
        end
    end
    return false
end

function GetNotification(ccacc)
    for a, a in pairs(
        game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()
    ) do
        if a.Name == "NotificationTemplate" then
            if string.lower(a.Text):find(ccacc) then
                return true
            end
        end
    end
    return false
end

local killshanda = false
spawn(function()
    while wait() do
        if killshanda then
            if DetectMob("Shanda") then
                repeat wait()
                    KillMob("Shanda", function() return Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 300 or killshanda == false end)
                until Bulon["Auto Farm"] == false or IsStackFarm or killshanda == false or plr.Data.Level.Value >= 300 or not DetectMob("Shanda")
            else
                for i, v in pairs(GetMobSpawnList(GetMobName("Shanda"))) do
                    repeat wait()
                        Tween(v.CFrame * CFrame.new(0, 15, 0))
                    until DetectMob("Shanda") or Bulon["Auto Farm"] == false or IsStackFarm or killshanda == false or plr.Data.Level.Value >= 300 or GetDistance(v.Position) <= 30
                end
            end
        end
    end
end)

function Click()
    local bc = game:GetService("VirtualUser")
    bc:CaptureController()
    bc:ClickButton1(Vector2.new(851, 158), WS.Camera.CFrame)
end

CountClaimQuest = 0
function SkipLevel()
    if plr.Data.Level.Value >= 1 and plr.Data.Level.Value <= 29 then
        if DetectMob("Sky Bandit") then
            repeat wait()
                SetDescStatus("Killing Mob Sky Bandit")
                KillMob("Sky Bandit", function() return Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 end)
            until Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 or not DetectMob("Sky Bandit")
        else
            for i, v in pairs(GetMobSpawnList(GetMobName("Sky Bandit"))) do
                repeat wait()
                    SetDescStatus("Waitting Mob Sky Bandit")
                    Tween(v.CFrame * CFrame.new(0, 15, 0))
                until DetectMob("Sky Bandit") or Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 or GetDistance(v.Position) <= 30
                NoClip = false
            end
        end
    elseif plr.Data.Level.Value >= 30 and plr.Data.Level.Value <= 49 then
        if DetectMob("Shanda") then
            repeat wait()
                SetDescStatus("Killing Mob Shanda")
                KillMob("Shanda", function() return Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 end)
            until Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 or not DetectMob("Shanda")
        else
            for i, v in pairs(GetMobSpawnList(GetMobName("Shanda"))) do
                repeat wait()
                    SetDescStatus("Waitting Mob Shanda")
                    Tween(v.CFrame * CFrame.new(0, 15, 0))
                until DetectMob("Shanda") or Bulon["Auto Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 or GetDistance(v.Position) <= 30
            end
        end
    elseif plr.Data.Level.Value >= 50 and plr.Data.Level.Value <= 299 then
        if not DetectQuestComplete() then
            if plr.PlayerGui.Main.Quest.Visible == false then
                Rc.Remotes["CommF_"]:InvokeServer("PlayerHunter")
                CountClaimQuest = CountClaimQuest + 1
            elseif plr.PlayerGui.Main.Quest.Visible == true then
                local djtmenokhovailon = string.gsub(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat ", "")
                djtmenokhovailon = string.gsub(djtmenokhovailon, " %p(0/1)%p", "")
                if not WS.Characters:FindFirstChild(djtmenokhovailon) and plr.PlayerGui.Main.Quest.Visible == true then
                    Rc.Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game.Players[djtmenokhovailon].Data.Level.Value < 20 or game.Players[djtmenokhovailon].Data.Level.Value >= 150 then
                    Rc.Remotes.CommF_:InvokeServer("AbandonQuest")
                    print(game.Players[djtmenokhovailon].Data.Level.Value)
                end
                if CountClaimQuest >= 15 then
                    HopServer()
                end
                if game.Players[djtmenokhovailon].Data.Level.Value >= 20 and game.Players[djtmenokhovailon].Data.Level.Value < 150 then
                    for i, v in pairs(WS.Characters:GetChildren()) do
                        if v:IsA("Model") then
                            if v.Name == djtmenokhovailon then
                                if v:FindFirstChild("Humanoid").Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                                    if plr.PlayerGui.Main.PvpDisabled.Visible == false then
                                        repeat wait()
                                            SetDescStatus("Killing Players ".. v.Name)
                                            v.HumanoidRootPart.Size = Vector3.new(30, 30, 30)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(math.random(0, 2), math.random(0, 2), math.random(0, 2)))
                                            EquipWeapon()
                                            NoClip = true
                                            Buso()
                                            if GetDistance(v.HumanoidRootPart.Position) <= 10 then
                                                SendKey("X")
                                                Click()
                                                SendKey("Z")
                                            end
                                        until v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or plr.PlayerGui.Main.PvpDisabled.Visible == true
                                    elseif plr.PlayerGui.Main.PvpDisabled.Visible == true then
                                        Rc.Remotes.CommF_:InvokeServer("EnablePvp")
                                        NoClip = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif DetectQuestComplete() then
            print("caiditmemay")
            killshanda = true
        end
    elseif plr.Data.Level.Value >= 300 then
        killshanda = false
    end
end

local TableCakePrince = {
    "Dough King",
    "Cake Prince"
}

function AutoFarm()
    if IsStackFarm == true then 
        return 
    end
    if Bulon["Select Method Farm"] == "Bones Farm" then
        SetTitleStatus("Status : Bones Farm")
        if DetectMob(TableMobBones) then
            for i, v in pairs(WS.Enemies:GetChildren()) do
                if table.find(TableMobBones, v.Name) then
                    if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            SetDescStatus("Killing Mob ".. v.Name)
                            KillMob(v.Name, function() return Bulon["Select Method Farm"] ~= "Bones Farm" or Bulon["Auto Farm"] == false end)
                        until Bulon["Select Method Farm"] ~= "Bones Farm" or Bulon["Auto Farm"] == false or IsStackFarm or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                    end
                end
            end
        else
            for i, v in pairs(WS.MobSpawns:GetChildren()) do
                if table.find(TableMobBones, v.Name) then
                    repeat wait()
                        NoClip = true
                        SetDescStatus("Waitting Mob "..v.Name)
                        ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                    until DetectMob(TableMobBones) or Bulon["Select Method Farm"] ~= "Bones Farm" or Bulon["Auto Farm"] == false or IsStackFarm or GetDistance(v.Position) <= 30
                    NoClip = false
                end
            end
        end
    elseif Bulon["Select Method Farm"] == "Cake Prince" then
        SetTitleStatus("Status : Cake Prince Farm")
        local v = DetectMob2(TableCakePrince)
        if not CheckGlassCake() and v then
            repeat wait()
                KillMob(v.Name, Bulon["Select Method Farm"] ~= "Cake Prince" or Bulon["Auto Farm"] == false)
            until CheckGlassCake() or not DetectMob2(TableCakePrince) or Bulon["Select Method Farm"] ~= "Cake Prince" or Bulon["Auto Farm"] == false or IsStackFarm or IsStackFarm
        elseif CheckGlassCake() and not DetectMob2(TableCakePrince) then
            if DetectMob(TableMobCakes) then
                for i, v in pairs(WS.Enemies:GetChildren()) do
                    if table.find(TableMobCakes, v.Name) then
                        if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat wait()
                                SetDescStatus("Killing Mob ".. v.Name)
                                KillMob(v.Name, function() return Bulon["Select Method Farm"] ~= "Cake Prince" or Bulon["Auto Farm"] == false end)
                            until Bulon["Select Method Farm"] ~= "Cake Prince" or Bulon["Auto Farm"] == false or IsStackFarm or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                        end
                    end
                end
            else
                for i, v in pairs(WS.MobSpawns:GetChildren()) do
                    if table.find(TableMobCakes, v.Name) then
                        repeat wait()
                            NoClip = true
                            SetDescStatus("Waitting Mob "..v.Name)
                            ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                        until DetectMob(TableMobCakes) or Bulon["Select Method Farm"] ~= "Cake Prince" or Bulon["Auto Farm"] == false or IsStackFarm or GetDistance(v.Position) <= 30
                        NoClip = false
                    end
                end
            end
        end
    elseif Bulon["Select Method Farm"] == "Level Farm" then
        if plr.Data.Level.Value < 300 then
            SkipLevel()
        elseif plr.Data.Level.Value >= 300 then
            killshanda = false
            SetTitleStatus("Status : Farm Level")
            if plr.PlayerGui.Main:FindFirstChild("Quest").Visible and not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "(0/1)") then
                if MobLevel1OrMobLevel2() then
                    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == MobLevel1OrMobLevel2() then
                            if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    SetDescStatus("Killing Mob ".. v.Name)
                                    KillMob(v.Name, function() 
                                        return Bulon["Select Method Farm"] ~= "Level Farm" or 
                                        Bulon["Auto Farm"] == false or IsStackFarm or 
                                        not plr.PlayerGui.Main:FindFirstChild("Quest").Visible 
                                    end)                                    
                                until Bulon["Select Method Farm"] ~= "Level Farm" or Bulon["Auto Farm"] == false or IsStackFarm or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                            end
                        end
                    end
                elseif not MobLevel1OrMobLevel2() then
                    for i, v in pairs(GetMobSpawnList(GetMob())) do
                        repeat wait()
                            SetDescStatus("Waitting Mob ".. CheckNameMobDoubleQuest() .. "")
                            NoClip = true
                            ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                        until MobLevel1OrMobLevel2() or Bulon["Select Method Farm"] ~= "Level Farm" or Bulon["Auto Farm"] == false or IsStackFarm or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or GetDistance(v.Position) <= 30 or IsStackFarm
                        NoClip = false
                    end
                end
            elseif not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "(0/1)") then
                SetDescStatus("Claim Quest Level Farm")
                GetQuest()
            end
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Farm"] then
            StackFunc()
        end
    end
end)

spawn(function()
    while task.wait() do
        if Bulon["Auto Farm"] then
            AutoFarm()
        end
    end
end)

MFarm:Section("Others Farmming")

local ToggleElite = MFarm:MakeToggle({
    Name = "Auto Elite",
    Description = "",
    Default = Bulon["Auto Elite"],
    Callback = function(Value)
        Bulon["Auto Elite"] = Value
        if Bulon["Auto Elite"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Elite"])
    end
})

local ToggleEliteHop = MFarm:MakeToggle({
    Name = "Auto Elite Hop",
    Description = "",
    Default = Bulon["Auto Elite Hop"],
    Callback = function(Value)
        Bulon["Auto Elite Hop"] = Value
        SaveSettings()
    end
})

function AutoElite()
    if Bulon["Auto Raid"] and getNextIsland() or plr.PlayerGui.Main.Timer.Visible == true or NiggaRaid then return end
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if Bulon["Auto Yama"] and EliteProgess >= 30 and not GetInventory("Yama") then return end
    local v = DetectElite()
    if v then
        SetTitleStatus("Status : Farm Elite")
        local nahidwin = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
        if plr.PlayerGui.Main.Quest.Visible == false or not string.find(nahidwin, "Diablo") and not string.find(nahidwin, "Deandre") and not string.find(nahidwin, "Urban") then
            Rc.Remotes.CommF_:InvokeServer("EliteHunter")
        elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(nahidwin, "Diablo") or string.find(nahidwin, "Deandre") or string.find(nahidwin, "Urban") then
            repeat wait()
                SetDescStatus("Killing Mob Elite")
                KillMob(v.Name, function() return Bulon["Auto Elite"] == false end)
            until not DetectElite() or Bulon["Auto Elite"] == false
        end
    else
        if Bulon["Auto Elite Hop"] == true then
            HopServer()
            Library:MakeNotify({
                Title = "Sitink Hub",
                Content = "Hop Server Find Elite",
                Description = "Auto Elite",
                Time = 5 
            })
            wait(6)
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Elite"] and Third_World then
            AutoElite()
        end
    end
end)

local ToggleFactory = MFarm:MakeToggle({
    Name = "Auto Factory",
    Description = "",
    Default = Bulon["Auto Factory"],
    Callback = function(Value)
        Bulon["Auto Factory"] = Value
        if Bulon["Auto Factory"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Factory"])
    end
})

MFarm:MakeToggle({
    Name = "Hop Server Find Factoy",
    Default = Bulon["Auto Factory Hop"],
    Callback = function(Value)
        Bulon["Auto Factory Hop"] = Value
        SaveSettings()
    end
})

function AutoFactory()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    local v = DetectMob2("Core")
    if v then
        SetTitleStatus("Farmming Factory")
        repeat wait()
            SetDescStatus("Killing Factory")
            KillMob(v.Name, function() return Bulon["Auto Factory"] == false end)
        until not DetectMob2("Core") or Bulon["Auto Factory"] == false
    else
        if Bulon["Auto Factory Hop"] == true then
            SetDescStatus("Hop Server Find Factory")
            HopServer()
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Factory"] and New_World then
            AutoFactory()
        end
    end
end)

function RaidCastle()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    local v = DetectCastleRaiding()
    if v then
        SetTitleStatus("Status : Farm Castle Raid")
        repeat wait()
            SetDescStatus("Killing Mob ".. v.Name)
            KillMob(v.Name, function() return Bulon["Auto Castle Raid"] == false end)
        until Bulon["Auto Castle Raid"] == false or not v.Parent
    end
end

local ToggleRaidCastle = MFarm:MakeToggle({
    Name = "Auto Castle Raid",
    Description = "",
    Default = Bulon["Auto Castle Raid"],
    Callback = function(Value)
        Bulon["Auto Castle Raid"] = Value
        if Bulon["Auto Castle Raid"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Castle Raid"])
    end
})

spawn(function()
    while task.wait() do
        if Bulon["Auto Castle Raid"] and Third_World then
            if DetectCastleRaiding() then
                IsCastleRaid = true
                local TimeRaid = tick()
                repeat task.wait()
                    if DetectCastleRaiding() then
                        TimeRaid = tick()
                    end
                until tick() - TimeRaid >= 20 or Bulon["Auto Castle Raid"] == false or GetNotification("Good job!")
                IsCastleRaid = false
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if Bulon["Auto Castle Raid"] and Third_World then
            RaidCastle()
        end
    end
end)

MFarm:Section("Bosses")

if Old_World then
    TableBoss  = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Saber Expert"
    }
elseif New_World then
    TableBoss  = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    }
elseif Third_World then
    TableBoss  = {
        "Stone",
        "Island Empress",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen"
    }
end

local StatusBoss  = MFarm:MakeParagraph({Title = "Status Bosses : Not Spawned", Content = ""})

spawn(function()
    while wait() do
        if DetectMob2(Bulon["Select Bosses"]) then
            StatusBoss:Set({Title = "Status Bosses : Spawned"})
        else
            StatusBoss:Set({Title = "Status Bosses : Not Spawned"})
        end
    end
end)

local DropDownBosses = MFarm:MakeDropdown({
    Name = "Boss List",
    Description = "",
    Options = TableBoss,
    Default = Bulon["Select Bosses"],
    Callback = function(Value)
        Bulon["Select Bosses"] = Value
        SaveSettings()
    end
})

local ToggleAutoBoss  = MFarm:MakeToggle({
    Name = "Auto Boss",
    Description = "",
    Default = Bulon['Auto Bosses'],
    Callback = function(Value)
        Bulon['Auto Bosses'] = Value
        if Bulon["Auto Bosses"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon['Auto Bosses'])
    end
})

MFarm:MakeToggle({
    Name = "Claim Quest",
    Default = Bulon["Claim Quest Bosses"],
    Callback = function(Value)
        Bulon["Claim Quest Bosses"] = Value
        SaveSettings()
    end
})

MFarm:MakeToggle({
    Name = "Hop Find Boss",
    Default = Bulon["Hop Find Boss"],
    Callback = function(Value)
        Bulon["Hop Find Boss"] = Value
        SaveSettings()
    end
})

function AutoBosses()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    SetTitleStatus("Status : Auto Bosses")
    if DetectMob2(Bulon["Select Bosses"]) then
        if Bulon["Claim Quest Bosses"] and plr.PlayerGui.Main.Quest.Visible == false then
            if GetDistance(GetBoss()["PosQuest"].Position) <= 10 then
                Rc.Remotes["CommF_"]:InvokeServer("StartQuest", tostring(GetBoss()["Boss2"]), GetBoss()["ID"])
            else
                SetDescStatus("Claim Quest")
                Tween(GetBoss()["PosQuest"])
            end
        elseif Bulon["Claim Quest Bosses"] and plr.PlayerGui.Main.Quest.Visible == true then
            repeat wait()
                SetDescStatus("Killing Bosses ".. Bulon["Select Bosses"] .. "")
                KillMob(Bulon["Select Bosses"], function() return plr.PlayerGui.Main.Quest.Visible == false or Bulon['Auto Bosses'] == false end)
            until plr.PlayerGui.Main.Quest.Visible == false or not Bulon['Auto Bosses'] or not DetectMob2(Bulon["Select Bosses"])
        elseif not Bulon["Claim Quest Bosses"] then
            repeat wait()
                SetDescStatus("Killing Bosses ".. Bulon["Select Bosses"] .. "")
                KillMob(Bulon["Select Bosses"], function() return Bulon['Auto Bosses'] == false end)
            until not Bulon['Auto Bosses'] or not DetectMob2(Bulon["Select Bosses"])
        end
    else
        if Bulon["Hop Find Boss"] == true then
            SetDescStatus("Hop Server Find Boss " .. Bulon["Select Bosses"] .. "")
            HopServer()
        end
    end
end

spawn(function()
    while wait() do
        if Bulon['Auto Bosses'] then
            AutoBosses()
        end
    end
end)

-- // Get Items \\ --

local GItem = GetItemTab:MakeSection({
    Title = "Sword",
    Content = "Auto Farm Sword, Get Sword"
})

local ToggleAutoSaber = GItem:MakeToggle({
    Name = "Auto Saber",
    Description = "",
    Default = Bulon["AUTO SABER"],
    Callback = function(Value)
        Bulon["AUTO SABER"] = Value
        if Bulon["AUTO SABER"] == false then
            MultiFarm = false
        end
        if Bulon["AUTO SABER"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["AUTO SABER"])
    end
})

GItem:MakeToggle({
    Name = "Hop Find Boss",
    Default = Bulon["Auto Saber Hop"],
    Callback = function(Value)
        Bulon["Auto Saber Hop"] = Value
        SaveSettings()
    end
})

function AutoSaber()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if plr.Data.Level.Value >= 200 then
        SetTitleStatus("Status : Auto Saber")
        if not CheckSaberDoor() then
            if WS.Map.Jungle.QuestPlates.Door.CanCollide then
                pcall(function()
                    SetDescStatus("Tween To Button In Jungle")
                    Tween(CheckButtonJungle().Button.CFrame)
                end)
            else
                if game.Workspace.Map.Desert.Burn.Part.CanCollide == true then
                    if not GetBackback("Torch") then
                        SetDescStatus("Get Torch")
                        Tween(WS.Map.Jungle.Torch.CFrame)
                    elseif GetBackback("Torch") then
                        SetDescStatus("Tween To Desert Door")
                        EquipTool("Torch")
                        Tween(
                            CFrame.new(
                                1114.61475,
                                5.04679728,
                                4350.22803,
                                -0.648466587,
                                -1.28799094e-09,
                                0.761243105,
                                -5.70652914e-10,
                                1,
                                1.20584542e-09,
                                -0.761243105,
                                3.47544882e-10,
                                -0.648466587
                            )
                        )
                    end
                elseif game.Workspace.Map.Desert.Burn.Part.CanCollide == false then
                    if not GetBackback("Cup") then
                        SetDescStatus("Get Cup")
                        if Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 and Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 1 then
                            Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        else
                            SetDescStatus("Claim Quest RichSon")
                            if Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                                Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                            elseif Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                                if DetectMob2("Mob Leader") then
                                    repeat wait()
                                        SetDescStatus("Killing Mob Leader")
                                        KillMob("Mob Leader", function() return Bulon["AUTO SABER"] == false end)
                                    until Bulon["AUTO SABER"] == false or not DetectMob2("Mob Leader")
                                    Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                else
                                    SetDescStatus("Teleport To Mob Leader Spawn")
                                    Tween(CFrame.new(-2967.59521, -4.91089821, 5328.70703))
                                end
                            elseif Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                SetDescStatus("Get Relic")
                                wait(0.3)
                                EquipTool("Relic")
                                wait(0.1)
                                ToBypass(
                                    CFrame.new(
                                        -1404.91504,
                                        29.9773273,
                                        3.80598116,
                                        0.876514494,
                                        5.66906877e-09,
                                        0.481375456,
                                        2.53851997e-08,
                                        1,
                                        -5.79995607e-08,
                                        -0.481375456,
                                        6.30572643e-08,
                                        0.876514494
                                    )
                                )
                            end
                        end                        
                    elseif GetBackback("Cup") then
                        SetDescStatus("Give Cup for SickMan")
                        EquipTool("Cup")
                        wait(0.1)
                        Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", plr.Character.Cup)
                        wait(0.3)
                        Rc.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    end
                end
            end
        else
            if DetectMob2('Saber Expert') then
                repeat wait()
                    MultiFarm = false
                    SetDescStatus("Killing Saber Expert")
                    KillMob("Saber Expert", function() return Bulon["AUTO SABER"] == false end)
                until Bulon["AUTO SABER"] == false
            else
                if Bulon["Auto Saber Hop"] == true then
                    SetDescStatus("Hop Server Find Saber Expert")
                    HopServer()
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["AUTO SABER"] and Old_World and not GetInventory("Saber") then
            AutoSaber()
        end
    end
end)

local ToggleAutoSaber = GItem:MakeToggle({
    Name = "Auto Pole",
    Description = "Auto Pole (1st from)",
    Default = Bulon["AUTO POLE"],
    Callback = function(Value)
        Bulon["AUTO POLE"] = Value
        if Bulon["AUTO POLE"] == false then
            MultiFarm = false
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["AUTO POLE"])
    end
})

GItem:MakeToggle({
    Name = "Hop Find Boss",
    Default = Bulon["Auto Pole Hop"],
    Callback = function(Value)
        Bulon["Auto Pole Hop"] = Value
        SaveSettings()
    end
})

function AutoPole()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if not GetInventory("Pole (1st Form)") then
        if DetectMob2("Thunder God") then
            SetTitleStatus("Status : Auto Pole")
            repeat wait()
                MultiFarm = false
                SetDescStatus("Killing Thunder God")
                KillMob("Thunder God", function() return Bulon["AUTO POLE"] == false end)
            until not DetectMob2("Thunder God") or Bulon["AUTO POLE"] == false or GetInventory("Pole (1st Form)")
        else
            if Bulon["Auto Pole Hop"] == true then
                SetDescStatus("Hop Server Find Boss")
                HopServer()
            end
            if Bulon["Auto Farm"] then
                SetDescStatus("Multi Farm Level")
                MultiFarm = true
            end 
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["AUTO POLE"] and Old_World and not GetInventory("Pole (1st Form)") then
            AutoPole()
        end
    end
end)

local ToggleAutoRengoku = GItem:MakeToggle({
    Name = "Auto Rengoku",
    Description = "",
    Default = Bulon["Auto Rengoku"],
    Callback = function(Value)
        Bulon["Auto Rengoku"] = Value
        SaveSettings()
    end
})

local TableMobRengoku = {
    "Arctic Warrior",
    "Snow Lurker"
}
spawn(function()
    while wait() do
        if Bulon["Auto Rengoku"] and New_World then
            if not GetInventory("Rengoku") then
                SetTitleStatus("Status : Auto Rengoku")
                if not GetBackback("Hidden Key") then
                    if DetectMob2("Awakened Ice Admiral") then
                        repeat wait()
                            SetDescStatus("Killing Bosses : Awakened Ice Admiral")
                            KillMob("Awakened Ice Admiral", function() return Bulon["Auto Rengoku"] == false or GetInventory("Rengoku") end)
                        until Bulon["Auto Rengoku"] == false or GetInventory("Rengoku") or not DetectMob2("Awakened Ice Admiral")
                    else
                        local v = DetectMob2(TableMobRengoku)
                        if v then
                            repeat wait()
                                SetDescStatus("Killing Mob : "..v.Name)
                                KillMob(v.Name, function() return Bulon["Auto Rengoku"] == false or GetInventory("Rengoku") end)
                            until Bulon["Auto Rengoku"] == false or GetInventory("Rengoku") or DetectMob2("Awakened Ice Admiral") or not DetectMob2(TableMobRengoku)
                        else
                            for i, v in pairs(WS.MobSpawns:GetChildren()) do
                                if table.find(TableMobRengoku, v.Name) then
                                    repeat wait()
                                        NoClip = true
                                        SetDescStatus("Waitting Mob "..v.Name)
                                        ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                                    until DetectMob2("Awakened Ice Admiral") or DetectMob2(TableMobRengoku) or Bulon["Auto Rengoku"] == false or GetDistance(v.Position) <= 30
                                    NoClip = false
                                end
                            end
                        end
                    end
                elseif GetBackback("Hidden Key") then
                    SetDescStatus("Equip Hidden Key And Teleport To Pos Rengoku Box")
                    EquipTool("Hidden Key")
                    Tween(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                end
            end
        end
    end
end)

local AutoGhoulToggle = GItem:MakeToggle({
    Name = "Auto Ghoul Race",
    Description = "",
    Default = Bulon["Auto Ghoul Race"],
    Callback = function(Value)
        Bulon["Auto Ghoul Race"] = Value
        SaveSettings()
    end
})

local AutoGhoulHopToggle = GItem:MakeToggle({
    Name = "Auto Ghoul Race [ Hop ]",
    Description = "",
    Default = Bulon["Auto Ghoul Race [ Hop ]"],
    Callback = function(Value)
        Bulon["Auto Ghoul Race [ Hop ]"] = Value
        SaveSettings()
    end
})

function GetGhoul()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if plr.Data.Race ~= "Ghoul" then
        SetTitleStatus("Status : Auto Ghoul Race")
        if not GetBackback("Hellfire Torch") then
            if DetectMob2("Cursed Captain") then
                repeat wait()
                    SetDescStatus("Killing Mob : Cursed Captain")
                    KillMob("Cursed Captain", function() return Bulon["Auto Ghoul Race"] == false or GetBackback("Hellfire Torch") or plr.Data.Race == "Ghoul" end)
                until Bulon["Auto Ghoul Race"] == false or GetBackback("Hellfire Torch") or plr.Data.Race == "Ghoul"
            else
                if Bulon["Auto Ghoul Race [ Hop ]"] == true then
                    SetDescStatus("Hop Find Boss : Cursed Captain")
                    HopServer()
                end
            end
        else
            SetDescStatus("Change Race To Ghoul")
            local args = {
                [1] = "Ectoplasm",
                [2] = "BuyCheck",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            Rc.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Ghoul Race"] then
            GetGhoul()
        end
    end
end)

local ToggleAutoDarkCoat = GItem:MakeToggle({
    Name = "Auto Dark Coat",
    Description = "",
    Default = Bulon["Auto Dark Coat"],
    Callback = function(Value)
        Bulon["Auto Dark Coat"] = Value
        if Bulon["Auto Dark Coat"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Dark Coat"])
    end
})

function GetDarkCoat()
    if not DetectMob2("Darkbeard") then
        if not GetBackback("Fist Of Darkness") then
            local v = DetectChest()
            repeat task.wait()
                SetDescStatus("Auto Chest Find Fist Of Darkness")
                Tween(v.CFrame)
                NoClip = true
                if GetDistance(v.Position) <= 2 then
                    firetouchinterest(v, plr.Character.HumanoidRootPart, 0)
                    firetouchinterest(v, plr.Character.HumanoidRootPart, 1)
                end
                if GetDistance(v.Position) <= 30 then
                    SendKey("W")
                end
            until GetBackback("Fist Of Darkness") or not v.Parent or Bulon["Auto Dark Coat"] == false or DetectMob2("Darkbeard")
            NoClip = false
        elseif GetBackback("Fist Of Darkness") then
            repeat wait()
                SetDescStatus("Summon Darkbeard")
                if GetDistance(WS.Map.DarkbeardArena.Summoner.Detection.Position) > 10 then
                    Tween(WS.Map.DarkbeardArena.Summoner.Detection.CFrame)
                elseif GetDistance(WS.Map.DarkbeardArena.Summoner.Detection.Position) <= 10 then
                    EquipTool("Fist Of Darkness")
                    task.wait()
                    firetouchinterest(plr.Character["Fist of Darkness"].Handle, WS.Map.DarkbeardArena.Summoner.Detection, 0)
                    firetouchinterest(plr.Character["Fist of Darkness"].Handle, WS.Map.DarkbeardArena.Summoner.Detection, 1)
                    firetouchinterest(plr.Character.HumanoidRootPart, WS.Map.DarkbeardArena.Summoner.Detection, 0)
                    firetouchinterest(plr.Character.HumanoidRootPart, WS.Map.DarkbeardArena.Summoner.Detection, 1)
                end
            until DetectMob2("Darkbeard") or not GetBackback("Fist Of Darkness") or Bulon["Auto Dark Coat"] == false
        end
    else
        repeat wait()
            SetDescStatus("Killing Bosses : Darkbeard")
            KillMob("Darkbeard", function() return Bulon["Auto Dark Coat"] == false end)
        until not DetectMob2("Darkbeard") or Bulon["Auto Dark Coat"] == false 
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Dark Coat"] and New_World then
            SetTitleStatus("Stats : Auto Dark Coat")
            GetDarkCoat()
        end
    end
end)

local ToggleAutoLegendSword = GItem:MakeToggle({
    Name = "Auto Sword Legend",
    Description = "",
    Default = Bulon["Auto Sword Legend"],
    Callback = function(Value)
        Bulon["Auto Sword Legend"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["Auto Sword Legend"] then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
        end
    end
end)

GItem:Section(" -- Chest -- ")

local ToggleAutoChest = GItem:MakeToggle({
    Name = "Auto Chest",
    Description = "",
    Default = Bulon["Auto Chest"],
    Callback = function(Value)
        Bulon["Auto Chest"] = Value
        if Bulon["Auto Chest"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Chest"])
    end
})

local ToggleStopItem = GItem:MakeToggle({
    Name = "Stop After Legendery Item",
    Description = "",
    Default = Bulon["Stop After Legendery Item"],
    Callback = function(Value)
        Bulon["Stop After Legendery Item"] = Value
        SaveSettings()
    end
})

local hophopcaidaubuoi
spawn(function()
    while wait() do
        if GetBackback("God's Chalice") or GetBackback("Fist Of Darkness") and Bulon["Stop After Legendery Item"] then
            hophopcaidaubuoi = true
        elseif not GetBackback("God's Chalice") and not GetBackback("Fist Of Darkness") and Bulon["Stop After Legendery Item"] then
            hophopcaidaubuoi = false
        end
    end
end)

local DropdownSelectChest = GItem:MakeDropdown({
    Name = "Select Chest To Hop",
    Description = "x",
    Options = {"30", "40", "60", "70"},
    Default = Bulon["Select Chest To Hop"],
    PlaceHolderText = "x",
    Callback = function(Value)
        Bulon["Select Chest To Hop"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["Select Chest To Hop"] == "" or Bulon["Select Chest To Hop"] == nil then
            ChestLock = 30
        end
        if Bulon["Select Chest To Hop"] == "30" then
            ChestLock = 30
        elseif Bulon["Select Chest To Hop"] == "40" then
            ChestLock = 40
        elseif Bulon["Select Chest To Hop"] == "60" then
            ChestLock = 60
        elseif Bulon["Select Chest To Hop"] == "70" then
            ChestLock = 70
        end
    end
end)

local ToggleChestHop = GItem:MakeToggle({
    Name = "Auto Chest Hop",
    Description = "",
    Default = Bulon["Auto Chest Hop"],
    Callback = function(Value)
        Bulon["Auto Chest Hop"] = Value
        SaveSettings()
    end
})

ChestCount = 0
function AutoChest()
    pcall(function()
        if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then return end
        if Bulon["Auto Elite"] and DetectElite() then return end
        if Bulon["Auto Castle Raid"] and IsCastleRaid then return end
        if Bulon['Auto DarkDagger'] and DetectMob2(TableDauBuoiAcMin) then return end
        if Bulon["Stop After Legendery Item"] and GetBackback("God's Chalice") or GetBackback("Fist Of Darkness") then return end
        if Bulon["Auto Chest Hop"] and ChestCount >= ChestLock and not hophopcaidaubuoi then HopServer() return end
        local v = DetectChest()
        repeat task.wait()
            SetDescStatus("Auto Chest | Chest Distance : " .. GetDistance(v.Position))
            Tween(v.CFrame)
            NoClip = true
            if GetDistance(v.Position) <= 2 then
                firetouchinterest(v, plr.Character.HumanoidRootPart, 0)
                firetouchinterest(v, plr.Character.HumanoidRootPart, 1)
            end
            if GetDistance(v.Position) <= 30 then
                SendKey("W")
            end
        until not v.Parent or Bulon["Auto Chest"] == false
        ChestCount = ChestCount + 1
    end)
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Chest"] then
            SetTitleStatus("Status : Auto Chest")
            AutoChest()
        end
    end
end)

local ToggleAutoDarkDagger = GItem:MakeToggle({
    Name = "Auto DarkDagger",
    Description = "",
    Default = Bulon["Auto DarkDagger"],
    Callback = function(Value)
        Bulon["Auto DarkDagger"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto DarkDagger"])
    end
})

function AutoDarkDagger()
    if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then return end
    local v = DetectMob2(TableDauBuoiAcMin)
    if v then
        repeat wait()
            SetDescStatus("Killing Mob : " .. v.Name)
            KillMob(v.Name, function() return Bulon["Auto DarkDagger"] == false end)
        until Bulon["Auto DarkDagger"] == false
    end
end

function AutoAdmin()
    if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then return end
    local v = DetectMob2(TableDauBuoiAcMin)
    if v then
        repeat wait()
            SetDescStatus("Killing Mob : " .. v.Name)
            KillMob(v.Name, function() return Bulon["Auto Admin"] == false end)
        until Bulon["Auto Admin"] == false
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto DarkDagger"] then
            if not GetInventory("Dark Dagger") then
                AutoDarkDagger()
            end
        end
    end
end)

local ToggleAutoSummonripindra = GItem:MakeToggle({
    Name = "Auto Summon rip_indra",
    Description = "",
    Default = Bulon["Auto Summon rip_indra"],
    Callback = function(Value)
        Bulon["Auto Summon rip_indra"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Summon rip_indra"])
    end
})

function DetectHakiColorPart()
    for i,v in next,WS.Map["Boat Castle"].Summoner.Circle:GetChildren() do
        if v:IsA("Part") and v.Part.BrickColor.Name ~= "Lime green"  then
            return v
        end
    end
end

function SummonAdminbucaccho()
    if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then return end
    if DetectMob2(TableDauBuoiAcMin) then
        AutoAdmin()
    else
        if GetBackback("God's Chalice") then
            if not DetectHakiColorPart() then
                SetDescStatus("Equip God's Chalice And Teleport To Part Color Pick")
                EquipTool("God's Chalice")
                wait(.1)
                Tween(WS.Map["Boat Castle"].Summoner.Detection.CFrame)
            else
                if DetectHakiColorPart().BrickColor.Name == "Hot pink"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                    Tween(DetectHakiColorPart().CFrame)
                elseif DetectHakiColorPart().BrickColor.Name == "Really red"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                    Tween(DetectHakiColorPart().CFrame)
                elseif DetectHakiColorPart().BrickColor.Name == "Oyster"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                    Tween(DetectHakiColorPart().CFrame)
                end
            end 
        elseif not GetBackback("God's Chalice") then
            SetDescStatus("Dit me may summon admin di")
            Library:MakeNotify({
                Title = "Sitink Hub",
                Content = "Please Get God's Chalice",
                Description = "Auto Summon rip_indra",
                Time = 5 
            })
            wait(6)
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Summon rip_indra"] then
            SetTitleStatus("Status : Auto Summon Admin")
            SummonAdminbucaccho()
        end
    end
end)

local ToggleAutoAdmin = GItem:MakeToggle({
    Name = "Auto Admin",
    Description = "Auto rip_indra or rip_indra True Form",
    Default = Bulon["Auto Admin"],
    Callback = function(Value)
        Bulon["Auto Admin"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Admin"])
    end
})

spawn(function()
    while task.wait() do
        if Bulon["Auto Admin"] then
            SetTitleStatus("Status : Auto Admin")
            AutoAdmin()
        end
    end
end)

local ToggleAutoDoughKing = GItem:MakeToggle({
    Name = "Auto Dough King",
    Description = "",
    Default = Bulon["Auto Dough King"],
    Callback = function(Value)
        Bulon["Auto Dough King"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Dough King"])
    end
})

function AutoDoughKing()
    if not DetectMob2("Dough King") then
        SetTitleStatus("Status : Auto Dough King")
        if not GetBackback("Sweet Chalice") then
            if GetBackback("God's Chalice") then
                SetDescStatus("Get Sweet Chalice")
                Rc.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
            end
        elseif GetBackback("Sweet Chalice") then
            if not DetectMob2("Dough King") then
                if CheckGlassCake() and not DetectMob2("Dough King") then
                    if DetectMob(TableMobCakes) then
                        for i, v in pairs(WS.Enemies:GetChildren()) do
                            if table.find(TableMobCakes, v.Name) then
                                if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat wait()
                                        SetDescStatus("Killing Mob ".. v.Name)
                                        KillMob(v.Name, function() return Bulon["Auto Dough King"] == false end)
                                    until Bulon["Auto Dough King"] == false or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                                end
                            end
                        end
                    else
                        for i, v in pairs(WS.MobSpawns:GetChildren()) do
                            if table.find(TableMobCakes, v.Name) then
                                repeat wait()
                                    NoClip = true
                                    SetDescStatus("Waitting Mob "..v.Name)
                                    Tween(v.CFrame * CFrame.new(0, 15, 0))
                                until DetectMob(TableMobCakes) or Bulon["Auto Dough King"] == false or GetDistance(v.Position) <= 30
                                NoClip = false
                            end
                        end
                    end
                end
            end
        end
    elseif DetectMob2("Dough King") then
        SetTitleStatus("Status : Auto Dough King")
        repeat wait()
            SetDescStatus("Killing Mob : Dough King")
            KillMob("Dough King", function() return Bulon["Auto Dough King"] == false end)     
        until Bulon["Auto Dough King"] == false or not DetectMob2("Dough King")
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Dough King"] then
            AutoDoughKing()
        end
    end
end)

local ToggleAutoYama = GItem:MakeToggle({
    Name = "Auto Yama",
    Description = "",
    Default = Bulon["Auto Yama"],
    Callback = function(Value)
        Bulon["Auto Yama"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Yama"])
    end
})

function AutoYama()
    if Bulon["Auto Tushita"] and DetectMob2(TableDauBuoiAcMin) and plr.Data.Level.Value >= 2000 then return end
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if Bulon["Auto Raid"] and plr.PlayerGui.Main.Timer.Visible == true or getNextIsland() then return end
    if EliteProgess >= 30 then
        SetTitleStatus("Status : Auto Yama")
        if GetDistance(game.Workspace.Map.Waterfall.SealedKatana.Handle.Position) > 10 then
            SetDescStatus("Tween to Yama Pos")
            Tween(game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame * CFrame.new(2, 15, 2))
        else
            if DetectMob("Ghosh") then
                spawn(function()
                    SetDescStatus("Killaura :>")
                    KillAura()
                end)
            else
                SetDescStatus("Huaw!!!!, dit me thanh kiem nang wuaaaaaaaaaaa!!!")
                fireclickdetector(game.Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
        end
    elseif EliteProgess < 30 then
        if Bulon["Auto Elite"] == false then
            SetDescStatus("Dit me may kill elite di!!!")
            Library:MakeNotify({
                Title = "Sitink Hub",
                Content = "Turn On Auto Elite Hunter and need to farm " .. 30 - tonumber(EliteProgess) .. " Elite more to get Yama!!!",
                Description = "Auto Yama",
                Time = 5 
            })
            wait(6)
        end
    end
end
spawn(function()
    while wait() do
        if Bulon["Auto Yama"] then
            AutoYama()
        end
    end
end)

local ToggleAutoTushita = GItem:MakeToggle({
    Name = "Auto Tushita",
    Description = "",
    Default = Bulon["Auto Tushita"],
    Callback = function(Value)
        Bulon["Auto Tushita"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Tushita"])
    end
})

function GetTorch()
    local a 
    if not WS.Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
        a = "1"
    elseif not WS.Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
        a = "2"
    elseif not WS.Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
        a = "3"
    elseif not WS.Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
        a = "4"
    elseif not WS.Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
        a = "5"
    end
    for i,v in next,WS.Map.Turtle.QuestTorches:GetChildren() do
        if v:IsA("MeshPart") and  string.find(v.Name, a) and not v.Particles.Main.Enabled then
            return v 
        end
    end
end

function AutoTushita()
    if DetectFruit() and Bulon["Auto Find DF"] then return end
    if GetInventory("Tushita") then return end
    if Bulon["Auto Raid"] and plr.PlayerGui.Main.Timer.Visible == true or getNextIsland() then return end
    if plr.Data.Level.Value >= 2000 then
        if not WS.Map.Turtle:FindFirstChild("TushitaGate") then
            SetTitleStatus("Status : Auto Tushita")
            if DetectMob2("Longma") then
                repeat wait()
                    SetDescStatus("Killing Bosses : Long ma bắc giang")
                    KillMob("Longma", function()
                        return Bulon["Auto Tushita"] == false or GetInventory("Tushita")
                    end)
                until Bulon["Auto Tushita"] == false or GetInventory("Tushita")
            end
        else
            SetTitleStatus("Status : Auto Tushita")
            if DetectMob2(TableDauBuoiAcMin) then
                if not GetBackback("Holy Torch") then
                    SetDescStatus("Teleport To Door Get Holy Torch")
                    Tween(WS.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
                elseif GetBackback("Holy Torch") then
                    EquipTool("Holy Torch")
                    SetDescStatus("Di thap duoc di thang ngu")
                    Tween(GetTorch().CFrame)
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Tushita"] then
            AutoTushita()
        end
    end
end)

local ToggleAutoSoulGuitar = GItem:MakeToggle({
    Name = "Auto Soul Guitar",
    Description = "",
    Default = Bulon["Auto Soul Guitar"],
    Callback = function(Value)
        Bulon["Auto Soul Guitar"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Soul Guitar"])
    end
})

function GetZombie()
    local CountZombie = 0
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name == "Zombie" then
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                if (v.HumanoidRootPart.Position - Vector3.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).Magnitude < 30 then
                    CountZombie = CountZombie + 1
                    v.HumanoidRootPart.CFrame = CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)
                end
            end
        end
    end
    return CountZombie
end

local BlankTablets = {
    "Segment6",
    "Segment2",
    "Segment8",
    "Segment9",
    "Segment5"
}
local Trophy = {
    ["Segment1"] = "Trophy1",
    ["Segment3"] = "Trophy2",
    ["Segment4"] = "Trophy3",
    ["Segment7"] = "Trophy4",
    ["Segment10"] = "Trophy5",
}
local Pipes = {
    ["Part1"] = "Really black",
    ["Part2"] = "Really black",
    ["Part3"] = "Dusty Rose",
    ["Part4"] = "Storm blue",
    ["Part5"] = "Really black",
    ["Part6"] = "Parsley green",
    ["Part7"] = "Really black",
    ["Part8"] = "Dusty Rose",
    ["Part9"] = "Really black",
    ["Part10"] = "Storm blue",
}

function GetItemCount(bj)
    for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v["Name"] == bj then
            return v["Count"]
        end
    end
    return 0
end

function AutoSoulGuitar()
    if not CommF:InvokeServer("GuitarPuzzleProgress", "Check") then
        if game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and (game.Lighting.ClockTime > 16 or game.Lighting.ClockTime < 5) then
            if GetDistance(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) <= 10 then
                CommF:InvokeServer("gravestoneEvent", 2)
                CommF:InvokeServer("gravestoneEvent", 2, true)
                task.wait(1)
            else
                Tween(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125))
            end
        end
    else
        if plr.PlayerGui.Main.Dialogue.Visible then
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
        end
        if not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Swamp then
            if GetDistance(CFrame.new(-10171.7607421875, 138.62667846679688+20, 6008.0654296875)) > 100 then
                Tween(CFrame.new(-10171.7607421875, 138.62667846679688+20, 6008.0654296875))
            else
                if GetZombie() >= 6 then
                    local v = DetectMob("Zombie")
                    repeat wait()
                        KillMob(v.Name, function() return Bulon["Auto Soul Guitar"] == false or not v.Parent end)
                    until Bulon["Auto Soul Guitar"] == false or not v.Parent or v:FindFirstChild("Humanoid").Health <= 0
                end
                return
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones then
            if GetDistance(Vector3.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
                Tween(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
            else
                local SignsClick = {game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector, game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector, game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector, game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector, game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector, game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector, game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector}
                for i, v in pairs(SignsClick) do
                    fireclickdetector(v)
                end
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Ghost then
            if GetDistance(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 50 then
                Tween(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375))
            else
                CommF:InvokeServer("GuitarPuzzleProgress", "Ghost")
                task.wait(3)
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Trophies then
            if GetDistance(Vector3.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 50 then
                Tween(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
            else
                local Tablet = game.workspace.Map["Haunted Castle"].Tablet
                for i, v in pairs(BlankTablets) do
                    local x = Tablet[v]
                    if x.Line.Position.X ~= 0 then
                        repeat task.wait()
                            fireclickdetector(x.ClickDetector)
                        until x.Line.Position.X == 0
                    end
                end
                for i, v in pairs(Trophy) do
                    local x = game.workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame
                    x = tostring(x)
                    x = x:split(", ")[4]
                    local c = "180"
                    if x == "1" or x == "-1" then
                        c = "90"
                    end
                    if not string.find(tostring(Tablet[i].Line.Rotation.Z), c) then
                        repeat task.wait()
                            fireclickdetector(Tablet[i].ClickDetector)
                        until string.find(tostring(Tablet[i].Line.Rotation.Z), c)
                        print(i, c)
                    end
                end
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Pipes then
            for i, v in pairs(Pipes) do
                local x = game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i]
                if x.BrickColor.Name ~= v then
                    repeat task.wait()
                        fireclickdetector(x.ClickDetector)
                    until x.BrickColor.Name == v
                end
            end
        end
    end
end

function FullySoulGuitar()
    if GetItemCount("Dark Fragment") >= 1 and GetItemCount("Ectoplasm") >= 250 and GetItemCount("Bones") >= 500 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy")
        AutoSoulGuitar()
    elseif GetItemCount("Dark Fragment") < 1 then
        Library:MakeNotify({
            Title = "Sitink Hub",
            Content = "Please Get Dark Fragment!!!",
            Description = "Auto Soul Guitar",
            Time = 5 
        })
        wait(6)
    elseif GetItemCount("Ectoplasm") < 250 then
        Library:MakeNotify({
            Title = "Sitink Hub",
            Content = "Please Need Get ".. 250 - tonumber(GetItemCount("Ectoplasm")) .. " Ectoplasm !!!",
            Description = "Auto Soul Guitar",
            Time = 5 
        })
        wait(6)
    elseif GetItemCount("Bones") < 500 then
        Library:MakeNotify({
            Title = "Sitink Hub",
            Content = "Please Farm Bone",
            Description = "Auto Soul Guitar",
            Time = 5 
        })
        wait(6)
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Soul Guitar"] then
            FullySoulGuitar()
        end
    end
end)

local GMelee = GetItemTab:MakeSection({
    Title = "Melee",
    Content = "Auto Superhuman, Death Step, Electric Claw, Sharkman, ..."
})

local ToggleAutoSuperhuman = GMelee:MakeToggle({
    Name = "Auto Superhuman",
    Description = "Taken Melee Superhuman",
    Default = Bulon["Auto Superhuman"],
    Callback = function(Value)
        Bulon["Auto Superhuman"] = Value
        SaveSettings()
    end
})

function BuyMelee(Taolaskiddertop1inallunversite)
    if Taolaskiddertop1inallunversite ~= "Mua Dragon Claw :))" then
        return Rc.Remotes.CommF_:InvokeServer(Taolaskiddertop1inallunversite)
    elseif Taolaskiddertop1inallunversite == "Mua Dragon Claw :))" then
        Rc.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
end

function DetectMeleeMastery(cac, chim)
    local v = GetBackback(cac)
    if v then
        if v.Level.Value >= chim then
            return true
        end
    end
end

local TableMeleeSuperhuman = {
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw"
}

function AutoSuperhuman()
    if not GetBackback("Superhuman") then
        if not GetBackback(TableMeleeSuperhuman) then
            BuyMelee("BuyBlackLeg")
        end
        if DetectMeleeMastery("Black Leg", 300) then
            wait(0.3)
            BuyMelee("BuyElectro")
        end
        if DetectMeleeMastery("Electro", 300) then
            wait(0.3)
            BuyMelee("BuyFishmanKarate")
        end
        if DetectMeleeMastery("Fishman Karate", 300) then
            wait(0.3)
            BuyMelee("Mua Dragon Claw :))")
        end
        if DetectMeleeMastery("Dragon Claw", 300) then
            wait(0.3)
            BuyMelee("BuyBlackLeg")
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Superhuman"] then
            BuyMelee("BuySuperhuman")
            AutoSuperhuman()
        end
    end
end)

local ToggleAutoElectricClaw = GMelee:MakeToggle({
    Name = "Auto Electric Claw",
    Description = "Work 100%",
    Default = Bulon["Auto Electric Claw"],
    Callback = function(Value)
        Bulon["Auto Electric Claw"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Electric Claw"])
    end
})

function AutoElectricClaw()
    if Rc.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 1 then
        SetTitleStatus("Status : Auto Electric Claw")
        if not GetBackback("Electro") then
            SetDescStatus("Mua Electro...")
            BuyMelee("BuyElectro")
        elseif GetBackback("Electro") then
            if DetectMeleeMastery("Electro", 400) then
                Rc.Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                SetDescStatus("Claim Quest Nigga cua thg Electric nung cac.")
                wait(0.3)
                SetDescStatus("Bay den dinh thu")
                Rc.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12549.7236, 337.511505, -7470.36328))
                wait(0.3)
                Rc.Remotes.CommF_:InvokeServer("BuyElectricClaw")     
                SetDescStatus("Mua Electric Claw")
            elseif DetectMeleeMastery("Electro", 399) then
                ToggleAutoFarm:Set(true)    
                SetDescStatus("Farm Electric Claw to 400 Mastery")                           
            end
        end
    elseif Rc.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
        BuyMelee("BuyElectricClaw")
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Electric Claw"] and Third_World then
            AutoElectricClaw()
        end
    end
end)

local ToggleAutoDeathStep = GMelee:MakeToggle({
    Name = "Auto Death Step",
    Description = "",
    Default = Bulon["Auto Death Step"],
    Callback = function(Value)
        Bulon["Auto Death Step"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Death Step"])
    end
})

function GetDeathStepDoor()
    if WS.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
        return WS.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide
    end
end

function AutoDeathStep()
    if Rc.Remotes.CommF_:InvokeServer("BuyDeathStep", true) ~= 1 then
        SetTitleStatus("Auto Death Step")
        if GetDeathStepDoor() then
            if not GetBackback("Library Key") then
                if not GetBackback("Black Leg") then
                    SetDescStatus("Mua Black Leg...")
                    BuyMelee("BuyBlackLeg")
                elseif GetBackback("Black Leg") then
                    if DetectMeleeMastery("Black Leg", 400) then
                        if DetectMob2("Awakened Ice Admiral") then
                            repeat wait()
                                SetDescStatus("Killing Bosses : Awakened Ice Admiral")
                                KillMob("Awakened Ice Admiral", function()
                                    return Bulon["Auto Death Step"] == false
                                end)
                            until Bulon["Auto Death Step"] == false
                        else
                            SetDescStatus("Hop Sv Tim Boss")
                            HopServer()
                        end
                    elseif DetectMeleeMastery("Black Leg", 399) then
                        SetDescStatus("Farm Black Leg len 400 mastery")
                        ToggleAutoFarm:Set(true)                          
                    end
                end
            elseif GetBackpack("Library Key") then
                SetDescStatus("Open Door Death Step")
                EquipTool("Library Key")
                Tween(CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814))
            end
        else
            BuyMelee("BuyDeathStep")
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Death Step"] and New_World then
            AutoDeathStep()
        end
    end
end)

local SFarm = GetItemTab:MakeSection({
    Title = "Stack Farm",
    Content = "Auto New World, Bartilo Quest, ..."
})

local ToggleAutoSecondSea = SFarm:MakeToggle({
    Name = "Auto New World",
    Description = "",
    Default = Bulon["Auto New World"],
    Callback = function(Value)
        Bulon["Auto New World"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto New World"])
    end
})

function AutoNewWorld()
    if CanGoNewWorld() then
        SetTitleStatus("Status : Auto New Wold")
        if game.Workspace.Map.Ice.Door.CanCollide then
            if not GetBackback("Key") then
                if GetDistance(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359)) <= 10 then
                    SetDescStatus("Get Key")
                    Rc.Remotes["CommF_"]:InvokeServer("DressrosaQuestProgress","Detective")      
                else
                    SetDescStatus("Teleport To NPC In ImpelDown")
                    Tween(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
                end
            elseif GetBackback("Key") then
                SetDescStatus("Teleport To Ice Door")
                Tween(game.Workspace.Map.Ice.Door.CFrame)
                EquipTool("Key")
            end
        elseif not game.Workspace.Map.Ice.Door.CanCollide then
            if DetectMob2("Ice Admiral") then
                repeat wait()
                    SetDescStatus("Killing Bosses : Ice Admiral")
                    KillMob("Ice Admiral", function() 
                        return Bulon["Auto New World"] == false or 
                        Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 
                    end)                    
                until Bulon["Auto New World"] == false or Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 or not DetectMob2("Ice Admiral") or DetectMob2("Ice Admiral"):FindFirstChild("Humanoid").Health <= 0
                Rc.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end
    elseif Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 then
        Rc.Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto New World"] and CanGoNewWorld() then
            AutoNewWorld()
        end
    end
end)

local ToggleAutoBartilo = SFarm:MakeToggle({
    Name = "Auto Bartilo Quest",
    Description = "",
    Default = Bulon["Auto Bartilo Quest"],
    Callback = function(Value)
        Bulon["Auto Bartilo Quest"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Bartilo Quest"])
    end
})

function GetPartProgess2()
    local a  
    if WS.Map.Dressrosa.BartiloPlates.Plate1.BrickColor == BrickColor.new("Sand yellow") then 
        a = "Plate1"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate2.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate2"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate3.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate3"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate4.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate4"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate5.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate5"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate6.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate6"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate7.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate7"
    elseif WS.Map.Dressrosa.BartiloPlates.Plate8.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate8"
    end
    return a 
end

function AutoBartilo()
    if BartiloProgess ~= 3 then
        SetTitleStatus("Auto Bartilo Quest")
        if DetectFruit() and Bulon["Auto Find DF"] then return end
        if BartiloProgess == 0 then
            if not plr.PlayerGui.Main.Quest.Visible or not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") or not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                if GetDistance(CFrame.new(-456.28952, 73.0200958, 299.895966)) <= 10 then
                    SetDescStatus("Claim Quest Bartilo")
                    Rc.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                else
                    SetDescStatus("Teleport To NPC Bartilo")
                    Tween(CFrame.new(-456.28952, 73.0200958, 299.895966))
                end
            elseif plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                if DetectMob2("Swan Pirate") then
                    repeat wait()
                        SetDescStatus("Killing Mob : Swan Pirate")
                        KillMob("Swan Pirate", function() return Bulon["Auto Bartilo Quest"] == false or BartiloProgess == 1 end)
                    until BartiloProgess == 1 or Bulon["Auto Bartilo Quest"] == false 
                else
                    for i, v in pairs(WS.MobSpawns:GetChildren()) do
                        if string.find(v.Name, "Swan Pirate") then
                            repeat wait()
                                NoClip = true
                                SetDescStatus("Waitting Mob "..v.Name)
                                Tween(v.CFrame * CFrame.new(0, 15, 0))
                            until DetectMob2("Swan Pirate") or Bulon["Auto Bartilo Quest"] == false  or GetDistance(v.Position) <= 30 or BartiloProgess == 1
                        end
                    end
                end
            end 
        elseif BartiloProgess == 1 then
            if DetectMob2("Jeremy") then
                repeat wait()
                    SetDescStatus("Killing Bosses : Jeremy")
                    KillMob("Jeremy", function() return Bulon["Auto Bartilo Quest"] == false or BartiloProgess == 2 end)
                until BartiloProgess == 2 or Bulon["Auto Bartilo Quest"] == false 
            else
                SetDescStatus("Change Server Find Jeremy")
                HopServer()
            end
        else
            if BartiloProgess == 2 then
                if GetDistance(Vector3.new(-1835.65, 10.4325, 1679.75)) > 100 then
                    SetDescStatus("Tween to Pos -1835.65, 10.4325, 1679.75")
                    Tween(CFrame.new(-1835.65, 10.4325, 1679.75))
                else
                    repeat wait()
                        SetDescStatus("deo biet noi gi")
                        plr.Character.HumanoidRootPart.CFrame = WS.Map.Dressrosa.BartiloPlates[GetPartProgess2()].CFrame
                        task.wait()
                        firetouchinterest(WS.Map.Dressrosa.BartiloPlates[GetPartProgess2()], plr.Character.HumanoidRootPart, 0)
                        firetouchinterest(WS.Map.Dressrosa.BartiloPlates[GetPartProgess2()], plr.Character.HumanoidRootPart, 1)
                    until BartiloProgess == 3 or Bulon["Auto Bartilo Quest"] == false 
                end
            end
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Bartilo Quest"] and New_World then
            AutoBartilo()
        end
    end
end)

local ToggleAutoRaceV1V2V3 = SFarm:MakeToggle({
    Name = "Auto Race (V1 - V2 - V3)",
    Description = "",
    Default = Bulon["Auto Race (V1 - V2 - V3)"],
    Callback = function(Value)
        Bulon["Auto Race (V1 - V2 - V3)"] = Value
        if Bulon["Auto Race (V1 - V2 - V3)"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
        DisableTween(Bulon["Auto Race (V1 - V2 - V3)"])
    end
})

function DetectRace()
    local Wenlocktoad = Rc.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local Alchemist = Rc.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if plr.Character:FindFirstChild("RaceTransformed") then
        return plr.Data.Race.Value .. " V4"
    end
    if Wenlocktoad == -2 then
        return plr.Data.Race.Value .. " V3"
    end
    if Alchemist == -2 then
        return plr.Data.Race.Value .. " V2"
    end
    return plr.Data.Race.Value .. " V1"
end

local TableCursedShipMob = {
    "Ship Officer",
    "Ship Steward",
    "Ship Engineer",
    "Ship Deckhand"
}

local TableMobHumanV2 = {
    "Jeremy",
    "Diamond",
    "Fajita"
}

function GetSafeZone()
    for i,v in pairs(WS["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            return v
        end
    end
end

function CheckSafeZone(v)
    if v:FindFirstChild("HumanoidRootPart") then
        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - GetSafeZone().Position).Magnitude <= 400 then
                return true
            end
        end
    end
    return false
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Race (V1 - V2 - V3)"] and New_World then
            if string.find(DetectRace(), "V1") then
                SetTitleStatus("Status : Auto Race (V2)")
                if not plr.Data.Race:FindFirstChild("Evolved") then
                    if Rc.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                        SetDescStatus("Claim Quest Race V2")
                        Rc.Remotes.CommF_:InvokeServer("Alchemist", "2")
                    elseif Rc.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                        if not GetBackback("Flower 1") then
                            if GetDistance(WS.Flower1.Position) > 10 then
                                SetDescStatus("Tween to Flower 1")
                                Tween(WS.Flower1.CFrame)
                            elseif GetDistance(WS.Flower1.Position) <= 10 then
                                firetouchinterest(WS.Flower1, plr.Character.HumanoidRootPart, 0)
                                firetouchinterest(WS.Flower1, plr.Character.HumanoidRootPart, 1)
                            end
                        elseif not GetBackback("Flower 2") then
                            if GetDistance(WS.Flower1.Position) > 10 then
                                SetDescStatus("Tween to Flower 2")
                                Tween(WS.Flower2.CFrame)
                            elseif GetDistance(WS.Flower2.Position) <= 10 then
                                firetouchinterest(WS.Flower2, plr.Character.HumanoidRootPart, 0)
                                firetouchinterest(WS.Flower2, plr.Character.HumanoidRootPart, 1)
                            end
                        elseif not GetBackback("Flower 3") then
                            if DetectMob(TableCursedShipMob) then
                                for i, v in pairs(WS.Enemies:GetChildren()) do
                                    if table.find(TableCursedShipMob, v.Name) then
                                        if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                            repeat wait()
                                                SetDescStatus("Killing Mob : ".. v.Name)
                                                KillMob(v.Name, function()
                                                    return Bulon["Auto Race (V1 - V2 - V3)"] == false or GetBackback("Flower 3")
                                                end)
                                            until Bulon["Auto Race (V1 - V2 - V3)"] == false or GetBackback("Flower 3")
                                        end
                                    end
                                end
                            else
                                for i, v in pairs(WS.MobSpawns:GetChildren()) do
                                    if table.find(TableCursedShipMob, v.Name) then
                                        repeat wait()
                                            NoClip = true
                                            SetDescStatus("Waitting Mob "..v.Name)
                                            Tween(v.CFrame * CFrame.new(0, 15, 0))
                                        until DetectMob(TableCursedShipMob) or Bulon["Auto Race (V1 - V2 - V3)"] == false or GetDistance(v.Position) <= 30
                                    end
                                end
                            end
                        end
                    elseif Rc.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                        SetDescStatus("Up Race To V2")
                        Rc.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            elseif string.find(DetectRace(), "V2") then
                SetTitleStatus("Status : Auto Race (V3)")
                pcall(function()
                    ClaimQuestRaceV3()
                    YouRace = DetectRace()
                    if YouRace == "Human V2" then
                        Bucaccho = 0
                        if DetectMob2("Jeremy") and DetectMob2("Fajita") and DetectMob2("Diamond") then
                            repeat wait()
                                Bucaccho = Bucaccho + 1
                                KillMob("Jeremy", function()
                                    SetDescStatus("Killing Bosses : Jeremy")
                                    return YouRace ~= "Human V2" or Bulon["Auto Race (V1 - V2 - V3)"] == false
                                end)
                                KillMob("Fajita", function()
                                    SetDescStatus("Killing Bosses : Fajita")
                                    return YouRace ~= "Human V2" or Bulon["Auto Race (V1 - V2 - V3)"] == false
                                end)
                                KillMob("Diamond", function()
                                    SetDescStatus("Killing Bosses : Diamond")
                                    return YouRace ~= "Human V2" or Bulon["Auto Race (V1 - V2 - V3)"] == false
                                end)
                            until YouRace ~= "Human V2" or Bulon["Auto Race (V1 - V2 - V3)"] == false
                        elseif not DetectMob2("Jeremy") or not DetectMob2("Fajita") or not DetectMob2("Diamond") then 
                            SetDescStatus("Change Server Find Bosses")
                            HopServer()
                        end
                    elseif YouRace == "Skypiea V2" then
                        TableSkyPlayers = {}
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v:FindFirstChild("Data") and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Parent and v.Data.Race.Value == "Skypiea" then
                                table.insert(v.Name, TableSkyPlayers)
                            end
                        end
                        for i, v in pairs(TableSkyPlayers) do
                            for r, s in pairs(WS.Characters:GetChildren()) do
                                if s:IsA("Model") and s.Parent and s:FindFirstChild("Humanoid") and s.Humanoid.Health > 0 and s.Name == v then
                                    repeat wait()
                                        SetDescStatus("Killing Players : ".. v.Name)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0 ,0, 2))
                                        EquipWeapon()
                                        Buso()
                                        Click()
                                    until CheckSafeZone(s) or GetNotification("Die") or GetNotification("player") or not s.Parent or not s:FindFirstChild("Humanoid") or s:FindFirstChild("Humanoid").Health <= 0 or not s:FindFirstChild("HumanoidRootPart") or Bulon["Auto Race (V1 - V2 - V3)"] == false
                                end
                            end
                        end
                    end
                end)
            end
        end
    end
end)

local ToggleAutoThirdSea = SFarm:MakeToggle({
    Name = "Auto Third Sea",
    Description = "",
    Default = Bulon["Auto Third Sea"],
    Callback = function(Value)
        Bulon["Auto Third Sea"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Third Sea"])
    end
})

function AutoThirdSea()
    if BartiloProgess == 3 then
        if plr.Data.Level.Value >= 1500 then
            SetTitleStatus("Status : Auto Third Sea")
            if Rc.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
                Library:MakeNotify({
                    Title = "Sitink Hub",
                    Content = "Please give Trevor 1 devil fruit per 1 meter beli!!!",
                    Description = "Auto Third Sea",
                    Time = 5 
                })
                wait(6)
            elseif Rc.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 and Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 and Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                SetDescStatus("Go Third Sea")
            elseif not Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") then 
                repeat wait()
                    SetDescStatus("Killing Don Swan")
                    KillMob("Don Swan", function() return Bulon["Auto Third Sea"] == false end)
                until Bulon["Auto Third Sea"] == false or DetectMob2("Don Swan"):FindFirstChild("Humanoid").Health <= 0
            elseif Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                if not DetectMob("rip_indra") then
                    if GetDistance(CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, -0, -0.292404652, 0, 1, -0, 0.292404652, 0, 0.956294656)) > 10 then
                        SetDescStatus("Tween to Thang red head nung cac")
                        Tween(CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, -0, -0.292404652, 0, 1, -0, 0.292404652, 0, 0.956294656))
                    else
                        SetDescStatus("Go to rip_indra")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                    end
                else
                    repeat wait()
                        SetDescStatus("Killing Bosses : rip_indra")
                        KillMob("rip_indra", function() return Bulon["Auto Third Sea"] == false end)
                    until Bulon["Auto Third Sea"] == false or DetectMob2("rip_indra"):FindFirstChild("Humanoid").Health <= 0
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Third Sea"] and New_World then
            AutoThirdSea()
        end
    end
end)

-- // Devil Fruits \\ --

local DFruit = FruitandRaidTab:MakeSection({
    Title = "Devil Fruit",
    Content = "Nigga"
})

DFruit:MakeButton({
    Name = "Random DF",
    Description = "",
    Callback = function()
        Rc.Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end
})

local ToggleRandomDF = DFruit:MakeToggle({
    Name = "Auto Random DF",
    Description = "",
    Default = Bulon["Auto Random DF"],
    Callback = function(Value)
        Bulon["Auto Random DF"] = Value
        SaveSettings()
    end
})

spawn(function()
    while wait() do
        if Bulon["Auto Random DF"] then
            Rc.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end
    end
end)

local ToggleFindDF = DFruit:MakeToggle({
    Name = "Auto Find DF",
    Description = "",
    Default = Bulon["Auto Find DF"],
    Callback = function(Value)
        Bulon["Auto Find DF"] = Value
        if Bulon["Auto Find DF"] == false then
            SetTitleStatus("Status : Not Farm")
            SetDescStatus("")
        end
        SaveSettings()
    end
})

DFruit:MakeToggle({
    Name = "Hop Find DF",
    Default = Bulon["Hop Find DF"],
    Callback = function(Value)
        Bulon["Hop Find DF"] = Value
        SaveSettings()
    end
})

function TweentoDF()
    if Bulon["Auto Kill Players When Complete Trial"] and plr.PlayerGui.Main.Timer.Visible then return end
    if Bulon["Auto Trials"] and IsTrial then return end
    if Bulon["Auto Raid"] and plr.PlayerGui.Main.Timer.Visible == true then return end
    if DetectFruit() then
        Tween(DetectFruit().Handle.CFrame)
        SetTitleStatus("Status : Teleport To Fruit")
    else
        if Bulon["Hop Find DF"] == true then
            SetTitleStatus("Status : Hop Server Find DF")
            HopServer()
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Find DF"] then
            TweentoDF()
        end
    end
end)

local ToggleStoreDF = DFruit:MakeToggle({
    Name = "Store DF",
    Description = "",
    Default = Bulon["Store DF"],
    Callback = function(Value)
        Bulon["Store DF"] = Value
        SaveSettings()
    end
})

spawn(function()
    while task.wait() do
        if Bulon["Store DF"] then
            for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then
                    if string.find(v.Text, "You can only")  then
                        v:Destroy()
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if Bulon["Store DF"] then
            for i, v in pairs(plr.Backpack:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    local args = {
                        [1] = "StoreFruit",
                        [2] = v:GetAttribute("OriginalName"),
                        [3] = v
                    }
                    Rc:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
                end
            end
            for i, v in pairs(plr.Character:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    local args = {
                        [1] = "StoreFruit",
                        [2] = v:GetAttribute("OriginalName"),
                        [3] = v
                    }
                    Rc:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
                end
            end
        end
    end
end)

local RaidT = FruitandRaidTab:MakeSection({
    Title = "Raid",
    Content = ""
})

TableChip = {}
for r, v in pairs(require(Rc.Raids).raids) do
    if v.Name ~= " " then
        table.insert(TableChip, v)
    end
end
for r, v in pairs(require(Rc.Raids).advancedRaids) do
    if v.Name ~= " " then
        table.insert(TableChip, v)
    end
end

local DropdownChip = RaidT:MakeDropdown({
    Name = "Chip List",
    Description = "",
    Options = TableChip,
    Default = Bulon["Select Chips"],
    Callback = function(Value)
        Bulon["Select Chips"] = Value
        SaveSettings()
    end
})

RaidT:MakeButton({
    Name = "Buy Chip",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", Bulon["Select Chips"])
    end
})

local ToggleAutoBuyChip = RaidT:MakeToggle({
    Name = "Auto Buy Chip",
    Description = "",
    Default = Bulon["Auto Buy Chip"],
    Callback = function(Value)
        Bulon["Auto Buy Chip"] = Value
        SaveSettings()
    end
})

spawn(function() while wait() do if Bulon["Auto Buy Chip"] then if not GetBackback("Special Microchip") and plr.PlayerGui.Main.Timer.Visible == false then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", Bulon["Select Chips"]) end end end end) 

local ToggleAutoStartRaid = RaidT:MakeToggle({
    Name = "Auto Start Raid",
    Description = "",
    Default = Bulon["Auto Start Raid"],
    Callback = function(Value)
        Bulon["Auto Start Raid"] = Value
        SaveSettings()
    end
})

function StartRaid()
    if New_World then
        return fireclickdetector(WS.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif Third_World then
        return fireclickdetector(WS.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
end

spawn(function() while wait() do if Bulon["Auto Start Raid"] then if GetBackback("Special Microchip") and plr.PlayerGui.Main.Timer.Visible == false then StartRaid() end end end end)
    
local ToggleAutoRaid = RaidT:MakeToggle({
    Name = "Auto Raid",
    Description = "",
    Default = Bulon["Auto Raid"],
    Callback = function(Value)
        Bulon["Auto Raid"] = Value
        SaveSettings()
        DisableTween(Bulon["Auto Raid"])
    end
})

if Bulon["Select Chips"] == nil or Bulon["Select Chips"] == "" then
    Bulon["Select Chips"] = "Flame"
end
CanBuyChip = true
function AutoRaid()
    if not plr.PlayerGui.Main.Timer.Visible and not getNextIsland() then
        NiggaRaid = false
        if not GetBackback("Special Microchip") and CanBuyChip then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", Bulon["Select Chips"])
        elseif GetBackback("Special Microchip") then
            NiggaRaid = true
            CanBuyChip = false
            StartRaid()
        end
    elseif plr.PlayerGui.Main.Timer.Visible or getNextIsland() then
        CanBuyChip = true
        NiggaRaid = true
        if getNextIsland() then
            spawn(function()
                pcall(function()
                    NoClip = true
                    Tween(getNextIsland().CFrame * CFrame.new(0, 60, 0))
                end)
            end)
        end
        spawn(function()
            KillAura()
        end)
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Raid"] then
            SetTitleStatus("Status : Auto Raid")
            AutoRaid()
        end
    end
end)

-- // Upgraded Race \\ --

local PullC = UpgradedRaceTab:MakeSection({
    Title = "Mirage Lever Pull",
    Content = ""
})

function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
end
function TweenBlueGear()
    BlueGear = getBlueGear()
    if BlueGear then
        Tween(BlueGear.CFrame)
    end
end

PullC:MakeButton({
    Name = "Tween to Blue Gear",
    Description = "",
    Callback = function()
        TweenBlueGear()
    end
})

function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
end
function TeleHighPoint()
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        if getHighestPoint() then
            Tween(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
        end
    end
end

PullC:MakeButton({
    Name = "Tween to Highest Point",
    Description = "",
    Callback = function()
        TeleHighPoint()
    end
})

local ToggleLockMoon = PullC:MakeToggle({
    Name = "Move Cam To Moon",
    Description = "",
    Default = Bulon["Move Cam To Moon"],
    Callback = function(Value)
        Bulon["Move Cam To Moon"] = Value
        SaveSettings()
    end
})

spawn(function()
    while task.wait() do
        if Bulon["Move Cam To Moon"] then
            game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, game.Workspace.CurrentCamera.CFrame.p + game.Lighting:GetMoonDirection() * 100)
        end
    end
end)

local ToggleAutoPullLever = PullC:MakeToggle({
    Name = "Auto Pull Lever",
    Description = "",
    Default = Bulon["Auto Pull Lever"],
    Callback = function(Value)
        Bulon["Auto Pull Lever"] = Value
        SaveSettings()
    end
})

local ToggleAutoPullLeverHop = PullC:MakeToggle({
    Name = "Auto Pull Lever [ HOP ]",
    Description = "",
    Default = Bulon["Auto Pull Lever [ HOP ]"],
    Callback = function(Value)
        Bulon["Auto Pull Lever [ HOP ]"] = Value
        if Value then
            if not Bulon["Auto Pull Lever"] then
                Library:MakeNotify({
                    Title = "Sitink Hub",
                    Content = "Please Turn On Auto Pull Lever!!!",
                    Description = "Auto Pull Lever [ HOP ]",
                    Time = 10 
                })
            end
        end
        SaveSettings()
    end
})

function QuestHeadnungcac()
    if GetDistance(CFrame.new(2956.78, 2281.85, -7217.63)) > 10 then
        Tween(CFrame.new(2956.78, 2281.85, -7217.63))
    else
        local args = {
            [1] = "RaceV4Progress",
            [2] = "Teleport"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
    if GetDistance(CFrame.new(28610, 14897, 105, 1, 0, 0, 0, 1, 0, 0, 0, 1)) < 1000 then
        repeat wait()
            Tween(CFrame.new(28610, 14897, 105, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        until GetDistance(CFrame.new(28610, 14897, 105, 1, 0, 0, 0, 1, 0, 0, 0, 1)) <= 10
        local args = {
            [1] = "RaceV4Progress",
            [2] = "TeleportBack"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

function RemoveFrog()
    game.Lighting.FogEnd = 100000
    for r, v in pairs(game.Lighting:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Pull Lever"] and Third_World then
            RemoveFrog()
            if GetInventory("Valkyrie Helm") and GetInventory("Mirror Fractal") then
                if Rc.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 1 then
                    Rc.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
                elseif Rc.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 2 then
                    QuestHeadnungcac()
                elseif Rc.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 3 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
                elseif DetectMirage() then
                    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                        if getBlueGear() then
                            pcall(function()
                                HighestPoint = getHighestPoint().CFrame * CFrame.new(0, 211.88, 0)
                            end)
                            Gear = getBlueGear()
                            if Gear and not Gear.CanCollide and Gear.Transparency ~= 1 then
                                repeat wait()
                                    Tween(getBlueGear().CFrame * CFrame.new(0, 3, 0))
                                until not getBlueGear() or getBlueGear().Transparency == 1 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor")
                            elseif Gear and Gear.Transparency == 1 then
                                if HighedPoint and (plr.Character.HumanoidRootPart.Position - HighedPoint.Position).Magnitude > 10 then
                                    Tween(HighestPoint)
                                elseif HighedPoint and (plr.Character.HumanoidRootPart.Position - HighedPoint.Position).Magnitude <= 10 then
                                    ToggleLockMoon:Set(true)
                                    SendKey("T")
                                end
                            end
                        elseif not getBlueGear() and getHighestPoint() then
                            if game.Lighting.ClockTime < 18 and game.Lighting.ClockTime > 5 then
                                thoigiantoinay = math.floor(18 - game.Lighting.ClockTime)
                                Library:MakeNotify({
                                    Title = "Sitink Hub",
                                    Content = "Please Waitting Night!!!",
                                    Description = "Auto Pull Lever",
                                    Time = 5 
                                })
                                wait(6)
                            end
                        end
                    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                        ToggleLockMoon:Set(false)
                        PullLever()
                        Library:MakeNotify({
                            Title = "Sitink Hub",
                            Content = "Pull Lever Complete!!!",
                            Description = "Auto Pull Lever",
                            Time = 5 
                        })
                    end
                else
                    if Bulon["Auto Pull Lever [ HOP ]"] then
                        HopServer()
                    end
                end
            end
        end
    end
end)

local Rce = UpgradedRaceTab:MakeSection({
    Title = "Upgraded Race",
    Content = "Teleport To Door Race, ..."
})

Rce:Section("Trials")

Rce:MakeButton({
    Name = "Tween to Current Race Door",
    Description = "",
    Callback = function()
        repeat task.wait()
            Tween(WS.Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union.CFrame)
        until (WS.Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union.CFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 8
    end
})

Rce:MakeButton({
    Name = "Tween to Lever Pull",
    Description = "",
    Callback = function()
        repeat task.wait()
            PullLever()
        until (WS.Map["Temple of Time"].Lever.Part.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 8
    end
})

Rce:MakeButton({
    Name = "Tween to Acient One",
    Description = "",
    Callback = function()
        repeat task.wait()
            TweenTemple()
            Tween(CFrame.new(28973.0879, 14889.9756, -120.298691))
        until (CFrame.new(28973.0879, 14889.9756, -120.298691).Position - plr.Character.HumanoidRootPart.Position).Magnitude < 8
    end
})

Rce:MakeButton({
    Name = "Tween to Clock",
    Description = "",
    Callback = function()
        repeat task.wait()
            TweenTemple()
            Tween(CFrame.new(29551.9941, 15069.002, -85.5179291))
        until (CFrame.new(29551.9941, 15069.002, -85.5179291).Position - plr.Character.HumanoidRootPart.Position).Magnitude < 8
    end
})

local ToggleAutoTrials = Rce:MakeToggle({
    Name = "Auto Trials",
    Description = "",
    Default = Bulon["Auto Trials"],
    Callback = function(Value)
        Bulon["Auto Trials"] = Value
        SaveSettings()
        if Value then
            Library:MakeNotify({
                Title = "Sitink Hub",
                Content = "Choose Weapons Skills In Settings Farm!!!",
                Description = "Auto Trials",
                Time = 5 
            })
        end
    end
})

function TrialHuman()
    if WS["_WorldOrigin"].Locations:FindFirstChild("Trial of Strength") then
        StrengthPart = WS["_WorldOrigin"].Locations["Trial of Strength"].CFrame
        if GetDistance(StrengthPart) <= 1000 then
            for i, v in pairs(WS.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent then
                    if GetDistance(v.HumanoidRootPart.Position) <= 2000 then
                        repeat wait()
                            KillMob(v.Name, function()
                                return v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or Bulon["Auto Trials"] == false
                            end)
                        until v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or Bulon["Auto Trials"] == false
                    end
                end
            end
        end
    end
end

function GhoulTrial()
    if WS["_WorldOrigin"].Locations:FindFirstChild("Trial of Carnage") then
        if GetDistance(WS["_WorldOrigin"].Locations["Trial of Carnage"].Position) <= 1000 then
            for i, v in pairs(WS.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent then
                    if GetDistance(v.HumanoidRootPart.Position) <= 1000 then
                        repeat wait()
                            KillMob(v.Name, function()
                                return v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or Bulon["Auto Trials"] == false
                            end)
                        until v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or Bulon["Auto Trials"] == false
                    end
                end
            end
        end
    end
end

IsTrial = true
spawn(function()
    while task.wait() do
        for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
            if v:IsA("TextLabel") then 
                if string.find(v.Text,"completed your trial!")  or string.find(v.Text,"All trials have been completed!") then 
                    IsTrial = false
                end
            end
        end
    end
end)

function AutoTrials()
    if not IsTrial then
        ToggleAutoTrials:Set(false)
        IsTrial = true
        task.wait(3)
        return
    end    
    if plr.PlayerGui.Main.Timer.Visible then
        local UGay = plr.Data.Race.Value
        if UGay == "Human" then
            TrialHuman()
        elseif UGay == "Skypiea" then
            if WS["_WorldOrigin"].Locations["Trial of the King"] and GetDistance(WS["_WorldOrigin"].Locations["Trial of the King"].CFrame.Position) <= 1000 then
                Tween(WS.Map.SkyTrial.Model.FinishPart.CFrame)
                task.wait(3)
            end
        elseif UGay == "Ghoul" then
            GhoulTrial()
        elseif UGay == "Fishman" then
            if WS["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
                for i,v in pairs(WS.SeaBeasts:GetChildren()) do
                    if v.Name == "SeaBeast1" and v:FindFirstChild("HumanoidRootPart") then
                        if v:FindFirstChild("Health") and v.Health.Value > 0 then
                            repeat task.wait()
                                Buso()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0))
                                AimPos = v.HumanoidRootPart.Position
                                AimSkill = true
                                NoClip = true
                                SpamSkill = true
                            until v:FindFirstChild("Health").Value <= 0 or Bulon["Auto Trials"] == false
                            NoClip = false
                            AimSkill = false
                            SpamSkill = false
                            AimPos = nil
                            CancelTween()
                        end
                    end
                end
            end
        elseif UGay == "Mink" then
            if WS["_WorldOrigin"].Locations["Trial of Speed"] then
                if GetDistance(WS["_WorldOrigin"].Locations["Trial of Speed"].Position) <= 1000 then
                    Tween(WS.StartPoint.CFrame * CFrame.new(0, 2, 0))
                end
            end
        elseif UGay == "Cyborg" then
            if GetDistance(CFrame.new(-20021.8691,10090.4893,-16.37994,-0.976144373,6.71342875e-08,-0.217122361,8.46145412e-08,1,-7.1212007e-08,0.217122361,-8.78849065e-08,-0.976144373)) <= 1000 then
                Tween(CFrame.new(-20021.8691,10090.4893,-16.37994,-0.976144373,6.71342875e-08,-0.217122361,8.46145412e-08,1,-7.1212007e-08,0.217122361,-8.78849065e-08,-0.976144373))
            end
        end
    else
        if IsTrial and not plr.PlayerGui.Main.Timer.Visible then
            Tween(WS.Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union.CFrame)
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Trials"] and Third_World then
            AutoTrials()
        end
    end
end)

local ToggleAutoKillTrial = Rce:MakeToggle({
    Name = "Auto Kill Players When Complete Trial",
    Description = "",
    Default = Bulon["Auto Kill Players When Complete Trial"],
    Callback = function(Value)
        Bulon["Auto Kill Players When Complete Trial"] = Value
        SaveSettings()
        if Value then
            Library:MakeNotify({
                Title = "Sitink Hub",
                Content = "Pick Weapons Skill In Settings Farm!!!",
                Description = "Auto Kill Players When Complete Trial",
                Time = 5 
            })
        end
    end
})

function GetPlayerTrial()
    for i, v in pairs(WS.Characters:GetChildren()) do
        if v.Name ~= plr.Name then
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health <= 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                if (v.HumanoidRootPart.Position - Vector3.new(28718.068359375, 14887.5625, -60.5482177734375)) <= 150 then
                    return v
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        if Bulon["Auto Kill Players When Complete Trial"] then
            if plr.PlayerGui.Main.Timer.Visible == true then
                if GetDistance(CFrame.new(28718.88671875, 14907.6630859375, -56.46955871582031)) <= 300 then
                    if GetPlayerTrial() then
                        local v = GetPlayerTrial()
                        repeat wait()
                            v.HumanoidRootPart.Size = Vector3.new(30, 30, 30)
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 5, 2))
                            Click()
                            DoAttack()
                            EquipWeapon()
                            Buso()
                            if Bulon["Skill Z"] then
                                SendKey("Z")
                            end
                            if Bulon["Skill X"] then
                                SendKey("X")
                            end
                            if Bulon["Skill C"] then
                                SendKey("C")
                            end
                            NoClip = true
                        until v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or Bulon["Auto Kill Players When Complete Trial"] == false
                        NoClip = false
                    end
                end
            end
        end
    end
end)

game:GetService("CorePackages").Packages["_Index"].Utils.Utils.executor:Destroy()
game:GetService("CorePackages").Packages["_Index"].Utils.Utils:Destroy()

game:GetService("StarterGui"):SetCore("SendNotification", {Title = "sitink hub", Text = "Loading complete", Duration = 5})
