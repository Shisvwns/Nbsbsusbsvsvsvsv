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
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = ('[ Player: '..v.Name..' ] - [ Health: '..math.floor(v.Character.Humanoid.Health)..'/'..v.Character.Humanoid.MaxHealth..' ]\n[ Distance: '..round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3)..'m ]')
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
function topos(Pos)
    if not Pos then return end 
    if not lp.Character:FindFirstChild("PartTele") then
        local PartTele = Instance.new("Part", lp.Character)
        PartTele.Size = Vector3.new(0,0,0)
        PartTele.Name = "PartTele"
        PartTele.Anchored = true
        PartTele.Transparency = 1
        PartTele.CanCollide = false
        PartTele.CFrame = WaitHRP(lp).CFrame 
        PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
            task.wait()
            WaitHRP(lp).CFrame = PartTele.CFrame
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
    if Distance <= 250 then
        lp.Character.HumanoidRootPart.CFrame = Pos
    end
    Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear),{CFrame = Pos})
    Tween:Play() 
    Clip = true
end

function Tween(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/_G.TweenSpeed, Enum.EasingStyle.Linear),{CFrame = Pos})
    Tween:Play()
end

function StopTween(target)
    if not target then
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear),{CFrame = Pos}):Cancel()
        Clip = false
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
    while wait() do
        if Type == 1 then
            Pos = CFrame.new(0,40,-20)
        elseif Type == 2 then
            Pos = CFrame.new(20,40,0)
        elseif Type == 3 then
            Pos = CFrame.new(0,40,20)	
        elseif Type == 4 then
            Pos = CFrame.new(-20,40,0)
        end
    end
end)

spawn(function()
    while wait() do
        if Type == 1 then
            PosSea = CFrame.new(0,400,-60)
        elseif Type == 2 then
            PosSea = CFrame.new(60,400,0)
        elseif Type == 3 then
            PosSea = CFrame.new(0,400,60)	
        elseif Type == 4 then
            PosSea = CFrame.new(-60,400,0)
        end
    end
end)

spawn(function()
    while wait() do
        if Type == 1 then
            PosCaMap = CFrame.new(0,60,-30)
        elseif Type == 2 then
            PosCaMap = CFrame.new(30,60,0)
        elseif Type == 3 then
            PosCaMap = CFrame.new(0,60,30)	
        elseif Type == 4 then
            PosCaMap = CFrame.new(-30,60,0)
        end
    end
end)

-- [ No Clip Farm ]

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if Clip then
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
            elseif not Clip and game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
                game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
            end
        end)
    end)
end)

-- [ Check Status ]

spawn(function()
	while wait() do
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
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
            return "Cake Prince Spawned"
        elseif CheckMob("Dough King") then
            return "Dough King Spawned"
        end
    elseif World1 or World2 then
        return "Defeat: 500/500 Mobs"
    end
end

function CheckElite()
    if CheckMob("Diablo") then
        return "Elite Diablo Spawned"
    elseif CheckMob("Deandre") then
        return "Elite Deandre Spawned"
    elseif CheckMob("Urban") then
        return "Elite Urban Spawned"
    else
        return "Not Spawned"
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
        return "Not Found Legendary Sword Dealer"
    end
end

function CheckHaki()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1") then
        return "Haki Colors: "..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")
    else
        return "Not Found Haki Dealer"
    end
end

function CheckMirage()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
        return "Spawned"
    else
        return "Not Spawned"
    end
end

function CheckKitsune()
    if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
        return "Spawned"
    else
        return "Not Spawned"
    end
end

function CheckFrozen()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
        return "Spawned"
    else
        return "Not Spawned"
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
        return "Darkbeard Spawned"
    else
        return "Darkbeard Not Spawned"
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
        return "Rip_Indra Spawned"
    else
        return "Rip_Indra Not Spawned"
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

-- [ Super Fast Attack ]

local PBlade = game.Players.LocalPlayer
local QBlade = getupvalues(require(PBlade.PlayerScripts.CombatFramework))
local RBlade = QBlade[2]
local CurveFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]

function GetCurrentBlade()
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

function AttackNoCD()
    local U = RBlade.activeController
    if U then
        for h = 1, 1 do
            local V =
                require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                PBlade.Character,
                {PBlade.Character:FindFirstChild("HumanoidRootPart")},
                70
            )
            local W = {}
            local X = {}
            for k, i in pairs(V) do
                if i.Parent:FindFirstChild("HumanoidRootPart") and not X[i.Parent] then
                    table.insert(W, i.Parent:FindFirstChild("HumanoidRootPart"))
                    X[i.Parent] = true
                end
            end
            V = W
            if #V > 0 then
                local Y = debug.getupvalue(U.attack, 5)
                local Z = debug.getupvalue(U.attack, 6)
                local _ = debug.getupvalue(U.attack, 4)
                local a0 = debug.getupvalue(U.attack, 7)
                local a1 = (Y * 798405 + _ * 727595) % Z
                local a2 = _ * 798405
                (function()
                    a1 = (a1 * Z + a2) % 1099511627776
                    Y = math.floor(a1 / Z)
                    _ = a1 - Y * Z
                end)()
                a0 = a0 + 1
                debug.setupvalue(U.attack, 5, Y)
                debug.setupvalue(U.attack, 6, Z)
                debug.setupvalue(U.attack, 4, _)
                debug.setupvalue(U.attack, 7, a0)
                pcall(
                    function()
                        if PBlade.Character:FindFirstChildOfClass("Tool") and U.blades and U.blades[1] then
                            U.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                "weaponChange",
                                tostring(GetCurrentBlade())
                            )
                            game.ReplicatedStorage.Remotes.Validator:FireServer(
                                math.floor(a1 / 1099511627776 * 16777215),
                                a0
                            )
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", V, h, "")
                        end
                    end
                )
            end
        end
    end
end

local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
spawn(function()
    while task.wait() do
        if KillPlayerAttack and CombatFramework.activeController then
            Click()
            CombatFramework.activeController.attacking = false
            CombatFramework.activeController.timeToNextAttack = 0
            CombatFramework.activeController.increment = 3
            CombatFramework.activeController.hitboxMagnitude = 70
            CombatFramework.activeController.blocking = false
            CombatFramework.activeController.timeToNextBlock = 0
            CombatFramework.activeController.focusStart = 0
            CombatFramework.activeController.humanoid.AutoRotate = true
        end
    end
end)

function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while task.wait() do
        if KillPlayerAttack then
            AttackNoCD()
        end
    end
end)

-- [ Ui & Create Tab ]

local Nani = loadstring(game:HttpGet("https://raw.githubusercontent.com/HuyLocDz/Ui/main/UiDeoBiet.lua"))()

local Window = Nani:CreateWindow({
   Name = "ArrayField Example Window",
   LoadingTitle = "ArrayField Interface Suite",
   LoadingSubtitle = "by Arrays",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "ArrayField"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Actions = {
            [1] = {
                Text = 'Click here to copy the key link <--',
                OnPress = function()
                    print('Pressed')
                end,
                }
            },
      Key = {"Hello"}
   }
})

local Setting = Window:CreateTab(Name = "Settings", 16730867128)
local Farm = Window:CreateTab(Name = "Farm", 16730867128)
local FruitRaid = Window:CreateTab(Name = "Fruit & Raid", 16730867128)
local Other = Window:CreateTab(Name = "Other", 16730867128)
local ItemQuest = Window:CreateTab(Name = "Item & Quest", 16730867128)
local Player = Window:CreateTab(Name = "Player", 16730867128)
local PvP = Window:CreateTab(Name = "PvP", 16730867128)
local Sea = Window:CreateTab(Name = "Sea Event", 16730867128)
local Race = Window:CreateTab(Name = "Race", 16730867128)
local StatsEsp = Window:CreateTab(Name = "Stats & Esp", 16730867128)
local Teleport = Window:CreateTab(Name = "Teleport", 16730867128)
local StatusServer = Window:CreateTab(Name = "Status & Server", 16730867128)
local Shop = Window:CreateTab(Name = "Shop", 16730867128)

-- [ Tab Setting ]

local Section = Setting:AddSection("~ Setting Farm ~", true)

Setting:AddDropdown({
	Name = "Select Weapon",
	Options = {"Melee","Sword","Gun","Blox Fruit"},
	CurrentOption = "Melee",
	MultiSelection = false,
	Callback = function(Done)
		_G.SelectWeapons = Done
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
	Name = "Select Speed Attack",
	Options = {"No Delay [ 0.0s ]","Super Fast [ 0.05s ]","Fast [ 0.1s ]","Moderate [ 0.3s ]","Default [ 0.5s ]","Medium [ 0.8s ]","Slow [ 1.0s ]"},
	CurrentOption = "Fast [ 0.1s ]",
	MultiSelection = false,
	Callback = function(Done)
		_G.SelectAttackDelay = Done
        if _G.SelectAttackDelay == "No Delay [ 0.0s ]" then
            _G.FastAttackDelay = 0
        elseif _G.SelectAttackDelay == "Super Fast [ 0.05s ]" then
            _G.FastAttackDelay = 0.05
        elseif _G.SelectAttackDelay == "Fast [ 0.1s ]" then
            _G.FastAttackDelay = 0.1
        elseif _G.SelectAttackDelay == "Moderate [ 0.3s ]" then
            _G.FastAttackDelay = 0.3
        elseif _G.SelectAttackDelay == "Default [ 0.5s ]" then
            _G.FastAttackDelay = 0.5
        elseif _G.SelectAttackDelay == "Medium [ 0.8s ]" then
            _G.FastAttackDelay = 0.8
        elseif _G.SelectAttackDelay == "Slow [ 1.0s ]" then
            _G.FastAttackDelay = 1
        else
            _G.FastAttackDelay = 0.5
        end
	end
})

Setting:AddToggle({
	Name = "Fast Attack",
	CurrentValue = true,
	Callback = function()
		_G.FastAttack = Done
	end
})

spawn(function()
    while task.wait(_G.FastAttackDelay) do
        if _G.FastAttack then
            AttackNoCD()
        end
    end
end)

Setting:AddToggle({
	Name = "Auto Click",
	CurrentValue = false,
	Callback = function(Done)
		_G.AutoClick = Done
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

Setting:AddToggle({
	Name = "Bring Mobs",
	CurrentValue = true,
	Callback = function(Done)
		_G.BringMonster = Done
	end
})

Nani:LoadConfiguration()
