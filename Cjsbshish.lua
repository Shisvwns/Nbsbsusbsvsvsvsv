--[ Anti Ban & Anti Afk]

assert(getrawmetatable)
    grm = getrawmetatable(game)
    setreadonly(grm, false)
    old = grm.__namecall
    grm.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return
        elseif tostring(args[1]) == "BR_KICKMOBILE" then
            return
        end
        return old(self, ...)
    end)
    
function CheckAntiCheatBypass()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
end

local function bypassAntiExploit()
    for _, instance in ipairs(filtergc()) do
        if instance:IsA("AntiExploitSystem") then
            instance:Destroy()
        end
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            CheckAntiCheatBypass()
            bypassAntiExploit()
        end)
    end
end)

_G.AntiFlagReset = true
spawn(function()
    while wait(2000) do
         if _G.AntiFlagReset then
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    end
end)

repeat wait() until game:IsLoaded()
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

-- [ World Check ]

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game.Players.LocalPlayer:Kick("Script Only Support Blox Fruit")
end

-- [ Quest Check ]

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
        elseif MyLevel == 15 or MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel == 60 or MyLevel <= 74 then
            Mon = "Desert Bandit"
            LevelQuest = 1
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif MyLevel == 75 or MyLevel <= 89 then
            Mon = "Desert Officer"
            LevelQuest = 2
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
            CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif MyLevel == 90 or MyLevel <= 99 then
            Mon = "Snow Bandit"
            LevelQuest = 1
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif MyLevel == 100 or MyLevel <= 119 then
            Mon = "Snowman"
            LevelQuest = 2
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
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
            Mon = "Dragon Crew Archer [Lv. 1600]"
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
            Mon = "Giant Islander [Lv. 1650]"
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
            Mon = "Marine Rear Admiral [Lv. 1725]"
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
        elseif MyLevel == 2400 or MyLevel <= 2424 then
            Mon = "Candy Pirate"
            LevelQuest = 1
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif MyLevel == 2425 or MyLevel <= 2449 then
            Mon = "Snow Demon"
            LevelQuest = 2
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
            CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif MyLevel == 2450 or MyLevel <= 2474 then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif MyLevel == 2475 or MyLevel <= 2499 then
            Mon = "Island Boy"
            LevelQuest = 2
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
            CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif MyLevel == 2500 or MyLevel <= 2524 then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            NameQuest = "TikiQuest2"
            NameMon = "Sun-kissed Warrior"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
        elseif MyLevel == 2525 or MyLevel <= 2550 then
            Mon = "Isle Champion"
            LevelQuest = 2
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16933.2129, 93.3503036, 999.450989)
        end
    end
end

-- [ Material ]

function MaterialMon()
    if SelectMaterial == "Radioactive Material" then
        MMon = "Factory Staff"
        MPos = CFrame.new(295,73,-56)
        SP = "Default"
    elseif SelectMaterial == "Mystic Droplet" then
        MMon = "Water Fighter"
        MPos = CFrame.new(-3385,239,-10542)
        SP = "Default"
    elseif SelectMaterial == "Magma Ore" then
        if World1 then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815,84,8820)
            SP = "Default"
        elseif World2 then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428,78,-5959)
            SP = "Default"
        end
    elseif SelectMaterial == "Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698,845,-1912)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4607.82275, 872.54248, -1667.55688)).Magnitude >= 5000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
        end
    elseif SelectMaterial == "Ectoplasm" then
        MMon = "Ship Steward"
        MPos = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(923.40197753906, 125.05712890625, 32885.875)).Magnitude >= 10000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.40197753906, 125.05712890625, 32885.875))
        end
    elseif SelectMaterial == "Leather" then
        if World1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145,15,4350)
            SP = "Default"
        elseif World2 then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Default"
        elseif World3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "Default"
        end
    elseif SelectMaterial == "Scrap Metal" then
        if World1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145,15,4350)
            SP = "Default"
        elseif World1 then
            MMon = "Swan Pirate"
            MPos = CFrame.new(878,122,1235)
            SP = "Default"
        elseif World3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107,332,-10549)
            SP = "Default"
        end
    elseif SelectMaterial == "Fish Tail" then
        if World3 then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10993,332,-8940)
            SP = "Default"
        elseif World1 then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            SP = "Default"
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
            end
        end
    elseif SelectMaterial == "Demonic Wisp" then
        MMon = "Demonic Soul"
        MPos = CFrame.new(-9507,172,6158)
        SP = "Default"
    elseif SelectMaterial == "Vampire Fang" then
        MMon = "Vampire"
        MPos = CFrame.new(-6033,7,-1317)
        SP = "Default"
    elseif SelectMaterial == "Conjured Cocoa" then
        MMon = "Chocolate Bar Battler"
        MPos = CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625)
        SP = "Default"
    elseif SelectMaterial == "Dragon Scale" then
        MMon = "Dragon Crew Archer"
        MPos = CFrame.new(6594,383,139)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(5756, 610, -282)).Magnitude >= 1500 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5756, 610, -282))
        end
    elseif SelectMaterial == "Gunpowder" then
        MMon = "Pistol Billionaire"
        MPos = CFrame.new(-469,74,5904)
        SP = "Default"
    elseif SelectMaterial == "Mini Tusk" then
        MMon = "Mythological Pirate"
        MPos = CFrame.new(-13545,470,-6917)
        SP = "Default"
    end
end

-- [ Check Monster ]

function CheckMonFarm()
    if World1 then
        if SelectMob == "Bandit" then
            PosMonster = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif SelectMob == "Monkey" then
            PosMonster = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif SelectMob == "Gorilla" then
            PosMonster = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif SelectMob == "Pirate" then
            PosMonster = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif SelectMob == "Brute" then
            PosMonster = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif SelectMob == "Desert Bandit" then
            PosMonster = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif SelectMob == "Desert Officer" then
            PosMonster = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif SelectMob == "Snow Bandit" then
            PosMonster = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif SelectMob == "Snowman" then
            PosMonster = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif SelectMob == "Chief Petty Officer" then
            PosMonster = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif SelectMob == "Sky Bandit" then
            PosMonster = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif SelectMob == "Dark Master" then
            PosMonster = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif SelectMob == "Prisoner" then
            PosMonster = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif SelectMob == "Dangerous Prisoner" then
            PosMonster = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif SelectMob == "Toga Warrior" then
            PosMonster = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif SelectMob == "Gladiator" then
            PosMonster = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif SelectMob == "Military Soldier" then
            PosMonster = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif SelectMob == "Military Spy" then
            PosMonster = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif SelectMob == "Fishman Warrior" then
            PosMonster = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif SelectMob == "Fishman Commando" then
            PosMonster = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif SelectMob == "God's Guard" then
            PosMonster = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif SelectMob == "Shanda" then
            PosMonster = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif SelectMob == "Royal Squad" then
            PosMonster = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif SelectMob == "Royal Soldier" then
            PosMonster = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif SelectMob == "Galley Pirate" then
            PosMonster = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif SelectMob == "Galley Captain" then
            PosMonster = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if SelectMob == "Raider" then
            PosMonster = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif SelectMob == "Mercenary" then
            PosMonster = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif SelectMob == "Swan Pirate" then
            PosMonster = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif SelectMob == "Factory Staff" then
            PosMonster = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif SelectMob == "Marine Lieutenant" then
            PosMonster = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif SelectMob == "Marine Captain" then
            PosMonster = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif SelectMob == "Zombie" then
            PosMonster = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif SelectMob == "Vampire" then
            PosMonster = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif SelectMob == "Snow Trooper" then
            PosMonster = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif SelectMob == "Winter Warrior" then
            PosMonster = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif SelectMob == "Lab Subordinate" then
            PosMonster = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif SelectMob == "Horned Warrior" then
            PosMonster = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif SelectMob == "Magma Ninja" then
            PosMonster = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif SelectMob == "Lava Pirate" then
            PosMonster = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif SelectMob == "Ship Deckhand" then
            PosMonster = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif SelectMob == "Ship Engineer" then
            PosMonster = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end             
        elseif SelectMob == "Ship Steward" then
            PosMonster = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif SelectMob == "Ship Officer" then
            PosMonster = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif SelectMob == "Arctic Warrior" then
            PosMonster = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
            if _G.AutoFarmMob and (PosMonster.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
            end
        elseif SelectMob == "Snow Lurker" then
            PosMonster = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif SelectMob == "Sea Soldier" then
            PosMonster = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif SelectMob == "Water Fighter" then
            PosMonster = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif World3 then
        if SelectMob == "Pirate Millionaire" then
            PosMonster = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif SelectMob == "Pistol Billionaire" then
            PosMonster = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif SelectMob == "Dragon Crew Warrior" then
            PosMonster = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif SelectMob == "Dragon Crew Archer" then 
            PosMonster = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
        elseif SelectMob == "Female Islander" then
            PosMonster = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
        elseif SelectMob == "Giant Islander" then 
            PosMonster = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
        elseif SelectMob == "Marine Commodore" then
            PosMonster = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif SelectMob == "Marine Rear Admiral" then
            PosMonster = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif SelectMob == "Fishman Raider" then
            PosMonster = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif SelectMob == "Fishman Captain" then
            PosMonster = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif SelectMob == "Forest Pirate" then
            PosMonster = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif SelectMob == "Mythological Pirate" then
            PosMonster = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif SelectMob == "Jungle Pirate" then
            PosMonster = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif SelectMob == "Musketeer Pirate" then
            PosMonster = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif SelectMob == "Reborn Skeleton" then
            PosMonster = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif SelectMob == "Living Zombie" then
            PosMonster = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif SelectMob == "Demonic Soul" then
            PosMonster = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif SelectMob == "Posessed Mummy" then
            PosMonster = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif SelectMob == "Peanut Scout" then
            PosMonster = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif SelectMob == "Peanut President" then
            PosMonster = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif SelectMob == "Ice Cream Chef" then
            PosMonster = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif SelectMob == "Ice Cream Commander" then
            PosMonster = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif SelectMob == "Cookie Crafter" then
            PosMonster = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif SelectMob == "Cake Guard" then
            PosMonster = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif SelectMob == "Baking Staff" then
            PosMonster = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif SelectMob == "Head Baker" then
            PosMonster = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif SelectMob == "Cocoa Warrior" then
            PosMonster = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif SelectMob == "Chocolate Bar Battler" then
            PosMonster = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif SelectMob == "Sweet Thief" then
            PosMonster = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif SelectMob == "Candy Rebel" then
            PosMonster = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif SelectMob == "Candy Pirate" then
            PosMonster = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif SelectMob == "Snow Demon" then
            PosMonster = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif SelectMob == "Isle Outlaw" then
            PosMonster = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif SelectMob == "Island Boy" then
            PosMonster = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif SelectMob == "Sun-kissed Warrior" then
            PosMonster = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
        elseif SelectMob == "Isle Champion" then
            PosMonster = CFrame.new(-16347.4150390625, 92.09503936767578, 1122.335205078125)
        end
    end
end

-- [ Other ]

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
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end
    end
    Teleport()
end

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size12"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(173, 216, 230)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = ('[ Player: '..v.Name..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3)..'m ]')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if IslandESP then 
            if v.Name ~= "Sea" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "GothamBold"
                    name.FontSize = "Size12"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 165, 0)
                else
                    v['NameEsp'].TextLabel.Text = ('[ Island: '.. v.Name ..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)..'m ]')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end
end

function UpdateChestChams() 
    for i,v in pairs(game.Workspace:GetChildren()) do
		if string.find(v.Name,"Chest") then
			if ChestESP then
				if string.find(v.Name,"Chest") then
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size12"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Name == "Chest1" then
							name.TextColor3 = Color3.fromRGB(128, 128, 128)
						end
						if v.Name == "Chest2" then
							name.TextColor3 = Color3.fromRGB(255, 255, 0)
						end
						if v.Name == "Chest3" then
							name.TextColor3 = Color3.fromRGB(0, 191, 255)
						end
					else
	    			    v['NameEsp'..Number].TextLabel.Text = ('[ '..v.Name..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3)..'m ]')
					end
				end
			else
				if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end
    end
end

function UpdateDevilChams() 
    for i,v in pairs(game.Workspace:GetChildren()) do
		if DevilFruitESP then
			if string.find(v.Name, "Fruit") then   
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size12"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = ('[ '..v.Name..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3)..'m ]')
				end
			end
		else
			if v:FindFirstChild('NameEsp'..Number) then
				v:FindFirstChild('NameEsp'..Number):Destroy()
			end
		end
    end
end

function UpdateFlowerChams() 
    for i,v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Flower2" or v.Name == "Flower1" then
			if FlowerESP then 
				if not v:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size12"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 0, 0)
					if v.Name == "Flower1" then 
						name.TextColor3 = Color3.fromRGB(0, 0, 255)
					end
					if v.Name == "Flower2" then
						name.TextColor3 = Color3.fromRGB(255, 0, 0)
					end
                else
                    v['NameEsp'..Number].TextLabel.Text = ('[ '..v.Name ..' ]\n[ Distance: '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..'m ]')
				end
			else
				if v:FindFirstChild('NameEsp'..Number) then
		    		v:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end
    end
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(a)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(a) then
        local a = game.Players.LocalPlayer.Backpack:FindFirstChild(a)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(a)
    end
end

function GetDistance(target1, taget2)
    if not taget2 then
        taget2 = game.Players.LocalPlayer.Character.HumanoidRootPart
    end
    bbos, bbos2 = pcall(function()
        a = target1.Position
        a2 = taget2.Position
    end)
    if bbos then
        a = target1.Position
        a2 = taget2.Position
        return (a - a2).Magnitude
    end
end

function BTP(a)
    local CheckDistanceToResetTween = GetDistance(a.Position)
    if CheckDistanceToResetTween > 2100 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
        for i = 1,3 do
            game.Players.LocalPlayer.HumanoidRootPart.CFrame = a
        end
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    end
end

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear),{CFrame = Pos})
    Tween:Play()
    _G.Clip = true
    if _G.StopTween == true then
        _G.Clip = false
        Tween:Cancel()
    end
end

function TelePlayer(Pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end

Pos = CFrame.new(0,30,0)
RaidPos = CFrame.new(0,70,0)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Clip then
            if not game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                local ag = Instance.new("BodyVelocity")
                ag.Velocity = Vector3.new(0, 0, 0)
                ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                ag.P = 9000
                ag.Parent = game.Players.LocalPlayer.Character.Head
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
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Fastattack then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
        end
    end)
end)

function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
    if game.Players.LocalPlayer.Character:FindFirstChild('Highlight') then
        game.Players.LocalPlayer.Character:FindFirstChild('Highlight'):Destroy()
    end
end

function EquipWeaponGun()
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == "Gun" and v:IsA('Tool') then
			local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
		end
	end
end

function EquipWeaponSword()
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == "Sword" and v:IsA('Tool') then
			local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
		end
	end
end

spawn(function()
	while task.wait() do
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

function MoonTextureId()
    if World1 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif World2 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif World3 then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end
function CheckMoon()
    moon8 = "http://www.roblox.com/asset/?id=9709150401"
    moon7 = "http://www.roblox.com/asset/?id=9709150086"
    moon6 = "http://www.roblox.com/asset/?id=9709149680"
    moon5 = "http://www.roblox.com/asset/?id=9709149431"
    moon4 = "http://www.roblox.com/asset/?id=9709149052"
    moon3 = "http://www.roblox.com/asset/?id=9709143733"
    moon2 = "http://www.roblox.com/asset/?id=9709139597"
    moon1 = "http://www.roblox.com/asset/?id=9709135895"
    moonreal = MoonTextureId()
    cofullmoonkothangbeo = "Bad Moon"
    if moonreal == moon5 or moonreal == moon4 then
        if moonreal == moon5 then
            cofullmoonkothangbeo = "Full Moon"
        elseif moonreal == moon4 then
            cofullmoonkothangbeo = "Next Night"
        end
    end
    return cofullmoonkothangbeo
end
function function7()
    GameTime = "Error"
    local c = game.Lighting
    local ao = c.ClockTime
    if ao >= 18 or ao < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end
function function6()
    return math.floor(game.Lighting.ClockTime)
end
function getServerTime()
    RealTime = tostring(math.floor(game.Lighting.ClockTime * 100) / 100)
    RealTime = tostring(game.Lighting.ClockTime)
    RealTimeTable = RealTime:split(".")
    Minute, Second = RealTimeTable[1], tonumber(0 + tonumber(RealTimeTable[2] / 100)) * 60
    return Minute, Second
end
function function8()
    local c = game.Lighting
    local ao = c.ClockTime
    if CheckMoon() == "Full Moon" and ao <= 5 then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(5 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 5 and ao < 12) then
        return tostring(function6()) .. " ( Fake Moon )"
    elseif CheckMoon() == "Full Moon" and (ao > 12 and ao < 18) then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (ao > 18 and ao <= 24) then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(24 + 6 - ao) .. " Minutes )"
    end
    if CheckMoon() == "Next Night" and ao < 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - ao) .. " Minutes )"
    elseif CheckMoon() == "Next Night" and ao > 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 + 12 - ao) .. " Minutes )"
    end
    return tostring(function6())
end
function FullMoobCheck()
    return function8()
end

if game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit') then
    game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit'):Destroy()
end

-- [ Super Fast Attack ]

local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
CamShake:Stop()
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
function Boost()
    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(CurveFuckWeapon()))
end
bs = tick()
task.spawn(function()
    while task.wait(_G.FastAttackDelay) do
        if _G.FastAttack then
            FastI = true
            pcall(function()
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 60 then
                            FastAttack()
                            task.wait()
                            Boost()
                        end
                    end
                end
            end)
        end
    end
end)
k = tick()
task.spawn(function()
    while task.wait() do
        if FastI then
            pcall(function()
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
                    d:Play(0.1, 0.1, 0.1)
                    h(i)
                    b.play = shared.cpc
                    task.wait()
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
        if _G.FastAttack then
            if typeof(y) == "table" then
                pcall(function()
                    y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 1655503339.0980349
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end
        if _G.FastAttack then
            if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                game.Players.LocalPlayer.Character.Stun.Value = 0
                game.Players.LocalPlayer.Character.Busy.Value = false        
            end
        end
    end
end)

-- [ Ui Orion ]

ScreenGui = Instance.new("ScreenGui");
Frame = Instance.new("Frame");
UIStroke = Instance.new("UIStroke");
UIGradient = Instance.new("UIGradient");
UICorner = Instance.new("UICorner");
TextLabel = Instance.new("TextLabel");
UIGradient1 = Instance.new("UIGradient");
TextLabel1 = Instance.new("TextLabel");
UIGradient2 = Instance.new("UIGradient");
ImageLabel = Instance.new("ImageButton");
adiadi = true
ImageLabel.Activated: Connect(function () 
    game:GetService"RunService": Set3dRenderingEnabled(not a)
    adiadi = not a
end) 

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.499250829, 0, 0.05, 0)
Frame.Size = UDim2.new(0, 170, 0, 50)
Frame.Parent = ScreenGui

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.5
UIStroke.Parent = Frame

UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255))
}
UIGradient.Parent = UIStroke

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame

TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Tinh Linh Hub Script"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 15
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0199637525, 0, 0.276315689, 0)
TextLabel.Size = UDim2.new(0, 170, 0, 6)
TextLabel.Parent = Frame

UIGradient1.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255))
}
UIGradient1.Parent = TextLabel

TextLabel1.Font = Enum.Font.FredokaOne
TextLabel1.Text = "discord.gg/C8YjpmQPJp"
TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.TextSize = 15
TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel1.BackgroundTransparency = 1
TextLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel1.BorderSizePixel = 0
TextLabel1.Position = UDim2.new(0.0199637525, 0, 0.539473593, 0)
TextLabel1.Size = UDim2.new(0, 170, 0, 11)
TextLabel1.Parent = Frame

UIGradient2.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15.000000055879354, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(207.00000286102295, 62.00000010430813, 255))
}
UIGradient2.Parent = TextLabel1

ImageLabel.Image = "rbxassetid://16730867128"
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.448140889, 0, -0.3, 0)
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.Parent = Frame

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/HuyLocDz/Ui/main/OrionUi.lua"))()
local Window =OrionLib:MakeWindow({Name = ":)", IntroEnabled = true, IntroText = "Tinh Linh Hub", IntroIcon = "rbxassetid://16730867128", HidePremium = false, SaveConfig = true, ConfigFolder = "TinhLinhHub"})

OrionLib:MakeNotification({
    Name = "Tinh Linh Hub",
    Content = "Loading Script Tinh Linh Hub...",
    Image = "rbxassetid://16730867128",
    Time = 5
})

-- [ Create Tab ]

local Setting = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Farm = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FruitRaid = Window:MakeTab({Name = "Fruit & Raid", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Other = Window:MakeTab({Name = "Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ItemQuest = Window:MakeTab({Name = "Item & Quest", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Player = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PvP = Window:MakeTab({Name = "PvP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Sea = Window:MakeTab({Name = "Sea Event", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Race = Window:MakeTab({Name = "Race", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local StatsEsp = Window:MakeTab({Name = "Stats & Esp", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Teleport = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local StatusServer = Window:MakeTab({Name = "Status & Server", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Shop = Window:MakeTab({Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- [ Tab Settings]

local Section = Setting:AddSection({
    Name = "Setting Farm"
})

local CheckWeapon1 = Setting:AddDropdown({
	Name = "Select Weapon",
	Default = "Melee",
	Options = {"Melee","Sword","Gun","Blox Fruit"},
	Callback = function(Value)
		SelectWeapon = Value
	end
})

spawn(function()
	while task.wait() do
		if SelectWeapon == SelectWeapon then
			for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == SelectWeapon then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.SelectWeapon = v.Name
					end
				end
			end
		end
	end
end)

Setting:AddDropdown({
	Name = "Select Speed ​​Attack",
	Default = "0",
	Options = {"0","0.1","0.15","0.5","1"},
	Callback = function(Value)
		_G.FastAttackDelay = Value
	end
})

Setting:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
		_G.FastAttack = Value
	end
})

Setting:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		_G.AutoClick = Value
	end
})

Setting:AddToggle({
	Name = "Bring Monster",
	Default = true,
	Callback = function(Value)
		_G.BringMonster = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.BringMonster then
            pcall(function()
                CheckQuest()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoSwordMastery then
                        if StartMagnet and v.Name == Mon and (v.HumanoidRootPart.Position - PosFarm.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosFarm
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoRengoku and StartRengokuMagnet then
                        if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = RengokuMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                        if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = MusketeerHatMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.Auto_EvoRace and StartEvoMagnet then
                        if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMonEvo
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoMaterial and BringMonMaterial then
                        if v.Name == MMon and (v.HumanoidRootPart.Position - MaterialPos.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = MaterialPos
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoFarmMob and SelectMag then
                        if v.Name == SelectMob and (v.HumanoidRootPart.Position - PosMonFarm.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMonFarm
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoBartilo and AutoBartiloBring then
                        if v.Name == "Swan Pirate" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMonBarto
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.Auto_Bone and StartMagnetBoneMon then
                        if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMonBone
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoDoughtBoss and MagnetDought then
                        if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.FarmSkip and StartBring then
                        if v.Name == "Shanda" and (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid:ChangeState(14)
                        end
                    end
                end
            end)
        end
    end
end)

local Section = Setting:AddSection({
    Name = "Graphic & Reduce Lag"
})

Setting:AddToggle({
	Name = "White Screen",
	Default = false,
	Callback = function(Value)
		_G.WhiteScreen = Value
		if _G.WhiteScreen == true then
   	     game:GetService("RunService"):Set3dRenderingEnabled(false)
	    elseif _G.WhiteScreen == false then
 	       game:GetService("RunService"):Set3dRenderingEnabled(true)
	    end
	end
})

spawn(function()
    while wait() do
        if _G.WhiteScreen then
            for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "DamageCounter" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
                    v:Destroy() 
                end
            end
        end
    end
end)

Setting:AddButton({
    Name = "Remove Fog",
    Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
    	game:GetService("Lighting").Sky:Destroy()
    end
})

Setting:AddButton({
    Name = "Fps Booster",
    Callback = function()
        FPSBooster()
    end
})

function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l,"Technology",2)
    sethiddenproperty(t,"Decoration",false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
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
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end

Setting:AddButton({
    Name = "Remove Lava",
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

Setting:AddToggle({
	Name = "Disabled Notifications Text",
	Default = false,
	Callback = function(Value)
		_G.Remove_trct = Value
	end
})

spawn(function()
	while wait() do
		if _G.Remove_trct then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
		end
	end
end)

Setting:AddToggle({
	Name = "Disabled Damage Counter",
	Default = true,
	Callback = function(Value)
		_G.DisabledDamage = Value
	end
})

spawn(function()
	while wait() do
		if _G.DisabledDamage then
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
		else
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
		end
	end
end)

local Section = Setting:AddSection({
    Name = "Other"
})

Setting:AddToggle({
	Name = "Auto Rejoin When Disconnect",
	Default = true,
	Callback = function(Value)
		_G.AutoRejoin = Value
	end
})

spawn(function()
	while wait() do
		if _G.AutoRejoin then
			getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
				if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			 end)
		end
	end
end)

Setting:AddSlider({
	Name = "Value Health",
	Min = 0,
	Max = 100,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.Health = Value
	end
})

Setting:AddToggle({
	Name = "Teleport To Y If Low Health",
	Default = false,
	Callback = function(Value)
		_G.LowHealth = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.LowHealth then
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                if game.Players.LocalPlayer.Character.Humanoid.Health / game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 100 < _G.Health then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
                end
            end
        end
    end
end)

Setting:AddToggle({
	Name = "Bypass Teleport",
	Default = false,
	Callback = function(Value)
		BypassTP = Value
	end
})

local Section = Setting:AddSection({
    Name = "Misc"
})

Setting:AddButton({
    Name = "Show Item",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HuyLocDz/ShowItem/main/ShowItem.lua"))()
    end
})

-- [ Tab Farm ]

local Section = Farm:AddSection({
    Name = "Farm Level"
})

local YourLevel = Farm:AddParagraph("Your Level")

spawn(function()
    while wait() do
        YourLevel:Set("Level: "..game:GetService("Players").LocalPlayer.Data.Level.Value.."/2550")
    end
end)

Farm:AddDropdown({
	Name = "Select Farm Mode",
	Default = "Get Quest",
	Options = {"No Quest","Get Quest"},
	Callback = function(Value)
		LevelFMode = Value
	end
})

local CayLevel = Farm:AddToggle({
	Name = "Auto Farm Level",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
        StopTween(_G.AutoFarm)
	end
})

spawn(function()
    while wait() do
        if LevelFMode == "No Quest" and _G.AutoFarm then
            CheckQuest()
            if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if v.Name == Mon then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                PosFarm = v.HumanoidRootPart.CFrame
                                StartMagnet = true
                            until not _G.AutoFarm or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                            StartMagnet = false
                        end
                    end
                end
            else
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude > 1500 then
                        BTP(CFrameMon)
                    else
                        topos(CFrameMon)
                    end
                else
                    topos(CFrameMon)
                end
                UnEquipWeapon(_G.SelectWeapon)
                StartMagnet = false
                if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if LevelFMode == "Get Quest" and _G.AutoFarm then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, NameMon) then
                StartMagnet = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnet = false
                CheckQuest()
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
		        			BTP(CFrameQuest)
		    			elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
		        			topos(CFrameQuest)
		    			end
	    			else
	    				topos(CFrameQuest)
	    			end
		    		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
	    				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == Mon then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        PosFarm = v.HumanoidRootPart.CFrame
                                        StartMagnet = true
                                    until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                else
                                    StartMagnet = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    end
                else
                    topos(CFrameMon)
                    UnEquipWeapon(_G.SelectWeapon)
                    StartMagnet = false
                    if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                    end
                end
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Farm Fast [ Lv. 1 -> Lv. 310 ]",
	Default = false,
	Callback = function(Value)
		_G.FarmSkip = Value
        StopTween(_G.FarmSkip)
	end
})

spawn(function()
    while task.wait() do
        if _G.FarmSkip then
            pcall(function()
                LvCount = game:GetService("Players").LocalPlayer.Data.Level.Value
                if LvCount >= 1 and LvCount < 60 then
                    local cframefarm = CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                    if GetDistance(cframefarm.Position) > 1500 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    end
                    topos(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shanda") then     
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shanda" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("TantaiGaming")
                                    topos(v.HumanoidRootPart.CFrame * Pos)               
                                    PosMon = v.HumanoidRootPart.CFrame
                                    StartBring = true
                                until not _G.FarmSkip or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                StartBring = false
                            end 
                        end
                    end 
                elseif LvCount >= 60 and LvCount < 300 then
                    CheckPlayer = 0
                    local Players = game:GetService("Players"):GetPlayers()
                    local Quest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                    local mylevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                    local QuestTitle = Quest.Container.QuestTitle.Title.Text
                    if game:GetService("Players").LocalPlayer.Team.Name == "Marines" then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
                    end
                    if Quest.Visible == true then
                        if string.find(QuestTitle, "Defeat") then
                            getgenv().Ply = string.split(QuestTitle," ")[2]
                            for i,v in pairs(Players) do
                                if v.Name == getgenv().Ply and v.Character.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        if v.Data.Level.Value < 20 or v.Data.Level.Value > mylevel * 5 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                                        end
                                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        _G.FastAttackPlayer = true
                                        topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0))
                                    until not _G.FarmSkip or not v:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0
                                    _G.FastAttackPlayer = false
                                end
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                        end
                    else                
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter") == "I don't have anything for you right now. Come back later." then
                            CheckPlayer = CheckPlayer + 1
                        end
                    end
                    if CheckPlayer >= 12 and Quest.Visible == false and not string.find(QuestTitle, "Defeat") then
                        Hop()
                        wait(0.1)
                        OrionLib:MakeNotification({
                            Name = "Tinh Linh Hub",
                            Content = "Hop Servers Because Not Players",
                            Image = "rbxassetid://16730867128",
                            Time = 5
                        })
                    end 
                else
                    CayLevel:Set(true)
                end
                if game:GetService("Players").LocalPlayer.Data.Points.Value >= 1 then
                    local args = { [1] = "AddPoint", [2] = "Melee", [3] = 5 }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end)
        end
    end
end)

local Section = Farm:AddSection({
    Name = "Katakuri"
})

local StatusCakePrince = Farm:AddParagraph("Cake Prince")

spawn(function()
    while task.wait() do
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
            StatusCakePrince:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."/500")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
            StatusCakePrince:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."/500")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
            StatusCakePrince:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).."/500")
        else
            StatusCakePrince:Set("Boss Is Spawning")
        end
    end
end)

Farm:AddDropdown({
	Name = "Select Farm Mode",
	Default = "Get Quest",
	Options = {"No Quest","Get Quest"},
	Callback = function(Value)
		CakeFMode = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Cake Prince",
	Default = false,
	Callback = function(Value)
		_G.AutoDoughtBoss = Value
        StopTween(_G.AutoDoughtBoss)
	end
})

spawn(function()
    while wait() do
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
            KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
            KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
            KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
        end
    end
end)

local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
spawn(function()
    while wait() do
        if CakeFMode == "No Quest" and _G.AutoDoughtBoss then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Cake Prince" or v.Name == "Dough King" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                else
                    if KillMob == 0 then
                    end
                    if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                            MagnetDought = true
                                        until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                    end
                                end
                            end
                        else
                            if BypassTP then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 1500 then
                                    BTP(CakePos)
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude < 1500 then
                                    topos(CakePos)
                                end
                            else
                                topos(CakePos)
                            end
                            MagnetDought = false
                            UnEquipWeapon(_G.SelectWeapon)
                            topos(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                        end
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                            topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            end
                        end
                    end
                end
            end
        end
    end
end)

local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
spawn(function()
    while wait() do
        if CakeFMode == "Get Quest" and _G.AutoDoughtBoss and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Cake Prince" or v.Name == "Dough King" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                end
            end
        end
    end
end) 
spawn(function()
    while wait() do
        if CakeFMode == "Get Quest" and _G.AutoDoughtBoss and World3 and not game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, "Cookie Crafter") then
                MagnetDought = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                MagnetDought = false
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakeQuestPos.Position).Magnitude > 1500 then
                        BTP(CakeQuestPos)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakeQuestPos.Position).Magnitude < 1500 then
                        topos(CakeQuestPos)
                    end
                else
                    topos(CakeQuestPos)
                end
                if (CakeQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then                            
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CakeQuest1",1)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                        MagnetDought = true
                                    until not _G.AutoDoughtBoss or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                else
                                    MagnetDought = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    end
                else
                    MagnetDought = false
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                    end
                end
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Spawn Katakuri",
	Default = true,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",Value)
	end
})

Farm:AddToggle({
	Name = "Auto Kill Dough King",
	Default = false,
	Callback = function(Value)
		_G.Autodoughking = Value
		StopTween(_G.Autodoughking)
	end
})

spawn(function()
    while wait() do
        if  _G.Autodoughking and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Dough King" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autodoughking or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-2662.818603515625, 1062.3480224609375, -11853.6953125))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

local Section = Farm:AddSection({
    Name = "Bone"
})

local YourBone = Farm:AddParagraph("Your Bone")

spawn(function()
    while task.wait() do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check") then
            YourBone:Set("Bone: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check").."/5000")
        else
            YourBone:Set("Only Third Sea")
        end
    end
end)

Farm:AddDropdown({
	Name = "Select Farm Mode",
	Default = "Get Quest",
	Options = {"No Quest","Get Quest"},
	Callback = function(Value)
		BoneFMode = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Bone",
	Default = false,
	Callback = function(Value)
		_G.Auto_Bone = Value
		StopTween(_G.Auto_Bone)
	end
})

local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
spawn(function()
    while wait() do 
        if BoneFMode == "No Quest" and _G.Auto_Bone and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                       if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                           repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                PosMonBone = v.HumanoidRootPart.CFrame
                                StartMagnetBoneMon = true
                            until not _G.Auto_Bone or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                        BTP(BonePos)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude < 1500 then
                        topos(BonePos)
                    end
                else
                    topos(BonePos)
                end
                UnEquipWeapon(_G.SelectWeapon)
                StartMagnetBoneMon = false
                topos(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375))
                for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                    if v.Name == "Reborn Skeleton" then
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    elseif v.Name == "Living Zombie" then
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    elseif v.Name == "Demonic Soul" then
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    elseif v.Name == "Posessed Mummy" then
                        topos(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end
        end
    end
end)

local BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
spawn(function()
    while wait() do
        if BoneFMode == "Get Quest" and _G.Auto_Bone and World3  then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, "Demonic Soul") then
                StartMagnetBoneMon = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnetBoneMon = false
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                        BTP(BoneQuestPos)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude < 1500 then
                        topos(BoneQuestPos)
                    end
                else
                    topos(BoneQuestPos)
                end
                if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                        StartMagnetBoneMon = true
                                    until not _G.Auto_Bone or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                else
                                    StartMagnetBoneMon = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    end
                else
                    StartMagnetBoneMon = false
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]").HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                    end
                end
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Random Bone",
	Default = false,
	Callback = function(Value)
		_G.Auto_Random_Bone = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.Auto_Random_Bone then    
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Spawn & Kill Soul Reaper",
	Default = false,
	Callback = function(Value)
		_G.Auto_Soul_Reaper = Value
		StopTween(_G.Auto_Soul_Reaper)
	end
})

spawn(function()
    while wait() do
        if _G.Auto_Soul_Reaper then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                 EquipWeapon("Hallow Essence")
                 topos(CFrame.new(-8932.83789, 144.098709, 6059.34229, -0.999290943, 7.95623478e-09, -0.0376505218, 4.4684243e-09, 1, 9.27205832e-08, 0.0376505218, 9.24866086e-08, -0.999290943))
            elseif game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                if game.Workspace.Enemies:FindFirstChild ("Soul Reaper") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Soul Reaper"  then
                            if _G.Auto_Soul_Reaper and v.Name == "Soul Reaper" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                     topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.Auto_Soul_Reaper or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            else
                local args = { [1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1 }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

local Section = Farm:AddSection({
    Name = "Boss"
})

local BossCheck = {}
for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
            or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
            or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain")
            or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
        table.insert(BossCheck, v.Name)
    end
end

local BossName = Farm:AddDropdown({
	Name = "Select Boss",
	Default = "",
	Options = BossCheck,
	Callback = function(Value)
		_G.SelectBoss = Value
	end
})

Farm:AddButton({
    Name = "Refresh Boss List",
    Callback = function()
        BossName:Refresh(BossCheck,true)
        local BossNew = {}
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                                or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                                or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain")
                                or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                table.insert(BossNew, v.Name)
            end
        end
        BossName:Refresh(BossNew)
    end
})

Farm:AddToggle({
	Name = "Auto Farm Boss",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmBoss = Value
		StopTween(_G.AutoFarmBoss)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectBoss then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                    end
                end
            end)
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Farm All Boss",
	Default = false,
	Callback = function(Value)
		_G.AutoAllBoss = Value
		StopTween(_G.AutoAllBoss)
	end
})

spawn(function()
    while wait() do
        if _G.AutoAllBoss then
            for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                if (v.Name == "rip_indra" or v.Name == "Ice Admiral") or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg") or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain") or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                        until v.Humanoid.Health <= 0 or _G.AutoAllBoss == false or not v.Parent
                    end
                else
                    if _G.AutoAllBossHop then
                        Hop()
                    end
                end
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Farm All Boss [ Hop ]",
	Default = false,
	Callback = function(Value)
		_G.AutoAllBossHop = Value
	end
})

local Section = Farm:AddSection({
    Name = "Mastery"
})

Farm:AddToggle({
	Name = "Auto Farm Devil Fruit Mastery",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmFruitMastery = Value
		StopTween(_G.AutoFarmFruitMastery)
        if _G.AutoFarmFruitMastery == false then
            UseSkill = false 
        end
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmFruitMastery then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, NameMon) then
                Magnet = false
                UseSkill = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnet = false
                UseSkill = false
                CheckQuest()
                repeat wait()
                    topos(CFrameQuest)
                until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmFruitMastery
                if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    wait(0.1)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == Mon then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                    repeat task.wait()
                                        if v.Humanoid.Health <= HealthMs then
                                            EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                            PosFarm = v.HumanoidRootPart.CFrame
                                            UseSkill = true
                                        else           
                                            UseSkill = false
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosFarm = v.HumanoidRootPart.CFrame
                                        end
                                        StartMagnet = true
                                    until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                else
                                    UseSkill = false
                                    StartMagnet = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    end
                else
                    topos(CFrameMon)
                    UnEquipWeapon(_G.SelectWeapon)
                    StartMagnet = false   
                    UseSkill = false 
                    local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                    if Mob then
                        topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                    else
                        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Farm Gun Mastery",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmGunMastery = Value
		StopTween(_G.AutoFarmGunMastery)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmGunMastery then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, NameMon) then
                Magnet = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnet = false
                CheckQuest()
                topos(CFrameQuest)
                if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    pcall(function()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon then
                                repeat task.wait()
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                        if v.Humanoid.Health <= HealthMin then                                                
                                            EquipWeaponGun()
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                            local args = {
                                                [1] = v.HumanoidRootPart.Position,
                                                [2] = v.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[EquipWeaponGun()].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        else
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                        end
                                        StartMagnet = true 
                                        PosFarm = v.HumanoidRootPart.CFrame
                                    else
                                        StartMagnet = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                StartMagnet = false
                            end
                        end
                    end)
                else
                   topos(CFrameMon)
                   UnEquipWeapon(_G.SelectWeapon)
                    _G.AutoFarmGunMastery = false
                    local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                    if Mob then
                        topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                    else
                        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end 
            end
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Farm Sword Mastery",
	Default = false,
	Callback = function(Value)
		_G.AutoSwordMastery = Value
		StopTween(_G.AutoSwordMastery)
	end
})

spawn(function()
    while wait() do
        if _G.AutoSwordMastery then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, NameMon) then
                StartMagnet = false                                      
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnet = false
                CheckQuest()
                topos(CFrameQuest)
                if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    pcall(function()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon then
                                repeat task.wait()
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                        if v.Humanoid.Health <= HealthMin then                                                
                                            EquipWeaponSword()
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                        else
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                        end
                                        StartMagnet = true 
                                        PosFarm = v.HumanoidRootPart.CFrame
                                    else
                                        StartMagnet = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                until v.Humanoid.Health <= 0 or _G.AutoSwordMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                StartMagnet = false
                            end
                        end
                    end)
                else
                   topos(CFrameMon)
                   UnEquipWeapon(_G.SelectWeapon)
                    StartMagnet = false
                    local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                    if Mob then
                        topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                    else
                        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                            task.wait()
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                        end
                    end
                end 
            end
        end
    end
end)

Farm:AddSlider({
	Name = "Kill Monster At % Health",
	Min = 0,
	Max = 100,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.Kill_At = Value
	end
})

Farm:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
		_G.SkillZ = Value
	end
})

Farm:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
		_G.SkillX = Value
	end
})

Farm:AddToggle({
	Name = "Use Skill C",
	Default = false,
	Callback = function(Value)
		_G.SkillC = Value
	end
})

Farm:AddToggle({
	Name = "Use Skill V",
	Default = false,
	Callback = function(Value)
		_G.SkillV = Value
	end
})

spawn(function()
    while wait() do
        if UseSkill then
            CheckQuest()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then                      
                    if _G.SkillZ then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then          
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then   
                    if _G.SkillZ then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then        
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then 
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        wait(2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                    if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.SkillV then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    if _G.SkillZ then 
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                    end
                    if _G.SkillX then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                    end
                    if _G.SkillC then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                    end
                    if _G.SkillV then
                        local args = {
                            [1] = PosFarm.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                    end
                end
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if UseSkill then
            local args = {
                [1] = PosFarm.Position
            }
            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
        end
    end)
end)

local Section = Farm:AddSection({
    Name = "Monster"
})

if World1 then
	TableMon = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	TableMon = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	TableMon = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end

Farm:AddDropdown({
	Name = "Select Monster",
	Default = "",
	Options = TableMon,
	Callback = function(Value)
		SelectMob = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Monster",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmMob = Value
		StopTween(_G.AutoFarmMob)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmMob then
            pcall(function()
                CheckMonFarm(SelectMob)
                if game:GetService("Workspace").Enemies:FindFirstChild(SelectMob) then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == SelectMob then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    PosMonFarm = v.HumanoidRootPart.CFrame
                                    SelectMag = true
                                until not _G.AutoFarmMob or not v.Parent or v.Humanoid.Health <= 0
                                SelectMag = false
                            end
                        end
                    end
                else
                    topos(PosMonster)
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)

local Section = Farm:AddSection({
    Name = "Material"
})

if World1 then
    MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail"}
elseif World2 then
    MaterialList = {"Scrap Metal","Leather","Radioactive Material","Ectoplasm","Mystic Droplet","Magma Ore","Vampire Fang"}
elseif World3 then
    MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
end

Farm:AddDropdown({
	Name = "Select Material",
	Default = "",
	Options = MaterialList,
	Callback = function(Value)
		SelectMaterial = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Material",
	Default = false,
	Callback = function(Value)
		_G.AutoMaterial = Value
		StopTween(_G.AutoMaterial)
	end
})

spawn(function()
    while wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial)
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == MMon then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    MaterialPos = v.HumanoidRootPart.CFrame
                                    BringMonMaterial = true
                                until not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                                BringMonMaterial = false
                            end
                        end
                    end
                else
                    topos(MPos)
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "Devil Fruit"
})

FruitList = {"Rocket-Rocket","Spin-Spin","Chop-Chop","Spring-Spring","Bomb-Bomb","Smoke-Smoke","Spike-Spike","Flame-Flame","Falcon-Falcon","Ice-Ice","Sand-Sand","Dark-Dark","Diamond-Diamond","Light-Light","Rubber-Rubber","Barrier-Barrier","Ghost-Ghost","Magma-Magma","Quake-Quake","Buddha-Buddha","Love-Love","Spider-Spider","Sound-Sound","Phoenix-Phoenix","Portal-Portal","Rumble-Rumble","Pain-Pain","Blizzard-Blizzard","Gravity-Gravity","Mammoth-Mammoth","T-Rex-T-Rex","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Spirit-Spirit","Dragon-Dragon","Leopard-Leopard","Kitsune-Kitsune"}

local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {}
ShopDevilSell = {}
for i,v in next,Remote_GetFruits do
	table.insert(Table_DevilFruitSniper,v.Name)
	if v.OnSale then 
		table.insert(ShopDevilSell,v.Name)
	end
end
	
_G.SelectFruit = ""
FruitRaid:AddDropdown({
	Name = "Select Devil Fruit",
	Default = "",
	Options = Table_DevilFruitSniper,
	Callback = function(Value)
		_G.SelectFruit = Value
	end
})

FruitRaid:AddToggle({
	Name = "Auto Buy Devil Fruit Sniper",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyFruitSniper = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoBuyFruitSniper then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)
        end 
    end
end)

FruitRaid:AddButton({
    Name = "Random Devil Fruit",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end
})

FruitRaid:AddToggle({
	Name = "Auto Random Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.Random_Auto = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.Random_Auto then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end 
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Store Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.AutoStoreFruit = Value
	end
})

function Get_Fruit(Fruit)
    if Fruit == "Rocket Fruit" then
        return "Rocket-Rocket"
    elseif Fruit == "Spin Fruit" then
        return "Spin-Spin"
    elseif Fruit == "Chop Fruit" then
        return "Chop-Chop"
    elseif Fruit == "Spring Fruit" then
        return "Spring-Spring"
    elseif Fruit == "Bomb Fruit" then
        return "Bomb-Bomb"
    elseif Fruit == "Smoke Fruit" then
        return "Smoke-Smoke"
    elseif Fruit == "Spike Fruit" then
        return "Spike-Spike"
    elseif Fruit == "Flame Fruit" then
        return "Flame-Flame"
    elseif Fruit == "Falcon Fruit" then
        return "Falcon-Falcon"
    elseif Fruit == "Ice Fruit" then
        return "Ice-Ice"
    elseif Fruit == "Sand Fruit" then
        return "Sand-Sand"
    elseif Fruit == "Dark Fruit" then
        return "Dark-Dark"
    elseif Fruit == "Ghost Fruit" then
        return "Ghost-Ghost"
    elseif Fruit == "Diamond Fruit" then
        return "Diamond-Diamond"
    elseif Fruit == "Light Fruit" then
        return "Light-Light"
    elseif Fruit == "Rubber Fruit" then
        return "Rubber-Rubber"
    elseif Fruit == "Barrier Fruit" then
        return "Barrier-Barrier"
    elseif Fruit == "Magma Fruit" then
        return "Magma-Magma"
    elseif Fruit == "Quake Fruit" then
        return "Quake-Quake"
    elseif Fruit == "Buddha Fruit" then
        return "Buddha-Buddha"
    elseif Fruit == "Love Fruit" then
        return "Love-Love"
    elseif Fruit == "Spider Fruit" then
        return "Spider-Spider"
    elseif Fruit == "Sound Fruit" then
        return "Sound-Sound"
    elseif Fruit == "Phoenix Fruit" then
        return "Phoenix-Phoenix"
    elseif Fruit == "Portal Fruit" then
        return "Portal-Portal"
    elseif Fruit == "Rumble Fruit" then
        return "Rumble-Rumble"
    elseif Fruit == "Pain Fruit" then
        return "Pain-Pain"
    elseif Fruit == "Blizzard Fruit" then
        return "Blizzard-Blizzard"
    elseif Fruit == "Gravity Fruit" then
        return "Gravity-Gravity"
    elseif Fruit == "Mammoth Fruit" then
        return "Mammoth-Mammoth"
    elseif Fruit == "Dough Fruit" then
        return "Dough-Dough"
    elseif Fruit == "Shadow Fruit" then
        return "Shadow-Shadow"
    elseif Fruit == "Venom Fruit" then
        return "Venom-Venom"
    elseif Fruit == "Control Fruit" then
        return "Control-Control"
    elseif Fruit == "Spirit Fruit" then
        return "Spirit-Spirit"
    elseif Fruit == "Dragon Fruit" then
        return "Dragon-Dragon"
    elseif Fruit == "T-Rex Fruit" then
        return "T-Rex-T-Rex"
    elseif Fruit == "Leopard Fruit" then
        return "Leopard-Leopard"
    elseif Fruit == "Kitsune Fruit" then
        return "Kitsune-Kitsune"
    end
end

spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            local plrBag = game:GetService("Players").LocalPlayer.Backpack
            local plrChar = game:GetService("Players").LocalPlayer.Character
            game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Position = UDim2.new(10.100, 0, 0.100, 0) -- HideUi
	    	game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
            for _,Fruit in pairs(plrChar:GetChildren()) do
                if Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit)
                end
            end
            for _,Fruit in pairs(plrBag:GetChildren()) do
                if Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit)
                end
            end
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Devil Fruit Notification",
	Default = false,
	Callback = function(Value)
		_G.FruitCheck = Value
	end
})

spawn(function()
	while wait(.1) do
		if _G.FruitCheck then
			for i,v in pairs(game.Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					require(game:GetService("ReplicatedStorage").Notification).new("Fruit Spawn"):Display()
					wait()
					setthreadcontext(5)
				end
			end
		end
    end
end)

FruitRaid:AddToggle({
	Name = "Teleport To Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.Tweenfruit = Value
		StopTween(_G.Tweenfruit)
	end
})

spawn(function()
	while wait() do
		if _G.Tweenfruit then
			for i,v in pairs(game.Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					topos(v.Handle.CFrame)
				end
			end
		end
    end
end)

FruitRaid:AddToggle({
	Name = "Bring To Devil Fruit [ 75% Kick System ]",
	Default = false,
	Callback = function(Value)
		_G.BringFruitBF = Value
	end
})

spawn(function()
    while wait() do
        if _G.BringFruitBF then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") then
                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "Raid"
})

_G.SelectChip = selectraids or ""
Raidslist = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for i,v in pairs(RaidsModule.raids) do
    table.insert(Raidslist,v)
end
for i,v in pairs(RaidsModule.advancedRaids) do
    table.insert(Raidslist,v)
end

FruitRaid:AddDropdown({
	Name = "Select Chip",
	Default = "",
	Options = Raidslist,
	Callback = function(Value)
		_G.SelectChip = Value
	end
})

FruitRaid:AddToggle({
	Name = "Auto Buy Chip",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyChip = Value
	end
})

spawn(function()
    while task.wait() do
		if _G.AutoBuyChip then
			local args = {
				[1] = "RaidsNpc",
				[2] = "Select",
				[3] = _G.SelectChip
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Get Devil Fruit [ Under 1M Beli ]",
	Default = false,
	Callback = function(Value)
		_G.AutoFruit = Value
	end
})

spawn(function()
    while wait() do
        if _G.AutoFruit then
            local args = {
                [1] = "LoadFruit",
                [2] = "Rocket-Rocket"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Spin-Spin"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Chop-Chop"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Spring-Spring"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Bomb-Bomb"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Smoke-Smoke"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Spike-Spike"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Flame-Flame"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Falcon-Falcon"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Ice-Ice"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Sand-Sand"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Dark-Dark"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Ghost-Ghost"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Diamond-Diamond"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Light-Light"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Rubber-Rubber"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LoadFruit",
                [2] = "Barrier-Barrier"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Start Raid",
	Default = false,
	Callback = function(Value)
		_G.Auto_StartRaid = Value
	end
})

spawn(function()
    while task.wait() do
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
    end
end)

FruitRaid:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(Value)
		_G.Kill_Aura = Value
	end
})

spawn(function()
    while wait() do
        if _G.Kill_Aura then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                        v.Humanoid.Health = 0
                        v.HumanoidRootPart.CanCollide = false
                    until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                end
            end
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Next Island",
	Default = false,
	Callback = function(Value)
		_G.NextIsland = Value
		StopTween(_G.NextIsland)
	end
})

spawn(function()
    while task.wait() do
        if _G.NextIsland and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame * RaidPos)
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame * RaidPos)
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame * RaidPos)
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame * RaidPos)
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame * RaidPos)
            end
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Awakener Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.Auto_Awakener = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.Auto_Awakener then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "Law Raid"
})

FruitRaid:AddButton({
    Name = "Buy Chip Law",
    Callback = function()
        local args = {
            [1] = "BlackbeardReward",
            [2] = "Microchip",
            [3] = "2"
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

FruitRaid:AddToggle({
	Name = "Auto Start Raid Law",
	Default = false,
	Callback = function(Value)
		_G.StartRaidLaw = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.StartRaidLaw and World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Kill Law",
	Default = false,
	Callback = function(Value)
		_G.AutoOderSword = Value
		StopTween(_G.AutoOderSword)
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoOderSword then
            if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Order" then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame*Pos)
                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoOderSword == false
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    topos(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                end
            end
        end
    end
end)

-- [ Tab Other ]

local Section = Other:AddSection({
    Name = "Game Event"
})

Other:AddToggle({
	Name = "Auto Pirate Raid",
	Default = false,
	Callback = function(Value)
		_G.RaidPirate = Value
		StopTween(_G.RaidPirate)
	end
})

spawn(function()
    while wait() do
        if _G.RaidPirate and World3 then
            if (CFrame.new(-5118.48682, 314.54129, -2958.64404, -0.387232125, 1.81507858e-08, 0.921982229, -7.54388907e-08, 1, -5.13709999e-08, -0.921982229, -8.94458196e-08, -0.387232125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                for a, a in pairs(game.Workspace.Enemies:GetChildren()) do
                    if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") and a.Humanoid.Health > 0 and (a.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(a.HumanoidRootPart.CFrame * Pos)
                            PosFarm = a.HumanoidRootPart.CFrame
                        until not _G.RaidPirate or not a.Parent or a.Humanoid.Health <= 0
                        StartMagnet = false
                    end
                end
            else
                if (CFrame.new(-5118.48682, 314.54129, -2958.64404, -0.387232125, 1.81507858e-08, 0.921982229, -7.54388907e-08, 1, -5.13709999e-08, -0.921982229, -8.94458196e-08, -0.387232125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                    for a, a in pairs(game.ReplicatedStorage:GetChildren()) do
                        if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") and a.Humanoid.Health > 0 and (a.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                            topos(a.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                end
                topos(CFrame.new(-5118.48682, 314.54129, -2958.64404, -0.387232125, 1.81507858e-08, 0.921982229, -7.54388907e-08, 1, -5.13709999e-08, -0.921982229, -8.94458196e-08, -0.387232125))
            end
        end
    end
end)

Other:AddToggle({
	Name = "Auto Factory",
	Default = false,
	Callback = function(Value)
		_G.AutoFactory = Value
		StopTween(_G.AutoFactory)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFactory and World2 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Core" and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)           
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                        until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                    end
                end
            else
                topos(CFrame.new(448.46756, 199.356781, -441.389252))
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "Elite Hunter"
})

local EliteStatus = Other:AddParagraph("Elite")

spawn(function()
    while task.wait() do
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
            EliteStatus:Set("Elite: 🟢")	
        else
            EliteStatus:Set("Elite: 🔴")	
        end
    end
end)

Other:AddToggle({
	Name = "Auto Kill Elite",
	Default = false,
	Callback = function(Value)
		_G.AutoElitehunter = Value
		StopTween(_G.AutoElitehunter)
	end
})

spawn(function()
    while wait() do
        if _G.AutoElitehunter then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.AutoElitehunter or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "Chest"
})

Other:AddDropdown({
	Name = "Select Team",
	Default = "Pirates",
	Options = {"Pirates","Marines"},
	Callback = function(Value)
		_G.TeamChest = Value
	end
})

Other:AddToggle({
	Name = "Auto Farm Chest [ Bypass ]",
	Default = false,
	Callback = function(Value)
		_G.ChestBypass = Value
		StopTween(_G.ChestBypass)
	end
})

spawn(function()
    while task.wait() do
        if _G.ChestBypass then
            local ohString1 = "SetTeam"
            local ohString2 = _G.TeamChest
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.ChestBypass then
            local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
            if not game.Players.LocalPlayer.Character then
            else
                local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
                if hasCrewTag then hasCrewTag:Destroy() end
                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hasHumanoid then
                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1")
                        if Chest then
                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        else
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                                _G.ChestBypass = false
                            break
                        end
                    end 
                end
            end
        end
    end
end)

Other:AddToggle({
	Name = "Teleport To Safe If Have Item",
	Default = false,
	Callback = function(Value)
		_G.TeleSafe = Value
		StopTween(_G.TeleSafe)
	end
})

spawn(function()
    while task.wait() do
        if _G.TeleSafe then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                if World3 then
                    topos(CFrame.new(-12489.4893, 336.895721, -7446.056153))
                elseif World2 then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                end
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "Rip_Indra"
})

Other:AddToggle({
	Name = "Auto Summon Rip_Indra",
	Default = false,
	Callback = function(Value)
		_G.AutoSpawnRip = Value
		StopTween(_G.AutoSpawnRip)
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoSpawnRip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
            	wait(0.3)
            	topos(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 3 then
                wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                wait(0.3)
                topos(CFrame.new(-5414.41357, 309.865753, -2212.45776))
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 3 then
                wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                wait(0.3)
                topos(CFrame.new(-4971.47559, 331.565765, -3720.02954))
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 3 then
                wait(1)
                EquipWeapon("God's Chalice")
                topos(game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
            end
        end
    end
end)

Other:AddToggle({
	Name = "Auto Kill Rip_Indra",
	Default = false,
	Callback = function(Value)
		_G.AutoKillRipIndra = Value
		StopTween(_G.AutoKillRipIndra)
	end
})

local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
spawn(function()
    while wait() do
        if _G.AutoKillRipIndra then
            if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                        until _G.AutoKillRipIndra == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "Darkbeard"
})

Other:AddToggle({
	Name = "Auto Summon Darkbeard",
	Default = false,
	Callback = function(Value)
		_G.AutoSpawnDark = Value
		StopTween(_G.AutoSpawnDark)
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoSpawnDark then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                if GetDistance(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection) <= 5 then
                    EquipWeapon("Fist of Darkness")
                    firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 1)
                else
                    topos(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
                end
            end
        end
    end
end)

Other:AddToggle({
	Name = "Auto Kill Darkbeard",
	Default = false,
	Callback = function(Value)
		_G.AutoKillDark = Value
		StopTween(_G.AutoKillDark)
	end
})

spawn(function()
    while wait() do
        if _G.AutoKillDark then
            if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Darkbeard" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                        until _G.AutoKillDark == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "Observation Haki"
})

local ObservationStatus = Other:AddParagraph("Observation Level")

spawn(function()
    while task.wait() do
        ObservationStatus:Set("Level: "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
    end
end)

Other:AddToggle({
	Name = "Auto Farm Observation",
	Default = false,
	Callback = function(Value)
		_G.AutoObservation = Value
		StopTween(_G.AutoObservation)
	end
})


spawn(function()
    while wait() do
        if _G.AutoObservation then
            repeat task.wait()
                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService('VirtualUser'):CaptureController()
                    game:GetService('VirtualUser'):SetKeyDown('0x65')
                    wait(2)
                    game:GetService('VirtualUser'):SetKeyUp('0x65')
                end
            until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoObservation
        end
    end
end)

Other:AddToggle({
	Name = "Auto Farm Observation [ Hop ]",
	Default = false,
	Callback = function(Value)
		_G.AutoObservation_Hop = Value
	end
})

spawn(function()
    while wait() do
        if _G.AutoObservation then
            if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 5000 then
                    OrionLib:MakeNotification({
                        Name = "Tinh Linh Hub",
                        Content = "You Have Max Points",
                        Image = "rbxassetid://16730867128",
                        Time = 5
                    })
                wait(2)
            else
                if World2 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                    wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif World1 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif World3 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat task.wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                wait(1)
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoObservation_Hop == true then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                end
                            until _G.AutoObservation == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        end
                    else
                        topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end
            end
        end
    end
end)

Other:AddToggle({
	Name = "Auto Upgrade Observation Haki V2",
	Default = false,
	Callback = function(Value)
		_G.AutoObservationv2 = Value
		StopTween(_G.AutoObservationv2)
	end
})

spawn(function()
    while wait() do
        if _G.AutoObservationv2 then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 3 then
                _G.AutoMusketeerHat = false
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and  game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                    repeat 
                        topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)) 
                        wait() 
                    until not _G.AutoObservationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                    repeat 
                        topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188)) 
                        wait() 
                    until not _G.AutoObservationv2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Start")
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2","Buy")
                else
                    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                            v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10)
                            wait()
                            firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                            wait()
                        end
                    end
                end
            else
                _G.AutoMusketeerHat = true
            end
        end
    end
end)

-- [ Tab Item & Quest ]

local Section = ItemQuest:AddSection({
    Name = "Legendary Sword"
})

local LegendSwords = ItemQuest:AddParagraph("Legendary Sword Dealer")

spawn(function()
    while task.wait() do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            LegendSwords:Set("Sword Name: Shisui")
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2") then
            LegendSwords:Set("Sword Name: Wando")
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3") then
            LegendSwords:Set("Sword Name: Saddi")
        else
            LegendSwords:Set("Not Found Legendary Sword Dealer")
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Buy Legendary Sword",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyLegendarySword = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoBuyLegendarySword then
            local args = {
                [1] = "LegendarySwordDealer",
                [2] = "1"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LegendarySwordDealer",
                [2] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "LegendarySwordDealer",
                [2] = "3"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end 
    end
end)

local Section = ItemQuest:AddSection({
    Name = "Haki Colors"
})

local ColorHaki = ItemQuest:AddParagraph("Haki Dealer")

spawn(function()
    while wait() do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") then
            ColorHaki:Set("Haki Colors: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))
        else
            ColorHaki:Set("Not Found Haki Dealer")
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Buy Haki Colors",
	Default = false,
	Callback = function(Value)
		_G.Auto_Buy_Enchancement = Value
	end
})

spawn(function()
	while task.wait() do
		if _G.Auto_Buy_Enchancement then
			local args = {
				[1] = "ColorsDealer",
				[2] = "2"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end 
	end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Rainbow Haki",
	Default = false,
	Callback = function(Value)
		_G.Auto_Rainbow_Haki = Value
		StopTween(_G.Auto_Rainbow_Haki)
	end
})

spawn(function()
    while wait(.1) do
        if _G.Auto_Rainbow_Haki and World3 then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Stone" then
                            OldCFrameRainbow = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Island Empress" then
                            OldCFrameRainbow = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
                end
            elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Kilo Admiral" then
                            OldCFrameRainbow = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                end
            elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Captain Elephant" then
                            OldCFrameRainbow = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
                end
            elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Beautiful Pirate" then
                            OldCFrameRainbow = v.HumanoidRootPart.CFrame
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                end
            else
                topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                    wait(1.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                end
            end
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "Soul Guitar"
})

ItemQuest:AddToggle({
	Name = "Auto Get Soul Guitar",
	Default = false,
	Callback = function(Value)
		_G.AutoNevaSoulGuitar = Value
		StopTween(_G.AutoNevaSoulGuitar)
	end
})

spawn(function()
    while wait() do
        if _G.AutoNevaSoulGuitar and World3 then
            if GetWeaponInventory("Soul Guitar") == false then
                if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                    if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
                    else
                        if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
                            if game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0 then
                                Quest2 = true
                                repeat wait() topos(CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875)) until (CFrame.new(-8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoNevaSoulGuitar
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                                wait(1)
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                                wait(1)
                            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                    Quest4 = true
                                    repeat wait() topos(CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625)) until (CFrame.new(-9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoNevaSoulGuitar
                                    wait(1)
                                    topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                                    wait(1)
                                    topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    wait(1)
                                    topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    wait(1)
                                    topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                                    wait(1)
                                    topos(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    wait(1)
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                else
                                    Quest3 = true
                                    --Not Work Yet
                                end
                            else
                                if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                    local args = {
                                        [1] = "GuitarPuzzleProgress",
                                        [2] = "Ghost"
                                    }

                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                            if v.Name == "Living Zombie" then
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                                                topos(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                                            end
                                        end
                                    end
                                else
                                    topos(CFrame.new(-10160.787109375, 138.6616973876953, 5955.03076171875))
                                end
                            end
                        else    
                            if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
                                OrionLib:MakeNotification({
									    Name = "Tinh Linh Hub",
									    Content = "Go to Grave",
									    Image = "rbxassetid://16730867128",
									    Time = 5
									})
									topos(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
								elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
									OrionLib:MakeNotification({
									    Name = "Tinh Linh Hub",
									    Content = "Wait Next Night",
									    Image = "rbxassetid://16730867128",
									    Time = 5
									})
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
                            end
                        end
                    end
                else
                    topos(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
                end
            else
                if _G.soulGuitarhop then
                    Hop()
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Soul Guitar [ Hop ]",
	Default = false,
	Callback = function(Value)
		_G.soulGuitarhop = Value
	end
})

local Section = ItemQuest:AddSection({
    Name = "Cursed Dual Katana"
})

local Yama = ItemQuest:AddParagraph("Elite Progress")

spawn(function()
    while task.wait() do
        Yama:Set("Elite: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Yama",
	Default = false,
	Callback = function(Value)
		_G.AutoYama = Value
		StopTween(_G.AutoYama)
	end
})

spawn(function()
    while wait() do
        if _G.AutoYama and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") < 30 then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.AutoYama or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                repeat wait(.1)
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Holy Torch",
	Default = false,
	Callback = function(Value)
		_G.AutoHolyTorch = Value
		StopTween(_G.AutoHolyTorch)
	end
})

-- topos(game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
spawn(function()
    while wait(.5) do
        if _G.AutoHolyTorch then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                repeat wait(.2)
                    EquipWeapon("Holy Torch")
                    topos(CFrame.new(-10752.4434, 415.261749, -9367.43848, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                until (Vector3.new(-10752.4434, 415.261749, -9367.43848)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat wait(.2)
                    EquipWeapon("Holy Torch")
                    topos(CFrame.new(-11671.6289, 333.78125, -9474.31934, 0.300932229, 0, -0.953645527, 0, 1, 0, 0.953645527, 0, 0.300932229))
                until (Vector3.new(-11671.6289, 333.78125, -9474.31934)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat wait(.2)
                    EquipWeapon("Holy Torch")
                    topos(CFrame.new(-12133.1406, 521.507446, -10654.292, 0.80428642, 0, -0.594241858, 0, 1, 0, 0.594241858, 0, 0.80428642))
                until (Vector3.new(-12133.1406, 521.507446, -10654.292)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                repeat wait(.2)
                    EquipWeapon("Holy Torch")
                    topos(CFrame.new(-13336.127, 484.521179, -6985.31689, 0.853732228, 0, -0.520712316, 0, 1, 0, 0.520712316, 0, 0.853732228))
                until (Vector3.new(-13336.127, 484.521179, -6985.31689)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                EquipWeapon("Holy Torch")
                repeat wait(.2)
                    topos(CFrame.new(-13487.623, 336.436188, -7924.53857, -0.982848108, 0, 0.184417039, 0, 1, 0, -0.184417039, 0, -0.982848108))
                until (Vector3.new(-13487.623, 336.436188, -7924.53857)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                wait(2)
                Com()
                wait(20)
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Tushita",
	Default = false,
	Callback = function(Value)
		_G.Autotushita = Value
		StopTween(_G.Autotushita)
	end
})

local TushitaPos = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
spawn(function()
    while wait() do
        if  _G.Autotushita and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Longma" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autotushita or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TushitaPos.Position).Magnitude > 1500 then
            BTP(TushitaPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TushitaPos.Position).Magnitude < 1500 then
            topos(TushitaPos)
            end
        else
            topos(TushitaPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Cursed Dual Katana",
	Default = false,
	Callback = function(Value)
		Auto_Cursed_Dual_Katana = Value
		StopTween(Auto_Cursed_Dual_Katana)
	end
})

spawn(function()
    while wait() do
        if Auto_Cursed_Dual_Katana and World3 then
            if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                        EquipWeapon("Tushita")
                    end
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                        EquipWeapon("Yama") 
                    end
                end
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Cursed_Dual_Katana then
            if GetMaterial("Alucard Fragment") == 0 then
                Auto_Quest_Yama_1 = true
                Auto_Quest_Yama_2 = false
                Auto_Quest_Yama_3 = false
                Auto_Quest_Tushita_1 = false
                Auto_Quest_Tushita_2 = false
                Auto_Quest_Tushita_3 = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
            elseif GetMaterial("Alucard Fragment") == 1 then
                Auto_Quest_Yama_1 = false
                Auto_Quest_Yama_2 = true
                Auto_Quest_Yama_3 = false
                Auto_Quest_Tushita_1 = false
                Auto_Quest_Tushita_2 = false
                Auto_Quest_Tushita_3 = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
            elseif GetMaterial("Alucard Fragment") == 2 then
                Auto_Quest_Yama_1 = false
                Auto_Quest_Yama_2 = false
                Auto_Quest_Yama_3 = true
                Auto_Quest_Tushita_1 = false
                Auto_Quest_Tushita_2 = false
                Auto_Quest_Tushita_3 = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
            elseif GetMaterial("Alucard Fragment") == 3 then
                Auto_Quest_Yama_1 = false
                Auto_Quest_Yama_2 = false
                Auto_Quest_Yama_3 = false
                Auto_Quest_Tushita_1 = true
                Auto_Quest_Tushita_2 = false
                Auto_Quest_Tushita_3 = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
            elseif GetMaterial("Alucard Fragment") == 4 then
                Auto_Quest_Yama_1 = false
                Auto_Quest_Yama_2 = false
                Auto_Quest_Yama_3 = false
                Auto_Quest_Tushita_1 = false
                Auto_Quest_Tushita_2 = true
                Auto_Quest_Tushita_3 = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
            elseif GetMaterial("Alucard Fragment") == 5 then
                Auto_Quest_Yama_1 = false
                Auto_Quest_Yama_2 = false
                Auto_Quest_Yama_3 = false
                Auto_Quest_Tushita_1 = false
                Auto_Quest_Tushita_2 = false
                Auto_Quest_Tushita_3 = true
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
            elseif GetMaterial("Alucard Fragment") == 6 then
                if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                    Auto_Quest_Yama_1 = false
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cursed Skeleton Boss" or v.Name == "Cursed Skeleton" then
                                if v.Humanoid.Health > 0 then
                                    EquipWeapon(Sword)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                end
                            end
                        end
                    end
                else
                    if (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                        wait(1)
                        topos(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        topos(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
                    else
                        topos(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Mythological Pirate" then
                        repeat wait()
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
                        until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                    end
                end
            else
                topos(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_2 then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("HazeESP") then
                    v.HazeESP.Size = UDim2.new(50,50,50,50)
                    v.HazeESP.MaxDistance = "inf"
                end
            end
            for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if v:FindFirstChild("HazeESP") then
                    v.HazeESP.Size = UDim2.new(50,50,50,50)
                    v.HazeESP.MaxDistance = "inf"
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if Auto_Quest_Yama_2 and v:FindFirstChild("HazeESP") and (v.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 then
                v.HumanoidRootPart.CFrame = PosMonsEsp
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                if not v.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local vc = Instance.new("BodyVelocity", v.HumanoidRootPart)
                    vc.MaxForce = Vector3.new(1, 1, 1) * math.huge
                    vc.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_2 then 
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("HazeESP") then
                    repeat wait()
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                            topos(v.HumanoidRootPart.CFrame * Pos)
                        else
                            EquipWeapon(Sword)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.Transparency = 1
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            PosMon = v.HumanoidRootPart.CFrame
                            MonFarm = v.Name
                            if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end							
                        end
                    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_2 == false or not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
                else
                    for x,y in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if y:FindFirstChild("HazeESP") then
                            if (y.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000 then
                                topos(y.HumanoidRootPart.CFrameMon* Farm_Mode)
                            else
                                topos(y.HumanoidRootPart.CFrame * Farm_Mode)
                            end
                        end
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_3 then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then         
                topos(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
            elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                repeat wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Hell's Messenger" then
                                if v.Humanoid.Health > 0 then
                                    repeat wait()
                                        EquipWeapon(Sword)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Yama_3 == false
                                end
                            end
                        end
                    else
                        wait(5)
                        topos(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)        
                        topos(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)     
                        topos(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)     
                        topos(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                    end
                until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3
            else
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Soul Reaper" then
                                if v.Humanoid.Health > 0 then
                                    repeat wait()
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                    until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                end
                            end
                        end
                    else
                        topos(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_1 then
            topos(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
            wait(5)
            topos(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
            wait(5)
            topos(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))    
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_2 then
            if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if Auto_Quest_Tushita_2 and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                            repeat wait()
                                EquipWeapon(Sword)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                PosMon = v.HumanoidRootPart.CFrame
                                MonFarm = v.Name
                                if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                            until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_2 == false
                        end
                    end
                end
            else
                topos(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Queen" then
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(Sword)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    PosMon = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                            end
                        end
                    end
                else
                    topos(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
                end
            elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                repeat wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cursed Skeleton" or v.Name == "Cursed Skeleton" or v.Name == "Heaven's Guardian" then
                                if v.Humanoid.Health > 0 then
                                    repeat wait()
                                        EquipWeapon(Sword)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                    until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_3 == false
                                end
                            end
                        end
                    else
                        wait(5)
                        topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)        
                        topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)     
                        topos(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)     
                        topos(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
                    end
                until not Auto_Cursed_Dual_Katana or not Auto_Quest_Tushita_3 or GetMaterial("Alucard Fragment") == 6
            end
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "Weapon"
})

ItemQuest:AddToggle({
	Name = "Auto Get Saber",
	Default = false,
	Callback = function(Value)
		_G.Auto_Saber = Value
		StopTween(_G.Auto_Saber)
	end
})

spawn(function()
    while task.wait() do
        if _G.Auto_Saber and World1 and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                        wait(1)
                    else
                        topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                    end
                else
                    if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipWeapon("Torch")
                            topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                          else
                          topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                        end
                    else
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                            wait(0.5)
                            EquipWeapon("Cup")
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                            wait(0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                        else
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            if v.Name == "Mob Leader" then
                                               if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") then
                                                   repeat task.wait()
                                                        EquipWeapon(_G.SelectWeapon)
                                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                                until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                             end
                                        end
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Pos)
                                        end
                                    end
                                end
                             end
                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                wait(0.5)
                                EquipWeapon("Relic")
                                wait(0.5)
                                topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                            end
                        end
                    end
                end
            else
                if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == "Saber Expert" then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                if v.Humanoid.Health <= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Rengoku",
	Default = false,
	Callback = function(Value)
		_G.AutoRengoku = Value
		StopTween(_G.AutoRengoku)
	end
})

spawn(function()
    while wait() do
        if _G.AutoRengoku and World2 then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                EquipWeapon("Hidden Key")
                topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
            elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior" or v.Name == "Awakened Ice Admiral") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                            RengokuMon = v.HumanoidRootPart.CFrame
                            StartRengokuMagnet = true
                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                        StartRengokuMagnet = false
                    end
                end
            else
                StartRengokuMagnet = false
                topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Cavander",
	Default = false,
	Callback = function(Value)
		_G.AutoCarvender = Value
		StopTween(_G.AutoCarvender)
	end
})

local CavandisPos = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
spawn(function()
    while wait() do
        if  _G.AutoCarvender and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Beautiful Pirate" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoCarvender or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude > 1500 then
            BTP(CavandisPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude < 1500 then
            topos(CavandisPos)
            end
        else
            topos(CavandisPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Twin Hook",
	Default = false,
	Callback = function(Value)
		_G.AutoTwinHook = Value
		StopTween(_G.AutoTwinHook)
	end
})

local ElephantPos = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
spawn(function()
    while wait() do
        if  _G.AutoTwinHook and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Captain Elephant" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoTwinHook or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude > 1500 then
            BTP(ElephantPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude < 1500 then
            topos(ElephantPos)
            end
        else
            topos(ElephantPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Hallow Scythe",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmBossHallow = Value
		StopTween(_G.AutoFarmBossHallow)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmBossHallow then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                 EquipWeapon("Hallow Essence")
                 topos(CFrame.new(-8932.83789, 144.098709, 6059.34229, -0.999290943, 7.95623478e-09, -0.0376505218, 4.4684243e-09, 1, 9.27205832e-08, 0.0376505218, 9.24866086e-08, -0.999290943))
            elseif game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                if game.Workspace.Enemies:FindFirstChild ("Soul Reaper") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Soul Reaper"  then
                            if _G.AutoFarmBossHallow and v.Name == "Soul Reaper" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                     topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoFarmBossHallow or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            else
                local args = { [1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1 }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Dragon Trident",
	Default = false,
	Callback = function(Value)
		_G.Auto_Dragon_Trident = Value
		StopTween(_G.Auto_Dragon_Trident)
	end
})

local TridentPos = CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125)
spawn(function()
    while wait() do
        if  _G.Auto_Dragon_Trident and World2 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Tide Keeper" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Auto_Dragon_Trident or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 1500 then
            BTP(TridentPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
            topos(TridentPos)
            end
        else
            topos(TridentPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Waden Sword",
	Default = false,
	Callback = function(Value)
		_G.Autowaden = Value
		StopTween(_G.Autowaden)
	end
})

local NamfonPos = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
spawn(function()
    while wait() do
        if  _G.Autowaden and World1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Chief Warden" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autowaden or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 1500 then
            BTP(TridentPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
            topos(TridentPos)
            end
        else
            topos(TridentPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Pole V1",
	Default = false,
	Callback = function(Value)
		_G.Autopole = Value
		StopTween(_G.Autopole)
	end
})

local PolePos = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
spawn(function()
    while wait() do
        if  _G.Autopole and World1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Thunder God" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autopole or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude > 1500 then
            BTP(PolePos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PolePos.Position).Magnitude < 1500 then
            topos(PolePos)
            end
        else
            if GetDistance(PolePos.Position) > 1500 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
            topos(PolePos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Shark Saw",
	Default = false,
	Callback = function(Value)
		_G.Autosaw = Value
		StopTween(_G.Autosaw)
	end
})

local SharkPos = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
spawn(function()
    while wait() do
        if  _G.Autosaw and World1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "The Saw" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autosaw or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude > 1500 then
            BTP(SharkPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude < 1500 then
            topos(SharkPos)
            end
        else
            topos(SharkPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Serpent Bow",
	Default = false,
	Callback = function(Value)
		_G.AutoSerpentBow = Value
		StopTween(_G.AutoSerpentBow)
	end
})

local EmpressPos = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
    spawn(function()
    while wait() do
        if  _G.AutoSerpentBow and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Island Empress" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
            if BypassTP then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude > 1500 then
            BTP(EmpressPos)
            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SharkPos.Position).Magnitude < 1500 then
            topos(EmpressPos)
            end
        else
            topos(EmpressPos)
        end
            UnEquipWeapon(_G.SelectWeapon)
            topos(CFrame.new(5543.86328125, 668.97399902344, 199.0341796875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress").HumanoidRootPart.CFrame * CFrame.new(2,40,2))
                end
            end
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "Other"
})

ItemQuest:AddToggle({
	Name = "Auto Evo Race V2",
	Default = false,
	Callback = function(Value)
		_G.Auto_EvoRace = Value
		StopTween(_G.Auto_EvoRace)
	end
})

spawn(function()
    while wait(.1) do
        if _G.Auto_EvoRace then
            if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                    topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                    if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                        wait(1.3)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                    end
                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                    pcall(function()
                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                            topos(game:GetService("Workspace").Flower1.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                            topos(game:GetService("Workspace").Flower2.CFrame)
                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Zombie" then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosMonEvo = v.HumanoidRootPart.CFrame
                                            StartEvoMagnet = true
                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                        StartEvoMagnet = false
                                    end
                                end
                            else
                                StartEvoMagnet = false
                                topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                            end
                        end
                    end)
                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Musketeer Hat",
	Default = false,
	Callback = function(Value)
		_G.AutoMusketeerHat = Value
		StopTween(_G.AutoMusketeerHat)
	end
})

spawn(function()
    while wait(.1) do
        if _G.AutoMusketeerHat then
            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Forest Pirate" then
                                repeat task.wait()
                                    pcall(function()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        MusketeerHatMon = v.HumanoidRootPart.CFrame
                                        StartMagnetMusketeerhat = true
                                    end)
                                until _G.AutoMusketeerHat == false or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                StartMagnetMusketeerhat = false
                            end
                        end
                    else
                        StartMagnetMusketeerhat = false
                        topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                    end
                else
                    topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                    if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
                    end
                end
            elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Captain Elephant" then
                                OldCFrameElephant = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    pcall(function()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameElephant
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    end)
                                until _G.AutoMusketeerHat == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            end
                        end
                    else
                        topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                    end
                else
                    topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                    if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
                    end
                end
            elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Quest Second Sea",
	Default = false,
	Callback = function(Value)
		_G.AutoSecondSea = Value
		StopTween(_G.AutoSecondSea)
	end
})

spawn(function()
    while wait() do 
        if _G.AutoSecondSea then
            local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
            if MyLevel >= 700 and World1 then
                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                    local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                    repeat topos(CFrame1) wait() until (CFrame1.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                    wait(1.1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                    wait(0.5)
                    EquipWeapon("Key")
                    repeat topos(CFrame.new(1347.7124, 37.3751602, -1325.6488)) wait() until (Vector3.new(1347.7124, 37.3751602, -1325.6488)-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false
                    wait(0.5)
                else
                    if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral" then
                                    if not v.Humanoid.Health <= 0 then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            OldCFrameSecond = v.HumanoidRootPart.CFrame
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    else 
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                            end
                        end
                    end
                end
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Quest Third Sea",
	Default = false,
	Callback = function(Value)
		_G.AutoThirdSea = Value
		StopTween(_G.AutoThirdSea)
	end
})

spawn(function()
    while wait() do
        if _G.AutoThirdSea then
            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                _G.AutoFarm = false
                if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                    topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                    if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                    end
                    wait(1.8)
                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "rip_indra" then
                                OldCFrameThird = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.CFrame = OldCFrameThird
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                        topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                    end
                end
            end
        end
    end
end)

-- [ Tab Player ]

local Section = Player:AddSection({
    Name = "Player"
})

Player:AddButton({
    Name = "Join Pirates Team",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")
    end
})

Player:AddButton({
    Name = "Join Marines Team",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
    end
})

Player:AddToggle({
	Name = "Auto Set Spawn Point",
	Default = false,
	Callback = function(Value)
		_G.Pos_Spawn = Value
	end
})

spawn(function()
    while wait() do
        if _G.Pos_Spawn then
            if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end
        end
    end
end)

Player:AddToggle({
	Name = "Auto Ken",
	Default = true,
	Callback = function(Value)
		_G.AutoKen = Value
	end
})

spawn(function()
    while wait() do
        if _G.AutoKen == true then
            game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
        end
    end
end)

local Section = Player:AddSection({
    Name = "Turn On"
})

Player:AddToggle({
	Name = "Auto Turn On Buso Haki",
	Default = true,
	Callback = function(Value)
		_G.AutoHaki = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.AutoHaki then
            AutoHaki()
        end
    end
end)

Player:AddToggle({
	Name = "Auto Turn On Race V3",
	Default = false,
	Callback = function(Value)
		_G.OnV3 = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.OnV3 then
            game:GetService('VirtualUser'):SetKeyDown('0x74')
            wait(0.1)
            game:GetService('VirtualUser'):SetKeyUp('0x74')
        end
    end
end)

Player:AddToggle({
	Name = "Auto Turn On Race V4",
	Default = false,
	Callback = function(Value)
		_G.OnV4 = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.OnV4 then
            game:GetService('VirtualUser'):SetKeyDown('0x59')
            wait(0.1)
           game:GetService('VirtualUser'):SetKeyUp('0x59')
        end
    end
end)

Player:AddToggle({
	Name = "Auto Turn On Observation",
	Default = false,
	Callback = function(Value)
		_G.OnHaki = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.OnHaki then
            repeat wait()
                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService('VirtualUser'):SetKeyDown('0x65')
                    wait(0.1)
                    game:GetService('VirtualUser'):SetKeyUp('0x65')
                end
            until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.OnHaki
        end
    end
end)

local Section = Player:AddSection({
    Name = "Haki State"
})

Player:AddDropdown({
	Name = "Select Haki State",
	Default = "",
	Options = {"State 0","State 1","State 2","State 3","State 4","State 5"},
	Callback = function(Value)
		_G.SelectStateHaki = Value
	end
})

Player:AddButton({
    Name = "Set State Haki",
    Callback = function()
        if _G.SelectStateHaki == "State 0" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
        elseif _G.SelectStateHaki == "State 1" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
        elseif _G.SelectStateHaki == "State 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
        elseif _G.SelectStateHaki == "State 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
        elseif _G.SelectStateHaki == "State 4 " then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
        elseif _G.SelectStateHaki == "State 5" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
        end
    end
})

local Section = Player:AddSection({
    Name = "Open"
})

Player:AddButton({
    Name = "Open Devil Fruit Shop",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end
})

Player:AddButton({
    Name = "Open Title",
    Callback = function()
        local args = {
            [1] = "getTitles"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end
})

Player:AddButton({
    Name = "Open Haki Colors",
    Callback = function()
        game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
    end
})

Player:AddButton({
    Name = "Open Awakening",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
    end
})

local Section = Player:AddSection({
    Name = "Abilities"
})

Player:AddToggle({
	Name = "Soru No CD",
	Default = false,
	Callback = function(Value)
		getgenv().InfSoru = Value
	end
})

spawn(function()
    while wait() do
        if getgenv().InfSoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Soru then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
                        for i2,v2 in next, getupvalues(v) do
                            if typeof(v2) == "table" then
                                repeat wait(0.1)
                                    v2.LastUse = 0
                                until not getgenv().InfSoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end
    end
end)

Player:AddToggle({
	Name = "Geppo No CD [ Wait Fix ]",
	Default = false,
	Callback = function(Value)
		getgenv().InfGeppo = Value
	end
})

spawn(function()
    while wait() do
        if getgenv().InfGeppo then
            for i,v in next, getgc() do
                if game.Players.LocalPlayer.Character:WaitForChild("Geppo") then
                    if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Geppo") then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(i2) == "9" then
                                repeat wait(.1)
                                    setupvalue(v,i2,0)
                                until not getgenv().InfGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end
    end
end)

Player:AddToggle({
	Name = "Walk On Water",
	Default = false,
	Callback = function(Value)
		_G.WalkWater = Value
	end
})

spawn(function()
	while task.wait() do
		if _G.WalkWater then
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
		else
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
		end
	end
end)

Player:AddToggle({
	Name = "No Clip",
	Default = false,
	Callback = function(Value)
		_G.LOf = Value
	end
})

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.LOf then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        end
    end)
end)

-- [ Tab PvP ]

local Section = PvP:AddSection({
    Name = "Player"
})

local plyserv = PvP:AddParagraph("Player In Server")

spawn(function()
    while task.wait() do
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if i == 12 then
                plyserv:Set("Player: "..i.."/".."12")
            elseif i == 1 then
                plyserv:Set("Player: "..i.."/".."12")
            else
                plyserv:Set("Player: "..i.."/".."12")
            end
        end
    end
end)

local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local Slplayer = PvP:AddDropdown({
	Name = "Select Player",
	Default = "",
	Options = Playerslist,
	Callback = function(Value)
		_G.SelectPly = Value
	end
})

PvP:AddButton({
    Name = "Refresh Player List",
    Callback = function()
        Slplayer:Refresh(Playerslist,true)
        NewPlayerList = {}
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(NewPlayerList, v.Name)
        end
        Slplayer:Refresh(NewPlayerList)
    end
})

PvP:AddToggle({
	Name = "Teleport To Player",
	Default = false,
	Callback = function(Value)
		_G.Teleport = Value
		StopTween(_G.Teleport)
	end
})

spawn(function()
	while wait() do
		if _G.Teleport then
			if game.Players:FindFirstChild(_G.SelectPly) then
				topos(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
			end
		end
	end
end)

PvP:AddToggle({
	Name = "Spectate Player",
	Default = false,
	Callback = function(Value)
		_G.SpectatePlys = Value
	end
})

spawn(function()
	while wait() do
		if _G.SpectatePlys then
			if game.Players:FindFirstChild(_G.SelectPly) then
				repeat wait(.1)
	                game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
				until _G.SpectatePlys == false
				game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
			end
		end
	end
end)

local Section = PvP:AddSection({
    Name = "Aimbot"
})

PvP:AddSlider({
	Name = "Size Fov Aimbot Skill",
	Min = 0,
	Max = 500,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		_G.Select_Size_Fov = Value
	end
})

PvP:AddToggle({
	Name = "Show Fov Aimbot Skill",
	Default = false,
	Callback = function(Value)
		_G.Show_Fov = Value
	end
})

PvP:AddToggle({
	Name = "Aimbot Skill To Player",
	Default = false,
	Callback = function(Value)
		_G.Aimbot_Skill_Fov = Value
	end
})

local lp = game:GetService('Players').LocalPlayer
local mouse = lp:GetMouse()
spawn(function()
	while wait() do
		if _G.Aimbot_Skill_Fov then
			local MaxDist, Closest = math.huge
			for i,v in pairs(game:GetService("Players"):GetChildren()) do 
				local Head = v.Character:FindFirstChild("HumanoidRootPart")
				local Pos, Vis = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, Head.Position)
				local MousePos, TheirPos = Vector2.new(mouse.X, mouse.Y), Vector2.new(Pos.X, Pos.Y)
				local Dist = (TheirPos - MousePos).Magnitude
				if Dist < MaxDist and Dist <= _G.Select_Size_Fov and v.Name ~= game.Players.LocalPlayer.Name then
					MaxDist = Dist
					_G.Aim_Players = v
				end
			end
		end
	end
end)
spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if _G.Aimbot_Skill_Fov then
						args[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
						return old(unpack(args))
					end
				end
			end
		end
		return old(...)
	end)
end)
local Circle = Drawing.new("Circle")
Circle.Color =  Color3.fromRGB(0, 244, 0)
Circle.Thickness = 1
Circle.Radius = 250
Circle.NumSides = 460
Circle.Filled = false
Circle.Transparency = 1

game:GetService("RunService").Stepped:Connect(function()
    Circle.Radius = _G.Select_Size_Fov
    Circle.Thickness = 1
    Circle.NumSides = 460
    Circle.Position = game:GetService('UserInputService'):GetMouseLocation()
    if _G.Show_Fov then
        Circle.Visible = true
    else
        Circle.Visible = false
    end
end)

PvP:AddToggle({
	Name = "Enabled PvP",
	Default = false,
	Callback = function(Value)
		_G.EnabledPvP = Value
	end
})

spawn(function()
    while wait(.1) do
        if _G.EnabledPvP then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end
    end
end)

local Section = PvP:AddSection({
    Name = "Bounty / Honor"
})

local checkbotihoron = PvP:AddParagraph("Your Bounty / Honor")

spawn(function()
    while task.wait() do
        if game:GetService("Players").LocalPlayer.Team.Name == "Pirates" then
            checkbotihoron:Set("Bounty: "..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value))
        elseif game:GetService("Players").LocalPlayer.Team.Name == "Marines" then
            checkbotihoron:Set("Honor: "..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value))
        end
    end
end)

-- [ Tab Race ]

local Section = Race:AddSection({
    Name = "Templete Of Time"
})

function CheckRace()
    local a = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad","1")
    local b = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist","1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value.." V4"
    end
    if a == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value.." V3"
    end
    if b == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value.." V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value.." V1"
end

local PosTemplete = CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)
function Templeteleport()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end
function CheckAndTweenTemple()
    if (PosTemplete.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        Templeteleport()
    end
    if (PosTemplete.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        Templeteleport()
    end
end

local CRace = Race:AddParagraph("Your Race")

spawn(function()
    while wait() do
        CRace:Set("Race: "..CheckRace())
    end
end)

Race:AddButton({
    Name = "Teleport To Temple Of Time",
    Callback = function()
        Templeteleport()
    end
})

Race:AddButton({
    Name = "Pull Lever",
    Callback = function()
        PullLever()
        OrionLib:MakeNotification({
			Name = "Tinh Linh Hub",
			Content = "Pull Lever Complete !",
			Image = "rbxassetid://16730867128",
			Time = 5
		})
    end
})

function PullLever()
    local bn=CFrame.new(28576.4688,14939.2832,76.5164413,-1,0,0,0,0.707134247,-0.707079291,-0,-0.707079291,-0.707134247)
    local bo=CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
    local bp = 0.2
    if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp then
        CheckAndTweenTemple()
        topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        wait(0.01)
        topos(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
        for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end
end

Race:AddButton({
    Name = "Teleport To Clock",
    Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
            wait(0.3)
            topos(CFrame.new(29551.9941, 15069.002, -85.5179291))
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.1)
      	  topos(CFrame.new(29551.9941, 15069.002, -85.5179291))
        end
    end
})

Race:AddButton({
    Name = "Teleport To Anclient One",
    Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
            wait(0.3)
            topos(CFrame.new(28973.0879, 14889.9756, -120.298691))
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.1)
            topos(CFrame.new(28973.0879, 14889.9756, -120.298691))
        end
    end
})

function RaceDoors()
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
        topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
        topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
        topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
        topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
        topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
    end
end
    

Race:AddButton({
    Name = "Teleport To Race Doors",
    Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
            wait(0.3)
            RaceDoors()
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.1)
            RaceDoors()
        end
    end
})

local Section = Race:AddSection({
    Name = "Mirage Island"
})

local StatusMirage = Race:AddParagraph("Mirage Island")

spawn(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            StatusMirage:Set("Mirage Island: 🟢")
        else
            StatusMirage:Set("Mirage Island: 🔴")
        end
    end
end)

Race:AddToggle({
	Name = "Teleport To Mirage Island",
	Default = false,
	Callback = function(Value)
		_G.AutoMysticIsland = Value
		StopTween(_G.AutoMysticIsland)
	end
})

spawn(function()
    while wait() do
        if _G.AutoMysticIsland then
            for i,v in pairs(game.Workspace.Map.MysticIsland:GetChildren()) do
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    topos(CFrame.new(game.Workspace.Map.MysticIsland.BiggTree.Part.Position))
                end
            end
        end
    end
end)

Race:AddToggle({
	Name = "Tween Blue Gear",
	Default = false,
	Callback = function(Value)
		_G.TweenMGear = Value
		StopTween(_G.TweenMGear)
	end
})

spawn(function()
    while wait() do
        if _G.TweenMGear then
			if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
				for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
					if v:IsA("MeshPart") then 
                        if v.Material == Enum.Material.Neon then  
                            topos(v.CFrame)
                        end
                    end
				end
			end
		end
    end
end)

Race:AddToggle({
	Name = "Lock Cam To Moon",
	Default = false,
	Callback = function(Value)
		_G.LockCamToMoon = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.LockCamToMoon then
           workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
        end
    end
end)

Race:AddToggle({
	Name = "Teleport To Advanced Fruit Dealer",
	Default = false,
	Callback = function(Value)
		_G.Miragenpc = Value
		StopTween(_G.Miragenpc)
	end
})

spawn(function()
    while wait() do
        if _G.Miragenpc then
            if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                topos(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
            end
        end
    end
end)

local Section = Race:AddSection({
    Name = "Trials"
})

local Moon1 = Race:AddParagraph("Moon")

spawn(function()
    while task.wait() do
        Moon1:Set(CheckMoon().." | "..function8())
    end
end)

Race:AddToggle({
	Name = "Auto Complete Trials",
	Default = false,
	Callback = function(Value)
		_G.AutoQuestRace = Value
		StopTween(_G.AutoQuestRace)
	end
})

spawn(function()
    while wait() do
        if _G.AutoQuestRace then
			if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
				for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						pcall(function()
							repeat wait(.1)
								v.Humanoid.Health = 0
								v.HumanoidRootPart.CanCollide = false
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
						end)
					end
				end
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
				for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
					if v.Name ==  "snowisland_Cylinder.081" then
						topos(v.CFrame* CFrame.new(0,0,0))
					end
				end
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
				for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
					if v.Name ==  "HumanoidRootPart" then
						topos(v.CFrame* Pos)
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v:IsA("Tool") then
								if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
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
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v:IsA("Tool") then
								if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
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
								if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
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
								if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
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
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
				topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
				for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						pcall(function()
							repeat wait(.1)
								v.Humanoid.Health = 0
								v.HumanoidRootPart.CanCollide = false
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
						end)
					end
				end
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
				for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
					if v.Name == "StartPoint" then
						topos(v.CFrame* CFrame.new(0,10,0))
					end
				end
			end
		end
    end
end)

Race:AddDropdown({
	Name = "Select Weapon Kill Players Trials",
	Default = "Melee",
	Options = {"Melee","Sword","Gun","Blox Fruit"},
	Callback = function(Value)
		SelectWeaponTrials = Value
	end
})

spawn(function()
	while task.wait() do
		if SelectWeaponTrials == SelectWeaponTrials then
			for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == SelectWeaponTrials then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.SelectWeaponTrials = v.Name
					end
				end
			end
		end
	end
end)

Race:AddToggle({
	Name = "Auto Kill Players After Trials",
	Default = false,
	Callback = function(Value)
		_G.KillAfterTrials = Value
		StopTween(_G.KillAfterTrials)
	end
})

spawn(function()
    while task.wait() do
        if _G.KillAfterTrials then
            for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 150 then
                        repeat task.wait()
                            EquipWeapon(_G.SelectWeaponTrials)
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0))
                            useskilltrial = true
                        until _G.KillAfterTrials == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                        useskilltrial = false
                    end
                end
            end
        end
    end
end)

Race:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
		_G.Z = Value
	end
})

Race:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
		_G.X = Value
	end
})

Race:AddToggle({
	Name = "Use Skill C",
	Default = false,
	Callback = function(Value)
		_G.C = Value
	end
})

Race:AddToggle({
	Name = "Use Skill V",
	Default = false,
	Callback = function(Value)
		_G.V = Value
	end
})

spawn(function()
    while task.wait() do
        if useskilltrial then
            if _G.Z then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                wait(0)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                if _G.X then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                    wait(0)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                    if _G.C then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                        wait(0)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                        if _G.V then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            wait(0)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.KillAfterTrials then
            repeat task.wait()
                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):SetKeyDown("0x65")
                    wait(2)
                    game:GetService("VirtualUser"):SetKeyUp("0x65")
                end
            until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.KillV4
        end
    end
end)

local Section = Race:AddSection({
    Name = "Train"
})

function CheckAncientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You Have Yet To Achieve Greatness"
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
            return "You Have Yet To Achieve Greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " Training Sessions"
end

local AnOn = Race:AddParagraph("Ancient One")

spawn(function()
    while wait() do
        AnOn:Set(CheckAncientOneStatus())
    end
end)

Race:AddToggle({
	Name = "Auto Buy Gear",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyGear = Value
	end
})

spawn(function()
    while wait(0.1) do
        if _G.AutoBuyGear then
            local args = {
                [1] = true
            }
            local args = {
                [1] = "UpgradeRace",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        end
    end
end)

Race:AddToggle({
	Name = "Auto Ancient One Quest",
	Default = false,
	Callback = function(Value)
		_G.AutoRace = Value
		StardFarm = Value
		StopTween(_G.AutoRace)
	end
})

spawn(function()
    while wait() do
        if _G.AutoRace then
            if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                StardFarm = false
                topos(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
            end
        end
    end
end)

spawn(function()
    while wait() do
        if StardFarm and World3  then
            local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
            if not string.find(QuestTitle, "Demonic Soul") then
                StartMagnetBoneMon = false
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                StartMagnetBoneMon = false
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                BTP(BoneQuestPos)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude < 1500 then
                topos(BoneQuestPos)
                end
            else
                topos(BoneQuestPos)
            end
            if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then    
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                        StartMagnetBoneMon = true
                                    until not StardFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                else
                                    StartMagnetBoneMon = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    end
                else
                    StartMagnetBoneMon = false
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]") then
                     topos(game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]").HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoRace then
            if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                StardFarm = true
            end
        end
    end
end)

spawn(function()
    while wait() do
		if _G.AutoRace then
			game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
			wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
		end
    end
end)

-- [ Tab Stats & Esp ]

local Section = StatsEsp:AddSection({
    Name = "Stats"
})

StatsEsp:AddSlider({
	Name = "Point",
	Min = 0,
	Max = 100,
	Default = 3,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		PointStats = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Melee",
	Default = false,
	Callback = function(Value)
		Melee = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Defense",
	Default = false,
	Callback = function(Value)
		Defense = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Sword",
	Default = false,
	Callback = function(Value)
		Sword = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Gun",
	Default = false,
	Callback = function(Value)
		Gun = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Devil Fruit",
	Default = false,
	Callback = function(Value)
		DemonFruit = Value
	end
})

spawn(function()
	while task.wait() do
		if game.Players.localPlayer.Data.Points.Value >= PointStats then
			if Melee then
				local args = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
			if Defense then
				local args = {
					[1] = "AddPoint",
					[2] = "Defense",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
			if Sword then
				local args = {
					[1] = "AddPoint",
					[2] = "Sword",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
			if Gun then
				local args = {
					[1] = "AddPoint",
					[2] = "Gun",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
			if DemonFruit then
				local args = {
					[1] = "AddPoint",
					[2] = "Demon Fruit",
					[3] = PointStats
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end
end)

local Section = StatsEsp:AddSection({
    Name = "Esp"
})

StatsEsp:AddToggle({
	Name = "Esp Player",
	Default = false,
	Callback = function(Value)
		ESPPlayer = Value
		UpdatePlayerChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Island",
	Default = false,
	Callback = function(Value)
		IslandESP = Value
 	   while IslandESP do wait()
			UpdateIslandESP()
		end
	end
})

StatsEsp:AddToggle({
	Name = "Esp Devil Fruit",
	Default = false,
	Callback = function(Value)
		DevilFruitESP = Value
		UpdateDevilChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Flower",
	Default = false,
	Callback = function(Value)
		FlowerESP = Value
		UpdateFlowerChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Chest",
	Default = false,
	Callback = function(Value)
		ChestESP = Value
		UpdateChestChams()
	end
})

spawn(function()
	while task.wait() do
	    if FlowerESP then
		    UpdateFlowerChams() 
	    end
	    if ChestESP then
		    UpdateChestChams() 
	    end
	    if ESPPlayer then
		    UpdatePlayerChams()
	    end
	    if DevilFruitESP then
		    UpdateDevilChams()
	    end
	end
end)

-- [ Tab Teleport ]

local Section = Teleport:AddSection({
    Name = "Sea"
})

Teleport:AddDropdown({
	Name = "Select Sea",
	Default = "",
	Options = {"First Sea","Second Sea","Third Sea"},
	Callback = function(Value)
		_G.SelectSea = Value
	end
})

Teleport:AddButton({
    Name = "Teleport To Sea",
    Callback = function()
        if _G.SelectSea == "First Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        elseif _G.SelectSea == "Second Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        elseif _G.SelectSea == "Third Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
    end
})

local Section = Teleport:AddSection({
    Name = "Island"
})

if World1 then
Teleport:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"},
    Callback = function(Value)
		_G.SelectIsland = Value
	end
})
end

if World2 then
Teleport:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Raid Lab","Two Snow Mountains","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"},
    Callback = function(Value)
		_G.SelectIsland = Value
	end
})
end

if World3 then
Teleport:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"Mansion","Port Town","Great Tree","Castle On The Sea","Raid Lab","MiniSky", "Hydra Island","Beautiful Pirate","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost"},
    Callback = function(Value)
		_G.SelectIsland = Value
	end
})
end

Teleport:AddToggle({
	Name = "Teleport To Island",
	Default = false,
	Callback = function(Value)
		_G.TeleportIsland = Value
	    if _G.TeleportIsland == true then
  	      repeat wait()
      	      if _G.SelectIsland == "WindMill" then
    	            topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
    	        elseif _G.SelectIsland == "Marine" then
     	           topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
    	        elseif _G.SelectIsland == "Middle Town" then
    	            topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
       	     elseif _G.SelectIsland == "Jungle" then
       	         topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
     	       elseif _G.SelectIsland == "Pirate Village" then
     	           topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
      	      elseif _G.SelectIsland == "Desert" then
      	          topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
      	      elseif _G.SelectIsland == "Snow Island" then
     	           topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
   	         elseif _G.SelectIsland == "MarineFord" then
      	          topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
     	       elseif _G.SelectIsland == "Colosseum" then
      	          topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
     	       elseif _G.SelectIsland == "Sky Island 1" then
    	            topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
     	       elseif _G.SelectIsland == "Sky Island 2" then
     	           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
       	     elseif _G.SelectIsland == "Sky Island 3" then
      	          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
     	       elseif _G.SelectIsland == "Prison" then
       	         topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
      	      elseif _G.SelectIsland == "Magma Village" then
       	         topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
     	       elseif _G.SelectIsland == "Under Water Island" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    	        elseif _G.SelectIsland == "Fountain City" then
     	           topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
   	         elseif _G.SelectIsland == "Shank Room" then
  	              topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
 	           elseif _G.SelectIsland == "Mob Island" then
    	            topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
      	      elseif _G.SelectIsland == "Raid Lab" then
      	 	 	if World3 then
     	         	  topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
   				elseif World2 then
						topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
   				end
        	    elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
        	    elseif _G.SelectIsland == "Frist Spot" then
     	           topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
     	       elseif _G.SelectIsland == "Dark Area" then
    	            topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
     	       elseif _G.SelectIsland == "Flamingo Mansion" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
      	      elseif _G.SelectIsland == "Flamingo Room" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283, 15, 867))
      	      elseif _G.SelectIsland == "Green Zone" then
            	    topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
	            elseif _G.SelectIsland == "Factory" then
        	        topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
    	        elseif _G.SelectIsland == "Colossuim" then
        	        topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
       	     elseif _G.SelectIsland == "Zombie Island" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6509, 83, -133))
       	     elseif _G.SelectIsland == "Two Snow Mountain" then
          	      topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
      	      elseif _G.SelectIsland == "Punk Hazard" then
        	        topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
      	      elseif _G.SelectIsland == "Cursed Ship" then
          	      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.40197753906, 125.05712890625, 32885.875))
      	      elseif _G.SelectIsland == "Ice Castle" then
           	     topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
        	    elseif _G.SelectIsland == "Forgotten Island" then
             	   topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
           	 elseif _G.SelectIsland == "Ussop Island" then
    	            topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
    	        elseif _G.SelectIsland == "Mini Sky Island" then
           	     topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
     	       elseif _G.SelectIsland == "Great Tree" then
             	   topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
       	     elseif _G.SelectIsland == "Castle On The Sea" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
           	 elseif _G.SelectIsland == "MiniSky" then
        	        topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
        	    elseif _G.SelectIsland == "Port Town" then
          	      topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
        	    elseif _G.SelectIsland == "Hydra Island" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5756, 610, -282))
        	    elseif _G.SelectIsland == "Beautiful Pirate" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5319, 23, -93))
       	     elseif _G.SelectIsland == "Floating Turtle" then
          	      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12001, 332, -8861))
        	    elseif _G.SelectIsland == "Mansion" then
     	     	  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
         	   elseif _G.SelectIsland == "Haunted Castle" then
          	      topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
        	    elseif _G.SelectIsland == "Ice Cream Island" then
           	     topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
         	   elseif _G.SelectIsland == "Peanut Island" then
        	        topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
          	  elseif _G.SelectIsland == "Cake Island" then
           	     topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
          	  elseif _G.SelectIsland == "Cocoa Island" then
         	       topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
       	     elseif _G.SelectIsland == "Candy Island" then
           	     topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
       	     elseif _G.SelectIsland == "Tiki Outpost" then
            	    topos(CFrame.new(-16101.1885,12.8422165,380.942291))
          	  end
  	  	until not _G.TeleportIsland
 	   end
  	  StopTween(_G.TeleportIsland)
	end
})

-- [ Tab Status & Server ]

local Section = StatusServer:AddSection({
    Name = "Status Server"
})

local Time = StatusServer:AddParagraph("Time Played")

function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    Time:Set(Hour.." Hour | "..Minute.." Minute | "..Second.." Seconds")
end

spawn(function()
    while task.wait() do
        UpdateTime()
    end
end)

local Moon = StatusServer:AddParagraph("Moon")

spawn(function()
    while task.wait() do
        Moon:Set(CheckMoon().." | "..function8())
    end
end)

local KillCake = StatusServer:AddParagraph("Cake Prince")

spawn(function()
    while task.wait() do
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
            KillCake:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."/500")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
            KillCake:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."/500")
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
            KillCak:Set("Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).."/500")
        else
            KillCake:Set("Boss Is Spawning")
        end
    end
end)

local LegendSwords1 = StatusServer:AddParagraph("Legendary Sword Dealer")

spawn(function()
    while wait() do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            LegendSwords1:Set("Sword Name: Shisui")
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2") then
            LegendSwords1:Set("Sword Name: Wando")
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3") then
            LegendSwords1:Set("Sword Name: Saddi")
        else
            LegendSwords1:Set("Not Found Legendary Sword Dealer")
        end
    end
end)

local ColorHaki1 = StatusServer:AddParagraph("Haki Dealer")

spawn(function()
    while wait() do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") then
            ColorHaki1:Set("Haki Colors: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1"))
        else
            ColorHaki1:Set("Not Found Haki Dealer")
        end
    end
end)

local Elite = StatusServer:AddParagraph("Elite")

spawn(function()
    while wait() do
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
            Elite:Set("Elite: 🟢")	
        else
            Elite:Set("Elite: 🔴")	
        end
    end
end)

local Mirage = StatusServer:AddParagraph("Mirage Island")

spawn(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            Mirage:Set("Mirage Island: 🟢")
        else
            Mirage:Set("Mirage Island: 🔴")
        end
    end
end)

local Kitsune = StatusServer:AddParagraph("Kitsune Island")

spawn(function()
    while wait() do
        if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
            Kitsune:Set("Kitsune Island: 🟢")
        else
            Kitsune:Set("Kitsune Island: 🔴")
        end
    end
end)

local Frozen = StatusServer:AddParagraph("Frozen Dimension")

spawn(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
            Frozen:Set("Frozen Dimension: 🟢")
        else
            Frozen:Set("Frozen Dimension: 🔴")
        end
    end
end)

local Section = StatusServer:AddSection({
    Name = "Server"
})

StatusServer:AddTextbox({
	Name = "Input Job-Id",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.Job = Value
	end	  
})

StatusServer:AddToggle({
	Name = "Spam Join Server",
	Default = false,
	Callback = function(Value)
		_G.Join = Value
	end
})

spawn(function()
    while task.wait() do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    end
end)

StatusServer:AddButton({
    Name = "Join Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
    end
})

StatusServer:AddButton({
    Name = "Copy Server Job-Id",
    Callback = function()
        setclipboard(tostring(game.JobId))
        OrionLib:MakeNotification({
        	Name = "Tinh Linh Hub!",
        	Content = "Copied Server Job-Id !",
        	Image = "rbxassetid://16730867128",
        	Time = 5
        })
    end
})

StatusServer:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

StatusServer:AddButton({
    Name = "Hop Server",
    Callback = function()
        Hop()
    end
})

-- [ Tab Shop ]

local Section = Shop:AddSection({
    Name = "Code"
})

CodeA = {"TantaiGaming","Axiore","SUB2DAIGROCK","Sub2UncleKizaru","SUB2NOOBMASTER123","StrawHatMaine","Sub2OfficialNoobie","SUB2GAMERROBOT_EXP1","THEGREATACE","BIGNEWS","FUDD10","fudd10_v2","Bluxxy","StarcodeHEO","JCWK","Magicbus","Enyu_is_Pro","Sub2Fer999","KittGaming","SUB2GAMERROBOT_RESET1","Sub2CaptainMaui"}

Shop:AddDropdown({
    Name = "Select Code",
    Default = "",
    Options = CodeA,
    Callback = function(Value)
		_G.CodeA = Value
	end
})

Shop:AddButton({
    Name = "Redeem Code",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeA)
    end
})

Shop:AddButton({
    Name = "Redeem All Code",
    Callback = function()
        function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(CodeA) do
            RedeemCode(v)
        end
    end
})

local Section = Shop:AddSection({
    Name = "Fighting Style"
})

SelectMelee = {"Black Leg","Electro","Fishman Karate","Dragon Claw","SuperHuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","GodHuman","Sanguine Art"}

Shop:AddDropdown({
    Name = "Select Fighting Style",
    Default = "",
    Options = SelectMelee,
    Callback = function(Value)
		_G.SelectMelee = Value
	end
})

Shop:AddButton({
    Name = "Buy Fighting Style",
    Callback = function()
        if _G.SelectMelee == "Black Leg" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        elseif _G.SelectMelee == "Electro" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
        elseif _G.SelectMelee == "Fishman Karate" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        elseif _G.SelectMelee == "Dragon Claw" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
        elseif _G.SelectMelee == "SuperHuman" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
        elseif _G.SelectMelee == "Death Step" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        elseif _G.SelectMelee == "Sharkman Karate" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        elseif _G.SelectMelee == "Electric Claw" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
        elseif _G.SelectMelee == "Dragon Talon" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        elseif _G.SelectMelee == "GodHuman" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
        elseif _G.SelectMelee == "Sanguine Art" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
    end
})

local Section = Shop:AddSection({
    Name = "Abilities"
})

SelectAbilities = {"Sky Jump [ Geppo ]","Buso Haki","Soru","Observation Haki"}

Shop:AddDropdown({
    Name = "Select Abilities",
    Default = "",
    Options = SelectAbilities,
    Callback = function(Value)
		_G.SelectAbilities = Value
	end
})

Shop:AddButton({
    Name = "Buy Abilities",
    Callback = function()
        if _G.SelectAbilities == "Sky Jump [ Geppo ]" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
        elseif _G.SelectAbilities == "Buso Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
        elseif _G.SelectAbilities == "Soru" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        elseif _G.SelectAbilities == "Observation Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
        end
    end
})

local Section = Shop:AddSection({
    Name = "Sword"
})

SelectSword = {"Cutlass","Katana","Iron Mace","Dual Katana","Triple Katana","Pipe","Dual-Headed Blade","Bisento","Soul Cane","Pole V2"}

Shop:AddDropdown({
    Name = "Select Sword",
    Default = "",
    Options = SelectSword,
    Callback = function(Value)
		_G.SelectSword = Value
	end
})

Shop:AddButton({
    Name = "Buy Sword",
    Callback = function()
        if _G.SelectSword == "Cutlass" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
        elseif _G.SelectSword == "Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
        elseif _G.SelectSword == "Iron Mace" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
        elseif _G.SelectSword == "Dual Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
        elseif _G.SelectSword == "Triple Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
        elseif _G.SelectSword == "Pipe" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
        elseif _G.SelectSword == "Dual-Headed Blade" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
        elseif _G.SelectSword == "Bisento" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
        elseif _G.SelectSword == "Soul Cane" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
        elseif _G.SelectSword == "Pole V2" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
        end
    end
})

local Section = Shop:AddSection({
    Name = "Gun"
})

SelectGun = {"Slingshot","Flintlock","Musket","Cannon","Refined Flintlock","Refined Slingshot","Bizarre Rifle","Kabucha"}

Shop:AddDropdown({
    Name = "Select Gun",
    Default = "",
    Options = SelectGun,
    Callback = function(Value)
		_G.SelectGun = Value
	end
})

Shop:AddButton({
    Name = "Buy Gun",
    Callback = function()
        if _G.SelectGun == "Slingshot" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
        elseif _G.SelectGun == "Flintlock" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
        elseif _G.SelectGun == "Musket" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
        elseif _G.SelectGun == "Cannon" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
        elseif _G.SelectGun == "Refined Flintlock" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
        elseif _G.SelectGun == "Refined Slingshot" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
        elseif _G.SelectGun == "Kabucha" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Kabucha")
        elseif _G.SelectGun == "Bizarre Rifle" then
            local A_1 = "Ectoplasm"
            local A_2 = "Buy"
            local A_3 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
            Event:InvokeServer(A_1, A_2, A_3) 
            local A_1 = "Ectoplasm"
            local A_2 = "Buy"
            local A_3 = 1
            local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
            Event:InvokeServer(A_1, A_2, A_3)
        end
    end
})

local Section = Shop:AddSection({
    Name = "Other"
})

SelectOther = {"Reroll Race","Reset Stats","Cyborg Race","Ghoul Race"}

Shop:AddDropdown({
    Name = "Select Other Things",
    Default = "",
    Options = SelectOther,
    Callback = function(Value)
		_G.SelectOther = Value
	end
})

Shop:AddButton({
    Name = "Buy Other Things Selected",
    Callback = function()
        if _G.SelectOther == "Reroll Race" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
        elseif _G.SelectOther == "Reset Stats" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
        elseif _G.SelectOther == "Cyborg Race" then
            local a = {
                [1] = "CyborgTrainer",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
        elseif _G.SelectOther == "Ghoul Race" then
            local a = {
                [1] = "Ectoplasm",
                [2] = "BuyCheck",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
            local a = {
                [1] = "Ectoplasm",
                [2] = "Change",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
        end
    end
})

OrionLib:MakeNotification({
    Name = "Tinh Linh Hub",
    Content = "Script Loaded Successfully!",
    Image = "rbxassetid://16730867128",
    Time = 5
})
