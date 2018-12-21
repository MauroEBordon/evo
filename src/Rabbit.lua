
Rabbit = Class{}

function Rabbit:init(x, y)
    self.acceleration = MVector(0, 0)
    self.velocity = MVector(0, -2)
    self.position = MVector(x, y)
    self.direction = MVector(0, 1)
    self.maxspeed = 4
    self.radio = 6
    self.maxforce = 0.3
end

function Rabbit:update()
    self.velocity = self.velocity + self.acceleration
    self.velocity = self.velocity:limit(self.maxspeed)
    self.position = self.velocity + self.position
    self.acceleration = self.acceleration:scalarMult(0)
end

function Rabbit:applyForce(force)
    self.acceleration = self.acceleration + force
end

function Rabbit:seek(target)
    local desired = MVector:sub(target, self.position)
    desired = desired:setMag(self.maxspeed)
    local steer =  desired - self.velocity
    steer = steer:limit(self.maxforce)
    self:applyForce(steer)
end

function Rabbit:render()
    tetha = self.velocity:heading() + math.pi/2
    love.graphics.translate(self.position.x, self.position.y)
    love.graphics.rotate(tetha)
    love.graphics.polygon('fill', 0, -self.radio*2, -self.radio, self.radio*2, self.radio, self.radio*2)
end
