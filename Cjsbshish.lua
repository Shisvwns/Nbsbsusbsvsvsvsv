--= [ Create Menu ] =--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Tinh Linh Hub",
    Icon = "rbxassetid://16730867128",
    Author = "obievn",
    Folder = "Tinh Linh Hub",
    Size = UDim2.fromOffset(590, 340),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 145
})

--= [ Anti Kick & Anti Admin ] =--

local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
else
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

_G.AntiFlagReset = true
spawn(function()
    while wait(2000) do
         if _G.AntiFlagReset then
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    end
end)

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	repeat wait()
		if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
			if _G.Team == "Pirates" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			elseif _G.Team == "Marines" then
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do                                                                                                
					v.Function()
				end
			end
		end
	until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = (function(...) return ... end)
	LPH_NO_VIRTUALIZE = (function(...) return ... end)
	LPH_NO_UPVALUES = (function(...) return ... end)
end

local function TeleportToServer(JobId)
    local Succ, Err = pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobId, game.Players.LocalPlayer)
    end)
    if not Succ then print(Err) end
end

local CheckAdmin = {"rip_indra","wenlocktoad","toilamvidamme","Uzoth","Azarth","Hingoi","Axiore","Death_King","Polkster","Lunoven","TheGreateAced","rip_fud","drip_mama","oofficialnoobie","Daigrock","layandikit12","red_game43","arlthmetic",}
task.spawn(function()
    while wait() do
        for _, User in ipairs(game.Players:GetPlayers()) do
            if table.find(CheckAdmin, User.Name) then
                local PlaceID = game.PlaceId
                local API = "https://games.roblox.com/v1/games/"
                local Limit = "/servers/Public?sortOrder=Asc&limit=100"
                local Serv = HttpService:JSONDecode(game:HttpGet(API .. PlaceID .. Limit))
                if Serv and Serv.data and #Serv.data > 0 then
                    TeleportToServer(Serv.data[1].id)
                end
            end
        end
    end
end)

--= [ Create Tab ] =--

local Setting = Window:Tab({Title = "Setting", Icon = "settings"})
local Hold = Window:Tab({Title = "Hold & Use Skill", Icon = "alarm-clock"})
local Farm = Window:Tab({Title = "Farm", Icon = "sword"})
local FruitRaid = Window:Tab({Title = "Fruits & Raid", Icon = "banana"})
local Other = Window:Tab({Title = "Miscellaneous", Icon = "boxes"})
local ItemQuest = Window:Tab({Title = "Item & Quest", Icon = "axe"})
local Player = Window:Tab({Title = "Local Player", Icon = "person-standing"})
local PvP = Window:Tab({Title = "PvP", Icon = "swords"})
local Sea = Window:Tab({Title = "Sea Event", Icon = "anchor"})
local Race = Window:Tab({Title = "Upgrade Race", Icon = "user-cog"})
local StatsEsp = Window:Tab({Title = "Stats & Esp", Icon = "arrow-big-up"})
local Teleport = Window:Tab({Title = "Teleport", Icon = "map-pin"})
local StatusServer = Window:Tab({Title = "Status & Server", Icon = "server"})
local Shop = Window:Tab({Title = "Shop", Icon = "shopping-bag"})

--= [ Tab Setting ] =--

Setting:Section({Title = "~ Setting Farm ~"})

Setting:Dropdown({
    Title = "Select Weapon",
    Multi = false,
    Value = "Melee",
    AllowNone = true,
    Values = {"Melee","Sword","Gun","Blox Fruit"},
    Callback = function(Cac)
        _G.SelectWeapons = Cac
    end
})

Setting:Dropdown({
    Title = "Select Attack Speed",
    Multi = false,
    Value = "Fast [ 0.1s ]",
    AllowNone = true,
    Values = {"No Delay [ 0.0s ]","Super Fast [ 0.05s ]","Fast [ 0.1s ]","Moderate [ 0.3s ]","Default [ 0.5s ]","Medium [ 0.8s ]","Slow [ 1.0s ]"},
    Callback = function(Cac)
        _G.AttackSpeed = Cac
        if _G.AttackSpeed == "No Delay [ 0.0s ]" then
           FastAttackDelay = 0
        elseif _G.AttackSpeed == "Super Fast [ 0.05s ]" then
           FastAttackDelay = 0.05
        elseif _G.AttackSpeed == "Fast [ 0.1s ]" then
           FastAttackDelay = 0.1
        elseif _G.AttackSpeed == "Moderate [ 0.3s ]" then
           FastAttackDelay = 0.3
        elseif _G.AttackSpeed == "Default [ 0.5s ]" then
           FastAttackDelay = 0.5
        elseif _G.AttackSpeed == "Medium [ 0.8s ]" then
           FastAttackDelay = 0.8
        elseif _G.AttackSpeed == "Slow [ 1.0s ]" then
           FastAttackDelay = 1
        end
    end
})

Setting:Toggle({
    Title = "Fast Attack",
    Value = true,
    Callback = function(Cac)
        Fast_Attack = Cac
		DamageAura = Cac
		ClickNoCooldown = Cac
		DmgAttack.Enabled = not Cac
    end
})

Setting:Toggle({
    Title = "Auto Click [ 75% Kick System ]",
    Value = false,
    Callback = function(Cac)
        _G.AutoClick = Cac
    end
})

Setting:Dropdown({
    Title = "Select Range Bring Mob",
    Multi = false,
    Value = "Slightly Far [ 300m ]",
    AllowNone = true,
    Values = {"Really Far [ 350m ]","Distant [ 325m ]","Slightly Far [ 300m ]","Near The [ 275m ]","Very Close [ 250m ]"},
    Callback = function(Cac)
        _G.BringMob = Cac
        if _G.BringMob == "Really Far [ 350m ]" then
           BringRange = 350
        elseif _G.BringMob == "Distant [ 325m ]" then
           BringRange = 325
        elseif _G.BringMob == "Slightly Far [ 300m ]" then
           BringRange = 300
        elseif _G.BringMob == "Near The [ 275m ]" then
           BringRange = 275
        elseif _G.BringMob == "Very Close [ 250m ]" then
           BringRange = 250
        end
    end
})

Setting:Toggle({
    Title = "Bring Mob",
    Value = true,
    Callback = function(Cac)
        _G.BringMobs = Cac
    end
})

Setting:Section({Title = "~ Move ~"})

Setting:Slider({
    Title = "Fly Speed",
    Step = 1,
    Value = {Min = 1, Max = 400, Default = 350},
    Callback = function(Cac)
        _G.FlySpeed = Cac
    end
})

Setting:Toggle({
    Title = "Bypass Move Or Fly",
    Value = false,
    Callback = function(Cac)
        _G.BypassTeleport = Cac
    end
})

Setting:Section({Title = "~ Graphic & Reduce Lag ~"})

Setting:Toggle({
    Title = "White Screen",
    Value = false,
    Callback = function(Cac)
        _G.WhiteScreen = Cac
        if _G.WhiteScreen == true then
   	     game:GetService("RunService"):Set3dRenderingEnabled(false)
	    elseif _G.WhiteScreen == false then
 	       game:GetService("RunService"):Set3dRenderingEnabled(true)
	    end
    end
})

Setting:Toggle({
	Title = "Disabled Notifications Text",
    Value = false,
	Callback = function(Cac)
		_G.DisabledNotify = Cac
	end
})

Setting:Toggle({
	Title = "Disabled Damage Counter",
    Value = true,
	Callback = function(Cac)
		_G.DisabledDamage = Cac
	end
})

Setting:Button({
    Title = "Remove Fog",
    Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
    	game:GetService("Lighting").Sky:Destroy()
    end
})

Setting:Button({
    Title = "Remove Lava",
    Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
		for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then   
				v:Destroy()
			end
		end
    end
})

Setting:Button({
    Title = "Fps Booster",
    Callback = function()
        FpsBooster()
    end
})

Setting:Slider({
    Title = "Brightness",
    Step = 1,
    Value = {Min = 1, Max = 100, Default = 20},
    Callback = function(Cac)
        _G.Brightness = Cac
    end
})

Setting:Button({
    Title = "Set Brightness",
    Callback = function()
        game:GetService("Lighting").Brightness = _G.Brightness
    end
})

Setting:Section({Title = "~ Other ~"})

Setting:Toggle({
	Title = "Auto Rejoin When Disconnect",
    Value = true,
	Callback = function(Cac)
		_G.AutoRejoin = Cac
	end
})

Setting:Button({
	Title = "Reset Character",
	Callback = function()
    	game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
	end
})

--= [ Hold & Use Skill ]

Hold:Section({Title = "~ Use Skill & Hold Skill ~"})

Hold:Paragraph({
    Title = "Setting Skill Devil Fruit",
    Desc = "0.1 = 0.1s | 3 = 3s"
})

Hold:Dropdown({
    Title = "Use Skill Devil Fruits",
    Multi = true,
    Value = {"Z","X","C","V"},
    AllowNone = true,
    Values = {"Z","X","C","V"},
    Callback = function(Cac)
        _G.SkillFruit = Cac
    end
})

Hold:Input({
    Title = "Hold Skill Z",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillFruitSeaZ = Cac
    end
})

Hold:Input({
    Title = "Hold Skill X",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillFruitSeaX = Cac
    end
})

Hold:Input({
    Title = "Hold Skill C",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillFruitSeaC = Cac
    end
})

Hold:Input({
    Title = "Hold Skill V",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillFruitSeaV = Cac
    end
})

Hold:Paragraph({
    Title = "Setting Skill Melee",
    Desc = "0.1 = 0.1s | 3 = 3s"
})

Hold:Dropdown({
    Title = "Use Skill Melee",
    Multi = true,
    Value = {"Z","X","C","V"},
    AllowNone = true,
    Values = {"Z","X","C","V"},
    Callback = function(Cac)
        _G.SkillMelee = Cac
    end
})

Hold:Input({
    Title = "Hold Skill Z",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillMeleeSeaZ = Cac
    end
})

Hold:Input({
    Title = "Hold Skill X",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillMeleeSeaX = Cac
    end
})

Hold:Input({
    Title = "Hold Skill C",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillMeleeSeaC = Cac
    end
})

Hold:Input({
    Title = "Hold Skill V",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillMeleeSeaV = Cac
    end
})

Hold:Paragraph({
    Title = "Setting Skill Sword",
    Desc = "0.1 = 0.1s | 3 = 3s"
})

Hold:Dropdown({
    Title = "Use Skill Sword",
    Multi = true,
    Value = {"Z","X"},
    AllowNone = true,
    Values = {"Z","X"},
    Callback = function(Cac)
        _G.SkillSword = Cac
    end
})

Hold:Input({
    Title = "Hold Skill Z",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillSwordSeaZ = Cac
    end
})

Hold:Input({
    Title = "Hold Skill X",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillSwordSeaX = Cac
    end
})

Hold:Paragraph({
    Title = "Setting Skill Gun",
    Desc = "0.1 = 0.1s | 3 = 3s"
})

Hold:Dropdown({
    Title = "Use Skill Gun",
    Multi = true,
    Value = {"Z","X"},
    AllowNone = true,
    Values = {"Z","X"},
    Callback = function(Cac)
        _G.SkillGun = Cac
    end
})

Hold:Input({
    Title = "Hold Skill Z",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillGunSeaZ = Cac
    end
})

Hold:Input({
    Title = "Hold Skill X",
    Value = "0",
    PlaceholderText = "Enter Hold Time",
    ClearTextOnFocus = false,
    Callback = function(Cac)
        _G.HoldSkillGunSeaX = Cac
    end
})

--= [ Tab Farm ] =--

Farm:Section({Title = "~ Level ~"})

Farm:Paragraph({
    Title = "Your Level",
    Desc = "Wait Loading..."
})

Farm:Dropdown({
    Title = "Select Farm Level Mode",
    Multi = false,
    Value = "Get Quest",
    Values = {"No Quest","Get Quest"},
    Callback = function(Cac)
        _G.LevelMode = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm Level",
    Value = false,
    Callback = function(Cac)
        _G.FarmLevel = Cac
        StopTween(_G.FarmLevel)
    end
})

Farm:Toggle({
    Title = "Auto Farm Fast [ Lv. 1 -> Lv. 250 ]",
    Value = false,
    Callback = function(Cac)
        _G.FarmSkip = Cac
        StopTween(_G.FarmSkip)
    end
})

Farm:Toggle({
    Title = "Auto Farm Nearest",
    Value = false,
    Callback = function(Cac)
        _G.FarmNearest = Cac
        StopTween(_G.FarmNearest)
    end
})

Farm:Section({Title = "~ Katakuri ~"})

Farm:Paragraph({
    Title = "Defeat Cake Prince",
    Desc = "Wait Loading..."
})

Farm:Dropdown({
    Title = "Select Farm Katakuri Mode",
    Multi = false,
    Value = "Get Quest",
    Values = {"No Quest","Get Quest"},
    Callback = function(Cac)
        _G.KatakuriMode = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm Katakuri",
    Value = false,
    Callback = function(Cac)
        _G.FarmKatakuri = Cac
        StopTween(_G.FarmKatakuri)
    end
})

Farm:Toggle({
    Title = "Auto Spawn Katakuri",
    Value = true,
    Callback = function(Cac)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",Cac)
    end
})

Farm:Section({Title = "~ Bone ~"})

Farm:Paragraph({
    Title = "Your Bone",
    Desc = "Wait Loading..."
})

Farm:Dropdown({
    Title = "Select Farm Bone Mode",
    Multi = false,
    Value = "Get Quest",
    Values = {"No Quest","Get Quest"},
    Callback = function(Cac)
        _G.BoneMode = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm Bone",
    Value = false,
    Callback = function(Cac)
        _G.FarmBone = Cac
        StopTween(_G.FarmBone)
    end
})

Farm:Toggle({
    Title = "Auto Random Bone",
    Value = false,
    Callback = function(Cac)
        _G.RandomBone = Cac
    end
})

Farm:Toggle({
    Title = "Auto Spawn & Kill Soul Reaper",
    Value = false,
    Callback = function(Cac)
        _G.SoulReaper = Cac
        StopTween(_G.SoulReaper)
    end
})

Farm:Section({Title = "~ Devil Fruit & Gun Mastery ~"})

Farm:Toggle({
    Title = "Auto Farm Devil Fruit Mastery",
    Value = false,
    Callback = function(Cac)
        _G.FruitsMastery = Cac
        StopTween(_G.FruitsMastery)
    end
})

Farm:Toggle({
    Title = "Auto Farm Gun Mastery",
    Value = false,
    Callback = function(Cac)
        _G.GunMastery = Cac
        StopTween(_G.GunMastery)
    end
})

Farm:Paragraph({
    Title = "Mob Health & Use Skill Devil Fruit + Gun",
})

Farm:Slider({
    Title = "Kill Mob At % Health",
    Step = 1,
    Value = {Min = 1, Max = 100, Default = 20},
    Callback = function(Cac)
        _G.MobHealth = Cac
    end
})

Farm:Toggle({
    Title = "Use Skill Z",
    Value = true,
    Callback = function(Cac)
        _G.SkillZ = Cac
    end
})

Farm:Toggle({
    Title = "Use Skill X",
    Value = true,
    Callback = function(Cac)
        _G.SkillX = Cac
    end
})

Farm:Toggle({
    Title = "Use Skill C",
    Value = true,
    Callback = function(Cac)
        _G.SkillC = Cac
    end
})

Farm:Toggle({
    Title = "Use Skill V",
    Value = true,
    Callback = function(Cac)
        _G.SkillV = Cac
    end
})

Farm:Section({Title = "~ Melee & Sword Mastery ~"})

Farm:Dropdown({
    Title = "Select Mastery",
    Multi = false,
    Value = "300",
    Values = {"100","200","300","400","500","600"},
    Callback = function(Cac)
        _G.SelectMastery = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm All Melee Mastery",
    Value = false,
    Callback = function(Cac)
        _G.FarmAllMelee = Cac
        StopTween(_G.FarmAllMelee)
    end
})

Farm:Toggle({
    Title = "Auto Farm All Sword Mastery",
    Value = false,
    Callback = function(Cac)
        _G.FarmAllSword = Cac
        StopTween(_G.FarmAllSword)
    end
})

Farm:Section({Title = "~ Boss ~"})

Farm:Dropdown({
    Title = "Select Farm Boss Mode",
    Multi = false,
    Value = "No Quest",
    Values = {"No Quest","Get Quest"},
    Callback = function(Cac)
        _G.BossMode = Cac
    end
})

local BossName = Farm:Dropdown({
    Title = "Select Boss",
    Multi = false,
    Value = "",
    Values = BossCheck,
    Callback = function(Cac)
        _G.SelectBoss = Cac
    end
})

Farm:Button({
    Title = "Refesh Boss List",
    Callback = function()
        RefeshBoss()
    end
})

Farm:Toggle({
    Title = "Auto Farm Boss",
    Value = false,
    Callback = function(Cac)
        _G.FarmBoss = Cac
        StopTween(_G.FarmBoss)
    end
})

Farm:Toggle({
    Title = "Auto Farm All Boss",
    Value = false,
    Callback = function(Cac)
        _G.FarmAllBoss = Cac
        StopTween(_G.FarmAllBoss)
    end
})

Farm:Section({Title = "~ Mob ~"})

if World1 then
	MobList = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	MobList = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	MobList = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end

Farm:Dropdown({
    Title = "Select Mob",
    Multi = false,
    Value = "",
    Values = MobList,
    Callback = function(Cac)
        _G.SelectMob = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm Mob",
    Value = false,
    Callback = function(Cac)
        _G.FarmMob = Cac
        StopTween(_G.FarmMob)
    end
})

Farm:Section({Title = "~ Material ~"})

if World1 then
    MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail"}
elseif World2 then
    MaterialList = {"Scrap Metal","Leather","Radioactive Material","Ectoplasm","Mystic Droplet","Magma Ore","Vampire Fang"}
elseif World3 then
    MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
end

Farm:Dropdown({
    Title = "Select Material",
    Multi = false,
    Value = "",
    Values = MaterialList,
    Callback = function(Cac)
        _G.SelectMaterial = Cac
    end
})

Farm:Toggle({
    Title = "Auto Farm Material",
    Value = false,
    Callback = function(Cac)
        _G.FarmMaterial = Cac
        StopTween(_G.FarmMaterial)
    end
})
