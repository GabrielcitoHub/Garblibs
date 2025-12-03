return function(self, tag, subanimations, loop)
    local manager = self
    loop = loop or false
    local anim = {
        playing = false,
        time = 0,
        speed = 1,
        current = 1,
        loop = loop,
        frames = {},
        subanimations = subanimations or {}
    }

    function anim:play(name, speed, loop)
        anim.frames = anim.subanimations[name]
        anim.playing = true
        if speed then
            anim:setSpeed(speed)
        end
        if loop then
            anim:setLooping(loop)
        end
    end

    function anim:pause()
        anim.playing = false
    end

    function anim:stop()
        anim.current = 1
        anim.playing = false
    end

    function anim:setFrame(frame)
        anim.current = frame
    end

    function anim:setSpeed(speed)
        anim.speed = speed / 10
    end

    function anim:setLooping(loop)
        anim.looping = loop
    end

    function anim:update(dt)
        if not anim.playing then return end
        anim.time = anim.time + self.speed * dt
        if not anim.frames then return end
        
        if anim.time > 1 then
            anim.time = 0
            if anim.current < #anim.frames then
                anim.current = anim.current + 1
            else
                if anim.loop then
                    anim.current = 1
                end
            end
        end
        
        manager.quad = anim.frames[anim.current] or nil
        -- print(tostring(self.quad))
    end

    function anim:remove()
        self.animations[anim.tag] = nil
    end

    self.animations[tag] = anim

    return anim
end