Config = {
    Loc = {
        ["ShopName"] = {
            location = vec(-48.4253, -1757.9330, 28.5210),
            marker = 22,
            scale = 0.8,
            sprite = 59,
            color = 84,
        },
    },
    items = {
        {
            label = "Bread",
            name = "bread",
            max = 100,
            price = 1000,
            icon = "box"
        }
    },
    menu = {
        position = "bottom-right",
        title = "Xilo Shops"
    },
    alert = function(des, type)
        lib.notify({
            title = 'Notification',
            description = des,
            type = type or "info"
        })
    end
}