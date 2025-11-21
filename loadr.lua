-- 🧟‍♂️ LOADER AUTOMÁTICO PARA ZOMBIES & WW1 🧟‍♂️
-- Detecta o jogo atual e carrega o script certo!
-- Funciona em: Hunty Zombies, Entrenched WW1, Blade X Zombies

local PlaceId = game.PlaceId
local StarterGui = game:GetService("StarterGui")

local Scripts = {
    [103754275310547] = { -- Hunty Zombies
        url = "https://api.junkie-development.de/api/v1/luascripts/public/c7a2dc0f18ea01f43a0f323087a7a62fa9ffe04dd6ab7f791cf34daed6afd0fe/download",
        name = "Hunty Zombies"
    },
    [3678761576] = { -- ENTRENCHED WW1
        url = "https://api.junkie-development.de/api/v1/luascripts/public/4db5dbacac98bfb32887f8e5f5285825599fcecd579d1ad4b6a005bc1c07860b/download",
        name = "Entrenched WW1"
    },
    [110866861848433] = { -- Blade X Zombies
        url = "https://api.junkie-development.de/api/v1/luascripts/public/0c36d8d99871ac55b04110744dec5b35a2b1715c6bb887ea9785567a5c414506/download",
        name = "Blade X Zombies"
    }
}

local scriptData = Scripts[PlaceId]

if scriptData then
    local sucesso, erro = pcall(function()
        loadstring(game:HttpGet(scriptData.url))()
    end)
    
    if sucesso then
        StarterGui:SetCore("SendNotification", {
            Title = "✅ LOADER SUCESSO!",
            Text = scriptData.name .. " carregado! 🎉",
            Duration = 5
        })
        print("Script para " .. scriptData.name .. " executado!")
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ ERRO!",
            Text = "Falha ao carregar " .. scriptData.name .. ": " .. tostring(erro),
            Duration = 7
        })
        warn("Erro: " .. tostring(erro))
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "❌ JOGO NÃO SUPORTADO",
        Text = "PlaceId: " .. PlaceId .. "\nApenas: Hunty Zombies, Entrenched WW1, Blade X Zombies",
        Duration = 6
    })
    print("Jogo atual (ID: " .. PlaceId .. ") não tem script configurado.")
end
