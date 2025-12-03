return function(tag, path, x, y, extra)
    ---@type Sprite
    local self = {}
    extra = extra or {}

    function self:load()
        require "sprite.toggleables" (self)
        require "sprite.functions" (self)
        return require "sprite.load" (self, tag, path, x, y)
    end

    function self:update(dt)
        if not self.deltatime then dt = 1 end
        return require "sprite.update" (self, dt)
    end

    function self:draw()
        return require "sprite.draw" (self)
    end

    function self:remove()
        return require "sprite.remove" (self, extra.manager)
    end

    return self
end