getgenv().targetplayer = "nil"
getgenv().targetmap = "nil"
getgenv().targetmode = "nil"
getgenv().targetkaren = "nil"
getgenv().targetclockbaws = "nil"
getgenv().enwait = 10

if game.PlaceId ~= 314927855 and game.PlaceId ~= 319213769 then
    game:GetService("Players").LocalPlayer:Kick("You are not in Pillow Fight Simulator or any related games.")
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/verigh/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Pillow Hub",
    LoadingTitle = "Loading PH",
    LoadingSubtitle = "Please Wait 🛌",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "PHconfig"
    },
    Discord = {
       Enabled = true,
       Invite = "M7Ut7p2Bqm", 
       RememberJoins = true 
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "n/a",
       Subtitle = "n/a",
       Note = "n/a",
       FileName = "n/a",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "n/a"
    }
})

local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Combat", true)
local Keybind = Tab:CreateKeybind({
    Name = "Range Kill",
    CurrentKeybind = "R",
    HoldToInteract = false,
    Flag = "RKillKB", 
    Callback = function(Keybind)
        local args = {
            [1] = game:GetService("Players"):FindFirstChild(targetplayer).Character.Humanoid,
            [2] = game:GetService("Players").LocalPlayer.Character.Pillow.Handle.ParticleEmitter,
            [3] = game:GetService("Players").LocalPlayer.Character.Pillow.Handle.Hit,
            [4] = game:GetService("Players").LocalPlayer.Character.Pillow
        }
        game:GetService("ReplicatedStorage").RemoteEvents.Touched:FireServer(unpack(args))
    end,
})
local Input = Tab:CreateInput({
    Name = "Target Player",
    Info = "Name of the player that you want to range kill.",
    PlaceholderText = "jopede",
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
		getgenv().targetplayer = Text
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Must have the default pillow equipped and in your hand. Don't spam it, or you'll be kicked. Only works within a short distance. Case sensitive. Doesn't work in maps that replace your pillow with a custom one.",SectionParent})

local Section = Tab:CreateSection("Misc", true)
local Button = Tab:CreateButton({
    Name = "Detach Player",
    Info = "Weird",
    Interact = 'Changable',
    Callback = function()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Lobby.Tip.Bounce, 0)
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Causes weird glitches with your character.",SectionParent})

local Tab = Window:CreateTab("Maps")
local Section = Tab:CreateSection("LAD", true)
local Keybind = Tab:CreateKeybind({
    Name = "Pickup Ladder",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "PICKlad", 
    Callback = function(Keybind)
        local args = {
            [1] = CFrame.new(80.7801742553711, 31.4999942779541, -14.197301864624023) * CFrame.Angles(6.553112541496375e-08, 0.0198968593031168, 1.8931505252339775e-08)
        }
        game:GetService("ReplicatedStorage").RemoteEvents.PlaceLadder:FireServer(unpack(args))
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Can also spawn a ladder in the middle of the map, will be added soon.",SectionParent})

local Section = Tab:CreateSection("KarenVille", true)
local Button = Tab:CreateButton({
    Name = "Transform Player Into Karen",
    Info = "Insane.",
    Interact = 'Changable',
    Callback = function()
        local args = {
            [1] = game:GetService("Players"):FindFirstChild(targetkaren)
        }
        game:GetService("ReplicatedStorage").RemoteEvents.TransformIntoMom:FireServer(unpack(args))        
    end,
})
local Input = Tab:CreateInput({
    Name = "Target Player",
    Info = "Name of the player that you want to transform into karen.",
    PlaceholderText = "jopede",
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
		getgenv().targetkaren = Text
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Only works while you're a karen. Target Player is case-sensitive.",SectionParent})

local Section = Tab:CreateSection("ClockBaws", true)
local Button = Tab:CreateButton({
    Name = "Hit ClockBaws",
    Info = "Insane.",
    Interact = 'Changable',
    Callback = function()
        for i = 1, targetclockbaws do
            local args = {
                [1] = workspace.Map.Clock.Breakable,
                [2] = game:GetService("Players").LocalPlayer.Character.Pillow.Handle.ParticleEmitter
            }
            game:GetService("ReplicatedStorage").RemoteEvents.TouchedBreakable:FireServer(unpack(args))             
        end          
    end,
})
local Input = Tab:CreateInput({
    Name = "Amount of times to hit ClockBaws",
    PlaceholderText = "500",
    NumbersOnly = true, 
    CharacterLimit = 3, 
    OnEnter = false, 
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().targetclockbaws = Text
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Anything above 250 should auto kill him.",SectionParent})

local Section = Tab:CreateSection("Pizzeria", true)
local Button = Tab:CreateButton({
    Name = "Turn off Lights",
    Info = "Turns off the lights",
    Interact = 'Changable',
    Callback = function()
        fireclickdetector(workspace.Map.Part.ClickDetector)
    end,
})

local Section = Tab:CreateSection("CTC", true)
local Button = Tab:CreateButton({
    Name = "Auto Catch Chicken",
    Info = "OP",
    Interact = 'Changable',
    Callback = function()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map.Chicken.Head, 0)
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Might break the chicken.",SectionParent})

local Section = Tab:CreateSection("PCH", true)
local Button = Tab:CreateButton({
    Name = "Grab Chips",
    Info = "Grabs the potato chips",
    Interact = 'Changable',
    Callback = function()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map.Chips, 0)
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Sometimes glitches the chips making it so everyone loses.",SectionParent})

local Tab = Window:CreateTab("Voting")
local Section = Tab:CreateSection("Vote Options", true)
local Input = Tab:CreateInput({
    Name = "Map",
    Info = "Refer to the official Wiki for a list of maps.",
    PlaceholderText = "Avanlanche",
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
		getgenv().targetmap = Text
    end,
})
local Input = Tab:CreateInput({
    Name = "Mode",
    Info = "Refer to the official Wiki for a list of modes.",
    PlaceholderText = "ESC",
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
		getgenv().targetmode = Text
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Refer to the official wiki for more info. Probably still counts your vote even if it's not in the list due to how voting works. Theoretically, if you get enough players to run this script and vote for a specifc map, you basically got free Tickets.",SectionParent})

local Section = Tab:CreateSection("Vote", true)
local Button = Tab:CreateButton({
    Name = "Normal Vote",
    Info = "Requires properly formatted text inputs.",
    Interact = 'Changable',
    Callback = function()
        local args = {
            [1] = targetmap,
            [2] = targetmode
        }
        game:GetService("ReplicatedStorage").RemoteEvents.Vote:FireServer(unpack(args))
    end,
})
local Button = Tab:CreateButton({
    Name = "Ticket Vote",
    Info = "Requires tickets to use.",
    Interact = 'Changable',
    Callback = function()
        local args = {
            [1] = targetmap,
            [2] = targetmode
        }
        game:GetService("ReplicatedStorage").RemoteEvents.PickMap:FireServer(unpack(args))
    end,
})
local Paragraph = Tab:CreateParagraph({Title = "Notes", Content = "Does not give you infinite votes. Also requires tickets to use the ticket vote.",SectionParent})

local Tab = Window:CreateTab("Info")
local Paragraph = Tab:CreateParagraph({Title = "Version: 2.1.0", Content = "Compatible with v2.6.6",SectionParent})
local Paragraph = Tab:CreateParagraph({Title = "Patch Notes", Content = "Added the following:\nDetatch Player\n Hit ClockBaws\nTurn off lights on Pizzeria\n Catch Chicken on CTC\nGrab Chips on PCH",SectionParent})
