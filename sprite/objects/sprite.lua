return function(tag, path, x, y, extra)
    ---@type Sprite
    local self = {}
    extra = extra or {}

    function self:load()
        require(extra.cwd .. "sprite.toggleables")(self)
        require(extra.cwd .. "sprite.functions")(self)
        return require(extra.cwd .. "sprite.load")(self, tag, path, x, y)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require(extra.cwd .. "sprite.update")(self, dt)
    end

    function self:draw()
        return require(extra.cwd .. "sprite.draw")(self)
    end

    function self:remove()
        return require(extra.cwd .. "sprite.remove")(self, extra.manager)
    end

    return self
end