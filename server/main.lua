lib.callback.register("xiloshops:payment", function(source, price, name, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local finalamount = price * amount

    if xPlayer.getMoney() >= finalamount then
        xPlayer.removeMoney(finalamount)
        xPlayer.addInventoryItem(name, amount)
        return true
    else
        return false
    end
end)