return function(tag, order, sprites, extra)
    ---@type Layer
    local self = {}
    extra = extra or {}
    
    function self:load()
        require(extra.cwd .. "layer.toggleables")(self)
        require(extra.cwd .. "layer.functions")(self)
        return require(extra.cwd .. "layer.load")(self, tag, order, sprites)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require(extra.cwd .. "layer.update")(self, dt)
    end

    function self:draw()
        return require(extra.cwd .. "layer.draw")(self, extra.manager)
    end

    function self:remove()
        return require(extra.cwd .. "layer.remove")(self, extra.manager)
    end

    return self
end