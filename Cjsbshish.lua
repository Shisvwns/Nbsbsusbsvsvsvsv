if game.PlaceId == 2753915549 then
    Sea1 = true
elseif game.PlaceId == 4442272183 then
    Sea2 = true
elseif game.PlaceId == 7449423635 then
    Sea3 = true
else
    game:GetService("Players").LocalPlayer:Kick("Support Only Blox Fruits")
end

if Sea1 then
    MobList = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Prisoner", "Dangerous Prisoner","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"} 
elseif Sea2 then
    MobList = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"} 
elseif Sea3 then
    MobList = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy", "Peanut Scout", "Peanut President", "Ice Cream Chef", "Ice Cream Commander", "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel", "Candy Pirate", "Snow Demon","Isle Outlaw","Island Boy","Isle Champion"}
end
if Sea1 then
    Boss = {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
elseif Sea2 then
    Boss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
elseif Sea3 then
    Boss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
end
local PosTemplete = CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)
local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()
local ChoMuaThuyen = CFrame.new(-16921.853515625, 9.0863618850708, 433.9601135253906)
local ConNPCTemplete = CFrame.new(28612.7148, 14896.4893, 103.860237)
local AdminPos = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
local Memaybeo = CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875)
local Anhjack5cu = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
local CavandisPos = CFrame.new(5314.58203, 22.8796749, -125.942276)
local PolePos = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
local PosRaidCastle = CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125)
local PosBone = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
local plr = game.Players.LocalPlayer
local CbFw = getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
CamShake:Stop()

function AntiKick()
    for _, descendant in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if descendant:IsA("LocalScript") then
            local blacklistNames = {"General", "Shiftlock", "FallDamage", "4444", "CamBob", "JumpCD", "Looking", "Run"}
            if table.find(blacklistNames, descendant.Name) then
                descendant:Destroy()
            end
        end
    end
    for _, descendant in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if descendant:IsA("LocalScript") then
            local blacklistNames = {"RobloxMotor6DBugFix", "Clans", "Codes", "CustomForceField", "MenuBloodSp", "PlayerList"}
            if table.find(blacklistNames, descendant.Name) then
                descendant:Destroy()
            end
        end
    end
end
AntiKick()

function QuestCheck()
    MyLevel = game: GetService("Players").LocalPlayer.Data.Level.Value
    if Sea1 then
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
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    end
    elseif MyLevel == 400 or MyLevel <= 449 then
    Mon = "Fishman Commando"
    LevelQuest = 2
    NameQuest = "FishmanQuest"
    NameMon = "Fishman Commando"
    CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
    CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    end
    elseif MyLevel == 450 or MyLevel <= 474 then
    Mon = "God's Guard"
    LevelQuest = 1
    NameQuest = "SkyExp1Quest"
    NameMon = "God's Guard"
    CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
    CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
    end
    elseif MyLevel == 475 or MyLevel <= 524 then
    Mon = "Shanda"
    LevelQuest = 2
    NameQuest = "SkyExp1Quest"
    NameMon = "Shanda"
    CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
    CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
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
    elseif Sea2 then
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
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
    end
    elseif MyLevel == 1275 or MyLevel <= 1299 then
    Mon = "Ship Engineer"
    LevelQuest = 2
    NameQuest = "ShipQuest1"
    NameMon = "Ship Engineer"
    CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
    CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
    end
    elseif MyLevel == 1300 or MyLevel <= 1324 then
    Mon = "Ship Steward"
    LevelQuest = 1
    NameQuest = "ShipQuest2"
    NameMon = "Ship Steward"
    CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
    CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
    end
    elseif MyLevel == 1325 or MyLevel <= 1349 then
    Mon = "Ship Officer"
    LevelQuest = 2
    NameQuest = "ShipQuest2"
    NameMon = "Ship Officer"
    CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
    CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
    end
    elseif MyLevel == 1350 or MyLevel <= 1374 then
    Mon = "Arctic Warrior"
    LevelQuest = 1
    NameQuest = "FrostQuest"
    NameMon = "Arctic Warrior"
    CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
    CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
    if _G.LevelFarm and(CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
    game: GetService("ReplicatedStorage").Remotes.CommF_: InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
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
    elseif Sea3 then
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
    CFrameQuest = CFrame.new(-16545.9355, 55.6863556, -173.230499)
    CFrameMon = CFrame.new(-16120.6035, 116.520554, -103.038849)
    elseif MyLevel == 2475 or MyLevel <= 2524 then
    Mon = "Island Boy"
    LevelQuest = 2
    NameQuest = "TikiQuest1"
    NameMon = "Island Boy"
    CFrameQuest = CFrame.new(-16545.9355, 55.6863556, -173.230499)
    CFrameMon = CFrame.new(-16751.3125, 121.226219, -264.015015)
    elseif MyLevel >= 2525 then
    Mon = "Isle Champion"
    LevelQuest = 2
    NameQuest = "TikiQuest2"
    NameMon = "Isle Champion"
    CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
    CFrameMon = CFrame.new(-16933.2129, 93.3503036, 999.450989)
    end
    end
    end

function Tween(Pos)
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    pcall(function()
        local tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/300, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        )
        tween:Play()
        if Distance <= 300 or _G.StopTween then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
            NoClip = false
        end
    end)
end

function Teleport(P)
    local Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = Distance >= 1 and 300 or 1
    pcall(function()
        local teleport = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = P}
        )
        teleport:Play()
        if _G.StopTween then
            teleport:Cancel()
            NoClip = false
        end
        NoClip = true
        wait(Distance/Speed)
        NoClip = false
    end)
end

function BP(P)
	pcall(function()
        repeat task.wait()
		    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		    task.wait()
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
            task.wait()
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
            task.wait()
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
    end)
end

function EquipTool(Toolse)
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Toolse)
    if tool then
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then
        return
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do
        ret = ret.Parent
    end
    return ret
end

function AttackNoCD()
    if not AutoFarmMasDevilFruit or AutoFarmMasGun then
        if not Auto_Raid then
            local AC = CbFw2.activeController
            for i = 1, 1 do 
                local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                    plr.Character,
                    {plr.Character.HumanoidRootPart},
                    60
                )
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
                    local u8 = debug.getupvalue(AC.attack, 5)
                    local u9 = debug.getupvalue(AC.attack, 6)
                    local u7 = debug.getupvalue(AC.attack, 4)
                    local u10 = debug.getupvalue(AC.attack, 7)
                    local u12 = (u8 * 798405 + u7 * 727595) % u9
                    local u13 = u7 * 798405
                    (function()
                        u12 = (u12 * u9 + u13) % 1099511627776
                        u8 = math.floor(u12 / u9)
                        u7 = u12 - u8 * u9
                    end)()
                    u10 = u10 + 1
                    debug.setupvalue(AC.attack, 5, u8)
                    debug.setupvalue(AC.attack, 6, u9)
                    debug.setupvalue(AC.attack, 4, u7)
                    debug.setupvalue(AC.attack, 7, u10)
                    pcall(function()
                        if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                            AC.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
                            game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                        end
                    end)
                end
            end
        end
    end
end

function CancelTween(FUCK)
    if not FUCK then
        _G.StopTween = true
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        NoClip = false
    end
end

function TweenIsland()
    if _G.SelectIsland == "WindMill" then
        Teleport(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
    elseif _G.SelectIsland == "Marine" then
        Teleport(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
    elseif _G.SelectIsland == "Middle Town" then
        Teleport(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
    elseif _G.SelectIsland == "Jungle" then
        Teleport(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
    elseif _G.SelectIsland == "Pirate Village" then
        Teleport(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
    elseif _G.SelectIsland == "Desert" then
        Teleport(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
    elseif _G.SelectIsland == "Snow Island" then
        Teleport(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
    elseif _G.SelectIsland == "MarineFord" then
        Teleport(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
    elseif _G.SelectIsland == "Colosseum" then
        Teleport(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
    elseif _G.SelectIsland == "Sky Island 1" then
        Teleport(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
    elseif _G.SelectIsland == "Sky Island 2" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
    elseif _G.SelectIsland == "Sky Island 3" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    elseif _G.SelectIsland == "Prison" then
        Teleport(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
    elseif _G.SelectIsland == "Magma Village" then
        Teleport(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
    elseif _G.SelectIsland == "Under Water Island" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
    elseif _G.SelectIsland == "Fountain City" then
        Teleport(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
    elseif _G.SelectIsland == "Shank Room" then
        Teleport(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
    elseif _G.SelectIsland == "Mob Island" then
        Teleport(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
    elseif _G.SelectIsland == "The Cafe" then
        Teleport(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
    elseif _G.SelectIsland == "Frist Spot" then
        Teleport(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
    elseif _G.SelectIsland == "Dark Area" then
        Teleport(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
    elseif _G.SelectIsland == "Flamingo Mansion" then
        Teleport(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
    elseif _G.SelectIsland == "Flamingo Room" then
        Teleport(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
    elseif _G.SelectIsland == "Green Zone" then
        Teleport(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
    elseif _G.SelectIsland == "Factory" then
        Teleport(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
    elseif _G.SelectIsland == "Colossuim" then
        Teleport(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
    elseif _G.SelectIsland == "Zombie Island" then
        Teleport(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
    elseif _G.SelectIsland == "Two Snow Mountain" then
        Teleport(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
    elseif _G.SelectIsland == "Punk Hazard" then
        Teleport(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
    elseif _G.SelectIsland == "Cursed Ship" then
        Teleport(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
    elseif _G.SelectIsland == "Ice Castle" then
        Teleport(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
    elseif _G.SelectIsland == "Forgotten Island" then
        Teleport(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
    elseif _G.SelectIsland == "Ussop Island" then
        Teleport(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
    elseif _G.SelectIsland == "Mini Sky Island" then
        Teleport(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
    elseif _G.SelectIsland == "Great Tree" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
        Teleport(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
    elseif _G.SelectIsland == "Castle On The Sea" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
    elseif _G.SelectIsland == "MiniSky" then
        Teleport(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
    elseif _G.SelectIsland == "Port Town" then
        Teleport(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
    elseif _G.SelectIsland == "Hydra Island" then
        Teleport(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
    elseif _G.SelectIsland == "Floating Turtle" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        wait(0.5)
        Teleport(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
    elseif _G.SelectIsland == "Mansion" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        wait(0.5)
        Tween(CFrame.new(-12489.4893, 336.895721, -7446.056153))
    elseif _G.SelectIsland == "Haunted Castle" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
        Teleport(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
    elseif _G.SelectIsland == "Ice Cream Island" then
        Teleport(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
    elseif _G.SelectIsland == "Peanut Island" then
        Teleport(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
    elseif _G.SelectIsland == "Cake Island" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
        Teleport(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
    elseif _G.SelectIsland == "Cocoa Island" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
        Teleport(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
    elseif _G.SelectIsland == "Candy Island New⛄" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5071.82324,314.858734,-3150.69922))
        wait(0.5)
        Teleport(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
    elseif _G.SelectIsland == "Tiki Outpost New" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        wait(0.5)
        Teleport(CFrame.new(-16101.1885,12.8422165,380.942291))
    else
        _G.StopTween = true
        wait(0.5)
        _G.StopTween = false
    end
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
        pcall(function()
            if not isnil(v.Character) then
                if _G.ESPPlayers then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextColor3 = Color3.new(0,255,0)
                        else
                            name.TextColor3 = Color3.new(255,0,0)
                        end
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
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

function UpdateRealFruitChams() 
    for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if _G.DinhViQua then 
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end 
        end
    end
    for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if _G.DinhViQua then 
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 174, 0)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end 
        end
    end
    for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v:IsA("Tool") then
            if _G.DinhViQua then 
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(251, 255, 0)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end 
        end
    end
    end

function UpdateDevilChams() 
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if _G.ESPFRUIT then
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
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
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

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if _G.ESPISLAND then 
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
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
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

function UpdateFlowerChams() 
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if v.Name == "Flower2" or v.Name == "Flower1" then
                if _G.ESPHOA then 
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if v.Name == "Flower1" then 
                            name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                            name.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if v.Name == "Flower2" then
                            name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
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

function teleporttosea()
    if _G.SelectSea == "1" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    elseif _G.SelectSea == "2" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    elseif _G.SelectSea == "3" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
end

function TweenFrozen()
    pcall(function()
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
            Teleport(game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') * CFrame.new(2, 20, 2))
        end
    end)
end

function TweenDaobian()
    repeat wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        local AllNPCS = getnilinstances()
        for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for _, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                Teleport(v.HumanoidRootPart.CFrame)
            end
        end
    end
end

function TweenTopOnGreatTree()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    Teleport(ConNPCTemplete)
    wait(0.5)
    if (ConNPCTemplete.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    end
end

function Templeteleport()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
end

function CheckNameBossSea3()
    if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra") then
        return "rip_indra True Form"
    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
        return "Soul Reaper"
    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
        return "Dough King"
    end
end

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

function Click()
    local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
    local CombatFramework = debug.getupvalues(Module)[2]
    local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
    CamShake:Stop()
    CombatFramework.activeController.attacking = false
    CombatFramework.activeController.timeToNextAttack = 0
    CombatFramework.activeController.hitboxMagnitude = 180
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

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

getgenv().NoDieEffect = true
if getgenv().NoDieEffect then
    local effectContainer = game:GetService("ReplicatedStorage").Effect.Container
    if effectContainer:FindFirstChild("Death") then
        effectContainer.Death:Destroy()
    end
    if effectContainer:FindFirstChild("Respawn") then
        effectContainer.Respawn:Destroy()
    end
end

spawn(function()
    while wait() do
        local rs = game:GetService("ReplicatedStorage")
        local guiAssets = rs.Assets.GUI
        local soundStorage = rs.Util.Sound.Storage.Other
        guiAssets.DamageCounter.Enabled = false
        soundStorage:FindFirstChild("LevelUp_Proxy"):Destroy()
        soundStorage:FindFirstChild("LevelUp"):Destroy()
        effectContainer.Respawn:Destroy()  
        effectContainer.LevelUp:Destroy()
    end
end)

local slashHit = game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit')
if slashHit then
    slashHit:Destroy()
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.TrainToc or _G.Tansat or _G.Zone6 or _G.KillFishCrew or _G.KillTerrorShark or _G.KillShark or _G.KillPiranha or _G.AutoTrials or _G.TrialV4 or _G.OneClick or _G.AutoHallowSycthe or _G.AutoDarkDagger or _G.AutoBudySword or _G.AutoCarvender or _G.AutoTwinHook or _G.AutoKen or _G.AutoRengoku or _G.AutoSecondSea or _G.Tweenfruit or _G.AutoMob or _G.ThirdSea or _G.AutoSwan or _G.Autopole or _G.AutoSaber or _G.AutoBartilo or _G.AutoBoss or _G.DjtFactorybantumlum or _G.DjtElite or _G.DjtPirates or _G.AutoBone or _G.LevelFarm or _G.AutoKatakuri or NoClip == true then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.TrainToc or _G.Tansat or _G.Zone6 or _G.KillFishCrew or _G.KillTerrorShark or _G.KillShark or _G.KillPiranha or _G.AutoTrials or _G.TrialV4 or _G.OneClick or _G.AutoHallowSycthe or _G.AutoDarkDagger or _G.AutoBudySword or _G.AutoCarvender or _G.AutoTwinHook or _G.AutoKen or _G.AutoRengoku or _G.AutoSecondSea or _G.Tweenfruit or _G.AutoMob or _G.ThirdSea or _G.AutoSwan or _G.Autopole or _G.AutoSaber or _G.AutoBartilo or _G.AutoBoss or _G.DjtFactorybantumlum or _G.DjtElite or _G.DjtPirates or _G.AutoBone or _G.LevelFarm or _G.AutoKatakuri or NoClip == true then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

if game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit') then
    game:GetService("ReplicatedStorage").Assets:FindFirstChild('SlashHit'):Destroy()
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Nghiavndeptraivcc/Orion-nhu-cut/main/Orion.Source')))()
local Window = OrionLib:MakeWindow({Name = "Night Hub", HidePremium = false,IntroText = "Night Library", SaveConfig = true, ConfigFolder = "Night Hub"})

local I = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local G = Window:MakeTab({
	Name = "General",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local IQ = Window:MakeTab({
	Name = "Item & Quest",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local ST = Window:MakeTab({
	Name = "Status Servers",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local TL = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local DF = Window:MakeTab({
	Name = "Devil Fruit",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local ER = Window:MakeTab({
	Name = "ESP & Raid",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local SE = Window:MakeTab({
	Name = "Sea Event",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local RC = Window:MakeTab({
	Name = "Race V4",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local SH = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local S = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://16035137478",
	PremiumOnly = false
})

local Section = I:AddSection({
    Name = "Info Owner"
})

I:AddLabel("Owner Name : Lương Minh Nghĩa")
I:AddLabel("BirthDay : 12/8/2011")
I:AddLabel("Brothers : Hirimii, T...")
I:AddLabel("My Discord : https://discord.gg/R4xC3t2Xm8")
I:AddLabel("I From : VietNam")

local Section = I:AddSection({
    Name = "Update My Hub"
})

I:AddLabel("Update Bring Mob Large")
I:AddLabel("Update FastAttack")
I:AddLabel("Fixed Lag")
I:AddLabel("Auto Bone Fixed")
I:AddLabel("Auto Katakuri FIxed")
I:AddLabel("Auto Mob, boss,... New")
I:AddLabel("Race V4, Sea Event,... [Comming Soon]")

local Section = G:AddSection({
    Name = "Players User"
})

G:AddButton({
	Name = "Reset Character",
	Callback = function()
      	game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
  	end    
})

G:AddButton({
	Name = "Remove frog",
	Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
        game:GetService("Lighting").Sky:Destroy()
  	end    
})

local Section = G:AddSection({
    Name = "Select Tool"
})

G:AddParagraph("Select Weapon","Click the DropDown and Select Tool You Like To Farm >w<")

G:AddDropdown({
	Name = "Select Weapon",
	Default = "Melee",
	Options = {"Melee", "Sword"},
	Callback = function(Value)
		SelectWP = Value
	end    
})

G:AddParagraph("SETTINGS FARM","Click The Box To Enable Settings Farm You Like >w<")

G:AddToggle({
	Name = "Turn On V4",
	Default = false,
	Callback = function(Value)
		_G.V4 = Value
	end    
})

G:AddParagraph("TOGGLE FARM","Click The Box To Enable Mode Farm You Like >w<")

G:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		_G.LevelFarm = Value
        CancelTween(_G.LevelFarm)
	end    
})

G:AddToggle({
	Name = "Auto Katakuri",
	Default = false,
	Callback = function(Value)
		_G.AutoKatakuri = Value
        CancelTween(_G.AutoKatakuri)
	end    
})

G:AddToggle({
	Name = "Auto Bone",
	Default = false,
	Callback = function(Value)
		_G.AutoBone = Value
        CancelTween(_G.AutoBone)
	end    
})

local Section = G:AddSection({
    Name = "Select Boss"
})

G:AddParagraph("SELECT BOSS DROPDOWN BETA","CHOOSE BOSS IN THE DROPDOWN TO FARM BOSS, IF NOT BOSS THEN NO FARM!")

G:AddDropdown({
	Name = "Select Boss(Beta)",
	Default = "",
	Options = Boss,
	Callback = function(Value)
		_G.SelectBoss = Value
	end    
})

G:AddToggle({
	Name = "Auto Farm Boss",
	Default = false,
	Callback = function(Value)
		_G.AutoBoss = Value
        CancelTween(_G.AutoBoss)
	end    
})

local Section = G:AddSection({
    Name = "Mob Farm"
})

G:AddParagraph("SELECT MOB DROPDOWN BETA","CHOOSE MOB IN THE DROPDOWN TO FARM BOSS, IF NOT MOB THEN NO FARM!")

G:AddDropdown({
	Name = "Select Mob(Beta)",
	Default = "",
	Options = MobList,
	Callback = function(Value)
		_G.SelectMob = Value
	end    
})

G:AddToggle({
	Name = "Auto Farm Mob",
	Default = false,
	Callback = function(Value)
		_G.AutoMob = Value
        CancelTween(_G.AutoMob)
	end    
})

local Section = G:AddSection({
    Name = "Toggle Others"
})

G:AddParagraph("OTHERS TOGGLE","AUTO ELITE, AUTO PIRATE, AUTO FACTORY")

G:AddToggle({
	Name = "Auto Elite",
	Default = false,
	Callback = function(Value)
		_G.DjtElite = Value
        CancelTween(_G.DjtElite)
	end    
})

G:AddToggle({
	Name = "Auto Pirates",
	Default = false,
	Callback = function(Value)
		_G.DjtPirates = Value
        CancelTween(_G.DjtPirates)
	end    
})

G:AddToggle({
	Name = "Auto Factory",
	Default = false,
	Callback = function(Value)
		_G.DjtFactorybantumlum = Value
        CancelTween(_G.DjtFactorybantumlum)
	end    
})

local Section = IQ:AddSection({
    Name = "Item"
})

IQ:AddParagraph("Item Get","Wait I Update...")

if Sea1 then
    IQ:AddToggle({
	Name = "Auto Saber",
	Default = false,
	Callback = function(Value)
		_G.AutoSaber = Value
        CancelTween(_G.AutoSaber)
	end    
})

IQ:AddToggle({
	Name = "Auto Pole",
	Default = false,
	Callback = function(Value)
		_G.Autopole = Value
        CancelTween(_G.Autopole)
	end    
})
end

if Sea2 then
    IQ:AddToggle({
        Name = "Auto Rengoku",
        Default = false,
        Callback = function(Value)
            _G.AutoRengoku = Value
            CancelTween(_G.AutoRengoku)
        end    
    })
end

IQ:AddToggle({
    Name = "Auto Observation Haki",
    Default = false,
    Callback = function(Value)
        _G.AutoKen = Value
        CancelTween(_G.AutoKen)
    end    
})

IQ:AddToggle({
    Name = "Auto Observation Haki [Hop]",
    Default = false,
    Callback = function(Value)
        _G.AutoKenHop = Value
    end    
})

IQ:AddToggle({
    Name = "Auto SuperHuman",
    Default = false,
    Flag = "Auto SuperHuman",
    Save = true,
    Callback = function(Value)
        _G.AutoSuperhuman = Value
        CancelTween(_G.AutoSuperhuman)
    end    
})

if Sea2 or Sea3 then
IQ:AddToggle({
    Name = "Auto Buy Legend Sword",
    Default = false,
    Flag = "Auto Legend",
    Save = true,
    Callback = function(Value)
        _G.AutoBuyLegendarySword = Value
    end    
})
end

if Sea3 then
IQ:AddToggle({
    Name = "Auto Cavander",
    Default = false,
    Flag = "Auto Cavander",
    Save = true,
    Callback = function(Value)
        _G.AutoCarvender = Value
        CancelTween( _G.AutoCarvender)
    end    
})
end

if Sea3 then
IQ:AddToggle({
    Name = "Auto Buddy Sword",
    Default = false,
    Flag = "Auto Buddy",
    Save = true,
    Callback = function(Value)
        _G.AutoBudySword = Value
        CancelTween(_G.AutoBudySword)
    end    
})
end

if Sea3 then
    IQ:AddToggle({
        Name = "Auto Twin Hook",
        Default = false,
        Flag = "Auto Twin",
        Save = true,
        Callback = function(Value)
            _G.AutoTwinHook = Value
            CancelTween( _G.AutoTwinHook)
        end    
    })
end

if Sea3 then
    IQ:AddToggle({
        Name = "Auto Hallow Scythe",
        Default = false,
        Flag = "Auto Hallow",
        Save = true,
        Callback = function(Value)
            _G.AutoHallowSycthe = Value
            CancelTween(_G.AutoHallowSycthe)
        end    
    })
end

if Sea3 then
    IQ:AddToggle({
        Name = "Auto Dark Dragger",
        Default = false,
        Flag = "Auto Dark",
        Save = true,
        Callback = function(Value)
            _G.AutoDarkDagger = Value
            CancelTween(_G.AutoDarkDagger)
        end    
    })
end

if Sea3 then
    IQ:AddToggle({
        Name = "Auto Taken Yama(Only Elite Process 30)",
        Default = false,
        Flag = "Auto Taken Yama",
        Save = true,
        Callback = function(Value)
            _G.TakenYama = Value
        end    
    })
end

local Section = IQ:AddSection({
    Name = "Quest"
})

IQ:AddParagraph("Quest Auto","Wait I Update...")

if Sea1 then
    IQ:AddToggle({
        Name = "Auto SecondSea",
        Default = false,
        Callback = function(Value)
            _G.AutoSecondSea = Value
            CancelTween(_G.AutoSecondSea)
        end    
    })
end

if Sea2 then
    IQ:AddToggle({
        Name = "Auto Bartilo Quest",
        Default = false,
        Callback = function(Value)
            _G.AutoBartilo = Value
            CancelTween(_G.AutoBartilo)
        end    
    })

    IQ:AddToggle({
        Name = "Auto Kill Swan",
        Default = false,
        Callback = function(Value)
            _G.AutoSwan = Value
            CancelTween(_G.AutoSwan)
        end    
    })

    IQ:AddToggle({
        Name = "Auto Third Sea Quest",
        Default = false,
        Callback = function(Value)
            _G.ThirdSea = Value
            CancelTween(_G.ThirdSea)
        end    
    })
end

local Section = TL:AddSection({
    Name = "Teleport Sea"
})

TL:AddDropdown({
	Name = "Select Sea To Teleport",
	Default = "",
	Options = {"1", "2", "3"},
	Callback = function(Value)
		_G.SelectSea = Value
	end    
})

TL:AddButton({
    Name = "Teleport To Sea",
    Callback = function()
        teleporttosea()
    end
})

local Section = TL:AddSection({
    Name = "Teleport Island"
})

if Sea1 then
TL:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"WindMill",
    "Marine",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Island",
    "MarineFord",
    "Colosseum",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Magma Village",
    "Under Water Island",
    "Fountain City",
    "Shank Room",
    "Mob Island",},
    Flag = "Select Island",
    Save = true,
    Callback = function(Value)
        _G.SelectIsland = Value
    end    
})

end
if Sea2 then
TL:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"The Cafe",
    "Frist Spot",
    "Dark Area",
    "Flamingo Mansion",
    "Flamingo Room",
    "Green Zone",
    "Factory",
    "Colossuim",
    "Zombie Island",
    "Two Snow Mountain",
    "Punk Hazard",
    "Cursed Ship",
    "Ice Castle",
    "Forgotten Island",
    "Ussop Island",
    "Mini Sky Island"},
    Flag = "Select Island",
    Save = true,
    Callback = function(Value)
        _G.SelectIsland = Value
    end    
})
end

if Sea3 then
TL:AddDropdown({
    Name = "Select Island",
    Default = "",
    Options = {"Mansion",
    "Port Town",
    "Great Tree",
    "Castle On The Sea",
    "MiniSky", 
    "Hydra Island",
    "Floating Turtle",
    "Haunted Castle",
    "Ice Cream Island",
    "Peanut Island",
    "Cake Island",
    "Cocoa Island",
    "Tiki Outpost New",
    "Candy Island New⛄"},
    Flag = "Select Island",
    Save = true,
    Callback = function(Value)
        _G.SelectIsland = Value
    end    
})
end

TL:AddButton({
    Name = "Teleport To Island",
    Callback = function()
        TweenIsland()
    end
})

TL:AddButton({
    Name = "Teleport To Frozen Leviathan",
    Callback = function()
        TweenFrozen()
    end
})

TL:AddButton({
    Name = "Teleport To Mirrage Island",
    Callback = function()
        TweenDaobian()
    end
})

TL:AddButton({
	Name = "Stop Teleport",
	Callback = function()
        CancelTween(All)
  	end    
})

local Section = DF:AddSection({
	Name = "Devil Fruit"
})

DF:AddButton({
    Name = "Random Fruits",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end    
})

DF:AddToggle({
    Name = "Auto Random Fruits",
    Default = false,
    Flag = "Auto Random Fruits",
    Save = true,
    Callback = function(Value)
        _G.Random_Auto = Value
    end    
})

DF:AddToggle({
    Name = "Auto Store Fruit",
    Default = false,
    Flag = "Auto Store Fruit",
    Save = true,
    Callback = function(Value)
        _G.AutoStoreFruit = Value
    end    
})

DF:AddToggle({
    Name = "Teleport To Fruit",
    Default = false,
    Flag = "Teleport To Fruit",
    Save = true,
    Callback = function(Value)
        _G.Tweenfruit = Value
        CancelTween(_G.Tweenfruit)
    end    
})

local Section = ER:AddSection({
	Name = "ESP"
})

ER:AddToggle({
    Name = "ESP Players",
    Default = false,
    Flag = "ESP Players",
    Save = true,
    Callback = function(Value)
        _G.ESPPlayers = Value
        UpdatePlayerChams()
    end    
})

ER:AddToggle({
    Name = "ESP Fruits",
    Default = false,
    Flag = "ESP Fruits",
    Save = true,
    Callback = function(Value)
        _G.ESPFRUIT = Value
        while _G.ESPFRUIT do wait()
        UpdateDevilChams() 
        end
    end    
})

ER:AddToggle({
    Name = "ESP Island",
    Default = false,
    Flag = "ESP Island",
    Save = true,
    Callback = function(Value)
        _G.ESPISLAND = Value
        while _G.ESPISLAND do wait()
        UpdateIslandESP() 
        end
    end    
})

ER:AddToggle({
    Name = "ESP Flower",
    Default = false,
    Flag = "ESP Flower",
    Save = true,
    Callback = function(Value)
        _G.ESPHOA = Value
        UpdateFlowerChams() 
    end    
})

local Section = ER:AddSection({
	Name = "One Click Raid"
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

ER:AddDropdown({
    Name = "Select Chips",
    Default = "",
    Options = Raidslist,
    Flag = "Select Chips",
    Save = true,
    Callback = function(Value)
        _G.SelectChip = Value
    end    
})

ER:AddToggle({
    Name = "One Click Full Raid",
    Default = false,
    Flag = "Auto Start",
    Save = true,
    Callback = function(Value)
        _G.OneClick = Value
    end    
})

local Section = SE:AddSection({
	Name = "Boats"
})

SE:AddButton({
	Name = "Buy Boats",
	Callback = function()
      	Teleport(ChoMuaThuyen)
        wait(0.5)
        local args = {
        [1] = "BuyBoat",
        [2] = "PirateBrigade"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})


SE:AddToggle({
    Name = "Set Speed Boats To 350",
    Default = false,
    Flag = "Set Speed Boats To 350",
    Save = true,
    Callback = function(Value)
        _G.SpeedBoats = Value
    end    
})

SE:AddToggle({
	Name = "Teleport Boats To Zone 6",
	Default = false,
    Flag = "Teleport Boats To Zone 6",
    Save = true,
	Callback = function(Value)
		_G.Zone6 = Value
        CancelTween(_G.Zone6)
	end    
})

SE:AddToggle({
	Name = "Auto Press W",
	Default = false,
    Flag = "Auto Press W",
    Save = true,
	Callback = function(Value)
		_G.PressW = Value
	end    
})

SE:AddParagraph("FARMMING SEA EVENT","Click The Box Toggle To Choose You FARMMING Mob Sea")

SE:AddToggle({
	Name = "Auto Shark",
	Default = false,
    Flag = "Auto Shark",
    Save = true,
	Callback = function(Value)
		_G.KillShark = Value
        CancelTween(_G.KillShark)
	end    
})

SE:AddToggle({
	Name = "Auto Terror Shark",
	Default = false,
    Flag = "Auto Terror Shark",
    Save = true,
	Callback = function(Value)
		_G.KillTerrorShark = Value
        CancelTween(_G.KillTerrorShark)
	end    
})

SE:AddToggle({
	Name = "Auto Fish Crew Member",
	Default = false,
    Flag = "Auto Fish Crew Member",
    Save = true,
	Callback = function(Value)
		_G.KillFishCrew = Value
        CancelTween(_G.KillFishCrew)
	end    
})

SE:AddToggle({
	Name = "Auto Piranha",
	Default = false,
    Flag = "Auto Piranha",
    Save = true,
	Callback = function(Value)
		_G.KillPiranha = Value
        CancelTween(_G.KillPiranha)
	end    
})

local Section = RC:AddSection({
	Name = "Templete Of Time"
})

RC:AddButton({
	Name = "Tween To Top On Great Tree",
	Callback = function()
      	TweenTopOnGreatTree()
  	end    
})

RC:AddButton({
	Name = "Tween To Templete Of Time",
	Callback = function()
        Templeteleport()
  	end    
})

RC:AddButton({
	Name = "Tween To Doors Trials",
	Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.5)
            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                wait(1)
                Teleport(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                wait(1)
                Teleport(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                wait(1)
                Teleport(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                wait(1)
                Teleport(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                wait(1)
                Teleport(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                wait(1)
                Teleport(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
            end
        end
  	end    
})

RC:AddButton({
	Name = "Tween To Anclient One",
	Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.5)
            Teleport(CFrame.new(28973.0879, 14889.9756, -120.298691))
        end
  	end    
})

RC:AddButton({
	Name = "Tween To Clock",
	Callback = function()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude > 1000 then
            Templeteleport()
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosTemplete.Position).Magnitude < 1000 then
            wait(0.5)
      	    Teleport(CFrame.new(29551.9941, 15069.002, -85.5179291))
        end
  	end    
})

local Section = RC:AddSection({
	Name = "Trials"
})

RC:AddToggle({
	Name = "Auto Trials",
	Default = false,
	Save = true,
	Flag = "Auto Trials",
	Callback = function(Value)
		_G.AutoTrials = Value
        CancelTween(_G.AutoTrials)
	end    
})

RC:AddToggle({
	Name = "Auto Train Race",
	Default = false,
	Save = true,
	Flag = "Auto Train Race",
	Callback = function(Value)
		_G.TrainToc = Value
        _G.BattocV4detraintoc = Value
        CancelTween(_G.BattocV4detraintoc)
        CancelTween(_G.TrainToc)
	end    
})

RC:AddToggle({
	Name = "Auto Kill Players After Trials",
	Default = false,
	Save = true,
	Flag = "Auto Kill Players After Trials",
	Callback = function(Value)
		_G.TrialV4 = Value
        CancelTween(_G.TrialV4)
	end    
})

RC:AddDropdown({
	Name = "Select Weapon Trials",
	Default = "Melee",
	Options = {"Melee", "Sword"},
	Callback = function(Value)
		_G.SelectWeaponTrial = Value
	end    
})

RC:AddToggle({
    Name = "Skill Z",
    Default = false,
    Flag = "Skill Z",
    Save = true,
    Callback = function(Value)
        _G.Z = Value
    end    
})

RC:AddToggle({
    Name = "Skill X",
    Default = false,
    Flag = "Skill X",
    Save = true,
    Callback = function(Value)
        _G.X = Value
    end    
})

RC:AddToggle({
    Name = "Skill C",
    Default = false,
    Flag = "Skill C",
    Save = true,
    Callback = function(Value)
        _G.C = Value
    end    
})


RC:AddToggle({
    Name = "Skill V",
    Default = false,
    Flag = "Skill V",
    Save = true,
    Callback = function(Value)
        _G.V = Value
    end    
})

local Section = ST:AddSection({
	Name = "Status Servers"
})

local Moon = ST:AddLabel("Đeo co Moon")
local Elite = ST:AddLabel("Elite : ❌ Not Spawn")
local MobKatakuri = ST:AddLabel("Defeat : 0")
local Mirrage = ST:AddLabel("Mirrage : ❌ Not Spawn")
local KitsuneIsland = ST:AddLabel("Kitsune Island : ❌ Not Spawn")
local Frozen = ST:AddLabel("Frozen Dimension : ❌ Not Spawn")

local Section = ST:AddSection({
	Name = "Servers"
})

ST:AddTextbox({
    Name = "Job Id",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.Job = Value 
    end	  
})

ST:AddButton({
    Name = "Join Job Id",
    Callback = function()
        _G.AutoRejoin = false
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
      end    
})

ST:AddButton({
    Name = "Copy Job Id",
    Callback = function()
        setclipboard(tostring(game.JobId))
      end    
    })

ST:AddButton({
    Name = "Hop Sever",
    Callback = function()
        Hop()
      end    
})

ST:AddButton({
    Name = "Rejoin Sever",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
      end    
})

local Section = SH:AddSection({
    Name = "Melee"
})

SH:AddButton({
    Name = "Black Leg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end    
})

SH:AddButton({
    Name = "Electrol",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end    
})

SH:AddButton({
    Name = "FishMan Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end    
})

SH:AddButton({
    Name = "Dragon Claw",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end    
})

SH:AddButton({
    Name = "SuperHuman",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end    
})


SH:AddButton({
    Name = "Death Step",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end    
})

SH:AddButton({
    Name = "Electric Claw",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end    
})

SH:AddButton({
    Name = "SharkMan Karate",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end    
})

SH:AddButton({
    Name = "Dragon Talon",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end    
})

SH:AddButton({
    Name = "GodHuman",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end    
})

local Section = SH:AddSection({
    Name = "Haki :"
})

SH:AddButton({
    Name = "Buy Buso Haki",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end    
})

SH:AddButton({
    Name = "Buy Geppo Haki",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end    
})

SH:AddButton({
    Name = "Buy Flash Step(Soru)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end    
})

SH:AddButton({
    Name = "Buy Observation(Ken) Haki",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end    
})

local Section = SH:AddSection({
    Name = "Race :"
})

SH:AddButton({
    Name = "Buy Ghoul Race",
    Callback = function()
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
})

SH:AddButton({
    Name = "Buy Ghoul Race",
    Callback = function()
        local a = {
            [1] = "CyborgTrainer",
            [2] = "Buy"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(a))
    end    
})

local Section = SH:AddSection({
    Name = "Other"
})

SH:AddButton({
    Name = "Cutlass Katana",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end    
})

SH:AddButton({
    Name = "Katana",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end    
})

SH:AddButton({
    Name = "Iron Mace",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end    
})

SH:AddButton({
    Name = "Dual Katana",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end    
})

SH:AddButton({
    Name = "Triple Katana",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end    
})

SH:AddButton({
    Name = "Pipe",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end    
})

SH:AddButton({
    Name = "Dual-Headed Blade ",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end    
})

SH:AddButton({
    Name = "Bisento",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end    
})

SH:AddButton({
    Name = "Soul Cane",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end    
})

SH:AddButton({
    Name = "Pole v.2 [ 5,000 Fragments ]",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end    
})

local Section = SH:AddSection({
    Name = "Gun"
})

SH:AddButton({
    Name = "Slingshot",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
    end    
})

SH:AddButton({
    Name = "Musket",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
    end    
})

SH:AddButton({
    Name = "Flintlock",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
    end    
})

SH:AddButton({
    Name = "Refined Slingshot",
    Callback = function()
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
    end    
})

SH:AddButton({
    Name = "Refined Flintlock",
    Callback = function()
        local args = {
            [1] = "BuyItem",
            [2] = "Refined Flintlock"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end    
})

SH:AddButton({
    Name = "Cannon",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
    end    
})

SH:AddButton({
    Name = "Kabucha [ 1,500 Fragments]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
    end    
})

SH:AddButton({
    Name = "Bizarre Rifle [ 250 Ectoplasm ]",
    Callback = function()
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
})

SH:AddButton({
    Name = "Refund Stats[2,500 fragment]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
    end    
})

SH:AddButton({
    Name = "Race Random[3,000 fragment]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
    end    
})

local Section = S:AddSection({
	Name = "Bring Mob"
})

S:AddToggle({
	Name = "Bring Monster",
	Default = true,
	Callback = function(Value)
		_G.BringMonster = Value
	end    
})

local Section = S:AddSection({
	Name = "FastAttack"
})

S:AddToggle({
	Name = "Fast Attack",
	Default = true,
	Callback = function(Value)
		_G.FastAttack = Value
	end    
})

S:AddDropdown({
	Name = "FastAttack Delay",
	Default = "Fast",
	Options = {"Super Fast", "Fast", "Normal", "Slow"},
	Callback = function(Value)
		_G.FastAttackDelay = Value
	end    
})

local Section = S:AddSection({
	Name = "Bypass"
})

S:AddToggle({
	Name = "Bypass Teleport",
	Default = true,
	Callback = function(Value)
		BypassTP = Value
	end    
})

local Section = S:AddSection({
	Name = "Settings Use Skill Players Aura"
})

S:AddToggle({
    Name = "Skill Z",
    Default = false,
    Flag = "Skill Z",
    Save = true,
    Callback = function(Value)
        _G.Z2 = Value
    end    
})

S:AddToggle({
    Name = "Skill X",
    Default = false,
    Flag = "Skill X",
    Save = true,
    Callback = function(Value)
        _G.X2 = Value
    end    
})

S:AddToggle({
    Name = "Skill C",
    Default = false,
    Flag = "Skill C",
    Save = true,
    Callback = function(Value)
        _G.C2 = Value
    end    
})

S:AddToggle({
    Name = "Skill V",
    Default = false,
    Flag = "Skill V",
    Save = true,
    Callback = function(Value)
        _G.V2 = Value
    end    
})

spawn(function()
    while task.wait() do
        if _G.LevelFarm then
            pcall(function()
                QuestCheck()
                local questTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(questTitle, NameMon) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude > 2000 then
                            BP(CFrameMon)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 2000 then
                            Tween(CFrameQuest)
                        end
                    else
                        Tween(CFrameQuest)
                    end
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif string.find(questTitle, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == Mon then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipTool(SelectWP)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                PosMon = v.HumanoidRootPart.CFrame
                                BringMob = true
                            until not _G.LevelFarm or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    Tween(CFrameMon)
                    BringMob = false
                    if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoBone then
            pcall(function()
                if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosBone.Position).Magnitude > 2000 then
                        BP(PosBone)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosBone.Position).Magnitude < 2000 then
                        Tween(PosBone)
                    end
                else
                    Tween(PosBone)
                end
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                if v.Humanoid.Health > 0 and (v:FindFirstChild("HumanoidRootPart") or v.Parent or _G.AutoBone) then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipTool(SelectWP)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                        StartCheckBone = true
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                    until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoBone
                                end
                            end
                        end
                    end
                else
                    StartCheckBone = false
                    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if v.Name == "Reborn Skeleton" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif v.Name == "Living Zombie" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif v.Name == "Demonic Soul" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif v.Name == "Posessed Mummy" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end
            end)
        end
    end
end)


spawn(function()
    while wait() do
        if _G.AutoKatakuri then
            pcall(function()
                local spawnerData = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                local dataLength = string.len(spawnerData)
                if dataLength == 88 then
                    CountMob = tonumber(string.sub(spawnerData, 39, 41)) - 500
                elseif dataLength == 87 then
                    CountMob = tonumber(string.sub(spawnerData, 40, 41)) - 500
                elseif dataLength == 86 then
                    CountMob = tonumber(string.sub(spawnerData, 41, 41)) - 500
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoKatakuri then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" or v.Name == "Dough King" then
                            if v.Humanoid.Health > 0 and (v:FindFirstChild("HumanoidRootPart") or v.Parent or _G.AutoKatakuri) then
                                repeat
                                    wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, -50, 0))
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(20,- 50 ,20))
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(20,- 50 ,20))
                    else
                        if CountMob == 0 then
                        end
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                        if v.Humanoid.Health > 0 and (v:FindFirstChild("HumanoidRootPart") or v.Parent or _G.AutoKatakuri) then
                                            repeat
                                                wait()
                                                AutoHaki()
                                                EquipTool(SelectWP)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                                MagnetDought = true
                                                PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                            until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0
                                        end
                                    end
                                end
                            else
                                if BypassTP then
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosCake.Position).Magnitude > 2000 then
                                        BP(PosCake)
                                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosCake.Position).Magnitude < 2000 then
                                        Tween(PosCake)
                                    end
                                else
                                    Tween(PosCake)
                                end
                                MagnetDought = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(20,40,20))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(20,40,20))
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectBoss then
                            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and _G.AutoBoss then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoBoss
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.BattocV4detraintoc then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                    _G.TrainToc = false
                    Tween(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do 
        if _G.TrainToc and Sea3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
                           if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                               repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false 
                                    v.HumanoidRootPart.Size = Vector3.new(99, 99, 99)
                                    BringQuaiNoToc = true
                                    PosQuaithichdjt = v.HumanoidRootPart.CFrame
                                until not _G.TrainToc or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    BringQuaiNoToc = false
                    Tween(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do 
                        if v.Name == "Cocoa Warrior" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif v.Name == "Chocolate Bar Battler" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif v.Name == "Sweet Thief" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        elseif v.Name == "Candy Rebel" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do 
        if _G.TrainToc and Sea3 then
            pcall(function()
                local args = {
                    [1] = true
                }
                local args = {
                    [1] = "UpgradeRace",
                    [2] = "Buy"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.BattocV4detraintoc then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                    _G.TrainToc = true
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.BattocV4detraintoc then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.BattocV4 then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoMob then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectMob then
                            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and _G.AutoMob then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    PosMobSelect = v.HumanoidRootPart.CFrame
                                    BringMobSelect = true
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.AutoBoss
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMob) then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectMob).HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                    end
                end
            end)
        end
    end
end)

spawn(function()    
    while wait() do
        if _G.OneClick then
            if not game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
                else
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if Sea2 then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif Sea3 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.OneClick then
            for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    repeat wait(.1)
                        v.Humanoid.Health = 0
                        v.HumanoidRootPart.CanCollide = false
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    until not _G.OneClick or not v.Parent or v.Humanoid.Health <= 0
                end
            end
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.OneClick then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*RaidPos)
                    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                        Tween(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*RaidPos)
                    end
                end
            end
        end
    end)
end)

Type = 1
spawn(function()
while wait(.1) do
    if Type == 1 then
        RaidPos = CFrame.new(0,25,0)
    elseif Type == 2 then
        RaidPos = CFrame.new(0,25,-40)
    elseif Type == 3 then
        RaidPos = CFrame.new(40,25,0)
    elseif Type == 4 then
        RaidPos = CFrame.new(0,25,40)	
    elseif Type == 5 then
        RaidPos = CFrame.new(-40,25,0)
    elseif Type == 6 then
        RaidPos = CFrame.new(0,25,0)
    end
    end
end)

spawn(function()
    while wait(.1) do
        Type = 1
        wait(0.9)
        Type = 2
        wait(0.9)
        Type = 3
        wait(0.9)
        Type = 4
        wait(0.9)
        Type = 5
        wait(0.9)
    end
end)

spawn(function()
    while task.wait() do
        if _G.DjtElite then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat wait()
                                            AutoHaki()
                                            EquipTool(SelectWP)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until not _G.DjtElite or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                            end
                        end                    
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.DjtFactorybantumlum then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Core" then
                            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and _G.DjtFactorybantumlum then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                                until _G.DjtFactorybantumlum == false or v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    end
                else
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(448.46756, 199.356781, -441.389252).Position).Magnitude > 2000 then
                            BP(CFrame.new(448.46756, 199.356781, -441.389252))
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(448.46756, 199.356781, -441.389252).Position).Magnitude < 2000 then
                            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    else
                        Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                    end         
                end        
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.DjtPirates then
            pcall(function()
                local CFrameRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
                if (PosRaidCastle.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.DjtPirates and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                repeat wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                until v.Humanoid.Health <= 0 or not v.Parent or not _G.DjtPirates
                            end
                        end
                    end
                else
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameRaid.Position).Magnitude > 2000 then
                            BP(CFrameRaid)
                        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameRaid.Position).Magnitude < 2000 then
                            Tween(CFrameRaid)
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Autopole and Sea1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Thunder God" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, -20, 2))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.Autopole or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, -9, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoBartilo then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                        if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                            Ms = "Swan Pirate"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    pcall(function()
                                        repeat task.wait()
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            EquipTool(SelectWP)
                                            AutoHaki()
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))													
                                            PosMonBarto =  v.HumanoidRootPart.CFrame
                                            AutoBartiloBring = true
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        AutoBartiloBring = false
                                    end)
                                end
                            end
                        else
                            repeat Tween(CFrame.new(932.624451, 156.106079, 1180.27466)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466)).Magnitude <= 10
                        end
                    else
                        repeat Tween(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                    end 
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                        Ms = "Jeremy"
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Ms then
                                OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    EquipTool(SelectWP)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))			
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy") then
                        repeat Tween(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                        wait(1)
                        repeat Tween(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        wait(2)
                    else
                        repeat Tween(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                    repeat Tween(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                    wait(1)
                    repeat Tween(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                end
            end 
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.ThirdSea then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and Sea2 then
                    _G.LevelFarm = false
                    if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                        Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                        if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                        end
                        wait(1.8)
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "rip_indra" then
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and _G.ThirdSea then
                                        OldCFrameThird = v.HumanoidRootPart.CFrame
                                        repeat task.wait()
                                            AutoHaki()
                                            EquipTool(SelectWP)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                            v.HumanoidRootPart.CFrame = OldCFrameThird
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                        until _G.ThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            end
                        elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            Tween(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoHallowSycthe then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v.Name , "Soul Reaper") then
                            repeat task.wait()
                                AutoHaki()
                                EquipTool(SelectWP)
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                v.HumanoidRootPart.CFrame = OldCFrameThird
                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            until v.Humanoid.Health <= 0 or _G.AutoHallowSycthe == false
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                    repeat Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                    EquipTool("Hallow Essence")
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)


spawn(function()
       while wait(0.001) do
        if _G.AutoHallowSycthe then
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

spawn(function()
    while wait() do
        if _G.AutoSwan then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Swan") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Swan" then
                            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and _G.AutoSwan then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    v.HumanoidRootPart.CFrame = OldCFrameThird
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until _G.AutoSwan == false or v.Humanoid.Health <= 0 or not v.Parent
                            end
                        end
                    end
                else
                    Tween(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Swan") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Swan").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.TakenYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                repeat wait(.1)
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.TakenYama
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoSecondSea then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 700 and Sea1 then
                    if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                        repeat wait() Tween(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563)) until (CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                        EquipTool("Key")
                        local pos2 = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        repeat wait() Tween(pos2) until (pos2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
                        wait(3)
                    elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral" and v.Humanoid.Health > 0 then
                                    repeat wait()
                                        AutoHaki()
                                        EquipTool(SelectWP)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                        v.HumanoidRootPart.Transparency = 1
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    until v.Humanoid.Health <= 0 or not v.Parent or not _G.AutoSecondSea
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                end
                            end
                        else
                            Tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKen then
                repeat task.wait()
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):SetKeyDown('0x65')
                        wait(2)
                        game:GetService('VirtualUser'):SetKeyUp('0x65')
                    end
                until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AutoKen
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoKen then
                if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                    OrionLib:MakeNotification({
                        Name = "Night Hub",
                        Content = "Đjt cụ m max điểm r bật bật cc",
                        Image = "rbxassetid://14919714384",
                        Time = 5
                    })
                    wait(2)
                else
                    if Sea2 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
                            if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                until _G.AutoKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            else
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)+
                                        wait(1)
                                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoKenHop == true then
                                        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                    end
                                until _G.AutoKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        else
                            Tween(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                        end
                    elseif Sea1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
                            if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                until _G.AutoKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            else
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                    wait(1)
                                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoKenHop == true then
                                        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                    end
                                until _G.AutoKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        else
                            Tween(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                        end
                    elseif Sea3 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
                            if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                                until _G.AutoKen == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            else
                                repeat task.wait()
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                                    wait(1)
                                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.AutoKenHop == true then
                                        game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
                                    end
                                until _G.AutoKen == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        else
                            Tween(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.AutoCarvender and Sea3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Beautiful Pirate" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 29, 2))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.AutoCarvender or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude > 2000 then
                    BP(CavandisPos)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CavandisPos.Position).Magnitude < 2000 then
                    Tween(CavandisPos)
                end
            else
                Tween(CavandisPos)
            end
                Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if  _G.AutoTwinHook and Sea3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Captain Elephant" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 50, 2))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.AutoTwinHook or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Anhjack5cu.Position).Magnitude > 1500 then
                BP(Anhjack5cu)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Anhjack5cu.Position).Magnitude < 1500 then
                Tween(Anhjack5cu)
                end
            else
                Tween(Anhjack5cu)
            end
                Tween(Anhjack5cu)
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBudySword and Sea3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Queen" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 50, 2))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Memaybeo.Position).Magnitude > 1500 then
                    Tween(Memaybeo)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Memaybeo.Position).Magnitude < 1500 then
                    Tween(Memaybeo)
                end
            else
                Tween(Memaybeo)
            end
                Tween(Memaybeo)
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBuyLegendarySword then
            pcall(function()
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
            end)
        end 
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoDarkDagger and Sea3 then
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                pcall(function()
                                    AutoHaki()
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(2, 50, 2))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                end)
                            until _G.AutoDarkDagger == false or v.Humanoid.Health <= 0
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude > 1500 then
                BP(AdminPos)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - AdminPos.Position).Magnitude < 1500 then
                Tween(AdminPos)
                end
            else
                Tween(AdminPos)
            end
                Tween(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoTrials then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoTrials or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
					for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
						if v.Name ==  "snowisland_Cylinder.081" then
							Tween(v.CFrame* CFrame.new(0,0,0))
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name ==  "HumanoidRootPart" then
							Tween(v.CFrame* CFrame.new(2, 30, 2))
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
					Tween(CFrame.new(28654, 14898.7832))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoTrials or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v.Name == "StartPoint" then
							Tween(v.CFrame* CFrame.new(0,3,0))
					  	end
				   	end
				end
			end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.TrialV4 then
            pcall(function()
                for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 150 then
                            repeat task.wait()
                                AutoHaki()
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0))
                                EquipTool(_G.SelectWeaponTrial)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
                                useskilltrial = true
                                Click()
                            until _G.TrialV4 == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                            useskilltrial = false
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if useskilltrial then
            pcall(function()
                if _G.Z then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                    if _G.X then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        if _G.C then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            if _G.V then
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
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
        if _G.TrialV4 then
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

spawn(function()
    while wait() do
        if _G.Zone6 then
            for i, v in pairs(workspace.Boats:GetChildren()) do
                if v:FindFirstChild("Owner") and v:FindFirstChild("Owner").Value == plr then
                    table.foreach(v:GetDescendants(), function(a, child)
                        if child:IsA("BasePart") or child:IsA("MeshPart") or child:IsA("Part") then
                            child.CanCollide = false
                        end
                    end)
                    v:FindFirstChild("Humanoid"):GetPropertyChangedSignal("Value"):Connect(function(g)
                        if g == 0 then
                        print("Vailon")
                        end
                    end)
                    v:FindFirstChild("VehicleSeat").CFrame = CFrame.new(-44842.3945, 10.7790766, 16911.3477)
                    wait(1.0)
                    Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 3, 0))
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SpeedBoats then
            for i, v in pairs(workspace.Boats:GetChildren()) do
                if v:FindFirstChild("Owner") then
                    if v:FindFirstChild("Owner").Value == plr then
                        table.foreach(v:GetDescendants(), function(a, child)
                            if child:IsA("BasePart") or child:IsA("MeshPart") or child:IsA("Part") then
                            child.CanCollide = false
                            end
                        end)
                        v:FindFirstChild("Humanoid"):GetPropertyChangedSignal("Value"):Connect(function(g)
                            if g == 0 then
                            print("Vailon")
                        end
                    end)
                    repeat wait()
                        plr.Character:SetPrimaryPartCFrame(v:FindFirstChild("VehicleSeat").CFrame * CFrame.new(0, 3, 0))
                        until plr.Character:FindFirstChildOfClass("Humanoid").Sit == true
                        v:FindFirstChild("VehicleSeat").MaxSpeed = 350
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.KillShark then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shark" then
                            if v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") and _G.KillShark then
                                repeat task.wait()
                                    AutoHaki()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    plr.Character.Humanoid.Sit = false
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.KillShark
                            end
                        end
                    end
                else
                    Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 3, 0))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Shark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Shark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.KillTerrorShark then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" then
                            if v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") and _G.KillTerrorShark then
                                repeat task.wait()
                                    AutoHaki()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    plr.Character.Humanoid.Sit = false
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.KillTerrorShark
                            end
                        end
                    end
                else
                    Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 3, 0))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.KillPiranha then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Piranha" then
                            if v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") and _G.KillPiranha then
                                repeat task.wait()
                                    AutoHaki()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    plr.Character.Humanoid.Sit = false
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.KillPiranha
                            end
                        end
                    end
                else
                    Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 3, 0))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.KillFishCrew then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Fish Crew Member" then
                            if v.Humanoid.Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") and _G.KillFishCrew then
                                repeat task.wait()
                                    AutoHaki()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                    EquipTool(SelectWP)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    plr.Character.Humanoid.Sit = false
                                until v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not _G.KillFishCrew
                            end
                        end
                    end
                else
                    Tween(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0, 3, 0))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.BringMonster then
            QuestCheck()
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.LevelFarm and BringMob and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    v.HumanoidRootPart.CFrame = PosMon
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                elseif _G.LevelFarm and BringMob and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    v.HumanoidRootPart.CFrame = PosMon
                    v.Humanoid:ChangeState(14)
                    v.HumanoidRootPart.CanCollide = false
                    v.Head.CanCollide = false
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.BringMonster then
            pcall(function()
                QuestCheck()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoKatakuri and MagnetDought then
                        if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and
                            (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
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
                    if _G.AutoBone and StartCheckBone then
                        if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
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
                    if _G.AutoBartilo and AutoBartiloBring then
                        if (v.Name == "Swan Pirate") and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CFrame = PosMonBarto
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
                if _G.AutoMob and BringMobSelect then
                    if (v.Name == _G.SelectMob) and (v.HumanoidRootPart.Position - PosMobSelect.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosMobSelect
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
                if _G.AutoRengoku and BringRengoku then
                    if (v.Name == "Snow Trooper" or v.Name == "Awakened Ice Admiral" or v.Name == "Winter Warrior") and (v.HumanoidRootPart.Position - PosRengoku.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosRengoku
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
                if _G.TrainToc and BringQuaiNoToc then
                    if (v.Name == "Sweet Thief" or v.Name == "Candy Rebel" or v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler") and (v.HumanoidRootPart.Position - PosQuaithichdjt.Position).Magnitude <= 350 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosQuaithichdjt
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    end
                end

            end)
        end
    end
end)

spawn(function()
    while wait(2) do
        if _G.ESPHOA then
            UpdateFlowerChams() 
        end
        if _G.ESPFRUIT then
            UpdateDevilChams() 
        end
        if _G.ESPPlayers then
            UpdatePlayerChams()
        end
        if _G.DinhViQua then
            UpdateRealFruitChams()
        end
    end
end)

spawn(function()
    while wait(000000000000000000000000000000000000000000000000000000000000000000.1) do
        pcall(function()
            if _G.FastAttack then
                repeat wait(_G.FastAttackDelay)
                    AttackNoCD()
                until not _G.FastAttack
            end
        end)
    end
end)

spawn(function()
    while wait(.1) do
        if _G.FastAttackDelay then
            pcall(function()
                if _G.FastAttackDelay == "Super Fast" then
                    _G.FastAttackDelay = 0.05
                elseif _G.FastAttackDelay == "Fast" then
                    _G.FastAttackDelay = 0.15
                elseif _G.FastAttackDelay == "Normal" then
                    _G.FastAttackDelay = 0.25
                elseif _G.FastAttackDelay == "Low" then
                    _G.FastAttackDelay = 0.5
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.V4 then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
            Moon:Set("🌕: Full Moon 100%")
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
            Moon:Set("🌖’ : Full Moon 75%")
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
            Moon:Set("🌗“ : Full Moon 50%")
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
            Moon:Set("🌘 : Full Moon 25%")
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
            Moon:Set("🌘: Full Moon 15%")
        else
            Moon:Set("Đeo co Moon")
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                MobKatakuri:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                MobKatakuri:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                MobKatakuri:Set("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
            else
                MobKatakuri:Set("Dough King V1 : ✅")
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
            Mirrage:Set("Mirrage : ✅ Spawn")
        else
            Mirrage:Set("Mirrage : ❌ Not Spawn")
        end
    end
end)

spawn(function()
    while wait() do
        if game:GetService("Workspace").Map:FindFirstChild('KitsuneIsland') then
            Kitsune:Set("Kitsune Island : ✅ Spawn")
        else
            Kitsune:Set("Kitsune Island : ❌ Not Spawn")
        end
    end
end)

spawn(function()
    while wait() do
        if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
            Frozen:Set("Frozen Dimension : ✅ Spawn")
        else
            Frozen:Set("Frozen Dimension : ❌ Not Spawn")
        end
    end
end)

spawn(function()
    while wait() do
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
            Elite:Set("Elite : ✅ Spawn")	
        else
            Elite:Set("Elite : ❌ Not Spawn")	
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
    end)
end)

spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rocket-Rocket",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ghost-Ghost",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Door-Door",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spider-Spider",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Pain-Pain",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Soul-Soul",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard",game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                    end
                end
                end
            end)
        end
        wait(0.3)
    end
end)

spawn(function()
    while wait(.1) do
        if _G.Tweenfruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    Tween(v.Handle.CFrame)
                end
            end
        end
	end
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.SelectWeaponTrial == "Melee" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        _G.SelectWeaponTrial = v.Name
                    end
                end
            elseif _G.SelectWeaponTrial == "Sword" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        _G.SelectWeaponTrial = v.Name
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if SelectWP == "Melee" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        SelectWP = v.Name
                    end
                end
            elseif SelectWP == "Sword" then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                        SelectWP = v.Name
                    end
                end
            end
        end)
    end
end)

if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" and game.PlaceId == 7449423635 then
    WebhookurlFM = "https://discord.com/api/webhooks/1189918727676907590/JBrb-CUOk7QIWmxq-lzfXpdfZqavn_O3QnTMEHwesc5qSPJABsMxazc2bVmpIy_Zvptj"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Full Moon";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"]= "Players Count",
                        ["value"]= "```"..playerCount.."/12```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Moon",
                        ["value"]= "** 🌖 75%**",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Job Id",
                        ["value"]= "```"..game.JobId.."```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"]= true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = WebhookurlFM , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end

if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" and game.PlaceId == 7449423635 then
    WebhookurlFM = "https://discord.com/api/webhooks/1189918727676907590/JBrb-CUOk7QIWmxq-lzfXpdfZqavn_O3QnTMEHwesc5qSPJABsMxazc2bVmpIy_Zvptj"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Full Moon";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"]= "Players Count",
                        ["value"]= "```"..playerCount.."/12```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Moon",
                        ["value"]= "** 🌕 100%**",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Job Id",
                        ["value"]= "```"..game.JobId.."```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"]= true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = WebhookurlFM , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end

if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    Webhookdao = "https://discord.com/api/webhooks/1189918802402607245/uLSj7grDV-ZQ1H4RVpqvg5Lrhsmeelk5Qe_eaWnp1k7ulIZvYEy-RpU0J1rtgARR5nef"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Mirage Find";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"] = "Players Count",
                        ["value"] = "```"..playerCount.."/12```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Mirage",
                        ["value"] = "**true**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Job Id",
                        ["value"] = "```"..game.JobId.."```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"] = true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = Webhookdao , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end

if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or  game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
    WebhookElite = "https://discord.com/api/webhooks/1199318001678299146/3Auil4er_c5KKHNL2Y4Mf8hLTqy6ynkeGof6_fCB-FT6euWz6LeTwHOC-YFXSloN0w9a"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Elite Find";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"] = "Players Count",
                        ["value"] = "```"..playerCount.."/12```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Elite",
                        ["value"] = "**true**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Job Id",
                        ["value"] = "```"..game.JobId.."```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"] = true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = WebhookElite , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end

if game:GetService("ReplicatedStorage"):FindFirstChild("Cursed Captain") then
    WebhookBoss = "https://discord.com/api/webhooks/1199318124319735878/VEseTtAbhD_DIRRF26VCxtD8aT7TtKuGPfDee4AzruQcuD_CCFuGemX9_ZT26KQDt0wb"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Boss Find Sea 2";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"] = "Players Count",
                        ["value"] = "```"..playerCount.."/12```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sea",
                        ["value"] = "**2**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Job Id",
                        ["value"] = "```"..game.JobId.."```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"] = true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = WebhookBoss , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end


if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra") or  game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
    WebhookBoss = "https://discord.com/api/webhooks/1199318124319735878/VEseTtAbhD_DIRRF26VCxtD8aT7TtKuGPfDee4AzruQcuD_CCFuGemX9_ZT26KQDt0wb"
    local HttpService = game:GetService("HttpService")
    local Data = {
        ["embeds"]= {
            {            
                ["title"]= "Boss Find Sea 3";
                ["color"]= tonumber(0x7269da);
                ["fields"]= {
                    {
                        ["name"] = "Players Count",
                        ["value"] = "```"..playerCount.."/12```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Name Boss",
                        ["value"] = "".. CheckNameBossSea3() .. "",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Job Id",
                        ["value"] = "```"..game.JobId.."```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Job Id",
                        ["value"]= '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..', "'..game.JobId..'", game.Players.LocalPlayer)```',
                        ["inline"] = true
                    },
                }              
            }
        }
    }
    local Headers = {["Content-Type"]="application/json"}
    local Encoded = HttpService:JSONEncode(Data)
    
    Request = http_request or request or HttpPost or syn.request
    local Final1 = {Url = WebhookBoss , Body = Encoded, Method = "POST", Headers = Headers}
    
    Request(Final1)
end
