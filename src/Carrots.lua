Carrots = Class{}

function Carrots:init(n)
  self.array = {}
  self.n = n
  self.r = 3
  
  for i = 1, n, 1 do
      self.array[i] = MVector(math.random(0,VIRTUAL_WIDTH - 10), math.random(0,VIRTUAL_HEIGHT - 10))
  end
end

function Carrots:getCarrot(i)
  return self.array[i]
end

function Carrots:render()
  for i = 1, self.n, 1 do
    love.graphics.circle("fill", self.array[i].x, self.array[i].y, self.r)
  end
end
