MVector = Class{}

function MVector:init(x,y)
    self.x = x
    self.y = y
end

-- //Sobrecargando los operadores basicos
MVector.__eq = function(a, b) return (a.p1 == b.p1 and a.p2 == b.p2) end
MVector.__add = function(a, b) return MVector(a.x + b.x, a.y + b.y) end
MVector.__mul = function(a, b) return MVector(a.x * b.x, a.y * b.y) end
MVector.__sub = function(a, b) return MVector(a.x - b.x, a.y - b.y) end
MVector.__div = function(a, b) return MVector(a.x / b.x, a.y / b.y) end
MVector.__tostring = function(v) return (('MVector :  %f  %f'):format(tostring(v.x), tostring(v.y))) end
MVector.__lt = function(a, b) return a.x < b.x or (a.x == b.x and a.y < b.y) end
MVector.__le = function(a, b) return a.x <= b.x and a.y <= b.y end


function MVector:scalarAdd(scalar)
    return MVector(self.x + scalar, self.y + scalar)
end

function MVector:scalarMult(scalar)
    return MVector(self.x * scalar, self.y * scalar)
end

function MVector:scalarSub(scalar)
    return MVector(self.x - scalar, self.y - scalar)
end

function MVector:scalarDiv(scalar)
    return MVector(self.x / scalar, self.y / scalar)
end

function MVector:rotate(angle)
    local x = (self.x*math.cos(angle)) - (self.y*math.sin(angle))
    local y = (self.x*math.sin(angle)) + (self.y*math.cos(angle))
    return MVector(x, y)
end

function MVector:magnitude()
    return math.sqrt(self.x^2 + self.y^2)
end

function MVector:unit()
    local length = self:magnitude()
    return MVector(self.x/length, self.y/length)
end

function MVector:dot(vec)
    return self.x * vec.x + self.y * vec.y
end

function MVector:normalize()
    local mag = self:magnitude()
    return MVector(self.x/mag, self.y/mag)
end

function MVector:projection(b)
    local dot = self:dot(b)
    return b:scalarMult(dot), dot
end

function MVector:setMag(mag)
    r = self:unit()
    return r:scalarMult(mag)
end

function MVector:limit(max)
    r = self:unit()
    mag = self:magnitude()
    if mag > max  then
      return r:scalarMult(max)
    else
      return self
    end
end

function MVector:heading()
    angle = math.atan2(self.y, self.x)
    return angle
end
