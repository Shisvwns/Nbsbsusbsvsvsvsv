-- Anti Ban & Afk & Auto Team --

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

-- Check World --

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game.Players.LocalPlayer:Kick("Script Only Support Blox Fruit")
end

-- Check Mob, Boss, Material --

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

function CheckMaterialMob()
    if World1 then
        if _G.SelectMaterial == "Magma Ore" then
            MMon = "Military Soldier"
            MPos = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
            MMon1 = "Military Spy"
            MPos1 = CFrame.new(-5815, 84, 8820)
        elseif _G.SelectMaterial == "Leather" or _G.SelectMaterial == "Scrap Metal" then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
            MMon1 = "Pirate"
            MPos1 = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif _G.SelectMaterial == "Angel Wings" then
            MMon = "God's Guard"
            MPos = CFrame.new(-4698, 845, -1912)
            MMon1 = "God's Guard"
            MPos1 = CFrame.new(-4698, 845, -1912)
        elseif _G.SelectMaterial == "Fish Tail" then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
            MMon1 = "Fishman Commando"
            MPos1 = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        end
    elseif World2 then
        if _G.SelectMaterial == "Magma Ore" then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
            MMon1 = "Lava Pirate"
            MPos1 = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif _G.SelectMaterial == "Leather" or _G.SelectMaterial == "Scrap Metal" then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010, 73, -3326)
            MMon1 = "Marine Captain"
            MPos1 = CFrame.new(-2010, 73, -3326)
        elseif _G.SelectMaterial == "Radioactive Material" then
            MMon = "Factory Staff"
            MPos = CFrame.new(295, 73, -56)
            MMon1 = "Factory Staff"
            MPos1 = CFrame.new(295, 73, -56)
        elseif _G.SelectMaterial == "Vampire Fang" then
            MMon = "Vampire"
            MPos = CFrame.new(-6033, 7, -1317)
            MMon1 = "Vampire"
            MPos1 = CFrame.new(-6033, 7, -1317)
        elseif _G.SelectMaterial == "Mystic Droplet" then
            MMon = "Water Fighter"
            MPos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
            MMon1 = "Sea Soldier"
            MPos1 = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        end
    elseif World3 then
        if _G.SelectMaterial == "Mini Tusk" then
            MMon = "Mythological Pirate"
            MPos = CFrame.new(-13545, 470, -6917)
            MMon1 = "Mythological Pirate"
            MPos1 = CFrame.new(-13545, 470, -6917)
        elseif _G.SelectMaterial == "Fish Tail" then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
            MMon1 = "Fishman Captain"
            MPos1 = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif _G.SelectMaterial == "Leather" or _G.SelectMaterial == "Scrap Metal" then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107, 332, -10549)
            MMon1 = "Jungle Pirate"
            MPos1 = CFrame.new(-12107, 332, -10549)
        elseif _G.SelectMaterial == "Dragon Scale" then
            MMon = "Dragon Crew Warrior"
            MPos = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
            MMon1 = "Dragon Crew Warrior"
            MPos1 = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif _G.SelectMaterial == "Conjured Cocoa" then
            MMon = "Cocoa Warrior"
            MPos = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
            MMon1 = "Chocolate Bar Battler"
            MPos1 = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif _G.SelectMaterial == "Demonic Wisp" then
            MMon = "Demonic Soul"
            MPos = CFrame.new(-9507, 172, 6158)
            MMon1 = "Demonic Soul"
            MPos1 = CFrame.new(-9507, 172, 6158)
        elseif _G.SelectMaterial == "Gunpowder" then
            MMon = "Pistol Billionaire"
            MPos = CFrame.new(-469, 74, 5904)
            MMon1 = "Pistol Billionaire"
            MPos1 = CFrame.new(-469, 74, 5904)
        end
    end
end

function CheckMobPos()
    if World1 then
        if _G.SelectMob == "Bandit" then
            PosMonster = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif _G.SelectMob == "Monkey" then
            PosMonster = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif _G.SelectMob == "Gorilla" then
            PosMonster = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif _G.SelectMob == "Pirate" then
            PosMonster = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif _G.SelectMob == "Brute" then
            PosMonster = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif _G.SelectMob == "Desert Bandit" then
            PosMonster = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
        elseif _G.SelectMob == "Desert Officer" then
            PosMonster = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
        elseif _G.SelectMob == "Snow Bandit" then
            PosMonster = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
        elseif _G.SelectMob == "Snowman" then
            PosMonster = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
        elseif _G.SelectMob == "Chief Petty Officer" then
            PosMonster = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
        elseif _G.SelectMob == "Sky Bandit" then
            PosMonster = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif _G.SelectMob == "Dark Master" then
            PosMonster = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif _G.SelectMob == "Prisoner" then
            PosMonster = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif _G.SelectMob == "Dangerous Prisoner" then
            PosMonster = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif _G.SelectMob == "Toga Warrior" then
            PosMonster = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif _G.SelectMob == "Gladiator" then
            PosMonster = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif _G.SelectMob == "Military Soldier" then
            PosMonster = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif _G.SelectMob == "Military Spy" then
            PosMonster = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif _G.SelectMob == "Fishman Warrior" then
            PosMonster = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
        elseif _G.SelectMob == "Fishman Commando" then
            PosMonster = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif _G.SelectMob == "God's Guard" then
            PosMonster = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif _G.SelectMob == "Shanda" then
            PosMonster = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
        elseif _G.SelectMob == "Royal Squad" then
            PosMonster = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
        elseif _G.SelectMob == "Royal Soldier" then
            PosMonster = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif _G.SelectMob == "Galley Pirate" then
            PosMonster = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif _G.SelectMob == "Galley Captain" then
            PosMonster = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if _G.SelectMob == "Raider" then
            PosMonster = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        elseif _G.SelectMob == "Mercenary" then
            PosMonster = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
        elseif _G.SelectMob == "Swan Pirate" then
            PosMonster = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
        elseif _G.SelectMob == "Factory Staff" then
            PosMonster = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
        elseif _G.SelectMob == "Marine Lieutenant" then
            PosMonster = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
        elseif _G.SelectMob == "Marine Captain" then
            PosMonster = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
        elseif _G.SelectMob == "Zombie" then
            PosMonster = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
        elseif _G.SelectMob == "Vampire" then
            PosMonster = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
        elseif _G.SelectMob == "Snow Trooper" then
            PosMonster = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
        elseif _G.SelectMob == "Winter Warrior" then
            PosMonster = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
        elseif _G.SelectMob == "Lab Subordinate" then
            PosMonster = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
        elseif _G.SelectMob == "Horned Warrior" then
            PosMonster = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
        elseif _G.SelectMob == "Magma Ninja" then
            PosMonster = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
        elseif _G.SelectMob == "Lava Pirate" then
            PosMonster = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
        elseif _G.SelectMob == "Ship Deckhand" then
            PosMonster = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
        elseif _G.SelectMob == "Ship Engineer" then
            PosMonster = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
        elseif _G.SelectMob == "Ship Steward" then
            PosMonster = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
        elseif _G.SelectMob == "Ship Officer" then
            PosMonster = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
        elseif _G.SelectMob == "Arctic Warrior" then
            PosMonster = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
        elseif _G.SelectMob == "Snow Lurker" then
            PosMonster = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
        elseif _G.SelectMob == "Sea Soldier" then
            PosMonster = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
        elseif _G.SelectMob == "Water Fighter" then
            PosMonster = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
        end
    elseif World3 then
        if _G.SelectMob == "Pirate Millionaire" then
            PosMonster = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        elseif _G.SelectMob == "Pistol Billionaire" then
            PosMonster = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
        elseif _G.SelectMob == "Dragon Crew Warrior" then
            PosMonster = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
        elseif _G.SelectMob == "Dragon Crew Archer" then 
            PosMonster = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
        elseif _G.SelectMob == "Female Islander" then
            PosMonster = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
        elseif _G.SelectMob == "Giant Islander" then 
            PosMonster = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
        elseif _G.SelectMob == "Marine Commodore" then
            PosMonster = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
        elseif _G.SelectMob == "Marine Rear Admiral" then
            PosMonster = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
        elseif _G.SelectMob == "Fishman Raider" then
            PosMonster = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
        elseif _G.SelectMob == "Fishman Captain" then
            PosMonster = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
        elseif _G.SelectMob == "Forest Pirate" then
            PosMonster = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
        elseif _G.SelectMob == "Mythological Pirate" then
            PosMonster = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
        elseif _G.SelectMob == "Jungle Pirate" then
            PosMonster = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
        elseif _G.SelectMob == "Musketeer Pirate" then
            PosMonster = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
        elseif _G.SelectMob == "Reborn Skeleton" then
            PosMonster = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
        elseif _G.SelectMob == "Living Zombie" then
            PosMonster = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
        elseif _G.SelectMob == "Demonic Soul" then
            PosMonster = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
        elseif _G.SelectMob == "Posessed Mummy" then
            PosMonster = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
        elseif _G.SelectMob == "Peanut Scout" then
            PosMonster = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
        elseif _G.SelectMob == "Peanut President" then
            PosMonster = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
        elseif _G.SelectMob == "Ice Cream Chef" then
            PosMonster = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
        elseif _G.SelectMob == "Ice Cream Commander" then
            PosMonster = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
        elseif _G.SelectMob == "Cookie Crafter" then
            PosMonster = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
        elseif _G.SelectMob == "Cake Guard" then
            PosMonster = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
        elseif _G.SelectMob == "Baking Staff" then
            PosMonster = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
        elseif _G.SelectMob == "Head Baker" then
            PosMonster = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
        elseif _G.SelectMob == "Cocoa Warrior" then
            PosMonster = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
        elseif _G.SelectMob == "Chocolate Bar Battler" then
            PosMonster = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
        elseif _G.SelectMob == "Sweet Thief" then
            PosMonster = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
        elseif _G.SelectMob == "Candy Rebel" then
            PosMonster = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
        elseif _G.SelectMob == "Candy Pirate" then
            PosMonster = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
        elseif _G.SelectMob == "Snow Demon" then
            PosMonster = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
        elseif _G.SelectMob == "Isle Outlaw" then
            PosMonster = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
        elseif _G.SelectMob == "Island Boy" then
            PosMonster = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
        elseif _G.SelectMob == "Sun-kissed Warrior" then
            PosMonster = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
        elseif _G.SelectMob == "Isle Champion" then
            PosMonster = CFrame.new(-16347.4150390625, 92.09503936767578, 1122.335205078125)
        end
    end
end

function CheckBossPos()
	if World1 then
		if _G.SelectBoss == "Saber Expert" then
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
		elseif _G.SelectBoss == "The Saw" then
			CFrameBoss = CFrame.new(-683.519897, 13.8534927, 1610.87854, -0.290192783, 6.88365773e-08, 0.956968188, 6.98413629e-08, 1, -5.07531119e-08, -0.956968188, 5.21077759e-08, -0.290192783)
		elseif _G.SelectBoss == "Greybeard" then
			CFrameBoss = CFrame.new(-4955.72949, 80.8163834, 4305.82666, -0.433646321, -1.03394289e-08, 0.901083171, -3.0443168e-08, 1, -3.17633075e-09, -0.901083171, -2.88092288e-08, -0.433646321)
		elseif _G.SelectBoss == "The Gorilla King" then
			CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
		elseif _G.SelectBoss == "Bobby" then
			CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
		elseif _G.SelectBoss == "Yeti" then
			CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
		elseif _G.SelectBoss == "Mob Leader" then
			CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.92824)
		elseif _G.SelectBoss == "Vice Admiral" then
			CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
		elseif _G.SelectBoss == "Warden" then
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.SelectBoss == "Chief Warden" then
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.SelectBoss == "Swan" then
			CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
		elseif _G.SelectBoss == "Magma Admiral" then
			CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
		elseif _G.SelectBoss == "Fishman Lord" then
			CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
		elseif _G.SelectBoss == "Wysper" then
			CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
		elseif _G.SelectBoss == "Thunder God" then
			CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
		elseif _G.SelectBoss == "Cyborg" then
			CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
		end
	elseif World2 then
		if _G.SelectBoss == "Diamond" then
			CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
		elseif _G.SelectBoss == "Jeremy" then
			CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
		elseif _G.SelectBoss == "Fajita" then
			CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
		elseif _G.SelectBoss == "Don Swan" then
			CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
		elseif _G.SelectBoss == "Smoke Admiral" then
			CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
		elseif _G.SelectBoss == "Cursed Captain" then
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
		elseif _G.SelectBoss == "Darkbeard" then
			CFrameBoss = CFrame.new(3876.00366, 24.6882591, -3820.21777, -0.976951957, 4.97356325e-08, 0.213458836, 4.57335361e-08, 1, -2.36868622e-08, -0.213458836, -1.33787044e-08, -0.976951957)
		elseif _G.SelectBoss == "Order" then
			CFrameBoss = CFrame.new(-6221.15039, 16.2351036, -5045.23584, -0.380726993, 7.41463495e-08, 0.924687505, 5.85604774e-08, 1, -5.60738549e-08, -0.924687505, 3.28013137e-08, -0.380726993)
		elseif _G.SelectBoss == "Awakened Ice Admiral" then
			CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
		elseif _G.SelectBoss == "Tide Keeper" then
			CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
		end
	elseif World3 then
		if _G.SelectBoss == "Stone" then
			CFrameBoss = CFrame.new(-1085, 40, 6779)
		elseif _G.SelectBoss == "Island Empress" then
			CFrameBoss = CFrame.new(5659, 602, 244)
		elseif _G.SelectBoss == "Kilo Admiral" then
			CFrameBoss =CFrame.new(2846, 433, -7100)
		elseif _G.SelectBoss == "Captain Elephant" then
			CFrameBoss = CFrame.new(-13221, 325, -8405)
		elseif _G.SelectBoss == "Beautiful Pirate" then
			CFrameBoss = CFrame.new(5182, 23, -20)
		elseif _G.SelectBoss == "Cake Queen" then
			CFrameBoss = CFrame.new(-821, 66, -10965)
		elseif _G.SelectBoss == "rip_indra True Form" then
			CFrameBoss = CFrame.new(-5359, 424, -2735)
		elseif _G.SelectBoss == "Longma" then
			CFrameBoss = CFrame.new(-10248.3936, 353.79129, -9306.34473)
		elseif _G.SelectBoss == "Soul Reaper" then
			CFrameBoss = CFrame.new(-9515.62109, 315.925537, 6691.12012)
		elseif _G.SelectBoss == "Dough King" then
			CFrameBoss = CFrame.new(-2077, 252, -12373)
		elseif _G.SelectBoss == "Cake Prince" then
			CFrameBoss = CFrame.new(-2077, 252, -12373)
		end
	end
end

-- Esp --

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if _G.EspPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild("NameEsp"..Number) then
                        local bill = Instance.new("BillboardGui", v.Character.Head)
                        bill.Name = "NameEsp"..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size12"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 105, 180)
                    else
                        v.Character.Head["NameEsp"..Number].TextLabel.Text = ("[ Player: "..v.Name.." ]\n[ Distance: "..round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3).."m ]")
                    end
                else
                    if v.Character.Head:FindFirstChild("NameEsp"..Number) then
                        v.Character.Head:FindFirstChild("NameEsp"..Number):Destroy()
                    end
                end
            end
        end)
    end
end

function UpdateIslandESP()
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.EspIsland then
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size12"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 165, 0)
                    else
                        v["NameEsp"].TextLabel.Text = ("[ Island: "..v.Name.." ]\n[ Distance: "..round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude/3).."m ]")
                    end
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function UpdateChestChams()
	for i, v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name, "Chest") then
				if _G.EspChest then
					if string.find(v.Name, "Chest") then
						if not v:FindFirstChild("NameEsp"..Number) then
							local bill = Instance.new("BillboardGui", v)
							bill.Name = "NameEsp"..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1, 200, 1, 30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new("TextLabel", bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size12"
							name.TextWrapped = true
							name.Size = UDim2.new(1, 0, 1, 0)
							name.TextYAlignment = "Top"
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
		    			    v["NameEsp"..Number].TextLabel.Text = ("[ "..v.Name.." ]\n[ Distance: "..round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude/3).."m ]")
						end
					end
				else
					if v:FindFirstChild("NameEsp"..Number) then
						v:FindFirstChild("NameEsp"..Number):Destroy()
					end
				end
			end
		end)
	end
end

function UpdateDevilChams()
	for i, v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if _G.EspDevilFruit then
				if string.find(v.Name, "Fruit") then
					if not v.Handle:FindFirstChild("NameEsp"..Number) then
						local bill = Instance.new("BillboardGui", v.Handle)
						bill.Name = "NameEsp"..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size12"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
					else
						v.Handle["NameEsp"..Number].TextLabel.Text = ("[ "..v.Name.." ]\n[ Distance: "..round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3).."m ]")
					end
				end
			else
				if v.Handle:FindFirstChild("NameEsp"..Number) then
					v.Handle:FindFirstChild("NameEsp"..Number):Destroy()
				end
			end
		end)
	end
end

function UpdateFlowerChams()
	for i, v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if _G.EspFlower then
					if not v:FindFirstChild("NameEsp"..Number) then
						local bill = Instance.new("BillboardGui", v)
						bill.Name = "NameEsp"..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1, 200, 1, 30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel", bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size12"
						name.TextWrapped = true
						name.Size = UDim2.new(1, 0, 1, 0)
						name.TextYAlignment = "Top"
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
                        v["NameEsp"..Number].TextLabel.Text = ("[ "..v.Name.." ]\n[ Distance: "..round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude/3).."m ]")
					end
				else
					if v:FindFirstChild("NameEsp"..Number) then
					v:FindFirstChild("NameEsp"..Number):Destroy()
					end
				end
			end
		end)
	end
end

-- Equip Weapon & Un Equip Weapon --

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(0.1)
        _G.NotAutoEquip = false
    end
end

function EquipWeapon(Weapon)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon) then
        local Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
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

-- Tween & Pos Farm --

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
            task.wait(0.01)
            WaitHRP(lp).CFrame = PartTele.CFrame
        end)
    end
    Portal = GetPortal(Pos) 
    Spawn = GetBypassPos(Pos) 
    MyCFrame = WaitHRP(lp).CFrame
    Distance = CalcDistance(MyCFrame, Pos)
    if CalcDistance(Portal, Pos) < CalcDistance(Pos) and CalcDistance(Portal) > 700 then
        return RequestEntrance(Portal)
    end
    if _G.BypassTeleport then
        if CalcDistance(Pos) - CalcDistance(Spawn, Pos) > 1200 and CalcDistance(Spawn) > 1200 then
            return BypassTeleport(Spawn)
        end
    end
    if lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid:FindFirstChild("Sit") and lp.Character.Humanoid.Sit == true then
        lp.Character.Humanoid.Sit = false
    end
    _G.NoClip = true
    Tween = game:GetService("TweenService"):Create(lp.Character.PartTele, TweenInfo.new(Distance / _G.FlySpeed, Enum.EasingStyle.Linear),{CFrame = Pos})
    if Distance <= 250 then
        Tween:Cancel()
        lp.Character.PartTele.CFrame = Pos
    end
    Tween:Play()
end

spawn(function()
    while task.wait() do
        if lp.Character:FindFirstChild("Humanoid").Health <= 0 or not lp.Character:FindFirstChild("HumanoidRootPart") then
            if lp.Character:FindFirstChild("PartTele") then
                lp.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
        if lp.Character:FindFirstChild("PartTele") then
            if (lp.Character.HumanoidRootPart.Position - lp.Character:FindFirstChild("PartTele").Position).Magnitude >= 100 then
                lp.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)

function StopTween(target)
    if not target then
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.NoClip = false
        _G.NoClip = false
    end
end

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
                local player = game:GetService("Players").LocalPlayer
                local humanoid = player.Character:FindFirstChild("Humanoid")
                local bodyVelocity = player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                if humanoid and bodyVelocity then
                    local moveDirection = humanoid.MoveDirection
                    moveDirection = Vector3.new(moveDirection.X, 0, moveDirection.Z)  -- Loại bỏ trục Y
                    bodyVelocity.Velocity = moveDirection * 60
                end
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            else
                local bodyVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end
            end
        end)
    end)
end)

-- Check Status --

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
        return "Frozen Dimension Island Spawned :)"
    else
        return "Frozen Dimension Island Not Spawned :("
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

-- Aimbot Farm --

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

-- Animation --

require(game.ReplicatedStorage.Util.CameraShaker):Stop()
spawn(function()
    pcall(function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Texture") then
                v.Texture = ""
            elseif v:IsA("BasePart") and v.Material == Enum.Material.Water then
                v.Material = Enum.Material.SmoothPlastic
            end
        end
        for _, v in pairs(r33_33arg.LocalPlayer.PlayerScripts:GetDescendants()) do
            local v641_args = {"WaterBlur", "WaterEffect", "WaterColorCorrection", "WaterCFrame"}
            if table.find(v641_args, v.Name) then
                v:Destroy()
                game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit'):Destroy()
                game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
            end
        end
    end)
end)

-- Super Fast Attack --

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

getAllBladeHits = function(Sizes)
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
end

getAllBladeHitsPlayers = function(Sizes)
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
end

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

CancelCoolDown = function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FastAttackDelay or 0.01) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		task.delay((FastAttackDelay or 0.01) + ((FireL+0.3/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end

AttackFunction = function(typef)
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
end

function CheckStun()
	if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
		return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
	end
	return false
end

task.spawn(function()
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

inmyselfss = function(name)
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
end

task.spawn(function() 
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then 
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
                            hookfunction(v,function() end)
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
                            pcall(function()
                                h(i)
                            end)
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

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
Mouse.Button1Down:Connect(function()
	if ClickNoCooldown then
		local ac = CombatFrameworkR.activeController
		if ac and ac.equipped then
			ac.hitboxMagnitude = 55
			pcall(AttackFunction,3)
		end
	end
end)

-- Create Menu & Tab --

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Shisvwns/Nbsbsusbsvsvsvsv/refs/heads/main/Testui.lua"))()
local Window =OrionLib:MakeWindow({Name = "Tinh Linh Hub", IntroEnabled = true, IntroText = "Tinh Linh Hub Script", IntroIcon = "rbxassetid://16730867128", HidePremium = false, SaveConfig = true, ConfigFolder = "TinhLinhHub"})

OrionLib:MakeNotification({
    Name = "Tinh Linh Hub",
    Content = "Loading Script Tinh Linh Hub...",
    Image = "rbxassetid://16730867128",
    Time = 5
})

local Setting = Window:MakeTab({Name = "Setting", Icon = "rbxassetid://10734950309", PremiumOnly = false})
local Farm = Window:MakeTab({Name = "Farm", Icon = "rbxassetid://10734975486", PremiumOnly = false})
local FruitRaid = Window:MakeTab({Name = "Fruit & Raid", Icon = "rbxassetid://10709770005", PremiumOnly = false})
local Other = Window:MakeTab({Name = "Miscellaneous", Icon = "rbxassetid://10709782582", PremiumOnly = false})
local ItemQuest = Window:MakeTab({Name = "Item & Quest", Icon = "rbxassetid://10709769508", PremiumOnly = false})
local Player = Window:MakeTab({Name = "Local Player", Icon = "rbxassetid://10734920149", PremiumOnly = false})
local PvP = Window:MakeTab({Name = "PvP", Icon = "rbxassetid://10734975692", PremiumOnly = false})
local Sea = Window:MakeTab({Name = "Sea Event", Icon = "rbxassetid://10709761530", PremiumOnly = false})
local Hold = Window:MakeTab({Name = "Hold & Use Skill", Icon = "rbxassetid://10709752630", PremiumOnly = false})
local Race = Window:MakeTab({Name = "Upgrade Race", Icon = "rbxassetid://10747372167", PremiumOnly = false})
local StatsEsp = Window:MakeTab({Name = "Stats & Esp", Icon = "rbxassetid://10709762879",PremiumOnly = false})
local Teleport = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://10734886004", PremiumOnly = false})
local StatusServer = Window:MakeTab({Name = "Status & Server", Icon = "rbxassetid://10734949856", PremiumOnly = false})
local Shop = Window:MakeTab({Name = "Shop", Icon = "rbxassetid://10734952273", PremiumOnly = false})

-- Tab Setting ]

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
	    pcall(function()
			if _G.SelectWeapons == _G.SelectWeapons then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == _G.SelectWeapons then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
end)

Setting:AddDropdown({
	Name = "Select Speed Attack",
	Default = "Fast [ 0.1s ]",
	Options = {"No Delay [ 0.0s ]","Super Fast [ 0.05s ]","Fast [ 0.1s ]","Moderate [ 0.3s ]","Default [ 0.5s ]","Medium [ 0.8s ]","Slow [ 1.0s ]"},
	Callback = function(Value)
		_G.AttackSpeed = Value
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

Setting:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
		Fast_Attack =Value
		DamageAura = Value
		ClickNoCooldown = Value
		NeedAttacking = Value
		UsefastattackPlayers = Value
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
		_G.BringMob = Value
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

Setting:AddToggle({
	Name = "Bring Mob",
	Default = true,
	Callback = function(Value)
		_G.BringMobs = Value
	end
})

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
        pcall(function()
            if _G.BringMobs then
                CheckQuest()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.FarmLevel or _G.FruitsMastery or _G.GunMastery or _G.FarmAllMelee or _G.FarmAllSword then
                        if StartMagnet and v.Name == Mon and (v.HumanoidRootPart.Position - PosFarm.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosFarm
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if MagnetNear then
                        if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - PosNear.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosNear
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                        if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = MusketeerHatMon
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.Auto_EvoRace and StartEvoMagnet then
                        if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonEvo
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.FarmMaterial and BringMonMaterial then
                        if (v.Name == MMon or v.Name == MMon1) and (v.HumanoidRootPart.Position - MaterialPos.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = MaterialPos
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.FarmMob and SelectMag then
                        if v.Name == _G.SelectMob and (v.HumanoidRootPart.Position - PosMonFarm.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonFarm
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                    if _G.AutoBartilo and AutoBartiloBring then
                        if v.Name == "Swan Pirate" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= BringRange then
                            v.HumanoidRootPart.CFrame = PosMonBarto
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)   
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end)
    end
end)

local Section = Setting:AddSection({
    Name = "~ Move ~"
})

Setting:AddSlider({
	Name = "Fly Speed",
	Min = 1,
	Max = 400,
	Default = 350,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		_G.FlySpeed = Value
	end
})

Setting:AddToggle({
	Name = "Bypass Teleport",
	Default = true,
	Callback = function(Value)
		_G.BypassTeleport = Value
	end
})

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

Setting:AddToggle({
	Name = "Disabled Notifications Text",
	Default = false,
	Callback = function(Value)
		_G.DisabledNotify = Value
	end
})

Setting:AddToggle({
	Name = "Disabled Damage Counter",
	Default = true,
	Callback = function(Value)
		_G.DisabledDamage = Value
	end
})

spawn(function()
	while wait() do
	    pcall(function()
        	if _G.DisabledNotify then
	    		game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
    		else
	    		game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
	    	end
	    	if _G.DisabledDamage then
	    		game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
	    	else
		    	game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
    		end
        end)
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
        FpsBooster()
    end
})

function FpsBooster()
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
        RemoveLava()
    end
})

function RemoveLava()
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

Setting:AddSlider({
	Name = "Select Brightnes",
	Min = 1,
	Max = 100,
	Default = 20,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.Brightness = Value
	end
})

Setting:AddButton({
    Name = "Set Brightnes",
    Callback = function()
        game:GetService("Lighting").Brightness = _G.Brightness
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

-- Tab Farm --

local Section = Farm:AddSection({
    Name = "~ Level ~"
})

local YourLevel = Farm:AddParagraph("Your Level")

Farm:AddDropdown({
	Name = "Select Farm Level Mode",
	Default = "Get Quest",
	Options = {"No Quest","Get Quest"},
	Callback = function(Value)
		_G.LevelMode = Value
	end
})

local CayLevel = Farm:AddToggle({
	Name = "Auto Farm Level",
	Default = false,
	Callback = function(Value)
		_G.FarmLevel = Value
        StopTween(_G.FarmLevel)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.FarmLevel then
                CheckQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and _G.LevelMode == "Get Quest" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and _G.LevelMode == "Get Quest" then
                    StartMagnet = false
	    			topos(CFrameQuest)
		    		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 10 then
	    				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.LevelMode == "No Quest" then
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
                                        until not _G.FarmLevel or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    else
                        StartMagnet = false
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                    end
                end
            end
        end)
    end
end)

Farm:AddToggle({
	Name = "Farm Fast [ Lv. 1 -> Lv. 250 ]",
	Default = false,
	Callback = function(Value)
		_G.FarmFast = Value
        StopTween(_G.FarmFast)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.FarmFast then
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("TantaiGaming")
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
                                    PosNear = v.HumanoidRootPart.CFrame
                                    MagnetNear = true
                                until not _G.FarmFast or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health <= 0
                                MagnetNear = false
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
                                        topos(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,5))
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
                                    until not _G.FarmFast or not v:FindFirstChild("HumanoidRootPart") or v.Character.Humanoid.Health <= 0
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
                        HopServer()
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
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Melee",
                        [3] = 5
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)

Farm:AddToggle({
	Name = "Auto Farm Nearest",
	Default = false,
	Callback = function(Value)
		_G.FarmNearest = Value
        StopTween(_G.FarmNearest)
	end
})

spawn(function()
	while wait() do
	    pcall(function()
	    	if _G.FarmNearest then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
         	       if v.Name and v:FindFirstChild("Humanoid") then
				        if v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			 	           repeat wait()
			     	           EquipWeapon(_G.SelectWeapon)
			  	              topos(v.HumanoidRootPart.CFrame * Pos)
			 	               PosNear = v.HumanoidRootPart.CFrame
					        	MagnetNear = true
				            until not _G.FarmNearest or not v.Parent or v.Humanoid.Health <= 0 
				            MagnetNear = false
				        end
				    end
				end
			end
		end)
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
		_G.KatakuriMode = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Cake Prince",
	Default = false,
	Callback = function(Value)
		_G.FarmKatakuri = Value
        StopTween(_G.FarmKatakuri)
	end
})

spawn(function()
	while wait() do
	    pcall(function()
	    	if _G.FarmKatakuri then
	            if _G.SpawnKatakuri then
				    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
				end
				if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") and _G.KatakuriMode == "Get Quest" then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and _G.KatakuriMode == "Get Quest" then
					MagnetNear = false
					topos(CFrame.new(-2020, 38, -12025))
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-2020, 38, -12025).Position).Magnitude <= 10 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.KatakuriMode == "No Quest" then
					if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if _G.FarmKatakuri and v.Name == "Cake Prince" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat wait()
									    EquipWeapon(_G.SelectWeapon)
							    		topos(v.HumanoidRootPart.CFrame * Pos)
										PosNear = v.HumanoidRootPart.CFrame
										MagnetNear = true
									until not _G.FarmKatakuri or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince")
								end
							end
						else
							if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053) * CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
								wait(.1)
							end
						end
					else
						if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if 0 and (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat wait()
									    EquipWeapon(_G.SelectWeapon)
							    		topos(v.HumanoidRootPart.CFrame * Pos)
										PosNear = v.HumanoidRootPart.CFrame
										MagnetNear = true
									until not _G.FarmKatakuri or not v.Parent or v.Humanoid.Health <= 0
									MagnetNear = false
								end
							end
						else
							MagnetNear = false
							topos(CFrame.new(-2077, 252, -12373))
							UnEquipWeapon(_G.SelectWeapon)
						end
					end
				end
			end
		end)
	end
end)

Farm:AddToggle({
	Name = "Auto Spawn Katakuri",
	Default = true,
	Callback = function(Value)
		_G.SpawnKatakuri = Value
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
		_G.BoneMode = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Bone",
	Default = false,
	Callback = function(Value)
		_G.FarmBone = Value
		StopTween(_G.FarmBone)
	end
})

spawn(function()
	while wait() do
		pcall(function()
			if _G.FarmBone then
				if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") and _G.BoneMode == "Get Quest" then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and _G.BoneMode == "Get Quest" then
					MagnetNear = false
					topos(CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0))
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0).Position).Magnitude <= 10 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true or _G.BoneMode == "No Quest" then
					if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat wait()
										EquipWeapon(_G.SelectWeapon)
										topos(v.HumanoidRootPart.CFrame * Pos)
										PosNear = v.HumanoidRootPart.CFrame
										MagnetNear = true
									until not _G.FarmBone or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
								end
							end
						end
					end
				else
				    MagnetNear = false
					topos(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
					UnEquipWeapon(_G.SelectWeapon)
				end
			end
		end)
	end
end)

Farm:AddToggle({
	Name = "Auto Random Bone",
	Default = false,
	Callback = function(Value)
		_G.RandomBone = Value
	end
})

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.RandomBone then    
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end)
    end
end)

Farm:AddToggle({
	Name = "Auto Spawn & Kill Soul Reaper",
	Default = false,
	Callback = function(Value)
		_G.SoulReaper = Value
		StopTween(_G.SoulReaper)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.SoulReaper and World3 then
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
                                    until not _G.SoulReaper or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                else
                    local args = {
                        [1] = "Bones",
                        [2] = "Buy",
                        [3] = 1,
                        [4] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)

local Section = Farm:AddSection({
    Name = "~ Gun & Devil Fruit Mastery ~"
})

Farm:AddToggle({
	Name = "Auto Farm Devil Fruit Mastery",
	Default = false,
	Callback = function(Value)
		_G.FruitsMastery = Value
		StopTween(_G.FruitsMastery)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.FruitsMastery then
                CheckQuest()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    repeat wait()
                        topos(CFrameQuest)
                    until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.FruitsMastery
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMs = v.Humanoid.MaxHealth * _G.MobHealth/100
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
                                        until not _G.FruitsMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        UseSkill = false
                                        Skillaimbot = false
                                    end
                                end
                            end
                        end
                    else
                        StartMagnet = false
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                        UnEquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                    end
                end
            end
        end)
    end
end)

Farm:AddToggle({
	Name = "Auto Farm Gun Mastery",
	Default = false,
	Callback = function(Value)
		_G.GunMastery = Value
		StopTween(_G.GunMastery)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.GunMastery then
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
                                            HealthMin = v.Humanoid.MaxHealth * _G.MobHealth/100
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
                                        until v.Humanoid.Health <= 0 or _G.GunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        UseGunSkill = false
                                        Skillaimbot = false
                                    end
                                end
                            end
                        end)
                    else
                       StartMagnet = false
                       topos(CFrameMon)
                       UnEquipWeapon(_G.SelectWeapon)
                       UnEquipWeapon(EquipWeaponGun())
                    end
                end
            end
        end)
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
		_G.MobHealth = Value
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
        pcall(function()
            if UseSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MobHealth / 100 then
                        if _G.SkillZ then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                        end
                        if _G.SkillC then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                        end
                        if _G.SkillV then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                        end
                    end
                end
            end
            if UseGunSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MobHealth / 100 then
                        if _G.SkillZ then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                        end
                        if _G.SkillX then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                        end
                    end
                end
            end
        end)
    end
end)

local Section = Farm:AddSection({
    Name = "~ Boss ~"
})

function CheckBoss()
    local Check = {"Not Found Boss"}
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain")
                or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
            table.insert(Check, v.Name)
            if table.find(Check, "Not Found Boss") then
                table.remove(Check, 1)
            end
        end
    end
    return Check
end

local BossName = Farm:AddDropdown({
	Name = "Select Boss",
	Default = "",
	Options = CheckBoss(),
	Callback = function(Value)
		_G.SelectBoss = Value
	end
})

Farm:AddButton({
    Name = "Refresh Boss List",
    Callback = function()
        BossName:Refresh(CheckBoss(), true)
    end
})

Farm:AddToggle({
	Name = "Auto Farm Boss",
	Default = false,
	Callback = function(Value)
		_G.FarmBoss = Value
		StopTween(_G.FarmBoss)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.FarmBoss then
                CheckBossPos()
				if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == _G.SelectBoss then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat wait()
									EquipWeapon(_G.SelectWeapon)
									topos(v.HumanoidRootPart.CFrame * Pos)
								until not _G.FarmBoss or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
							end
						end
					end
				else
					topos(CFrameBoss)
					UnEquipWeapon(_G.SelectWeapon)
				end
			end
		end)
	end
end)

Farm:AddToggle({
	Name = "Auto Farm All Boss",
	Default = false,
	Callback = function(Value)
		_G.FarmAllBoss = Value
		StopTween(_G.FarmAllBoss)
	end
})

spawn(function()
    while wait(3) do
        pcall(function()
            if _G.FarmAllBoss then
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                    if (v.Name == "rip_indra" or v.Name == "Ice Admiral") or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Vice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg") or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard" or v.Name == "Cursed Captain") or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                            until not _G.FarmAllBoss or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

local Section = Farm:AddSection({
    Name = "~ Mob ~"
})

if World1 then
	MobList = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	MobList = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	MobList = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end

Farm:AddDropdown({
	Name = "Select Mob",
	Default = "",
	Options = MobList,
	Callback = function(Value)
		_G.SelectMob = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Mob",
	Default = false,
	Callback = function(Value)
		_G.FarmMob = Value
		StopTween(_G.FarmMob)
	end
})

spawn(function()
    while wait() do
        if _G.FarmMob then
            pcall(function()
                CheckMobPos()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                    for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == _G.SelectMob then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    PosMonFarm = v.HumanoidRootPart.CFrame
                                    SelectMag = true
                                until not _G.FarmMob or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    SelectMag = false
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
		_G.SelectMaterial = Value
	end
})

Farm:AddToggle({
	Name = "Auto Farm Material",
	Default = false,
	Callback = function(Value)
		_G.FarmMaterial = Value
		StopTween(_G.FarmMaterial)
	end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.SelectMaterial == "Ectoplasm" and _G.FarmMaterial then
                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Captain") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" or v.Name == "Cursed Captain" then
                            repeat wait()
                                EquipWeapon(_G.SelectWeapon)
                                topos(v.HumanoidRootPart.CFrame * Pos)
                                PosNear = v.HumanoidRootPart.CFrame
                                MagnetNear = true
                            until not _G.FarmMaterial or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    MagnetNear = false
                    topos(CFrame.new(916.928589, 181.092773, 33422))
                    UnEquipWeapon(_G.SelectWeapon)
                end
            elseif _G.FarmMaterial then
                CheckMaterialMob()
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) or game:GetService("Workspace").Enemies:FindFirstChild(MMon1) then
                    for i,v in pairs (game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if v.Name == MMon or v.Name == MMon1 then
                                repeat wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    MaterialPos = v.HumanoidRootPart.CFrame
                                    BringMonMaterial = true
                                until not _G.FarmMaterial or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    BringMonMaterial = false
                    topos(MPos)
                    UnEquipWeapon(_G.SelectWeapon)
                    wait(3)
                    topos(MPos1)
                    wait(3)
                end
            end
        end)
    end
end)
