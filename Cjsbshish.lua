if game.PlaceId == 2753915549 then --091
    Main = true
elseif game.PlaceId == 4442272183 then
    Dressora = true
elseif game.PlaceId == 7449423635 then
    Zou = true
end
local function CheckQuest()--2
    local Quest = require(game.ReplicatedStorage.Quests)
    local QuestTable = {}
    local Ignore = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local LevelData = game.Players.LocalPlayer.Data.Level.Value
    local min = 0
    local IdPlG = game.PlaceId
    if LevelData >= 1450 and IdPlG == 4442272183 then
        QuestTable["MobName"] = "Water Fighter"
        QuestTable["QuestName"] = "ForgottenQuest"
        QuestTable["LevelQuest"] = 2
    elseif LevelData >= 700 and IdPlG == 2753915549 then
        QuestTable["MobName"] = "Galley Captain"
        QuestTable["QuestName"] = "FountainQuest"
        QuestTable["LevelQuest"] = 2
    else
        for r, v in pairs(Quest) do
            for m,n in pairs(v) do
                local U = n.LevelReq
                for O, P in pairs(N.Task) do
                    if LevelData >= U and U >= min and N.Task[O] > 1 and not table.find(Ignore, tostring(r)) then
                        min = U
                        QuestTable["MobName"] = tostring(O)
                        QuestTable["QuestName"] = r
                        QuestTable["LevelQuest"] = m
                    end
                end
            end
        end
    end
    return QuestTable
end
function CheckNearestTeleporter(P) --Skid YMF
    local min = math.huge
    local min2 = math.huge
    local choose 
    if Zou then
        TableLocations = {
            ["1"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["2"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["3"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["4"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["5"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["6"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif Dressora then
        TableLocations = {
            ["1"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["2"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["3"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["4"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif Main then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - P.Position).Magnitude
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
    if min2 <= GetDistance(P) then
        return choose
    end
end
function GetNPCPosition()
    local GuideModule = require(game.ReplicatedStorage.GuideModule)
    for i,v in pairs(GuideModule.Data["NPCList"]) do
		if v.NPCName == GuideModule.Data["LastClosestNPC"] then
			return i.CFrame
		end
	end
end
function GetDistance(q)
    if typeof(q) == "CFrame" then
        return game.Players.LocalPlayer:DistanceFromCharacter(q.Position)
    elseif typeof(q) == "Vector3" then
        return game.Players.LocalPlayer:DistanceFromCharacter(q)
    end
end
function RETeleport(ze)
    local cle = game.Players.LocalPlayer
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", ze)
    humanoidCframe = cle.Character.HumanoidRootPart.CFrame
    humanrootpar = cle.Character.HumanoidRootPart
    humanrootpar.CFrame = CFrame.new(humanoidCframe.X, humanoidCframe.Y + 50, humanoidCframe.Z)
    task.wait(0.5)
end
function ToTween(a, speed)
    if not speed or speed == nil then
        speed = DelayTween
    end
    dis = GetDistance(a.Position)
    if dis <= 250 then
        game.Players.LocalPlayer.HumanoidRootPart.CFrame = a
    end
    local ab = CheckNearestTeleporter(a)
    if ab then
        pcall(function()
            tween:Cancel()
        end)
        requestEntrance(aM)
    end
    tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((a.Position - game.Players.LocalPlayer.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear), {CFrame = aL})
    tween:Play()
end
function BypassTeleport(a)
    local CheckDistanceToResetTween = GetDistance(a.Position)
    if CheckDistanceToResetTween > 2100 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        for i = 1,3 do
            game.Players.LocalPlayer.HumanoidRootPart.CFrame = a
        end
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    end
end
function GetQuest()
    local dis = GetDistance(GetNPCPosition())
    local questn, lvq = CheckQuest()["QuestName"], CheckQuest()["LevelQuest"]
    if dis <= 20 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", questn, lvq)
    else
        if Distance > 2000 then
            BypassTeleport(NPCPos())
        else
            ToTween(NPCPos())
        end
    end
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
task.spawn(function()
    while task.wait() do
        if NoClip and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local Hold = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.PrimaryPart)
                Hold.Name = "Hold"
                Hold.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                Hold.Velocity = Vector3.new(0, 0, 0)
                for a, b in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if b:IsA("BasePart") then
                        b.CanCollide = false
                    end
                end
                for r, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        elseif not NoClip and game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
    end
end)
function CheckPart(a)
    if a and a.Parent then
        if a:FindFirstChild("HumanoidRootPart") and a:FindFirstChild("Humanoid") and a.Humanoid.Health > 0 then
            return true
        else
            return false
        end
    end
    return false
end
function MonCheck(c)
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if table.find(c, v.Name) and CheckPart(v) then
            return v
        end
    end
    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
        if table.find(c, v.Name) and CheckPart(v) then
            return v
        end
    end
end
Table1 = {}
function CheckBossSpawn()
    for ik,mn in pairs(game.Workspace.Enemies:GetChildren()) do
        if string.find(mn.Humanoid.DisplayName, "Boss") then
            table.insert(Table1, mn)
        end
    end
end
function EnableBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end
end
function EnableClick()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
end
function EquipTool(ToolSe) --skid
    if va then
        return
    end
    if getgenv()["SelectTool"] == "" or getgenv()["SelectTool"] == nil then
        getgenv()["SelectTool"] = "Melee"
    end
    ToolSe = GetWeapon(getgenv()["SelectTool"])
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        NoClip = true
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        NoClip = false
    end
end
function GetWeapon(bh) --skid
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end
spawn(function()
    while task.wait() do
        if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
            NoClip = true
        elseif tween then
            NoClip = false
        end
    end
end)
function Killing(Mon, valu)
    pcall(function()
        MonI = Mon
        if type(MonI) == "table" and valu then
            if MonCheck(MonI) then
                Mon = MonCheck(MonI)
                if Mon and CheckPart(Mon) then
                    repeat task.wait()
                        EnableBuso()
                        EquipTool()
                        ToTween(Mon.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                        EnableClick()
                        Mon.HumanoidRootPart.CanCollide = false
                        NoClip = true
                    until not Mon or not Mon:FindFirstChild("Humanoid") or not Mon:FindFirstChild("HumanoidRootPart") or Mon.Humanoid.Health <= 0
                end
            end
        else
            if Mon and CheckPart(Mon) then
                repeat task.wait()
                    EnableBuso()
                    EquipTool()
                    ToTween(Mon.HumanoidRootPart.CFrame * CFrame.new(0,15,0))
                    EnableClick()
                    Mon.HumanoidRootPart.CanCollide = false
                    NoClip = true
                until not Mon or not Mon:FindFirstChild("Humanoid") or not Mon:FindFirstChild("HumanoidRootPart") or Mon.Humanoid.Health <= 0
            end
        end
    end)
end
local LibLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dextral-Code/lua/main/ui-library.lua"))()
local HirimiHub = LibLoader:MakeGui({NameHub = "Hirimi Hub", NameGam = "by !DestroyX", Icon = "rbxassetid://16410678154"})
local A = HirimiHub:CreateTab({Name = "Main Options", Icon = "rbxassetid://16410678154"})
A:AddSeperator("Options")
A:AddDropdown({Title = "Tool", Multi = false, Options = {"Melee", "Sword"}, Default = "Melee",
	Callback = function(vTool)
		getgenv()["SelectTool"] = vTool
	end
})
A:AddSlider({Title = "Fast Delay", Min = 0, Max = 400, Increment = 1, Default = 175, ValueName = "Speed",
	Callback = function(vFastDelay) 
		getgenv()["FastDelay"] = vFastDelay/100
	end
})
A:AddToggle({Title = "Fast Attack", Content = "Attack Faster", Default = true, Callback = function(vFast)
    getgenv()["FastAttack"] = vFast
end
})
A:AddToggle({Title = "Farm Level", Content = "", Default = false, Callback = function(vFarmLevel)
    getgenv()["LevelFarm"] = vFarmLevel
end
})
local CurveFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService("VirtualUser")
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)
function CurveFuckWeapon()
    local p13 = CurveFrame.activeController
    if not p13 then
        return nil
    end
    
    local wea = p13.blades[1]
    if not wea then
        return nil
    end
    
    while wea.Parent ~= game.Players.LocalPlayer.Character do
        wea = wea.Parent
    end
    
    return wea
end

function getHits(Size)
    local Hits = {}
    
    local function processHumanoid(Human)
        if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 5 then
            table.insert(Hits, Human.RootPart)
        end
    end

    for _, v in pairs(workspace.Enemies:GetChildren()) do
        processHumanoid(v:FindFirstChildOfClass("Humanoid"))
    end

    for _, v in pairs(workspace.Characters:GetChildren()) do
        if v ~= game.Players.LocalPlayer.Character then
            processHumanoid(v:FindFirstChildOfClass("Humanoid"))
        end
    end
    return Hits
end
function Boost()
    task.spawn(function()
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(CurveFuckWeapon()))
    end)
end
function Unboost()
    task.spawn(function()
        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon", tostring(CurveFuckWeapon()))
    end)
end
local cdnormal = 0
local Animation = Instance.new("Animation")
local CooldownFastAttack = 0
FastAttack = function()
    local ac = CurveFrame.activeController
    if ac and ac.equipped then
        task.spawn(function()
            if tick() - cdnormal > 0.5 then
                ac:attack()
                cdnormal = tick()
            else
                Animation.AnimationId = ac.anims.basic[2]
                ac.humanoid:LoadAnimation(Animation):Play(1, 1)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
            end
        end)
    end
end
bs = tick()
task.spawn(function()
    while task.wait(getgenv()["FastDelay"]) do
        if getgenv()["FastAttack"] then
            FastI = true
            if bs - tick() > 0.75 then
                task.wait()
                bs = tick()
            end
            pcall(function()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            FastAttack()
                            task.wait()
                            Boost()
                            EClick()
                        end
                    end
                end
            end)
        end
    end
end)
k = tick()
task.spawn(function()
    if FastI then
        while task.wait(.2) do
            if k - tick() > 0.75 then
                task.wait()
                k = tick()
            end
            pcall(function()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            task.wait(.000025)
                            Unboost()
                        end
                    end
                end
            end)
        end
    end
end)
task.spawn(function()
    while task.wait() do
        if FastI then
            pcall(function()
                CurveFrame.activeController.timeToNextAttack = -1
                CurveFrame.activeController.focusStart = 0
                CurveFrame.activeController.hitboxMagnitude = 40
                CurveFrame.activeController.humanoid.AutoRotate = true
                CurveFrame.activeController.increment = 1 + 1 / 1
            end)
        end
    end
end)
EnableCurv = true
task.spawn(function()
    local a = game.Players.LocalPlayer
    local b = require(a.PlayerScripts.CombatFramework.Particle)
    local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    if not shared.orl then
        shared.orl = c.wrapAttackAnimationAsync
    end
    if not shared.cpc then
        shared.cpc = b.play
    end
    if EnableCurv then
        pcall(function()
            c.wrapAttackAnimationAsync = function(d, e, f, g, h)
                local i = c.getBladeHits(e, f, g)
                if i then
                    b.play = function()
                    end
                    d:Play(0.25, 0.25, 0.25)
                    h(i)
                    b.play = shared.cpc
                    wait(.5)
                    d:Stop()
                end
            end
        end)
    end
end)
CombatFrameworkR = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
    while wait() do
        if getgenv()["FastAttack"] then
            if typeof(y) == "table" then
                pcall(function()
                    CameraShaker:Stop()
                    y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    y.activeController.timeToNextAttack = -1
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 1655503339.0980349
                    y.activeController.increment = 3
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end
        if getgenv()["FastAttack"] then
            if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                game.Players.LocalPlayer.Character.Stun.Value = 0
                game.Players.LocalPlayer.Character.Busy.Value = false        
            end
        end
    end
end)
function RemoveLvTitle(mob)
    mob = mob:gsub(" %pLv. %d+%p", "")
    return mob
end
task.spawn(function()
    while task.wait() do
        if getgenv()["LevelFarm"] then
            local Quest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
            local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, CheckQuest()["MobName"]) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if Quest.Visible == true then    
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == CheckQuest()["MobName"] and CheckPart(v) then
                        Killing(v)
                    else
                        if game.Workspace._WorldOrigin.EnemySpawns:FindFirstChild(CheckQuest()["MobName"]) then
                            for i,v in pairs(game.Workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                if v.Name == RemoveLvTitle(CheckQuest()["MobName"]) then
                                    ToTween(v.CFrame * CFrame.new(0,15,0))
                                end
                            end
                        end
                    end
                end
            else
                GetQuest()
            end
        end
    end
end)
