-- UNIVERSAL ZOMBIES & BLADE LOADER (English)
-- Auto detects the game and runs the correct script

local PlaceId = game.PlaceId
local StarterGui = game:GetService("StarterGui")

local Scripts = {
    [103754275310547] = { -- Hunty Zombies
        name = "Hunty Zombies",
        url = "https://api.junkie-development.de/api/v1/luascripts/public/c7a2dc0f18ea01f43a0f323087a7a62fa9ffe04dd6ab7f791cf34daed6afd0fe/download"
    },
    [3678761576] = { -- Entrenched WW1
        name = "Entrenched WW1",
        url = "https://api.junkie-development.de/api/v1/luascripts/public/4db5dbacac98bfb32887f8e5f5285825599fcecd579d1ad4b6a005bc1c07860b/download"
    },
    [110866861848433] = { -- Blade X Zombies
        name = "Blade X Zombies",
        url = "https://api.junkie-development.de/api/v1/luascripts/public/0c36d8d99871ac55b04110744dec5b35a2b1715c6bb887ea9785567a5c414506/download"
    },
    [79940517734440] = { -- Slashe Blade Loot
        name = "Slashe Blade Loot",
        url = "https://api.junkie-development.de/api/v1/luascripts/public/0b4195d497066eb5e0acaf8c99d40e8dde2b45f4411ff7a14d0d19b92bdf1821/download"
    }
}

local script = Scripts[PlaceId]

if script then
    local success, err = pcall(function()
        loadstring(game:HttpGet(script.url))()
    end)

    if success then
        StarterGui:SetCore("SendNotification", {
            Title = "SUCCESS",
            Text = script.name .. " loaded!",
            Duration = 5
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "ERROR",
            Text = "Failed to load " .. script.name,
            Duration = 7
        })
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "NOT SUPPORTED",
        Text = "This game is not supported yet in the loader\nPlaceId: " .. PlaceId,
        Duration = 6
    })
end
