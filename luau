-- made by elyos
-- dont look at to my script nigger
-- discord: https://discord.gg/unE5Bscp89
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "[ALPHA] Monster Runners Script - Made By Elyos",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Script Loading...",
   LoadingSubtitle = "by Elyos",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
   Name = "God Mode [BETA]",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- MADE BY ELYOS
local start = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DashStartEvent")
local hidevent = game:GetService("ReplicatedStorage")
local req =  game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FindFirstChild("DashEndEvent") or game:GetService("ReplicatedStorage"):FindFirstChild("DashEndEvent")
if Value then
local function startgodmode()
if not req then Rayfield:Notify({
    Title = "Required Event Not Found",
    Duration = 3,
    Image = 4483362458,
 });return end
req.Parent = hidevent
task.wait(0.5)
start:FireServer()
end
startgodmode()
Rayfield:Notify({
   Title = "God Mode Enabled",
   Duration = 3,
   Content = "Congratulations!",
   Image = 4483362458,
})
else
req.Parent = game:GetService("ReplicatedStorage"):WaitForChild("Events")
Rayfield:Notify({
   Title = "God Mode Disabled",
   Duration = 3,
   Content = "FAAAAAAAAAAH!",
   Image = 4483362458,
})
end -- value
   end,
})
local Button = Tab:CreateButton({
    Name = "Kill All [For Monster]",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local RunService = game:GetService("RunService")
        
        -- 5 stud yukarı için değer
        local UP_OFFSET = Vector3.new(0, 5, 0)
        
        local function getCharacterRootPart(player)
            if not player or not player.Character then return nil end
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            return root
        end
        
        local function teleportTo(targetRootPart)
            if not LocalPlayer or not LocalPlayer.Character then return end
            local root = getCharacterRootPart(LocalPlayer)
            if not root then return end
            
            -- Hedef + 5 stud yukarı
            local targetCFrame = targetRootPart.CFrame * CFrame.new(0, 5, 0)
            root.CFrame = targetCFrame
        end
        
        -- Sonsuz döngü: sürekli oyuncuları dolaş
        
            -- Her tur yeni oyuncuları al (yeni gelenler dahil)
            local players = Players:GetPlayers()
            
            for _, player in ipairs(players) do
                -- Kendin atlarsın
                if player == LocalPlayer then continue end
                
                -- Karakteri veya RootPart yoksa atla
                local targetRoot = getCharacterRootPart(player)
                if not targetRoot then continue end
                
                -- 1 saniye boyunca durmadan ışınlan
                local startTime = tick()
                while (tick() - startTime) < 1 do
                    teleportTo(targetRoot)
                    
                    -- RenderStep ile her frame'de de ışınlan (daha akıcı)
                    RunService:BindToRenderStep("TeleportStep", 1, function()
                        teleportTo(targetRoot)
                    end)
                    
                    -- Loop heavy olmayı önle
                    wait(0.02)
                end
                
                -- RenderStep'i kaldır
                RunService:UnbindFromRenderStep("TeleportStep")
            end
       
    end,
 })
local Button = Tab:CreateButton({
   Name = "Rejoin",
   Callback = function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})
