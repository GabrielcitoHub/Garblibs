return function(tag, order, sprites, extra)
    ---@type Layer
    local self = {}
    extra = extra or {}
    
    function self:load()
        require "layer.toggleables" (self)
        require "layer.functions" (self)
        return require "layer.load" (self, tag, order, sprites)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require "layer.update" (self, dt)
    end

    function self:draw()
        return require "layer.draw" (self, extra.manager)
    end

    function self:remove()
        return require "layer.remove" (self, extra.manager)
    end

    return self
end