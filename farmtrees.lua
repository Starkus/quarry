os.loadAPI("inv")
os.loadAPI("t")

local LOG = "minecraft:log"
local SAP = "minecraft:sapling"
local COAL = "minecraft:coal"

local x = 0
local y = 0

function chestyStuff()
    -- We can't see what's on the chest
    -- so we just grab everything
    while turtle.suck() do end
    inv.stackItems()
    -- and we drop back all the logs
    while inv.selectItem(LOG) do
        turtle.drop()
    end
    -- Drop all but one stack of coal
    while inv.getItemCount(COAL) > 128 do
        inv.selectItem(COAL)
        turtle.drop()
    end
    while inv.getItemCount(SAP) > 128 do
        inv.selectItem(SAP)
        turtle.drop()
    end
end

function refuelIfNeeded()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 70 then
        print("Fuel level is " .. fuelLevel .. ", refueling...")
        if inv.selectItem("minecraft:coal") then
            turtle.refuel(1)
            print("Refueled! new level is " .. turtle.getFuelLevel())
            return true
        end
        printError("No fuel in inventory!")
    end
    return false
end

function placeSapling()
    for i=1, 16 do
        turtle.select(i)
        local data = turtle.getItemDetail()
        if (data and data.name == SAP) then
            turtle.place()
            break
        end
    end
end

function chop()
    turtle.dig()
    turtle.forward()
    local success = true
    local data
    while success do
        success, data = turtle.inspectUp()
        if data.name == LOG then
            turtle.digUp()
            turtle.up()
        else
            break
        end
    end
    while success do
        success = turtle.down()
    end
    turtle.back()
    placeSapling()
end

function inFrontOfTree()
    local success, data
    success, data = turtle.inspect()
        
    if data.name == LOG then
        return true
    end
    return false
end

function rowOfTrees()
    local foundAny = false
    local success, data = turtle.inspect()
    if success and (data.name == LOG or data.name == SAP) then
        foundAny = true
        if data.name == LOG then
            inv.selectItem(LOG)
            chop()
        end
        turtle.turnRight()
        turtle.forward()
        turtle.forward()
        turtle.forward()
        x = x+3
        turtle.turnLeft()
        rowOfTrees()
    end
    if x > 0 then
        turtle.turnLeft()
        while x > 0 do
            turtle.forward()
            x = x-1
        end
        turtle.turnRight()
    end
    return foundAny
end

function columns(colCount)
    for column=1, colCount do
        refuelIfNeeded()
        
        turtle.turnRight()
        turtle.forward()
        x = x + 1
        turtle.turnLeft()
        
        local foundAny = rowOfTrees()
        
        if foundAny == false or column >= colCount then
            break
        else
            turtle.forward()
            turtle.forward()
            turtle.forward()
            y = y + 3
        end
    end
    -- Go back
    turtle.turnLeft()
    turtle.turnLeft()
    while y > 0 do
        turtle.forward()
        y = y - 1
    end
    turtle.turnRight()
    turtle.turnRight()
end

while true do
    refuelIfNeeded()
    
    columns(8)

    turtle.turnLeft()
    chestyStuff()
    turtle.turnRight()
    
    sleep(10)
end
