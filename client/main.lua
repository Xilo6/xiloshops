local function shopsmenu()
    local shopoptions = {}
    local shopvalues = {}
    for key, value in pairs(Config.items) do
        for i = 1, value.max do
            table.insert(shopvalues, {
                label = "Amount Selected: "..i
            })
        end
        table.insert(shopoptions, {
            label = value.label,
            icon = value.icon,
            values = shopvalues,
            args = {
                label = value.label,
                price = value.price,
                name = value.name
            }
        })
    end
    lib.registerMenu({
        id = "xilo_main_shop_menu",
        title = Config.menu.title,
        position = Config.menu.position,
        options = shopoptions
    }, function(selected, scrollIndex, args)
        local alert = lib.alertDialog({
            header = "Hello",
            content = "Are you sure you wish to purchase this product?",
            centered = true,
            cancel = true,
            confirm = "Confirm",
            cancel = "Decline"
        })
        if alert == "confirm" then
            local shopscallback = lib.callback.await("xiloshops:payment", false, args.price, args.name, scrollIndex)
            if not shopscallback then
                Config.alert("You Cannot Afford This Item", "error")
            else
                Config.alert("Successfully purchased x"..scrollIndex.." "..args.label, "success")
            end
        end
    end)
    lib.showMenu("xilo_main_shop_menu")
end

for key, value in pairs(Config.Loc) do
    local point = lib.points.new({
        coords = value.location,
        distance = 2,
    })
    function point:onEnter()
        lib.showTextUI('[E] - To Open Shops')
    end
    function point:onExit()
        lib.hideTextUI()
    end
    function point:nearby()
        DrawMarker(23, value.location, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 50, false, true, 2, false, nil, nil, false)
        if IsControlPressed(0, 38) then
            shopsmenu()
        end
    end
end

CreateThread(function()
    for key, value in pairs(Config.Loc) do
        ShopBlip = AddBlipForCoord(value.location)
        SetBlipSprite(ShopBlip, value.sprite)
        SetBlipDisplay(ShopBlip, 4)
        SetBlipScale(ShopBlip, value.scale)
        SetBlipColour(ShopBlip, value.color)
        SetBlipAsShortRange(ShopBlip, true)
        BeginTextCommandSetBlipName("STRING")
        EndTextCommandSetBlipName(ShopBlip)
    end
end)