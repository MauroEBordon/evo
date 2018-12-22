Carrots = Class{}

function Carrots:init(n)
  self.carrots = {}
  self.n = n
  for i = 1, n, 1 do
      self.carrots[i] = MVector(math.random(0,VIRTUAL_WIDTH - 10), math.random(0,VIRTUAL_HEIGHT - 10))
  end
end

function Carrots:render()
  for i = 1, self.n, 1 do
    love.graphics.circle("fill", self.carrots[i].x, self.carrots[i].y, 4)
  end
end
