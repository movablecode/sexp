--  object_access.lua

local ObjectEntry = {
  p_model = "none",
}

local ObjectEntryObject = {}

ObjectEntryMeta = {
  __index = function (t,k,v)
    local r = t.p_model:get(k)
    if r==nil then
      return rawget(t, k, v)
    else
      return r
    end
  end,
  __newindex = function (t,k,v)
    local r = t.p_model:set(k,v)
    if r==nil then
      return rawset(t, k, v)
    else
      return r
    end
  end,
}

ObjectEntry.new = function(model)
  local obj = clone_from(ObjectEntry)
  local obj = setmetatable(obj,ObjectEntryMeta)
  obj.p_model = model
  return obj
end

return {
  ObjectEntry = ObjectEntry,
}
