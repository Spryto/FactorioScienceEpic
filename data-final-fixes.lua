-- if a mod adds technology in data-final-fixes, then we need to add optional dependency on those mods :/

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local roughNumberOfTechs = 100*math.floor(0.5 + tablelength(data.raw["technology"])/100)
local costModifier = 1 / math.sqrt(math.sqrt(roughNumberOfTechs))

for techname, tech in pairs(data.raw["technology"]) do
    if techname ~= "automation" then
        tech.unit.count = 25*math.max(math.floor((tech.unit.count * math.max(tech.unit.time * costModifier, 1) * 2)/25), 1)
        tech.unit.time = 10
    end
end
