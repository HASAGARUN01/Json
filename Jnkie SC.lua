--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Join my discord server : https://discord.gg/uRgd95BNR5 or add kokie.cx ( if found any error)
local HttpService = game:GetService("HttpService")

setreadonly(http, false)
local stata = 0
local OldRequest = (syn and syn.request) or request or http_request
local OldPrint   = print
local OldWarn    = warn

local fakeaahh = newcclosure(function(req)
    --[[
    if typeof(req) == "table" then
        for i, v in pairs(req) do
            print(i, v)
            if typeof(v) == "table" then
                for s, d in pairs(v) do
                print("--",s, d)
                end
            end
        end
    end

    if typeof(req.Body) == "table" then
        for i, v in pairs(req.Body) do
            print(i, v)
        end
    end
    L log ngl
    ]]

    if typeof(req) == "table"
        and req.Url == "https://api.jnkie.com/api/v1/whitelist/verifyOpen"
    then
        print("try bypass..")
        if stata == 0 then
            print("FOUND LOADER Request")
            stata = stata + 1
            return OldRequest(req)
        end
        stata = 0
        return {
            Success = true,
            StatusCode = 200,
            Body = HttpService:JSONEncode({
                message = "KEY_VALID",
                valid = true
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        }
    end

    return OldRequest(req)
end)

http.request = fakeaahh
getgenv().http.request = fakeaahh
getgenv().http_request = fakeaahh
getgenv().request = fakeaahh

if syn and syn.request then
    syn.request = fakeaahh
end

setreadonly(http, true)

print("i eat a lot of junk food")
