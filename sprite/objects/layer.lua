return function(tag, order, sprites, extra)
    ---@type Layer
    local self = {}
    extra = extra or {}
    local manager = extra.manager
    local cwd = manager.cwd
    
    function self:load()
        require(cwd .. "layer.toggleables")(self)
        require(cwd .. "layer.functions")(self)
        return require(cwd .. "layer.load")(self, tag, order, sprites)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require(cwd .. "layer.update")(self, dt)
    end

    function self:draw()
        return require(cwd .. "layer.draw")(self, manager)
    end

    function self:remove()
        return require(cwd .. "layer.remove")(self, manager)
    end

    return self
end