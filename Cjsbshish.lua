setfpscap(60)
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

-- [ Check Monster & Material & Boss & Quest & Pos ]

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
        elseif MyLevel == 400 or MyLevel <= 449 then
            Mon = "Fishman Commando"
            LevelQuest = 2
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif MyLevel == 450 or MyLevel <= 474 then
            Mon = "God's Guard"
            LevelQuest = 1
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif MyLevel == 475 or MyLevel <= 524 then
            Mon = "Shanda"
            LevelQuest = 2
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
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
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Mon = "Ship Engineer"
            LevelQuest = 2
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
            CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Mon = "Ship Steward"
            LevelQuest = 1
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
            CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Mon = "Ship Officer"
            LevelQuest = 2
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
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

function MaterialMon()
    if World1 then
        if SelectMaterial == "Magma Ore" then
            MMon = "Military Soldier"
            MPos = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
            MMon1 = "Military Spy"
            MPos1 = CFrame.new(-5815, 84, 8820)
        elseif SelectMaterial == "Leather" or SelectMaterial == "Scrap Metal" then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
            MMon1 = "Pirate"
            MPos1 = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif SelectMaterial == "Angel Wings" then
            MMon = "God's Guard"
            MPos = CFrame.new(-4698, 845, -1912)
            MMon1 = "God's Guard"
            MPos1 = CFrame.new(-4698, 845, -1912)
        elseif SelectMaterial == "Fish Tail" then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            MMon1 = "Fishman Commando"
            MPos1 = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        end
    end
    if World2 then
        if SelectMaterial == "Magma Ore" then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
            MMon1 = "Lava Pirate"
            MPos1 = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif SelectMaterial == "Leather" or SelectMaterial == "Scrap Metal" then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010, 73, -3326)
            MMon1 = "Marine Captain"
            MPos1 = CFrame.new(-2010, 73, -3326)
        elseif SelectMaterial == "Radioactive Material" then
            MMon = "Factory Staff"
            MPos = CFrame.new(295, 73, -56)
            MMon1 = "Factory Staff"
            MPos1 = CFrame.new(295, 73, -56)
        elseif SelectMaterial == "Vampire Fang" then
            MMon = "Vampire"
            MPos = CFrame.new(-6033, 7, -1317)
            MMon1 = "Vampire"
            MPos1 = CFrame.new(-6033, 7, -1317)
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = "Water Fighter"
            MPos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
            MMon1 = "Sea Soldier"
            MPos1 = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        end
    end
    if World3 then
        if SelectMaterial == "Mini Tusk" then
            MMon = "Mythological Pirate"
            MPos = CFrame.new(-13545, 470, -6917)
            MMon1 = "Mythological Pirate"
            MPos1 = CFrame.new(-13545, 470, -6917)
        elseif SelectMaterial == "Fish Tail" then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
            MMon1 = "Fishman Captain"
            MPos1 = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif SelectMaterial == "Leather" or SelectMaterial == "Scrap Metal" then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107, 332, -10549)
            MMon1 = "Jungle Pirate"
            MPos1 = CFrame.new(-12107, 332, -10549)
        elseif SelectMaterial == "Dragon Scale" then
            MMon = "Dragon Crew Warrior"
            MPos = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
            MMon1 = "Dragon Crew Warrior"
            MPos1 = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = "Cocoa Warrior"
            MPos = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
            MMon1 = "Chocolate Bar Battler"
            MPos1 = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = "Demonic Soul"
            MPos = CFrame.new(-9507, 172, 6158)
            MMon1 = "Demonic Soul"
            MPos1 = CFrame.new(-9507, 172, 6158)
        elseif SelectMaterial == "Gunpowder" then
            MMon = "Pistol Billionaire"
            MPos = CFrame.new(-469, 74, 5904)
            MMon1 = "Pistol Billionaire"
            MPos1 = CFrame.new(-469, 74, 5904)
        end
    end
end

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
        elseif SelectMob == "Fishman Commando" then
            PosMonster = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif SelectMob == "God's Guard" then
            PosMonster = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif SelectMob == "Shanda" then
            PosMonster = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
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
        elseif SelectMob == "Ship Engineer" then
            PosMonster = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
        elseif SelectMob == "Ship Steward" then
            PosMonster = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
        elseif SelectMob == "Ship Officer" then
            PosMonster = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
        elseif SelectMob == "Arctic Warrior" then
            PosMonster = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
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

function CheckBossQuest()
	if SelectBoss == "Saber Expert" then 
		MsBoss = "Saber Expert"
		NameBoss = "Saber Expert"
		CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
	elseif SelectBoss == "The Saw" then 
		MsBoss = "The Saw"
		NameBoss = "The Saw"
		CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
	elseif SelectBoss == "Greybeard" then
		MsBoss = "Greybeard"
		NameBoss = "Greybeard"
		CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
	elseif SelectBoss == "The Gorilla King" then
		MsBoss = "The Gorilla King"
		NameBoss = "The Gorilla King"
		NameQuestBoss = "JungleQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
		CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
	elseif SelectBoss == "Bobby" then
		MsBoss = "Bobby"
		NameBoss = "Bobby"
		NameQuestBoss = "BuggyQuest1"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
		CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
	elseif SelectBoss == "Yeti" then
		MsBoss = "Yeti"
		NameBoss = "Yeti"
		NameQuestBoss = "SnowQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
		CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
	elseif SelectBoss == "Mob Leader" then
		MsBoss = "Mob Leader"
		NameBoss = "Mob Leader"
		CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
	elseif SelectBoss == "Vice Admiral" then
		MsBoss = "Vice Admiral"
		NameBoss = "Vice Admiral"
		NameQuestBoss = "MarineQuest2"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
		CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
	elseif SelectBoss == "Warden" then
		MsBoss = "Warden"
		NameBoss = "Warden"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 1
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Chief Warden" then
		MsBoss = "Chief Warden"
		NameBoss = "Chief Warden"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Swan" then
		MsBoss = "Swan"
		NameBoss = "Swan"
		NameQuestBoss = "ImpelQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Magma Admiral" then
		MsBoss = "Magma Admiral"
		NameBoss = "Magma Admiral"
		NameQuestBoss = "MagmaQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
		CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
	elseif SelectBoss == "Fishman Lord" then
		MsBoss = "Fishman Lord"
		NameBoss = "Fishman Lord"
		NameQuestBoss = "FishmanQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
		CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
	elseif SelectBoss == "Wysper" then
		MsBoss = "Wysper"
		NameBoss = "Wysper"
		NameQuestBoss = "SkyExp1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
		CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
	elseif SelectBoss == "Thunder God" then
		MsBoss = "Thunder God"
		NameBoss = "Thunder God"
		NameQuestBoss = "SkyExp2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
		CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
	elseif SelectBoss == "Cyborg" then
		MsBoss = "Cyborg"
		NameBoss = "Cyborg"
		NameQuestBoss = "FountainQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
		CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
		-- New World
	elseif SelectBoss == "Diamond" then
		MsBoss = "Diamond"
		NameBoss = "Diamond"
		NameQuestBoss = "Area1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
	elseif SelectBoss == "Jeremy" then
		MsBoss = "Jeremy"
		NameBoss = "Jeremy"
		NameQuestBoss = "Area2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
	elseif SelectBoss == "Fajita" then
		MsBoss = "Fajita"
		NameBoss = "Fajita"
		NameQuestBoss = "MarineQuest3"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
		CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
	elseif SelectBoss == "Don Swan" then
		MsBoss = "Don Swan"
		NameBoss = "Don Swan"
		CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
	elseif SelectBoss == "Smoke Admiral" then
		MsBoss = "Smoke Admiral"
		NameBoss = "Smoke Admiral"
		NameQuestBoss = "IceSideQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
		CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
	elseif SelectBoss == "Cursed Captain" then
		MsBoss = "Cursed Captain"
		NameBoss = "Cursed Captain"
		CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
	elseif SelectBoss == "Darkbeard" then
		MsBoss = "Darkbeard"
		NameBoss = "Darkbeard"
		CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
	elseif SelectBoss == "Order" then
		MsBoss = "Order"
		NameBoss = "Order"
		CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
	elseif SelectBoss == "Awakened Ice Admiral" then
		MsBoss = "Awakened Ice Admiral"
		NameBoss = "Awakened Ice Admiral"
		NameQuestBoss = "FrostQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
		CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
	elseif SelectBoss == "Tide Keeper" then
		MsBoss = "Tide Keeper"
		NameBoss = "Tide Keeper"
		NameQuestBoss = "ForgottenQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
		CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
		-- Third World
	elseif SelectBoss == "Stone" then
		MsBoss = "Stone"
		NameBoss = "Stone"
		NameQuestBoss = "PiratePortQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-290, 44, 5577)
		CFrameBoss = CFrame.new(-1085, 40, 6779)
	elseif SelectBoss == "Island Empress" then
		MsBoss = "Island Empress"
		NameBoss = "Island Empress"
		NameQuestBoss = "AmazonQuest2"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5443, 602, 752)
		CFrameBoss = CFrame.new(5659, 602, 244)
	elseif SelectBoss == "Kilo Admiral" then
		MsBoss = "Kilo Admiral"
		NameBoss = "Kilo Admiral"
		NameQuestBoss = "MarineTreeIsland"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(2178, 29, -6737)
		CFrameBoss =CFrame.new(2846, 433, -7100)
	elseif SelectBoss == "Captain Elephant" then
		MsBoss = "Captain Elephant"
		NameBoss = "Captain Elephant"
		NameQuestBoss = "DeepForestIsland"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-13232, 333, -7631)
		CFrameBoss = CFrame.new(-13221, 325, -8405)
	elseif SelectBoss == "Beautiful Pirate" then
		MsBoss = "Beautiful Pirate"
		NameBoss = "Beautiful Pirate"
		NameQuestBoss = "DeepForestIsland2"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-12686, 391, -9902)
		CFrameBoss = CFrame.new(5182, 23, -20)
	elseif SelectBoss == "Cake Queen" then
		MsBoss = "Cake Queen"
		NameBoss = "Cake Queen"
		NameQuestBoss = "IceCreamIslandQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-716, 382, -11010)
		CFrameBoss = CFrame.new(-821, 66, -10965)
	elseif SelectBoss == "rip_indra True Form" then
		MsBoss = "rip_indra True Form"
		NameBoss = "rip_indra True Form"
		CFrameBoss = CFrame.new(-5359, 424, -2735)
	elseif SelectBoss == "Longma" then
		MsBoss = "Longma"
		NameBoss = "Longma"
		CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
	elseif SelectBoss == "Soul Reaper" then
		MsBoss = "Soul Reaper"
		NameBoss = "Soul Reaper"
		CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
	end
end

-- [ Esp ]

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if _G.ESPPlayer then
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
                        name.TextColor3 = Color3.fromRGB(255, 105, 180)
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = ('[ Player: '..v.Name..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3)..'m ]')
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandESP then 
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
        end)
    end
end

function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if _G.ChestESP then
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
		end)
	end
end

function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if _G.DevilFruitESP then
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
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end

function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if _G.FlowerESP then 
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
		end)
	end
end

-- [ Equip Weapon ]

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

-- [ Tween ]

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

local plrs = game.Players
local lp = plrs.LocalPlayer
local Workspace = game:GetService("Workspace")
NpcList = {}
for i, v in pairs(Workspace.NPCs:GetChildren()) do 
    if string.find(string.lower(v.Name), "home point") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end
for i, v in pairs(getnilinstances()) do 
    if string.find(string.lower(v.Name), "home point") then
        table.insert(NpcList, v:GetModelCFrame())
    end
end
local w = game.PlaceId
if w == 2753915549 then
    World1 = true
    gQ = {
        Vector3.new(-7894.6201171875, 5545.49169921875, -380.246346191406),
        Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
        Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
        Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
    }
elseif w == 4442272183 then
    World2 = true
    gQ = {
        Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
        Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
        Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
    }
elseif w == 7449423635 then
    World3 = true
    gQ = {
        Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
        Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
        Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
        Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
        Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
    }
end
function GetPortal(check2)
    local check3 = check2.Position
    local aM, aN = Vector3.new(0,0,0), math.huge
    for _, aL in pairs(gQ) do
        if (aL-check3).Magnitude < aN and aM ~= aL then
            aM, aN = aL, (aL-check3).Magnitude
        end
    end
    return aM
end 
function BypassTeleport(is)
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = CFrame.new(lp.Character.PartTele.CFrame.X, lp.Character.PartTele.CFrame.Y, lp.Character.PartTele.CFrame.Z)
        wait(0.5)
        lp.Character.PartTele.CFrame = is
        wait(0.1)
        lp.Character.PrimaryPart.CFrame = is   
        lp.Character:WaitForChild("Humanoid"):ChangeState(15)
        wait(0.5)
        repeat task.wait() until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health <= 0
        repeat task.wait()
            if lp.Character:FindFirstChild("PartTele") then
                lp.Character.PartTele.CFrame = is  
            end
            if lp.Character:FindFirstChild("PrimaryPart") then
                lp.Character.PrimaryPart.CFrame = is  
            end
        until lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health > 0
    end
end
function GetBypassPos(pos)
    pos = Vector3.new(pos.X, pos.Y, pos.Z)
    local lll, mmm = nil, math.huge
    for i, v in pairs(NpcList) do
        if (v.p - pos).Magnitude < mmm then
            lll = v
            mmm = (v.p - pos).Magnitude
        end
    end
    return lll
end
function RequestEntrance(check1)
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({"requestEntrance", check1}))
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele.CFrame = WaitHRP(lp).CFrame 
    end
    wait(0.01)
end
function WaitHRP(q0) 
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9) 
end 
function CalcDistance(I, II) 
    if not II then 
        II = lp.Character.PrimaryPart.CFrame 
    end 
    return (Vector3.new(I.X, 0, I.Z)-Vector3.new(II.X, 0, II.Z)).Magnitude 
end

isTeleporting = false
function topos(Pos)
    if lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.Health > 0 and lp.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (Pos.Position - lp.Character.HumanoidRootPart.Position).Magnitude
        if not Pos then 
            return 
        end
        if not lp.Character:FindFirstChild("PartTele") then
            local PartTele = Instance.new("Part", lp.Character)
            PartTele.Size = Vector3.new(0,0,0)
            PartTele.Name = "PartTele"
            PartTele.Anchored = true
            PartTele.Transparency = 1
            PartTele.CanCollide = false
            PartTele.CFrame = WaitHRP(lp).CFrame 
            PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                if not isTeleporting then return end
                task.wait()
                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    WaitHRP(lp).CFrame = PartTele.CFrame
                end
            end)
        end
        Portal = GetPortal(Pos) 
        Spawn = GetBypassPos(Pos) 
        MyCFrame = WaitHRP(lp).CFrame
        Distance = CalcDistance(MyCFrame, Pos)
        if CalcDistance(Portal, Pos) < CalcDistance(Pos) and CalcDistance(Portal) > 500 then
            return RequestEntrance(Portal)
        end
        if _G.BypassTele == true then
            if CalcDistance(Pos) - CalcDistance(Spawn, Pos) > 1000 and CalcDistance(Spawn) > 1000 then
                return BypassTeleport(Spawn)
            end
        end
        if lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid:FindFirstChild("Sit") and lp.Character.Humanoid.Sit == true then
            lp.Character.Humanoid.Sit = false
        end
        isTeleporting = true
        _G.NoClip = true
        Tween = game:GetService("TweenService"):Create(lp.Character.PartTele, TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Pos})
        Tween:Play()
        Tween.Completed:Connect(function(status)
            if status == Enum.PlaybackState.Completed then
                if lp.Character:FindFirstChild("PartTele") then
                    lp.Character.PartTele:Destroy()
                end
                isTeleporting = false
            end
        end)
    end
end

function stopTeleport()
    isTeleporting = false
    if lp.Character:FindFirstChild("PartTele") then
        lp.Character.PartTele:Destroy()
    end
end

spawn(function()
    while task.wait() do
        if not isTeleporting then
            stopTeleport()
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if lp.Character:FindFirstChild("PartTele") then
                if (lp.Character.HumanoidRootPart.Position - lp.Character.PartTele.Position).Magnitude >= 100 then
                    stopTeleport()
                end
            end
        end)
    end
end)

function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        stopTeleport()
    end)
end

lp.CharacterAdded:Connect(onCharacterAdded)

if lp.Character then
    onCharacterAdded(lp.Character)
end

function StopTween(target)
    if not target then
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.NoClip = false
        _G.NoClip = false
    end
end

-- [ Pos Farm ]

Type = 1
spawn(function()
    while wait() do
        Type = 1
        wait(0.5)
        Type = 2
        wait(0.5)
        Type = 3
        wait(0.5)
        Type = 4
        wait(0.5)
    end
end)

spawn(function()
    while task.wait() do
        if Type == 1 then
            Pos = CFrame.new(0,30,-20)
            PosSea = CFrame.new(0,400,-60)
            PosCaMap = CFrame.new(0,60,-30)
        elseif Type == 2 then
            Pos = CFrame.new(20,30,0)
            PosSea = CFrame.new(60,400,0)
            PosCaMap = CFrame.new(30,60,0)
        elseif Type == 3 then
            Pos = CFrame.new(0,30,20)
            PosSea = CFrame.new(0,400,60)
            PosCaMap = CFrame.new(0,60,30)	
        elseif Type == 4 then
            Pos = CFrame.new(-20,30,0)
            PosSea = CFrame.new(-60,400,0)
            PosCaMap = CFrame.new(-30,60,0)
        end
    end
end)

-- [ No Clip Farm ]

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if _G.NoClip then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    local NoClip = Instance.new("BodyVelocity")
                    NoClip.Name = "BodyVelocity"
                    NoClip.P = 9000
                    NoClip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    NoClip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                end
                game:GetService("RunService").RenderStepped:Connect(function()
                    local player = game:GetService("Players").LocalPlayer
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    local bodyVelocity = player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                    if humanoid and bodyVelocity then
                        bodyVelocity.Velocity = humanoid.MoveDirection * 60
                    end
                end)
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
            end
        end)
    end)
end)

-- [ Check Status ]

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

spawn(function()
    while wait() do
        if sethiddenproperty then
            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",100)
        end
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0 * 0 / 0
        end
    end
end)

function CheckMob(MobName)
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if v.Name == MobName then
            return v
        end
    end
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if v.Name == MobName then
            return v
        end
    end
end

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

function CheckCakeSpawn()
    if World3 then
        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
            return "Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."/500 Mobs"
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
            return "Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."/500 Mobs"
        elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
            return "Defeat: "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).."/500 Mobs"
        elseif CheckMob("Cake Prince") then
            return "Cake Prince Spawned :)"
        elseif CheckMob("Dough King") then
            return "Dough King Spawned :)"
        end
    elseif World1 or World2 then
        return "Only Third Sea ( Sea 3 )"
    end
end

function CheckElite()
    if CheckMob("Diablo") then
        return "Elite Diablo Spawned :)"
    elseif CheckMob("Deandre") then
        return "Elite Deandre Spawned :)"
    elseif CheckMob("Urban") then
        return "Elite Urban Spawned :)"
    else
        return "Elite Not Spawned :("
    end
end

function CheckSword()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
        return "Sword Name: Shisui"
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2") then
        return "Sword Name: Wando"
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3") then
        return "Sword Name: Saddi"
    else
        return "Not Found Legendary Sword Dealer :("
    end
end

function CheckHaki()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") then
        return "Haki Colors: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")
    else
        return "Not Found Haki Dealer :("
    end
end

function CheckMirage()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        return "Mirage Island Spawned :)"
    else
        return "Mirage Island Not Spawned :("
    end
end

function CheckKitsune()
    if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
        return "Kitsune Island Spawned :)"
    else
        return "Kitsune Island Not Spawned :("
    end
end

function CheckFrozen()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
        return "Island Frozen Dimension Spawned :)"
    else
        return "Island Frozen Dimension Not Spawned :("
    end
end

function CDarkness()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
        return "Fist Of Darkness: Yes"
    else
        return "Fist Of Darkness: No"
    end
end
function CheckRauDen()
    if CheckMob("Darkbeard") then
        return "Darkbeard Spawned :)"
    else
        return "Darkbeard Not Spawned :("
    end
end

function GodChalice()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
        return "God's Chalice: Yes"
    else
        return "God's Chalice: No"
    end
end
function CheckTrumAd()
    if CheckMob("rip_indra True Form") then
        return "Rip_Indra Spawned :)"
    else
        return "Rip_Indra Not Spawned :("
    end
end

-- [ Aimbot Farm ]

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkill or UseGunSkill or SeaSkill then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    for _, Notif in pairs(v:GetChildren()) do
                        if string.find(Notif.Text,"Skill Locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)

local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot or Skillaimbotpl then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)

setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
    local args = {...}
    if getnamecallmethod() == "InvokeServer" then 
        if tostring(args[2]) == "TAP" then
            if Skillaimbot or Skillaimbotpl then
                args[3] = AimBotSkillPosition
                return old(unpack(args))
            end
        end
    end
    return old(...)
end)

-- [ Effect ]

if game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit') then
    game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit'):Destroy()
end
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
spawn(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA('Texture') then
            v.Texture = ''
        elseif v:IsA('BasePart') and v.Material == Enum.Material.Water then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
    for _, v in pairs(r33_33arg.LocalPlayer.PlayerScripts:GetDescendants()) do
        local v641_args = {'WaterBlur', 'WaterEffect', 'WaterColorCorrection', 'WaterCFrame', 'MirageFog'}
        if table.find(v641_args, v.Name) then
            v:Destroy()
        end
    end
end)

-- [ Super Fast Attack ]

NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync
RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
	if not NoAttackAnimation then
		return oldRL(a,b,c,60,func)
	end

	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	a:Play(0.01,0.01,0.01)
	pcall(func,Hits)
end

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FastAttackDelay = 0.01
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FastAttackDelay or 0.01) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		task.delay((FastAttackDelay or 0.01) + ((FireL+0.3/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end)

AttackFunction = LPH_JIT_MAX(function(typef)
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		local bladehit = {}
		if typef == 1 then
			bladehit = getAllBladeHits(60)
		elseif typef == 2 then
			bladehit = getAllBladeHitsPlayers(65)
		else
			for i2,v2 in pairs(getAllBladeHits(55)) do
				table.insert(bladehit,v2)
			end
			for i3,v3 in pairs(getAllBladeHitsPlayers(55)) do
				table.insert(bladehit,v3)
			end
		end
		if #bladehit > 0 then
			pcall(task.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.1 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(task.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[3]
			local AMI2 = ac.anims.basic[2]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(0.01,0.01,0.01)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 3 or 2,"")
			task.delay(0.01,function()
				StartP:Stop()
			end)
		end
	end
end)

function CheckStun()
	if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
		return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
	end
	return false
end

LPH_JIT_MAX(function()
	spawn(function()
		while game:GetService("RunService").Stepped:Wait() do
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped and not CheckStun() then
				if NeedAttacking and Fast_Attack then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,1)
					end)
				elseif DamageAura then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,3)
					end)
				elseif UsefastattackPlayers and Fast_Attack then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,2)
					end)
				elseif NeedAttacking and Fast_Attack == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(task.spawn,ac.attack,ac)
				end
			end
		end
	end)
end)()
    
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
    
inmyselfss = LPH_JIT_MAX(function(name)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name) then
		return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name)
	end
	local OutValue
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
		if v:IsA("Tool") then
			if v.Name == name then
				OutValue = v
				break
			end
		end
	end
	return OutValue or game:GetService("Players").LocalPlayer.Character:FindFirstChild(name)
end)

task.spawn(function() 
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name =='DamageCounter' then 
                v.Enabled  = false 
            end
        end)
        hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC,function() end)
        task.spawn(function()
            local NGU,NGUVL
            repeat 
                NGU,NGUVL = pcall(function()
                    for i,v in pairs(getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data) do  
                        if typeof(v) == 'function' then 
                            hookfunction(v,function() end )
                        end
                    end
                end)
                task.wait(1.5)
            until NGU 
        end) 
        abc = true
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
            if abc then
                pcall(function()
                    c.wrapAttackAnimationAsync = function(d, e, f, g, h)
                        local i = c.getBladeHits(e, f, g)
                        if i then
                            b.play = function()
                            end
                            d:Play(0.1, 0.1, 0.1)
                            h(i)
                            b.play = shared.cpc
                            wait(.5)
                            d:Stop()
                        end
                    end
                end)
            end
        end)
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
local Window =OrionLib:MakeWindow({Name = ":)", IntroEnabled = true, IntroText = "Tinh Linh Hub Script", IntroIcon = "rbxassetid://16730867128", HidePremium = false, SaveConfig = true, ConfigFolder = "TinhLinhHub"})

OrionLib:MakeNotification({
    Name = "Tinh Linh Hub",
    Content = "Loading Script Tinh Linh Hub...",
    Image = "rbxassetid://16730867128",
    Time = 5
})

-- [ Create Tab ]

local Setting = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Hold = Window:MakeTab({Name = "Hold Skill", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Farm = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FruitRaid = Window:MakeTab({Name = "Fruit & Raid", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Other = Window:MakeTab({Name = "Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ItemQuest = Window:MakeTab({Name = "Item & Quest", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Player = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PvP = Window:MakeTab({Name = "PvP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Sea = Window:MakeTab({Name = "Sea Event", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Race = Window:MakeTab({Name = "Upgrade Race", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local StatsEsp = Window:MakeTab({Name = "Stats & Esp", Icon = "rbxassetid://4483345998",PremiumOnly = false})
local Teleport = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local StatusServer = Window:MakeTab({Name = "Status & Server", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Shop = Window:MakeTab({Name = "Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- [ Tab Settings]

local Section = Setting:AddSection({
    Name = "~ Setting Farm ~"
})

Setting:AddDropdown({
	Name = "Select Weapon",
	Default = "Melee",
	Options = {"Melee","Sword","Gun","Blox Fruit"},
	Callback = function(Value)
		_G.SelectWeapons = Value
	end
})

spawn(function()
	while wait() do
		if _G.SelectWeapons == _G.SelectWeapons then
			for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == _G.SelectWeapons then
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
	Default = "Fast [ 0.1s ]",
	Options = {"No Delay [ 0.0s ]","Super Fast [ 0.05s ]","Fast [ 0.1s ]","Moderate [ 0.3s ]","Default [ 0.5s ]","Medium [ 0.8s ]","Slow [ 1.0s ]"},
	Callback = function(Value)
		_G.SelectAttackDelay = Value
        if _G.SelectAttackDelay == "No Delay [ 0.0s ]" then
            FastAttackDelay = 0
        elseif _G.SelectAttackDelay == "Super Fast [ 0.05s ]" then
            FastAttackDelay = 0.05
        elseif _G.SelectAttackDelay == "Fast [ 0.1s ]" then
            FastAttackDelay = 0.1
        elseif _G.SelectAttackDelay == "Moderate [ 0.3s ]" then
            FastAttackDelay = 0.3
        elseif _G.SelectAttackDelay == "Default [ 0.5s ]" then
            FastAttackDelay = 0.5
        elseif _G.SelectAttackDelay == "Medium [ 0.8s ]" then
            FastAttackDelay = 0.8
        elseif _G.SelectAttackDelay == "Slow [ 1.0s ]" then
            FastAttackDelay = 1
        end
	end
})

Setting:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
		Fast_Attack =Value
		DamageAura =Value
		ClickNoCooldown = Value
		DmgAttack.Enabled = not Value
	end
})

Setting:AddToggle({
	Name = "Auto Click [ 75% Kick System ]",
	Default = false,
	Callback = function(Value)
		_G.AutoClick = Value
	end
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
        end
    end)
end)

Setting:AddDropdown({
	Name = "Select Range Collect Mob",
	Default = "Slightly Far [ 300m ]",
	Options = {"Really Far [ 350m ]","Distant [ 325m ]","Slightly Far [ 300m ]","Near The [ 275m ]","Very Close [ 250m ]"},
	Callback = function(Value)
		_G.SelectRange = Value
        if _G.SelectRange == "Really Far [ 350m ]" then
            BringRange = 350
        elseif _G.SelectRange == "Distant [ 325m ]" then
            BringRange = 325
        elseif _G.SelectRange == "Slightly Far [ 300m ]" then
            BringRange = 300
        elseif _G.SelectRange == "Near The [ 275m ]" then
            BringRange = 275
        elseif _G.SelectRange == "Very Close [ 250m ]" then
            BringRange = 250
        end
	end
})

Setting:AddToggle({
	Name = "Bring Mobs",
	Default = true,
	Callback = function(Value)
		_G.BringMonster = Value
	end
})

spawn(function()
    while wait() do
        if _G.BringMonster then
            pcall(function()
                CheckQuest()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoSwordMastery then
                        if StartMagnet and v.Name == Mon and (v.HumanoidRootPart.Position - PosFarm.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosFarm
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if MagnetNear then
                        if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - PosNear.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosNear
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                        if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = MusketeerHatMon
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.Auto_EvoRace and StartEvoMagnet then
                        if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonEvo
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoMaterial and BringMonMaterial then
                        if (v.Name == MMon or v.Name == MMon1) and (v.HumanoidRootPart.Position - MaterialPos.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = MaterialPos
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoFarmMob and SelectMag then
                        if v.Name == SelectMob and (v.HumanoidRootPart.Position - PosMonFarm.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonFarm
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.AutoBartilo and AutoBartiloBring then
                        if v.Name == "Swan Pirate" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonBarto
                            v.Humanoid:ChangeState(14)
                        end
                    end
                    if _G.FarmSkip and StartBring then
                        if v.Name == "Shanda" and (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                        end
                    end
                end
            end)
        end
    end
end)

local Section = Setting:AddSection({
    Name = "~ Tween ~"
})

Setting:AddSlider({
	Name = "Tween Speed",
	Min = 1,
	Max = 400,
	Default = 350,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		_G.TweenSpeed = Value
	end
})

Setting:AddToggle({
	Name = "Bypass Teleport",
	Default = true,
	Callback = function(Value)
		_G.BypassTele = Value
	end
})

Setting:AddDropdown({
	Name = "Select Item",
	Default = "Fist Of Darkness Or God's Chalice & Devil Fruit",
	Options = {"Devil Fruit","Fist Of Darkness Or God's Chalice","Fist Of Darkness Or God's Chalice & Devil Fruit"},
	Callback = function(Value)
		_G.SelectItem = Value
	end
})

Setting:AddToggle({
	Name = "Don't Bypass Teleport If Have Item In Inventory ( Test )",
	Default = true,
	Callback = function(Value)
		_G.DontBypass = Value
	end
})

function CheckTraiAcQuy()
    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
    for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
end

spawn(function()
    while task.wait() do
        if _G.DontBypass then
            pcall(function()
                if _G.SelectItem == "Devil Fruit" and CheckTraiAcQuy() then
                    _G.BypassTele = false
                elseif _G.SelectItem == "Fist Of Darkness Or God's Chalice" and game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                    _G.BypassTele = false
                elseif _G.SelectItem == "Fist Of Darkness Or God's Chalice & Devil Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit") and CheckTraiAcQuy() then
                    _G.BypassTele = false
                end
            end)
        end
    end
end)

Setting:AddButton({
	Name = "Reset Character",
	Callback = function()
    	game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
	end    
})

local Section = Setting:AddSection({
    Name = "~ Graphic & Reduce Lag ~"
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

Setting:AddSlider({
	Name = "Select Brightnes",
	Min = 1,
	Max = 100,
	Default = 20,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.BrightValue = Value
	end
})

Setting:AddButton({
    Name = "Set Brightnes",
    Callback = function()
        game:GetService("Lighting").Brightness = _G.BrightValue
    end
})

local Section = Setting:AddSection({
    Name = "~ Other ~"
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

-- [ Hold Skill ]

local Paragraph = Hold:AddParagraph("For Example", "If You Want To Wait 3 Seconds Before Using Skill Z Again, Set The Value To 3.")

local Section = Hold:AddSection({
    Name = "~ Hold Skill Farm Mastery ~"
})

Hold:AddLabel("• Hold Skill Devil Fruit •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillX = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill C",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillC = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill V",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillV = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill F",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillF = Value
	end
})

Hold:AddLabel("• Hold Skill Gun •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillGZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillGX = Value
	end
})

local Section = Hold:AddSection({
    Name = "~ Hold Skill Sea Event ~"
})

Hold:AddLabel("• Hold Skill Devil Fruit •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillFruitZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillFruitX = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill C",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillFruitC = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill V",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillFruitV = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill F",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillFruitF = Value
	end
})

Hold:AddLabel("• Hold Skill Melee •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillMeleeZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillMeleeX = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill C",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillMeleeC = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill V",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillMeleeV = Value
	end
})

Hold:AddLabel("• Hold Skill Sword •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillSwordZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillSwordX = Value
	end
})

Hold:AddLabel("• Hold Skill Gun •")

Hold:AddTextbox({
	Name = "Hold Skill Z",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillGunZ = Value
	end
})

Hold:AddTextbox({
	Name = "Hold Skill X",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		_G.HoldSKillGunX = Value
	end
})

-- [ Tab Farm ]

local Section = Farm:AddSection({
    Name = "~ Level ~"
})

local YourLevel = Farm:AddParagraph("Your Level")

Farm:AddDropdown({
	Name = "Select Farm Level Mode",
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
            pcall(function()
                CheckQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == Mon then
                                repeat wait()
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
                    topos(CFrameMon)
                    UnEquipWeapon(_G.SelectWeapon)
                    StartMagnet = false
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if LevelFMode == "Get Quest" and _G.AutoFarm then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    StartMagnet = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMagnet = false
                    CheckQuest()
	    			topos(CFrameQuest)
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
                                        repeat wait()
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
                    end
                end
            end)
        end
    end
end)

Farm:AddToggle({
	Name = "Farm Fast [ Lv. 1 -> Lv. 250 ]",
	Default = false,
	Callback = function(Value)
		_G.FarmSkip = Value
		if _G.FarmSkip == true then
	    	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("TantaiGaming")
    	end
        StopTween(_G.FarmSkip)
	end
})

spawn(function()
    while wait() do
        if _G.FarmSkip then
            pcall(function()
                LvCount = game:GetService("Players").LocalPlayer.Data.Level.Value
                if LvCount >= 1 and LvCount < 60 then
                    local cframefarm = CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                    topos(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shanda") then     
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shanda" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
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
                            PlayerKill = string.split(QuestTitle," ")[2]
                            for i,v in pairs(Players) do
                                if v.Name == PlayerKill and v.Character.Humanoid.Health > 0 then
                                    repeat wait()
                                        if v.Data.Level.Value < 20 or v.Data.Level.Value > mylevel * 5 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
                                        end
                                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                       UsefastattackPlayers = true
                                        if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                            Skillaimbot = true
                                            AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
                                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                            wait()
                                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                        end
                                    until not _G.FarmSkip or not v:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0
                                    Skillaimbot = false
                                    UsefastattackPlayers = false
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

Farm:AddToggle({
	Name = "Auto Farm Nearest",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmNearest = Value
        StopTween(_G.AutoFarmNearest)
	end
})

spawn(function()
	while wait() do
		if _G.AutoFarmNearest then
		    pcall(function()
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
         	       if v.Name and v:FindFirstChild("Humanoid") then
				        if v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			 	           repeat wait()
			     	           EquipWeapon(_G.SelectWeapon)
			  	              topos(v.HumanoidRootPart.CFrame * Pos)
			 	               PosNear = v.HumanoidRootPart.CFrame
					        	MagnetNear = true
				            until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0 
				            MagnetNear = false
				        end
				    end
				end
			end)
		end
	end
end)

local Section = Farm:AddSection({
    Name = "~ Katakuri ~"
})

local StatusCakePrince = Farm:AddParagraph("Cake Prince")

Farm:AddDropdown({
	Name = "Select Farm Katakuri Mode",
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
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41)) - 500)
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),40,41)) - 500)
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),41,41)) - 500)
            end
        end)
    end
end)

local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
spawn(function()
    while wait() do
        if CakeFMode == "No Quest" and _G.AutoDoughtBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" or v.Name == "Dough King" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * Pos)
                    else
                        if KillMob == 0 then
                        end
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                PosNear = v.HumanoidRootPart.CFrame
                                                MagnetNear = true
                                            until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                        end
                                    end
                                end
                            else
                                topos(CakePos)
                                MagnetNear = false
                                UnEquipWeapon(_G.SelectWeapon)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
spawn(function()
    while wait() do
        if CakeFMode == "Get Quest" and _G.AutoDoughtBoss and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" or v.Name == "Dough King" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end) 
spawn(function()
    while wait() do
        if CakeFMode == "Get Quest" and _G.AutoDoughtBoss and World3 then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, "Cookie Crafter") then
                    MagnetNear = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    MagnetNear = false
                    topos(CakeQuestPos)
                    if (CakeQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then                            
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CakeQuest1",1)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
                                        repeat wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosNear = v.HumanoidRootPart.CFrame
                                            MagnetNear = true
                                        until not _G.AutoDoughtBoss or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                    else
                                        MagnetNear = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    else
                        topos(CakePos)
                        MagnetNear = false
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            end)
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

local Section = Farm:AddSection({
    Name = "~ Bone ~"
})

local YourBone = Farm:AddParagraph("Your Bone")

Farm:AddDropdown({
	Name = "Select Farm Bone Mode",
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
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                           if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                               repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    PosNear = v.HumanoidRootPart.CFrame
                                    MagnetNear = true
                                until not _G.Auto_Bone or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(BonePos)
                    UnEquipWeapon(_G.SelectWeapon)
                    MagnetNear = false
                end
            end)
        end
    end
end)

local BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
spawn(function()
    while wait() do
        if BoneFMode == "Get Quest" and _G.Auto_Bone and World3  then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, "Demonic Soul") then
                    MagnetNear = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    MagnetNear = false
                    topos(BoneQuestPos)
                    if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then    
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","HauntedQuest2",1)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                        repeat wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosNear = v.HumanoidRootPart.CFrame
                                            MagnetNear = true
                                        until not _G.Auto_Bone or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        MagnetNear = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    else
                        topos(BonePos)
                        UnEquipWeapon(_G.SelectWeapon)
                        MagnetNear = false
                    end
                end
            end)
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
            elseif game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                if game.Workspace.Enemies:FindFirstChild ("Soul Reaper") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Soul Reaper"  then
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                     topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.Auto_Soul_Reaper or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            else
                topos(BonePos)
                UnEquipWeapon(_G.SelectWeapon)
                local args = { [1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1 }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

local Section = Farm:AddSection({
    Name = "~ Gun & Devil Fruit Mastery ~"
})

Farm:AddToggle({
	Name = "Auto Farm Devil Fruit Mastery",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmFruitMastery = Value
		StopTween(_G.AutoFarmFruitMastery)
	end
})

spawn(function()
    while wait() do
        if _G.AutoFarmFruitMastery then
            pcall(function()
                CheckQuest()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    repeat wait()
                        topos(CFrameQuest)
                    until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmFruitMastery
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                        repeat wait()
                                            if v.Humanoid.Health <= HealthMs then
                                                EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                UseSkill = true
                                                Skillaimbot = true
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            else           
                                                UseSkill = false 
                                                Skillaimbot = false
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                            end
                                            AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
                                            MonFarm = v.Name
                                            PosFarm = v.HumanoidRootPart.CFrame
                                            StartMagnet = true
                                        until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMagnet = false
                                        UseSkill = false
                                        Skillaimbot = false
                                    end
                                end
                            end
                        end
                    else
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            end)
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

function EquipWeaponGun()
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == "Gun" and v:IsA('Tool') then
			local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
		end
	end
end

spawn(function()
    while wait() do
        if _G.AutoFarmGunMastery then
            pcall(function()
                CheckQuest()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    topos(CFrameQuest)
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        pcall(function()
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        repeat wait()
                                            HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                            ShootPosition = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                            if v.Humanoid.Health <= HealthMin then
                                                EquipWeaponGun()
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer("TAP", Vector3.new(ShootPosition.Position))
                                                UseGunSkill = true
                                                Skillaimbot = true
                                            else
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                UseGunSkill = false
                                                Skillaimbot = false
                                            end
                                            AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
                                            StartMagnet = true 
                                            PosFarm = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                        until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        UseGunSkill = false
                                        Skillaimbot = false
                                        StartMagnet = false
                                    end
                                end
                            end
                        end)
                    else
                       topos(CFrameMon)
                       UnEquipWeapon(_G.SelectWeapon)
                    end 
                end
            end)
        end
    end
end)

Farm:AddSlider({
	Name = "Kill Mobs At % Health",
	Min = 1,
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

Farm:AddToggle({
	Name = "Use Skill F",
	Default = false,
	Callback = function(Value)
		_G.SkillF = Value
	end
})

spawn(function()
    while wait() do
        if UseSkill then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                    if _G.SkillZ then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                        wait(_G.HoldSKillZ)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                    end
                    if _G.SkillX then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                        wait(_G.HoldSKillX)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                    end
                    if _G.SkillC then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                        wait(_G.HoldSKillC)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                    end
                    if _G.SkillV then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                        wait(_G.HoldSKillV)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                    end
                    if _G.SkillF then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                        wait(_G.HoldSKillF)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
                    end
                end
            end
        end
    end
end)


spawn(function()
    while wait() do
        if UseGunSkill then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                    if _G.SkillZ then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                        wait(_G.HoldSKillGZ)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                    end
                    if _G.SkillX then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                        wait(_G.HoldSKillGX)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                    end
                end
            end
        end
    end
end)

local Section = Farm:AddSection({
    Name = "~ Melee & Sword Mastery ~"
})

local Paragraph = Farm:AddParagraph("Note", "Up Stats In Melee If You Farm Mastery Melee, Farm Mastery Sword Also Do The Same.")

Farm:AddSlider({
	Name = "Select Mastery ",
	Min = 1,
	Max = 600,
	Default = 300,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Mastery",
	Callback = function(Value)
		_G.SeMastery = Value
	end
})

function CheckMasSelect(Weapon)
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v.ToolTip == Weapon then
            return v.Level.Value
        end
    end
end

spawn(function()
    while wait() do
        if _G.FarmAllMelee then
            if CheckMasSelect("Melee") == _G.SeMastery then
                for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
                    if type(v) == "table" then
                        if v.Type == "Melee" and v.Mastery >= _G.SeMastery then
                            if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(v.Name)) then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",v.Name)
                            end
                        end
                    end
                end
            end
        elseif _G.FarmAllSword then
            if CheckMasSelect("Sword") == _G.SeMastery then
                for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
                    if type(v) == "table" then
                        if v.Type == "Sword" and v.Mastery >= _G.SeMastery then
                            if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(v.Name)) then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",v.Name)
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
	    if _G.FarmAllMelee then
    		for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	    		if v.ToolTip == "Melee" then
	    			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
					    SelectAllMelee = v.Name
	    			end
	    		end
    		end
    	elseif _G.FarmAllSword then
    		for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	    		if v.ToolTip == "Sword" then
	    			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
		    			SelectAllSword = v.Name
		            end
				end
			end
		end
	end
end)

Farm:AddToggle({
	Name = "Auto Farm All Melee Mastery",
	Default = false,
	Callback = function(Value)
		_G.FarmAllMelee = Value
	end
})

spawn(function()
    while wait() do
        if _G.FarmAllMelee then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    StartMagnet = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMagnet = false
                    CheckQuest()
	    			topos(CFrameQuest)
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
                                        repeat wait()
                                            EquipWeapon(SelectAllMelee)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosFarm = v.HumanoidRootPart.CFrame
                                            StartMagnet = true
                                        until not _G.FarmAllMelee or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
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
                    end
                end
            end)
        end
    end
end)

Farm:AddToggle({
	Name = "Auto Farm All Sword Mastery",
	Default = false,
	Callback = function(Value)
		_G.FarmAllSword = Value
	end
})

spawn(function()
    while wait() do
        if _G.FarmAllSword then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    StartMagnet = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMagnet = false
                    CheckQuest()
	    			topos(CFrameQuest)
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
                                        repeat wait()
                                            EquipWeapon(SelectAllSword)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            PosFarm = v.HumanoidRootPart.CFrame
                                            StartMagnet = true
                                        until not _G.FarmAllSword or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
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
                    end
                end
            end)
        end
    end
end)

local Section = Farm:AddSection({
    Name = "~ Boss ~"
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
	Name = "Select Farm Boss Mode",
	Default = "No Quest",
	Options = {"No Quest","Get Quest"},
	Callback = function(Value)
		ModeBoss = Value
	end
})

local BossName = Farm:AddDropdown({
	Name = "Select Boss",
	Default = "",
	Options = BossCheck,
	Callback = function(Value)
		SelectBoss = Value
	end
})

Farm:AddButton({
    Name = "Refresh Boss List",
    Callback = function()
        BossName:Refresh(BossCheck,true)
        local BossCheck = {}
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                    or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                    or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain")
                    or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                table.insert(BossCheck, v.Name)
            end
        end
        BossName:Refresh(BossCheck)
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
        if ModeBoss == "No Quest" and _G.AutoFarmBoss then
            pcall(function()
                CheckBossQuest()
                if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == SelectBoss then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    topos(CFrameBoss)
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)

spawn(function()
	while wait() do
		if ModeBoss == "Get Quest" and _G.AutoFarmBoss then
			pcall(function()
				CheckBossQuest()
				if MsBoss == "Soul Reaper" or MsBoss == "Longma" or MsBoss == "Don Swan" or MsBoss == "Cursed Captain" or MsBoss == "Order" or MsBoss == "rip_indra True Form" then
					if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == MsBoss then
								repeat wait()
									EquipWeapon(_G.SelectWeapon)
									topos(v.HumanoidRootPart.CFrame * Pos)
								until _G.AutoFarmBoss == false or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					else
						topos(CFrameBoss)
					end
				else
					if ModeBoss == "Get Quest" and _G.AutoFarmBoss then
						CheckBossQuest()
						if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						end
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							repeat wait() topos(CFrameQuestBoss) until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmBoss
							if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
							end
						elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == MsBoss then
										repeat wait()
											EquipWeapon(_G.SelectWeapon)
											topos(v.HumanoidRootPart.CFrame * Pos)
										until _G.AutoFarmBoss == false or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							else
								topos(CFrameBoss)
							end
						end
					else
						if game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == MsBoss then
									repeat wait()
										EquipWeapon(_G.SelectWeapon)
										topos(v.HumanoidRootPart.CFrame * Pos)										
									until _G.AutoFarmBoss == false or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						else
							topos(CFrameBoss)
						end
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
            pcall(function()
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if (v.Name == "rip_indra" or v.Name == "Ice Admiral") or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg") or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain") or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame*Pos)
                            until v.Humanoid.Health <= 0 or _G.AutoAllBoss == false or not v.Parent
                        end
                    end
                end
            end)
        end
    end
end)

local Section = Farm:AddSection({
    Name = "~ Mobs ~"
})

if World1 then
	TableMon = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	TableMon = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	TableMon = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end

Farm:AddDropdown({
	Name = "Select Mobs",
	Default = "",
	Options = TableMon,
	Callback = function(Value)
		SelectMob = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Mobs",
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
                                repeat wait()
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
    Name = "~ Material ~"
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
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) or game:GetService("Workspace").Enemies:FindFirstChild(MMon1) then
                    for i,v in pairs (game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == MMon or v.Name == MMon1 then
                                repeat wait()
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
                    UnEquipWeapon(_G.SelectWeapon)
                    topos(MPos)
                    wait(3)
                    topos(MPos1)
                    wait(3)
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if SelectMaterial == "Ectoplasm" and _G.AutoMaterial then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" or v.Name == "Cursed Captain" then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                PosNear = v.HumanoidRootPart.CFrame
                                MagnetNear = true
                            until not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                            MagnetNear = false
                        end
                    end
                else
                    topos(CFrame.new(916.928589, 181.092773, 33422))
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "~ Devil Fruit ~"
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
    while wait() do
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
    while wait() do
        if _G.Random_Auto then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
        end 
    end
end)

local RarityFruits = {
    ["Common"] = {
        "Rocket Fruit",
        "Spin Fruit",
        "Chop Fruit",
        "Spring Fruit",
        "Bomb Fruit",
        "Smoke Fruit",
        "Spike Fruit"
    },
    ["Uncommon"] = {
        "Flame Fruit",
        "Falcon Fruit",
        "Ice Fruit",
        "Sand Fruit",
        "Diamond Fruit",
        "Dark Fruit"
    },
    ["Rare"] = {
        "Light Fruit",
        "Rubber Fruit",
        "Barrier Fruit",
        "Ghost Fruit",
        "Magma Fruit"
    },
    ["Legendary"] = {
        "Quake Fruit",
        "Budha Fruit",
        "Love Fruit",
        "Spider Fruit",
        "Sound Fruit",
        "Phoenix Fruit",
        "Portal Fruit",
        "Rumble Fruit",
        "Pain Fruit",
        "Blizzard Fruit",
    },
    ["Mythical"] = {
        "Gravity Fruit",
        "Mammoth Fruit",
        "T-Rex Fruit",
        "Dough Fruit",
        "Shadow Fruit",
        "Venom Fruit",
        "Control Fruit",
        "Spirit Fruit",
        "Dragon Fruit",
        "Leopard Fruit",
        "Kitsune Fruit",
    }
}

FruitRaid:AddDropdown({
	Name = "Store Rarity Devil Fruit",
	Default = "Common -> Mythical",
	Options = {"Common -> Mythical","Uncommon -> Mythical","Rare -> Mythical","Legendary -> Mythical","Mythical"},
	Callback = function(Value)
		_G.SetRarityFruits = Value
	end
})

function CheckFruits()
    for i, v in pairs(RarityFruits) do
        if _G.SetRarityFruits == "Common -> Mythical" then
            if i == "Common" or i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
                for _, fruit in ipairs(v) do
                    table.insert(ResultStoreFruits, fruit)
                end
            end
        elseif _G.SetRarityFruits == "Uncommon -> Mythical" then
            if i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
                for _, fruit in ipairs(v) do
                    table.insert(ResultStoreFruits, fruit)
                end
            end
        elseif _G.SetRarityFruits == "Rare -> Mythical" then
            if i == "Rare" or i == "Legendary" or i == "Mythical" then
                for _, fruit in ipairs(v) do
                    table.insert(ResultStoreFruits, fruit)
                end
            end
        elseif _G.SetRarityFruits == "Legendary -> Mythical" then
            if i == "Legendary" or i == "Mythical" then
                for _, fruit in ipairs(v) do
                    table.insert(ResultStoreFruits, fruit)
                end
            end
        elseif _G.SetRarityFruits == "Mythical" then
            if i == "Mythical" then
                for _, fruit in ipairs(v) do
                    table.insert(ResultStoreFruits, fruit)
                end
            end
        end
    end  
end

FruitRaid:AddToggle({
	Name = "Auto Store Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.AutoStoreFruit = Value
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoStoreFruit then
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        ResultStoreFruits = {}
                        CheckFruits()
                        for z, Res in pairs(ResultStoreFruits) do
                            if v.Name == Res then
                                local NameFruit = v.Name
                                local FirstNameFruit = string.gsub(v.Name, " Fruit", "")
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FirstNameFruit.."-"..FirstNameFruit,game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameFruit))
                                end
                            end
                        end
                    end
                end
                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        ResultStoreFruits = {}
                        CheckFruits()
                        for z, Res in pairs(ResultStoreFruits) do
                            if v.Name == Res then
                                local NameFruit = v.Name
                                local FirstNameFruit = string.gsub(v.Name, " Fruit", "")
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(NameFruit) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FirstNameFruit.."-"..FirstNameFruit,game:GetService("Players").LocalPlayer.Character:FindFirstChild(NameFruit))
                                end
                            end
                        end
                    end
                end
            end
        end)
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
		_G.Grabfruit = Value
	end
})

spawn(function()
    while wait(1) do
        if _G.Grabfruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "~ Raid ~"
})

SelectChip = selectraids or ""
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
		SelectChip = Value
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
    while wait() do
		if _G.AutoBuyChip then
			local args = {
				[1] = "RaidsNpc",
				[2] = "Select",
				[3] = SelectChip
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

FruitRaid:AddToggle({
	Name = "Auto Get Devil Fruit [ Under 1M Beli ] ( Test )",
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
    while wait() do
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
                    repeat wait()
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

RaidPos = CFrame.new(0,70,0)
spawn(function()
    while wait() do
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
    while wait() do
        if _G.Auto_Awakener then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
        end
    end
end)

local Section = FruitRaid:AddSection({
    Name = "~ Law Raid ~"
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
    while wait() do
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
    while wait() do
        if _G.AutoOderSword then
            if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Order" then
                            repeat wait()
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
    Name = "~ Game Event ~"
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
                    if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") and a.Humanoid.Health > 0 and (a.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                        repeat wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(a.HumanoidRootPart.CFrame * Pos)
                            PosNear = a.HumanoidRootPart.CFrame
                            MagnetNear = true
                        until not _G.RaidPirate or not a.Parent or a.Humanoid.Health <= 0
                        MagnetNear = false
                    end
                end
            else
                if (CFrame.new(-5118.48682, 314.54129, -2958.64404, -0.387232125, 1.81507858e-08, 0.921982229, -7.54388907e-08, 1, -5.13709999e-08, -0.921982229, -8.94458196e-08, -0.387232125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                    for a, a in pairs(game.ReplicatedStorage:GetChildren()) do
                        if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") and a.Humanoid.Health > 0 and (a.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
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
                        repeat wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                        until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                    end
                end
            else
                topos(CFrame.new(448.46756, 199.356781, -441.389252))
                UnEquipWeapon(_G.SelectWeapon)           
            end
        end
    end
end)

local Section = Other:AddSection({
    Name = "~ Elite Hunter ~"
})

local EliteStatus = Other:AddParagraph("Elite")

Other:AddToggle({
	Name = "Auto Kill Elite",
	Default = false,
	Callback = function(Value)
		_G.AutoElitehunter = Value
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
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
                                    repeat wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.AutoElitehunter or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * Pos)
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * Pos)
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * Pos)
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
    Name = "~ Chest ~"
})

Other:AddDropdown({
	Name = "Select Team When Farm Chest [ Bypass ]",
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
    while wait() do
        if _G.ChestBypass then
            local ohString1 = "SetTeam"
            local ohString2 = _G.TeamChest
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
        end
    end
end)

spawn(function()
    while wait() do
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
                            if _G.TeleSafe == true then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                                    _G.ChestBypass = false
                                break
                            end
                        end
                    end 
                end
            end
        end
    end
end)

Other:AddToggle({
	Name = "Auto Farm Chest [ Tween ]",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmChest = Value
		StopTween(_G.AutoFarmChest)
	end
})

_G.MagnitudeAdd = 0;
spawn(function()
	while wait() do
		if _G.AutoFarmChest then
			for y, z in pairs(game:GetService("Workspace"):GetChildren()) do
				if z.Name:find("Chest") then
					if game:GetService("Workspace"):FindFirstChild(z.Name) then
						if (z.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 + _G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(z.Name) then
									topos(z.CFrame)
									if (z.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
									    EquipWeapon(_G.SelectWeapon)
								    	UnEquipWeapon(_G.SelectWeapon)
								    end
								end
							until _G.AutoFarmChest == false or not z.Parent;
							topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd + 1500;
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
    while wait() do
        if _G.TeleSafe then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                _G.ChestBypass = false
                _G.AutoFarmChest = false
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
    Name = "~ Rip_Indra ~"
})

local CheckRip = Other:AddParagraph("Rip_Indra Status")

Other:AddToggle({
	Name = "Auto Summon Rip_Indra",
	Default = false,
	Callback = function(Value)
		_G.AutoSpawnRip = Value
		StopTween(_G.AutoSpawnRip)
	end
})

spawn(function()
    while wait() do
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
        if _G.AutoKillRipIndra and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        repeat wait()
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
    Name = "~ Darkbeard ~"
})

local CheckRauu = Other:AddParagraph("Darkbeard Status")

Other:AddToggle({
	Name = "Auto Summon Darkbeard",
	Default = false,
	Callback = function(Value)
		_G.AutoSpawnDark = Value
		StopTween(_G.AutoSpawnDark)
	end
})

spawn(function()
    while wait() do
        if _G.AutoSpawnDark then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                if GetDistance(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection).Magnitude <= 5 then
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
        if _G.AutoKillDark and World2 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Darkbeard" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        repeat wait()
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
    Name = "~ Observation Haki ~"
})

local ObservationStatus = Other:AddParagraph("Observation Level")

Other:AddToggle({
	Name = "Auto Farm Observation [ Error ]",
	Default = false,
	Callback = function(Value)
		_G.AutoObservation = Value
		StopTween(_G.AutoObservation)
	end
})

spawn(function()
    while wait() do
        if _G.AutoObservation then
            repeat wait()
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
                            repeat wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat wait()
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
                            repeat wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat wait()
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
                            repeat wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.AutoObservation == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            repeat wait()
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
    Name = "~ Legendary Sword ~"
})

local LegendSwords = ItemQuest:AddParagraph("Legendary Sword Dealer")

ItemQuest:AddToggle({
	Name = "Auto Buy Legendary Sword",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyLegendarySword = Value
	end
})

spawn(function()
    while wait() do
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

ItemQuest:AddToggle({
	Name = "Auto Buy True Triple Katana",
	Default = false,
	Callback = function(Value)
		_G.AutoTrueTriplKatana = Value
	end
})

spawn(function()
    while wait() do
        if _G.AutoTrueTriplKatana then
            game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("MysteriousMan", "2")
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "~ Haki Colors ~"
})

local ColorHaki = ItemQuest:AddParagraph("Haki Dealer")

ItemQuest:AddToggle({
	Name = "Auto Buy All Haki Colors",
	Default = false,
	Callback = function(Value)
		_G.Auto_Buy_Enchancement = Value
	end
})

ItemQuest:AddToggle({
	Name = "Auto Buy Legendary Haki Colors",
	Default = false,
	Callback = function(Value)
		_G.Auto_Buy_Haki_Legends = Value
	end
})

spawn(function()
	while wait() do
		if _G.Auto_Buy_Enchancement then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
		elseif _G.Auto_Buy_Haki_Legends then
		    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1") == "Snow White" then
		        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
		    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1") == "Winter Sky" then
		        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
		    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1") == "Pure Red" then
		        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","2")
		    end
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
    while wait() do
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CFrame = OldCFrameRainbow
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
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
    Name = "~ Cursed Dual Katana ~"
})

local Yama = ItemQuest:AddParagraph("Elite Progress")

ItemQuest:AddToggle({
	Name = "Auto Get Yama",
	Default = false,
	Callback = function(Value)
		_G.AutoYama = Value
		if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") < 30 then
		    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
		end
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
                                    repeat wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                    until not _G.AutoYama or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * Pos)
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * Pos)
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * Pos)
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
                repeat wait()
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

function CheckTool(toolnam)
    lol = {game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Backpack}
    for i, v in pairs(lol) do
        if v:FindFirstChild(toolnam) then
            return v:FindFirstChild(toolnam)
        end
    end
end

function CheckTorchTushita()
    local a
    if not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
        a = "1"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
        a = "2"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
        a = "3"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
        a = "4"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
        a = "5"
    end
    for i, v in next, game:GetService("Workspace").Map.Turtle.QuestTorches:GetChildren() do
        if v:IsA("MeshPart") and string.find(v.Name, a) and not v.Particles.Main.Enabled then
            return v
        end
    end
end

spawn(function()
    while wait() do
        if _G.AutoHolyTorch then
            if CheckMob("rip_indra True Form") then
                if CheckTool("Holy Torch") then
                    EquipWeapon("Holy Torch")
                    if CheckTorchTushita() then
                        topos(CheckTorchTushita().CFrame)
                    end
                else
                    topos(game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
                    wait(1)
                end
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autotushita or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(TushitaPos)
                UnEquipWeapon(_G.SelectWeapon)
            end
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "~ Weapon ~"
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
    while wait() do
        if _G.Auto_Saber and World1 and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                        wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
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
                            wait()
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
                                                   repeat wait()
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
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                if v.Humanoid.Health <= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                end
                            end
                        end
                    end
                else
                    topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                    UnEquipWeapon(_G.SelectWeapon)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autowaden or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(NamfonPos)
                UnEquipWeapon(_G.SelectWeapon)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autopole or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(PolePos)
                UnEquipWeapon(_G.SelectWeapon)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Autosaw or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(SharkPos)
                UnEquipWeapon(_G.SelectWeapon)
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
                        repeat wait()
                            EquipWeapon(_G.SelectWeapon)
                            topos(v.HumanoidRootPart.CFrame * Pos)
                            PosNear = v.HumanoidRootPart.CFrame
                            MagnetNear = true
                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                        MagnetNear = false
                    end
                end
            else
                StartRengokuMagnet = false
                topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                UnEquipWeapon(_G.SelectWeapon)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.Auto_Dragon_Trident or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(TridentPos)
                UnEquipWeapon(_G.SelectWeapon)
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Carvander",
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoCarvender or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(CavandisPos)
                UnEquipWeapon(_G.SelectWeapon)
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Buddy Sword",
	Default = false,
	Callback = function(Value)
		_G.AutoBudySword = Value
		StopTween(_G.AutoBudySword)
	end
})

local BigMomPos = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
spawn(function()
    while wait() do
        if  _G.AutoBudySword and World3 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Cake Queen" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(BigMomPos)
                UnEquipWeapon(_G.SelectWeapon)
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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoTwinHook or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(ElephantPos)
                UnEquipWeapon(_G.SelectWeapon)
            end
        end
    end
end)

ItemQuest:AddToggle({
	Name = "Auto Get Hallow Scythe",
	Default = false,
	Callback = function(Value)
		_G.Auto_Soul_Reaper = Value
		StopTween(_G.Auto_Soul_Reaper)
	end
})

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
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not  _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            else
                topos(EmpressPos)
                UnEquipWeapon(_G.SelectWeapon)
                if game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress") then
                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Island Empress").HumanoidRootPart.CFrame * Pos)
                end
            end
        end
    end
end)

local Section = ItemQuest:AddSection({
    Name = "~ Other ~"
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
    while wait() do
        if _G.Auto_EvoRace then
            pcall(function()
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
                                            repeat wait()
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
            end)
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
    while wait() do
        if _G.AutoMusketeerHat then
            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Forest Pirate" then
                                repeat wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        MusketeerHatMon = v.HumanoidRootPart.CFrame
                                        StartMagnetMusketeerhat = true
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
                                repeat wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CFrame = OldCFrameElephant
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
                                            repeat wait()
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
                                repeat wait()
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
    Name = "~ Player ~"
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
    Name = "~ Turn On ~"
})

Player:AddToggle({
	Name = "Auto Turn On Buso Haki",
	Default = true,
	Callback = function(Value)
		_G.AutoHaki = Value
	end
})

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

spawn(function()
    while wait() do
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

Player:AddToggle({
	Name = "Auto Turn On Race V4",
	Default = false,
	Callback = function(Value)
		_G.OnV4 = Value
	end
})

spawn(function()
    while wait() do
        if _G.OnV3 then
            game:GetService('VirtualUser'):SetKeyDown('0x74')
            game:GetService('VirtualUser'):SetKeyUp('0x74')
        elseif _G.OnV4 then
            game:GetService('VirtualUser'):SetKeyDown('0x59')
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
    while wait() do
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
    Name = "~ Haki State ~"
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
    Name = "~ Open Tab ~"
})

Player:AddButton({
    Name = "Open Devil Fruit Shop [ Normal ]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end
})

Player:AddButton({
    Name = "Open Devil Fruit Shop [ Mirage ]",
    Callback = function()
        StartDialog("FruitShop2")
    end
})

function StartDialog(DialogName)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local DialogueController = require(ReplicatedStorage.DialogueController)
    local DialoguesList = require(ReplicatedStorage.DialoguesList)
    for Index,Dialog in pairs(DialoguesList) do
        if tostring(Index) == DialogName then
            DialogueController.Start(DialogueController, Dialog)
        end
    end
end

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
    Name = "~ Abilities ~"
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
                                repeat wait()
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
	Name = "Walk On Water",
	Default = false,
	Callback = function(Value)
		_G.WalkWater = Value
	end
})

spawn(function()
	while wait() do
	    pcall(function()
	    	if _G.WalkWater then
	    		game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
    		else
    			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
            end
		end)
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

local Section = Player:AddSection({
    Name = "~ Misc ~"
})

Player:AddButton({
    Name = "Show Item",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HuyLocDz/ShowItem/main/ShowItem.lua"))()
    end
})

-- [ Tab PvP ]

local Section = PvP:AddSection({
    Name = "~ Player ~"
})

local plyserv = PvP:AddParagraph("Player In Server")

local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local Slplayer = PvP:AddDropdown({
	Name = "Select Player",
	Default = "",
	Options = Playerslist,
	Callback = function(Value)
		SelectPly = Value
	end
})

PvP:AddButton({
    Name = "Refresh Player List",
    Callback = function()
        Slplayer:Refresh(Playerslist,true)
        local Playerslist = {}
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(Playerlist, v.Name)
        end
        Slplayer:Refresh(Playerslist)
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
			if game.Players:FindFirstChild(SelectPly) then
				topos(game.Players[SelectPly].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0))
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
			if game.Players:FindFirstChild(SelectPly) then
				repeat wait()
	                game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(SelectPly).Character.Humanoid
				until _G.SpectatePlys == false
				game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
			end
		end
	end
end)

local Section = PvP:AddSection({
    Name = "~ Aimbot & PvP ~"
})

PvP:AddToggle({
	Name = "Aimbot Skill To Player Nearest",
	Default = false,
	Callback = function(Value)
		_G.AimSkillNearest = Value
	end
})

spawn(function()
	while wait() do
		pcall(function()
			local MaxDistance = math.huge
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					local Distance = v:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
					if Distance < MaxDistance then
						MaxDistance = Distance
						TargetPlayerAim = v.Name
					end
				end
			end
		end)
	end
end)

spawn(function()
	pcall(function()
		game:GetService("RunService").RenderStepped:connect(function()
			if _G.AimSkillNearest and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
				local args = {
					[1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
			end
		end)
	end)
end)

PvP:AddToggle({
	Name = "Enabled PvP",
	Default = false,
	Callback = function(Value)
		_G.EnabledPvP = Value
	end
})

spawn(function()
    while wait() do
        if _G.EnabledPvP then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end
    end
end)

local Section = PvP:AddSection({
    Name = "~ Bounty / Honor [ Soon ] ~"
})

local checkbotihoron = PvP:AddParagraph("Your Bounty / Honor")

-- [ Tab Sea Event ]

local Section = Sea:AddSection({
    Name = "~ Settings Farm Sea Event~"
})

Sea:AddDropdown({
	Name = "Select Boats",
	Default = "Guardian",
	Options = {"Guardian","Grand Brigade","Sloop","Lantern","Brigade","Beast Hunter"},
	Callback = function(Value)
		_G.Boat = Value
        if _G.Boat == "Grand Brigade" then
            SelectedBoat = "PirateGrandBrigade"
        elseif _G.Boat == "Sloop" then
            SelectedBoat = "PirateSloop"
        elseif _G.Boat == "Lantern" then
            SelectedBoat = "Lantern"
        elseif _G.Boat == "Brigade" then
            SelectedBoat = "PirateBrigade"
        elseif _G.Boat == "Beast Hunter" then
            SelectedBoat = "BeastHunter"
        elseif _G.Boat == "Guardian" then
            SelectedBoat = "Guardian"
        end
	end    
})
            
if World3 then
	Sea:AddDropdown({
		Name = "Select Zone Sea",
		Default = "Zone 5 [ Crazy ]",
		Options = {"Zone 0 [ None ]", "Zone 1 [ Low ]","Zone 2 [ Medium ]","Zone 3 [ High ]","Zone 4 [ Extreme ]","Zone 5 [ Crazy ]","Zone 6 [ ??? ]","Zone ∞ [ ??? ]"},
		Callback = function(Value)
			_G.SelectedZone = Value
            if _G.SelectedZone == "Zone 0 [ None ]" then
                CFrameSelectedZone = CFrame.new(-19118.041015625, 24.44040298461914, 858.4185791015625)
            elseif _G.SelectedZone == "Zone 1 [ Low ]" then
                CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143, 0.120013528, 0.00690158736, 0.99274826, -0.0574118942, 0.998350561, -2.36509201e-10, -0.991110802, -0.0569955558, 0.120211802)
            elseif _G.SelectedZone == "Zone 2 [ Medium ]" then
                CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032, 0.307457417, 0.019647358, 0.951358974, -0.0637726262, 0.997964442, -4.15334017e-10, -0.949422479, -0.0606706589, 0.308084518)
            elseif _G.SelectedZone == "Zone 3 [ High ]" then
                CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774, 0.37637493, 0.0150483791, 0.926345229, -0.0399504974, 0.999201655, 2.70896673e-11, -0.925605655, -0.0370079502, 0.376675636)
            elseif _G.SelectedZone == "Zone 4 [ Extreme ]" then
                CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012, 0.0935864747, -0.00122954219, 0.995610416, 0.0624034069, 0.998040259, -0.00463332096, -0.993653536, 0.062563099, 0.0934797972)
            elseif _G.SelectedZone == "Zone 5 [ Crazy ]" then
                CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669)
            elseif _G.SelectedZone == "Zone 6 [ ??? ]" then
                CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372)
            elseif _G.SelectedZone == "Zone ∞ [ ??? ]" then
                CFrameSelectedZone = CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -1.54416148e-06, 0.996583343, -1.8696026e-05, 1, -3.91858095e-13, -0.996583343, -1.86321486e-05, -0.0825930536)
            end
		end
	})
end

if World2 then
	Sea:AddDropdown({
		Name = "Select Zone Sea",
		Default = "Sea [ Normal ]",
		Options = {"Sea [ Normal ]"},
		Callback = function(Value)
			_G.SelectedZone = Value
            if _G.SelectedZone == "Sea [ Normal ]" then
                CFrameSelectedZone = CFrame.new(210.99585, 12.9606171, 4158.57959, -0.917689145, 7.58163254e-11, -0.39729917, 1.20923558e-11, 1, 1.62898153e-10, 0.39729917, 1.44685583e-10, -0.917689145)
            end
		end
	})
end

if World1 then
	Sea:AddDropdown({
		Name = "Select Zone Sea",
		Default = "No Zone Sea",
		Options = {"No Zone Sea"},
		Callback = function()
		end
	})
end

Sea:AddToggle({
	Name = "Auto Sail Boats",
	Default = false,
	Callback = function(Value)
		_G.SailBoat = Value
		StopTween(_G.SailBoat)
	end
})

function CheckBoat()
    for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
        if v.Name == SelectedBoat then
            for _, child in pairs(v:GetChildren()) do
                if child.Name == "MyBoatEsp" then
                    return v
                end
            end
        end
    end
    return false
end

function CheckShark()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                return true
            end
        end
    end
    return false
end

function CheckPiranha()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                return true
            end
        end
    end
    return false
end

function CheckFishCrewMember()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Fish Crew Member" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                return true
            end
        end
    end
    return false
end

function CheckTerrorshark()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Terrorshark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                return true
            end
        end
    end
    return false
end

function CheckSeaBeast()
    if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
        for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
            if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 then
                return true
            end
        end
    end
    return false
end

function TeleportSeabeast(c5)
    local a = Vector3.new(0, c5:FindFirstChild("HumanoidRootPart").Position.Y, 0)
    local ab = Vector3.new(0, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, 0)
    if (a - ab).Magnitude <= 300 then
        topos(c5.HumanoidRootPart.CFrame * PosSea)
    else
        topos(CFrame.new(c5.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, c5.HumanoidRootPart.Position.Z))
    end
end


function AddEsp(Name, Parent)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    BillboardGui.Parent = Parent
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.Name = Name
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 13
    TextLabel.Text = ""
end

local stopboat = {}
function TPB(pos, boat)
	Tween = game:service"TweenService":Create(boat, TweenInfo.new((boat.CFrame.Position - pos.Position).Magnitude/_G.SpeedBoat, Enum.EasingStyle.Linear), {CFrame = pos})
    if (boat.CFrame.Position - pos.Position).Magnitude <= 25 then
        Tween:Cancel()
    else
        Tween:Play()
    end
	function stopboat:Stop()
		Tween:Cancel()
	end
	return stopboat
end

spawn(function()
    while wait() do
        if _G.SailBoat then
            pcall(function()
                if not CheckBoat() then
                    if World3 then
                        BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781)
                    elseif World2 then
                        BuyBoatCFrame = CFrame.new(90.488054275512695, 10.311711311340332, 2950.69287109375)
                    end
                    buyb = topos(BuyBoatCFrame)
                    if (BuyBoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        if buyb then
                            buyb:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", SelectedBoat)
                        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                            if v.Name == SelectedBoat then
                                if (v.VehicleSeat.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                    AddEsp('MyBoatEsp', v)
                                end
                            end
                        end
                    end
                elseif CheckBoat() then
                    for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                        if v.Name == SelectedBoat then
                            if v:FindFirstChild("MyBoatEsp") then
                                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                    if ((CheckShark() and _G.AutoKillShark) or (CheckTerrorshark() and _G.AutoTerrorshark) or (CheckPiranha() and _G.AutoKillPiranha) or (CheckFishCrewMember() and _G.AutoKillFishCrew) or (game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade) or (CheckSeaBeast() and _G.AutoSeaBest)) then
                                        if stoppos then
                                            stoppos:Stop()
                                        end
                                    else
                                        local stoppos = topos(v.VehicleSeat.CFrame * CFrame.new(0,1,0))
                                    end
                                else
                                    repeat wait()
                                        local stopboat = TPB(CFrameSelectedZone, v.VehicleSeat)
                                    until ((CheckShark() and _G.AutoKillShark) or (CheckTerrorshark() and _G.AutoTerrorshark) or (CheckPiranha() and _G.AutoKillPiranha) or (CheckFishCrewMember() and _G.AutoKillFishCrew) or (game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade) or (CheckSeaBeast() and _G.AutoSeaBest)) or game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false or _G.SailBoat == false
                                    if stopboat then
                                        stopboat:Stop()
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                                    wait()
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SailBoat then
            if ((CheckShark() and _G.AutoKillShark) or (CheckTerrorshark() and _G.AutoTerrorshark) or (CheckPiranha() and _G.AutoKillPiranha) or (CheckFishCrewMember() and _G.AutoKillFishCrew) or (game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade) or (game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade) or (CheckSeaBeast() and _G.AutoSeaBest)) then
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            elseif _G.DogeRoughSea == true then
                if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Rough Sea") and checkboat() then
                    if game.Players.LocalPlayer.Character.Humanoid.Sit then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                    if (checkboat().VehicleSeat.Position - Vector3.new(-16207.501953125, 9.0863618850708, 475.1490783691406)).Magnitude > 100 then
                        checkboat().VehicleSeat.CFrame = CFrame.new(-28464.876953125, 12.553319931030273, 6896.8076171875)
                    end
                    if not game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                        _G.Clip = true
                        topos(checkboat().VehicleSeat.CFrame)
                    else
                        _G.Clip = false
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SailBoat then
            pcall(function()
                if CheckFishCrewMember() and _G.AutoKillFishCrew then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                MagnetNear = true
                                SeaSkill = false
                            until not _G.AutoKillFishCrew or not v.Parent or v.Humanoid.Health <= 0
                            MagnetNear = false
                        end
                    end
                elseif game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") and _G.RelzFishBoat then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") then
                            repeat wait()
                                local BoatCFrame = v.Engine.CFrame
                                if (BoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                    SeaSkill = true
                                else
                                    SeaSkill = false
                                end
                                topos(BoatCFrame)
                                Skillaimbot = true
                                AimSkill = v.Engine.CFrame * CFrame.new(0, -15, 0)
                                AimBotSkillPosition = AimSkill.Position
                            until not v.Parent or v.Health < 0 or not game:GetService("Workspace").Enemies:FindFirstChild("FishBoat") or not v:FindFirstChild("Engine") or not _G.RelzFishBoat
                            Skillaimbot = false
                            SeaSkill = false
                        end
                    end
                elseif game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") and _G.RelzPirateGrandBrigade then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") then
                            repeat wait()
                                local BoatCFrame = v.Engine.CFrame
                                if (BoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                    SeaSkill = true
                                else
                                    SeaSkill = false
                                end
                                topos(BoatCFrame)
                                Skillaimbot = true
                                AimSkill = v.Engine.CFrame * CFrame.new(0, -15, 0)
                                AimBotSkillPosition = AimSkill.Position
                            until not v.Parent or v.Health.Value < 0 or not game:GetService("Workspace").Enemies:FindFirstChild("PirateGrandBrigade") or not v:FindFirstChild("Engine") or not _G.RelzPirateGrandBrigade
                            Skillaimbot = false
                            SeaSkill = false
                        end
                    end
                elseif game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") and _G.RelzPirateBrigade then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") then
                            repeat wait()
                                local BoatCFrame = v.Engine.CFrame
                                if (BoatCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                    SeaSkill = true
                                else
                                    SeaSkill = false
                                end
                                topos(BoatCFrame)
                                Skillaimbot = true
                                AimSkill = v.Engine.CFrame * CFrame.new(0, -15, 0)
                                AimBotSkillPosition = AimSkill.Position
                            until not v.Parent or v.Health.Value < 0 or not game:GetService("Workspace").Enemies:FindFirstChild("PirateBrigade") or not v:FindFirstChild("Engine") or not _G.RelzPirateBrigade
                            Skillaimbot = false
                            SeaSkill = false
                        end
                    end
                elseif CheckSeaBeast() and _G.AutoSeaBest then
                    if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
                        for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                            if CheckSeaBeast() then
                                repeat wait()
                                    CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0,200,0)
                                    if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 200 then
                                        SeaSkill = true
                                    else
                                        SeaSkill = false
                                    end
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
                                    spawn(TeleportSeabeast(v), 1)
                                until not _G.AutoSeaBest or CheckSeaBeast() == false or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 or not v.Parent
                                Skillaimbot = false
                                SeaSkill = false
                            else
                                Skillaimbot = false
                                SeaSkill = false
                            end
                        end
                    end
                elseif CheckTerrorshark() and _G.AutoTerrorshark then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * PosCaMap)
                                MagnetNear = true
                                SeaSkill = false
                            until not  _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
                            MagnetNear = false
                        end
                    end
                elseif CheckPiranha() and _G.AutoKillPiranha then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                MagnetNear = true
                                SeaSkill = false
                            until not _G.AutoKillPiranha or not v.Parent or v.Humanoid.Health <= 0
                            MagnetNear = false
                        end
                    end
                elseif CheckShark() and _G.AutoKillShark then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                MagnetNear = true
                                SeaSkill = false
                            until not _G.AutoKillShark or not v.Parent or v.Humanoid.Health <= 0
                            MagnetNear = false
                        end
                    end
                else
                    Skillaimbot = false
                    SeaSkill = false
                    MagnetNear = false
                end
            end)
        end
    end
end)

Sea:AddToggle({
	Name = "Auto Dodge Rough Sea [ Test ]",
	Default = false,
	Callback = function(Value)
		_G.DogeRoughSea = Value
	end
})

Sea:AddToggle({
	Name = "No Clip Rock",
	Default = false,
	Callback = function(Value)
		_G.NoClipRock = Value
	end
})

spawn(function()
	while wait() do
		if _G.NoClipRock or _G.SailBoat then
		    pcall(function()
				if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
					for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == true then
							v.CanCollide = false
						end
					end
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == true then
							v.CanCollide = false
						end
					end
				elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false then
					for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == false then
							v.CanCollide = true
						end
					end
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == false then
							v.CanCollide = true
						end
					end
				end
			end)
		end
	end
end)

Sea:AddSlider({
	Name = "Speed Boats",
	Min = 120,
	Max = 600,
	Default = 300,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		_G.SpeedBoat = Value
	end
})

local Section = Sea:AddSection({
    Name = "~ Use Weapon Skill ~"
})

Sea:AddToggle({
	Name = "Auto Spam Skill Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.UseSeaFruitSkill = Value
	end
})

Sea:AddToggle({
	Name = "Auto Spam Skill Melee",
	Default = false,
	Callback = function(Value)
		_G.UseSeaMeleeSkill = Value
	end
})

Sea:AddToggle({
	Name = "Auto Spam Skill Sword",
	Default = false,
	Callback = function(Value)
		_G.UseSeaSwordSkill = Value
	end
})

Sea:AddToggle({
	Name = "Auto Spam Skill Gun",
	Default = false,
	Callback = function(Value)
		_G.UseSeaGunSkill = Value
	end
})

local Section = Sea:AddSection({
    Name = "~ Aimbot Skill To Ship & Sea Beast ~"
})

Sea:AddLabel("Select Use Skill Devil Fruit")

Sea:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
		_G.SkillFruitZ = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
		_G.SkillFruitX = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill C",
	Default = false,
	Callback = function(Value)
		_G.SkillFruitC = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill V",
	Default = false,
	Callback = function(Value)
		_G.SkillFruitV = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill F",
	Default = false,
	Callback = function(Value)
		_G.SkillFruitF = Value
	end
})

Sea:AddLabel("Select Use Skill Melee")

Sea:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
		_G.SkillMeleeZ = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
		_G.SkillMeleeX = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill C",
	Default = false,
	Callback = function(Value)
		_G.SkillMeleeC = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill V",
	Default = false,
	Callback = function(Value)
		_G.SkillMeleeV = Value
	end
})

Sea:AddLabel("Select Use Skill Sword")

Sea:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
	    _G.SkillSwordZ = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
	    _G.SkillSwordX = Value
	end
})

Sea:AddLabel("Select Use Skill Gun")

Sea:AddToggle({
	Name = "Use Skill Z",
	Default = false,
	Callback = function(Value)
		_G.SkillGunZ = Value
	end
})

Sea:AddToggle({
	Name = "Use Skill X",
	Default = false,
	Callback = function(Value)
		_G.SkillGunX = Value
	end
})

local Section = Sea:AddSection({
    Name = "~ Mobs Sea Event ~"
})

Sea:AddToggle({
	Name = "Auto Kill Shark",
	Default = false,
	Callback = function(Value)
		_G.AutoKillShark = Value
		StopTween(_G.AutoKillShark)
	end
})

Sea:AddToggle({
	Name = "Auto Kill Piranha",
	Default = false,
	Callback = function(Value)
		_G.AutoKillPiranha = Value
		StopTween(_G.AutoKillPiranha)
	end
})

Sea:AddToggle({
	Name = "Auto Kill Fish Crew Member",
	Default = false,
	Callback = function(Value)
		_G.AutoKillFishCrew = Value
		StopTween(_G.AutoKillFishCrew)
	end
})

Sea:AddToggle({
	Name = "Auto Kill Ship",
	Default = false,
	Callback = function(Value)
		_G.RelzFishBoat = Value
		_G.RelzPirateBrigade = Value
		_G.RelzPirateGrandBrigade = Value
		StopTween(Value)
		if not _G.RelzFishBoat then
            SeaSkill = false
            Skillaimbot = false
        end
	end
})

Sea:AddToggle({
	Name = "Auto Kill Terrorshark",
	Default = false,
	Callback = function(Value)
		_G.AutoTerrorshark = Value
		StopTween(_G.AutoTerrorshark)
	end
})

Sea:AddToggle({
	Name = "Auto Kill Sea Beast",
	Default =false,
	Callback = function(Value)
		_G.AutoSeaBest = Value
		StopTween(_G.AutoSeaBest)
	    if not _G.AutoSeaBest then
            SeaSkill = false
            Skillaimbot = false
        end
	end
})

DoneSkillGun = false
DoneSkillSword = false
DoneSkillFruit = false
DoneSkillMelee = false
spawn(function()
    while wait() do
        if SeaSkill then
            if _G.UseSeaFruitSkill and DoneSkillFruit == false then
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Blox Fruit" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
            if _G.SkillFruitZ then
                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                wait(_G.HoldSKillFruitZ)
                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
            end
            if _G.SkillFruitX then
                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                wait(_G.HoldSKillFruitX)
                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
            end       
            if _G.SkillFruitC then
                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                wait(_G.HoldSKillFruitC)
                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
            end
            if _G.SkillFruitV then
                game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                wait(_G.HoldSKillFruitV)
                game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
            end
            if _G.SkillFruitF then
                game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                wait(_G.HoldSKillFruitF)
                game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
            end
            DoneSkillFruit = true
            end
            if _G.UseSeaMeleeSkill and DoneSkillMelee == false then 
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Melee" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                if _G.SkillMeleeZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(_G.HoldSKillMeleeZ)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillMeleeX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(_G.HoldSKillMeleeX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end 
                if _G.SkillMeleeC then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(_G.HoldSKillMeleeC)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if _G.SkillMeleeV then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(_G.HoldSKillMeleeV)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                DoneSkillMelee = true
            end
            if _G.UseSeaSwordSkill and DoneSkillSword == false then 
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Sword" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                if _G.SkillSwordZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(_G.HoldSKillSwordX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillSwordX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(_G.HoldSKillSwordX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                DoneSkillSword = true
            end
            if _G.UseSeaGunSkill and DoneSkillGun == false then 
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.ToolTip == "Gun" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end
                if _G.SkillGunZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(_G.HoldSKillGunZ)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillGunX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(_G.HoldSKillGunX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                DoneSkillGun = true
            end
            DoneSkillGun = false
            DoneSkillSword = false
            DoneSkillFruit = false
            DoneSkillMelee = false
        end
    end
end)

local Section = Sea:AddSection({
    Name = "~ Kitsune Island ~"
})

local CheckKitsunee = Sea:AddParagraph("Kitsune Island")

Sea:AddToggle({
	Name = "Teleport To Kitsune Island",
	Default =false,
	Callback = function(Value)
		_G.TeleportKitsune = Value
		StopTween(_G.TeleportKitsune)		
	end
})

spawn(function()
    while wait() do
        if _G.TeleportKitsune then
            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                topos(game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,0,10))
            end
        end
    end
end)

Sea:AddToggle({
	Name = "Auto Collect Azure",
	Default =false,
	Callback = function(Value)
		_G.CollectAzure = Value
		StopTween(_G.CollectAzure)		
	end
})

spawn(function()
    while wait() do
        if _G.CollectAzure then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                    topos(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                end
            end)
        end
    end
end)

Sea:AddSlider({
	Name = "Set Azure Ember Quantity To Trade",
	Min = 10,
	Max = 25,
	Default = 20,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		_G.SetToTradeAureEmber = Value
	end
})

Sea:AddToggle({
	Name = "Auto Trade Azure Ember",
	Default =false,
	Callback = function(Value)
		_G.TradeAureEmber = Value	
	end
})

function GetCountMaterials(MaterialName)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if v.Name == MaterialName then
            return v["Count"]
        end
    end
end

spawn(function()
    while wait() do
        if _G.TradeAureEmber then
            pcall(function()
                local AzureAvilable = GetCountMaterials("Azure Ember")
                if AzureAvilable >= _G.SetToTradeAureEmber then
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KitsuneStatuePray")
                end
            end)
        end
    end
end)

-- [ Tab Race ]

local Section = Race:AddSection({
    Name = "~ Templete Of Time ~"
})

local CRace = Race:AddParagraph("Your Race")

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
    local bn = CFrame.new(28576.4688,14939.2832,76.5164413,-1,0,0,0,0.707134247,-0.707079291,-0,-0.707079291,-0.707134247)
    local bo = CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
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
    local RaceValue = game:GetService("Players").LocalPlayer.Data.Race.Value
    if RaceValue == "Fishman" then
        topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
    elseif RaceValue == "Human" then
        topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
    elseif RaceValue == "Cyborg" then
        topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
    elseif RaceValue == "Skypiea" then
        topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
    elseif RaceValue == "Ghoul" then
        topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
    elseif RaceValue == "Mink" then
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
    Name = "~ Mirage Island ~"
})

local StatusMirage = Race:AddParagraph("Mirage Island")

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
    while wait() do
        if _G.LockCamToMoon then
           workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
        end
    end
end)

Race:AddToggle({
	Name = "Teleport To Advanced Fruit Dealer",
	Default = false,
	Callback = function(Value)
		_G.MirageNpc = Value
		StopTween(_G.MirageNpc)
	end
})

spawn(function()
    while wait() do
        if _G.MirageNpc then
            if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                topos(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
            end
        end
    end
end)

local Section = Race:AddSection({
    Name = "~ Trials Race ~"
})

local Moon1 = Race:AddParagraph("Moon")

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
						repeat wait()
							v.Humanoid.Health = 0
							v.HumanoidRootPart.CanCollide = false
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
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
						topos(v.CFrame* PosSea)
						Skillaimbot = true
						AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v:IsA("Tool") then
								if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
								end
							end
						end
						game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						wait()
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
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						wait()
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
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						wait()
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
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
					end
				end
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
				topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
				for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						repeat wait()
							v.Humanoid.Health = 0
							v.HumanoidRootPart.CanCollide = false
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
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
		_G.SelectTrialWeapon = Value
	end
})

spawn(function()
	while wait() do
		if _G.SelectTrialWeapon == _G.SelectTrialWeapon then
			for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == _G.SelectTrialWeapon then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.SelectTrialsWeapon = v.Name
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
            pcall(function()
                TempleCFrame = CFrame.new( 28730.0645, 14887.5371, -91.0957718, 0.557085216, -4.57713725e-08, 0.830455363, 9.81919115e-08, 1, -1.07530047e-08, -0.830455363, 8.75343389e-08, 0.557085216)
                if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    if GetDistance(TempleCFrame) <= 380 then
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v.Name ~= game.Players.LocalPlayer.Name and (GetDistance(TempleCFrame, v.Character.HumanoidRootPart) <= 300) and v.Character.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectTrialsWeapon)
                                    topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(1, 1, 1))
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    UseSkillTrial = true
                                    SpamOnRace = true
                                    Skillaimbot = true
                                    AimBotSkillPosition = v.Character.HumanoidRootPart.CFrame.Position
                                    KillPlayerAttack = true
                                until _G.KillAfterTrials == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                                UseSkillTrial = false
                                SpamOnRace = false
                                Skillaimbot = false
                                KillPlayerAttack = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if SpamOnRace then
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"T",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"T",false,game)
            wait()
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
        end
    end
end)

spawn(function()
    while wait() do
        if SpamOnRace then
            repeat wait()
                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService('VirtualUser'):SetKeyDown('0x65')
                    wait(0.1)
                    game:GetService('VirtualUser'):SetKeyUp('0x65')
                end
            until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not SpamOnRace
        end
    end
end)

Race:AddToggle({
	Name = "Use Skill Z",
	Default = true,
	Callback = function(Value)
		_G.Z = Value
	end
})

Race:AddToggle({
	Name = "Use Skill X",
	Default = true,
	Callback = function(Value)
		_G.X = Value
	end
})

Race:AddToggle({
	Name = "Use Skill C",
	Default = true,
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
        if UseSkillTrial then
            if _G.Z then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
            end
            if _G.X then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
            end
            if _G.C then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
            end
            if _G.V then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
            end
        end
    end
end)

local Section = Race:AddSection({
    Name = "~ Training Race ~"
})

local AnOn = Race:AddParagraph("Ancient One")

Race:AddToggle({
	Name = "Auto Buy Gear",
	Default = false,
	Callback = function(Value)
		_G.AutoBuyGear = Value
	end
})

spawn(function()
    while wait() do
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
		_G.Auto_Bone = Value
		StopTween(_G.AutoRace)
	end
})

spawn(function()
    while wait() do
        if _G.AutoRace then
            if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                _G.Auto_Bone = false
                topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoRace then
            if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                _G.Auto_Bone = true
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
    Name = "~ Up Stats ~"
})

StatsEsp:AddSlider({
	Name = "Point",
	Min = 1,
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
	Name = "Auto Up Stats Melee",
	Default = false,
	Callback = function(Value)
		Melee = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Up Stats Defense",
	Default = false,
	Callback = function(Value)
		Defense = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Up Stats Sword",
	Default = false,
	Callback = function(Value)
		Sword = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Up Stats Gun",
	Default = false,
	Callback = function(Value)
		Gun = Value
	end
})

StatsEsp:AddToggle({
	Name = "Auto Up Stats Devil Fruit",
	Default = false,
	Callback = function(Value)
		DemonFruit = Value
	end
})

spawn(function()
	while wait() do
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
    Name = "~ Esp ~"
})

StatsEsp:AddToggle({
	Name = "Esp Player",
	Default = false,
	Callback = function(Value)
		_G.ESPPlayer = Value
		UpdatePlayerChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Island",
	Default = false,
	Callback = function(Value)
		_G.IslandESP = Value
		UpdateIslandESP()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Devil Fruit",
	Default = false,
	Callback = function(Value)
		_G.DevilFruitESP = Value
		UpdateDevilChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Flower",
	Default = false,
	Callback = function(Value)
		_G.FlowerESP = Value
		UpdateFlowerChams()
	end
})

StatsEsp:AddToggle({
	Name = "Esp Chest",
	Default = false,
	Callback = function(Value)
		_G.ChestESP = Value
		UpdateChestChams()
	end
})

spawn(function()
	while task.wait() do
	    if _G.FlowerESP then
		    UpdateFlowerChams() 
	    end
	    if _G.ChestESP then
		    UpdateChestChams() 
	    end
	    if _G.ESPPlayer then
		    UpdatePlayerChams()
	    end
	    if _G.IslandESP then
	        UpdateIslandESP()
	    end
	    if _G.DevilFruitESP then
		    UpdateDevilChams()
	    end
	end
end)

-- [ Tab Teleport ]

local Section = Teleport:AddSection({
    Name = "~ Sea ~"
})

local CheckSea = Teleport:AddParagraph("Check Sea")

if World1 then
    CheckSea:Set("First Sea")
elseif World2 then
    CheckSea:Set("Second Sea")
elseif World3 then
    CheckSea:Set("Third Sea")
end

Teleport:AddDropdown({
	Name = "Select Sea",
	Default = "",
	Options = {"First Sea","Second Sea","Third Sea"},
	Callback = function(Value)
		SelectSea = Value
	end
})

Teleport:AddButton({
    Name = "Teleport To Sea",
    Callback = function()
        if SelectSea == "First Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        elseif SelectSea == "Second Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        elseif SelectSea == "Third Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
    end
})

local Section = Teleport:AddSection({
    Name = "~ Island ~"
})

if World1 then
    ChonDao = {"Wind Mill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"}
elseif Word2 then
    ChonDao = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Raid Lab","Two Snow Mountains","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"}
elseif World3 then
    ChonDao = {"Mansion","Port Town","Great Tree","Castle On The Sea","Raid Lab","MiniSky", "Hydra Island","Beautiful Pirate","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost"}
end

Teleport:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = ChonDao,
    Callback = function(Value)
		SelectIsland = Value
	end
})

Teleport:AddToggle({
	Name = "Teleport To Island",
	Default = false,
	Callback = function(Value)
		_G.TeleportIsland = Value
	    if _G.TeleportIsland == true then
  	      repeat wait()
      	      if SelectIsland == "Wind Mill" then
    	            topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
    	        elseif SelectIsland == "Marine" then
     	           topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
    	        elseif SelectIsland == "Middle Town" then
    	            topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
       	     elseif SelectIsland == "Jungle" then
       	         topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
     	       elseif SelectIsland == "Pirate Village" then
     	           topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
      	      elseif SelectIsland == "Desert" then
      	          topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
      	      elseif SelectIsland == "Snow Island" then
     	           topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
   	         elseif SelectIsland == "MarineFord" then
      	          topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
     	       elseif SelectIsland == "Colosseum" then
      	          topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
     	       elseif SelectIsland == "Sky Island 1" then
    	            topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
     	       elseif SelectIsland == "Sky Island 2" then
     	           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
       	     elseif SelectIsland == "Sky Island 3" then
      	          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
     	       elseif SelectIsland == "Prison" then
       	         topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
      	      elseif SelectIsland == "Magma Village" then
       	         topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
     	       elseif SelectIsland == "Under Water Island" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.6796875, 1819.7841796875))
    	        elseif SelectIsland == "Fountain City" then
     	           topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
   	         elseif SelectIsland == "Shank Room" then
  	              topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
 	           elseif SelectIsland == "Mob Island" then
    	            topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
      	      elseif SelectIsland == "Raid Lab" then
      	 	 	if World3 then
     	         	  topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
   				elseif World2 then
						topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
   				end
        	    elseif SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
        	    elseif SelectIsland == "Frist Spot" then
     	           topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
     	       elseif SelectIsland == "Dark Area" then
    	            topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
     	       elseif SelectIsland == "Flamingo Mansion" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
      	      elseif SelectIsland == "Flamingo Room" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2283, 15, 867))
      	      elseif SelectIsland == "Green Zone" then
            	    topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
	            elseif SelectIsland == "Factory" then
        	        topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
    	        elseif SelectIsland == "Colossuim" then
        	        topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
       	     elseif SelectIsland == "Zombie Island" then
       	         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6509, 83, -133))
       	     elseif SelectIsland == "Two Snow Mountain" then
          	      topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
      	      elseif SelectIsland == "Punk Hazard" then
        	        topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
      	      elseif SelectIsland == "Cursed Ship" then
          	      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.40197753906, 125.05712890625, 32885.875))
      	      elseif SelectIsland == "Ice Castle" then
           	     topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
        	    elseif SelectIsland == "Forgotten Island" then
             	   topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
           	 elseif SelectIsland == "Ussop Island" then
    	            topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
    	        elseif SelectIsland == "Mini Sky Island" then
           	     topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
     	       elseif SelectIsland == "Great Tree" then
             	   topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
       	     elseif SelectIsland == "Castle On The Sea" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
           	 elseif SelectIsland == "MiniSky" then
        	        topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
        	    elseif SelectIsland == "Port Town" then
          	      topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
        	    elseif SelectIsland == "Hydra Island" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5756, 610, -282))
        	    elseif SelectIsland == "Beautiful Pirate" then
           	     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5319, 23, -93))
       	     elseif SelectIsland == "Floating Turtle" then
          	      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12001, 332, -8861))
        	    elseif SelectIsland == "Mansion" then
     	     	  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
         	   elseif SelectIsland == "Haunted Castle" then
          	      topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
        	    elseif SelectIsland == "Ice Cream Island" then
           	     topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
         	   elseif SelectIsland == "Peanut Island" then
        	        topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
          	  elseif SelectIsland == "Cake Island" then
           	     topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
          	  elseif SelectIsland == "Cocoa Island" then
         	       topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
       	     elseif SelectIsland == "Candy Island" then
           	     topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
       	     elseif SelectIsland == "Tiki Outpost" then
            	    topos(CFrame.new(-16101.1885,12.8422165,380.942291))
          	  end
  	  	until not _G.TeleportIsland
 	   end
  	  StopTween(_G.TeleportIsland)
	end
})

-- [ Tab Status & Server ]

local Section = StatusServer:AddSection({
    Name = "~ Status Server ~"
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

local TimeServer = StatusServer:AddParagraph("Time In Server")

spawn(function()
    while task.wait() do
        TimeServer:Set(tostring(game.Lighting.TimeOfDay).." ( "..function7().." )")
    end
end)

local Moon = StatusServer:AddParagraph("Moon")

local KillCake = StatusServer:AddParagraph("Cake Prince")

local LegendSwords1 = StatusServer:AddParagraph("Legendary Sword Dealer")

local ColorHaki1 = StatusServer:AddParagraph("Haki Dealer")

local Elite = StatusServer:AddParagraph("Elite")

local Mirage = StatusServer:AddParagraph("Mirage Island")

local Kitsune = StatusServer:AddParagraph("Kitsune Island")

local Frozen = StatusServer:AddParagraph("Island Frozen Dimension")

spawn(function()
    while task.wait() do
        pcall(function()
            YourLevel:Set("Level: "..game:GetService("Players").LocalPlayer.Data.Level.Value.."/2550")
            Moon:Set(CheckMoon().." | "..function7().." | "..function8())
            KillCake:Set(CheckCakeSpawn())
            LegendSwords1:Set(CheckSword())
            ColorHaki1:Set(CheckHaki())
            Elite:Set(CheckElite())
            AnOn:Set(CheckAncientOneStatus())
            Mirage:Set(CheckMirage())
            Kitsune:Set(CheckKitsune())
            Frozen:Set(CheckFrozen())
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            StatusCakePrince:Set(CheckCakeSpawn())
            LegendSwords:Set(CheckSword())
            ColorHaki:Set(CheckHaki())
            CheckKitsunee:Set(CheckKitsune())
            StatusMirage:Set(CheckMirage())
            CRace:Set("Race: "..CheckRace())
            EliteStatus:Set(CheckElite())
            Moon1:Set(CheckMoon().." | "..function7().." | "..function8())
            Yama:Set("Progress: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check") and World3 then
                YourBone:Set("Bone: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check").."/5000")
            elseif World1 or World2 then
                YourBone:Set("Only Third Sea ( Sea 3 )")
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            CheckRip:Set(GodChalice().." | "..CheckTrumAd())
            CheckRauu:Set(CDarkness().." | "..CheckRauDen())
            ObservationStatus:Set("Level: "..math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if i == 12 then
                    plyserv:Set("Player: "..i.."/".."12")
                elseif i == 1 then
                    plyserv:Set("Player: "..i.."/".."12")
                else
                    plyserv:Set("Player: "..i.."/".."12")
                end
            end
            if game:GetService("Players").LocalPlayer.Team.Name == "Pirates" then
                checkbotihoron:Set("Bounty: "..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value))
            elseif game:GetService("Players").LocalPlayer.Team.Name == "Marines" then
                checkbotihoron:Set("Honor: "..tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value))
            end
        end)
    end
end)
            

local Section = StatusServer:AddSection({
    Name = "~ Server ~"
})

local JobId = StatusServer:AddParagraph("Server Job Id", game.JobId)

StatusServer:AddTextbox({
	Name = "Input Job Id",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.Job = Value
	end
})

StatusServer:AddButton({
    Name = "Join Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
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
    while wait() do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    end
end)

StatusServer:AddButton({
    Name = "Copy Server Job Id",
    Callback = function()
        setclipboard(tostring(game.JobId))
        OrionLib:MakeNotification({
        	Name = "Tinh Linh Hub",
        	Content = "Copied Server Job Id !",
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

-- [ Tab Shop ]

local Section = Shop:AddSection({
    Name = "~ Code ~"
})

CodeA = {"TantaiGaming","Axiore","SUB2DAIGROCK","Sub2UncleKizaru","SUB2NOOBMASTER123","StrawHatMaine","Sub2OfficialNoobie","SUB2GAMERROBOT_EXP1","THEGREATACE","BIGNEWS","FUDD10","fudd10_v2","Bluxxy","StarcodeHEO","JCWK","Magicbus","Enyu_is_Pro","Sub2Fer999","KittGaming","SUB2GAMERROBOT_RESET1","Sub2CaptainMaui"}

Shop:AddDropdown({
    Name = "Select Code",
    Default = "",
    Options = CodeA,
    Callback = function(Value)
		CodeRd = Value
	end
})

Shop:AddButton({
    Name = "Redeem Code",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(CodeRd)
    end
})

Shop:AddButton({
    Name = "Redeem All Code",
    Callback = function()
        function RedeemCode(Value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Value)
        end
        for i,v in pairs(CodeA) do
            RedeemCode(v)
        end
    end
})

local Section = Shop:AddSection({
    Name = "~ Fighting Style ~"
})

Shop:AddDropdown({
    Name = "Select Fighting Style",
    Default = "",
    Options = {"Black Leg","Electro","Fishman Karate","Dragon Claw","SuperHuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","GodHuman","Sanguine Art"},
    Callback = function(Value)
		SelectMelee = Value
	end
})

Shop:AddButton({
    Name = "Buy Fighting Style",
    Callback = function()
        if SelectMelee == "Black Leg" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        elseif SelectMelee == "Electro" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
        elseif SelectMelee == "Fishman Karate" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        elseif SelectMelee == "Dragon Claw" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
        elseif SelectMelee == "SuperHuman" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
        elseif SelectMelee == "Death Step" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        elseif SelectMelee == "Sharkman Karate" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        elseif SelectMelee == "Electric Claw" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
        elseif SelectMelee == "Dragon Talon" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        elseif SelectMelee == "GodHuman" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
        elseif SelectMelee == "Sanguine Art" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
    end
})

local Section = Shop:AddSection({
    Name = "~ Abilities ~"
})

Shop:AddDropdown({
    Name = "Select Abilities",
    Default = "",
    Options = {"Sky Jump [ Geppo ]","Buso Haki","Soru","Observation Haki"},
    Callback = function(Value)
		SelectAbilities = Value
	end
})

Shop:AddButton({
    Name = "Buy Abilities",
    Callback = function()
        if SelectAbilities == "Sky Jump [ Geppo ]" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
        elseif SelectAbilities == "Buso Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
        elseif SelectAbilities == "Soru" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        elseif SelectAbilities == "Observation Haki" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
        end
    end
})

local Section = Shop:AddSection({
    Name = "~ Sword ~"
})

Shop:AddDropdown({
    Name = "Select Sword",
    Default = "",
    Options = {"Cutlass","Katana","Iron Mace","Dual Katana","Triple Katana","Pipe","Dual-Headed Blade","Bisento","Soul Cane","Pole V2"},
    Callback = function(Value)
		SelectSword = Value
	end
})

Shop:AddButton({
    Name = "Buy Sword",
    Callback = function()
        if SelectSword == "Cutlass" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
        elseif SelectSword == "Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
        elseif SelectSword == "Iron Mace" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
        elseif SelectSword == "Dual Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
        elseif SelectSword == "Triple Katana" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
        elseif SelectSword == "Pipe" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
        elseif SelectSword == "Dual-Headed Blade" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
        elseif SelectSword == "Bisento" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
        elseif SelectSword == "Soul Cane" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
        elseif SelectSword == "Pole V2" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
        end
    end
})

local Section = Shop:AddSection({
    Name = "~ Gun ~"
})

Shop:AddDropdown({
    Name = "Select Gun",
    Default = "",
    Options = {"Slingshot","Flintlock","Musket","Cannon","Refined Flintlock","Refined Slingshot","Bizarre Rifle","Kabucha"},
    Callback = function(Value)
		SelectGun = Value
	end
})

Shop:AddButton({
    Name = "Buy Gun",
    Callback = function()
        if SelectGun == "Slingshot" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
        elseif SelectGun == "Flintlock" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
        elseif SelectGun == "Musket" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
        elseif SelectGun == "Cannon" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
        elseif SelectGun == "Refined Flintlock" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
        elseif SelectGun == "Refined Slingshot" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
        elseif SelectGun == "Kabucha" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Kabucha")
        elseif SelectGun == "Bizarre Rifle" then
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
    Name = "~ Other ~"
})

Shop:AddDropdown({
    Name = "Select Other Things",
    Default = "",
    Options = {"Reroll Race","Reset Stats","Cyborg Race","Ghoul Race"},
    Callback = function(Value)
		SelectOther = Value
	end
})

Shop:AddButton({
    Name = "Buy Other Things Selected",
    Callback = function()
        if SelectOther == "Reroll Race" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
        elseif SelectOther == "Reset Stats" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
        elseif SelectOther == "Cyborg Race" then
            local a = {
                [1] = "CyborgTrainer",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
        elseif SelectOther == "Ghoul Race" then
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
    Content = "Script Loaded Successfully !",
    Image = "rbxassetid://16730867128",
    Time = 5
})

OrionLib:Init()
