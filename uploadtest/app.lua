local lapis = require("lapis")
do
  local _parent_0 = lapis.Application
  local _base_0 = {
    ["/my_action"] = function(self)
      do
        local file = self.params.uploaded_file
        if file then
          local handle = io.open(file.filename, "w")
          handle.write(handle, file.content)
          handle.close(handle)
          return "Uploaded " .. tostring(file.filename) .. ", " .. tostring(#file.content) .. "bytes"
        else
          return {
            render = "my_action"
          }
        end
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
