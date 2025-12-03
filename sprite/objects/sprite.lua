return function(tag, path, x, y, extra)
    ---@type Sprite
    local self = {}
    extra = extra or {}
    local manager = extra.manager
    local cwd = manager.cwd

    function self:load()
        require(cwd .. "sprite.toggleables")(self)
        require(cwd .. "sprite.functions")(self)
        return require(cwd .. "sprite.load")(self, tag, path, x, y)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require(cwd .. "sprite.update")(self, dt)
    end

    function self:draw()
        return require(cwd .. "sprite.draw")(self)
    end

    function self:remove()
        return require(cwd .. "sprite.remove")(self, manager)
    end

    return self
end