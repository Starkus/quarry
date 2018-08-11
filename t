function turnAround()
  local success = false
  
  success = turtle.turnRight()
  success = success and turtle.turnRight()
  
  return success
end

function dig()
  local tries = 0
  
  while turtle.detect() do
    
    turtle.dig()
    sleep(0.4)
    
    tries = tries+1
    if tries > 500 then

      printError("Can't dig forward")
      return false
      
    end
  end
  
  return true
end

function digDown()
  local tries = 0
  
  while turtle.detectDown() do
  
    turtle.digDown()
    sleep(0.4)
    
    tries = tries+1
    if tries > 500 then
      printError("Can't dig down")
      return false
    end
  end
  
  return true
end

function digUp()
  local tries = 0
  
  while turtle.detectUp() do
  
    turtle.digUp()
    sleep(0.4)
    
    tries = tries+1
    if tries > 500 then
      printError("Can't dig up")
      return false
    end
  end
  
  return true
end


function fw(l)
  l=l or 1
  
  for i=1, l do
  
    local tries = 0
    
    while turtle.forward() ~= true do
      
      turtle.dig()
      turtle.attack()
      sleep(0.2)
      
      tries = tries+1
      if tries > 500 then
        printError("Can't move forward")
        return false
      end
    end
  end
  
  return true
end

function up(l)
  l=l or 1
  
  for i=1, l do
  
    local tries = 0
    
    while turtle.up() ~= true do
      
      turtle.digUp()
      turtle.attackUp()
      sleep(0.2)
      
      tries = tries+1
      if tries > 500 then
        printError("Can't move up")
        return false
      end
    end
  end
  
  return true
end

function down(l)
  l=l or 1
  
  for i=1, l do
  
    local tries = 0
  
    while turtle.down() ~= true do
  
      turtle.digDown()
      turtle.attackDown()
      sleep(0.2)
    
      tries = tries+1
      if tries > 500 then
        printError("Can't move down")
        return false
      end
    end
  end
  
  return true
end

function back(l)
  l=l or 1
  
  for i=1, l do
  
    if turtle.back() ~= true then
      turnAround()
      fw()
      turnAround()
    end
  end
end
