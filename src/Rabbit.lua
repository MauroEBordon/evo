
Rabbit = Class{}

function Rabbit:init(x, y)
    self.acceleration = MVector(0, 0)
    self.velocity = MVector(0, -2)
    self.position = MVector(x, y)
    self.maxspeed = 5
    self.radio = 6
    self.maxforce = 0.09
    self.HP = 255
end

function Rabbit:update()
    self.velocity = self.velocity + self.acceleration
    self.velocity = self.velocity:limit(self.maxspeed)
    self.position = self.velocity + self.position
    self.acceleration = self.acceleration:scalarMult(0)
    self.HP = math.max(self.HP-1, 0)
end

function Rabbit:applyForce(force)
    self.acceleration = self.acceleration + force
end

function Rabbit:seek(target)
    local desired = target - self.position
    desired = desired:setMag(self.maxspeed)
    local steer =  desired - self.velocity
    steer = steer:limit(self.maxforce)
    self:applyForce(steer)
end



function Rabbit:eats(food)
    if food.n == 0 then
      return nil
    end

    local min = 999999999
    local r = 1
    for i = 1, table.getn(food.array), 1 do
        local dist = self.position:dist(food.array[i])

        if min > dist then
            min = dist
            r = i
        end
    end

    self:seek(food.array[r])

    if min < 16 then
      self.HP = self.HP + 50
      table.remove(food.array, r)
      food.n = food.n - 1

    end

end


function Rabbit:render()
    tetha = self.velocity:heading() + math.pi/2
    love.graphics.translate(self.position.x, self.position.y)
    love.graphics.rotate(tetha)
    love.graphics.setColor(1-self.HP/255, self.HP/255, 25/255, 1)
    love.graphics.polygon('fill', 0, -self.radio*2, -self.radio, self.radio*2, self.radio, self.radio*2)
    love.graphics.reset()
end
