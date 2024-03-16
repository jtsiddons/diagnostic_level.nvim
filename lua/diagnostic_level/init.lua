M = {}

local get_diag_config = function()
    return vim.diagnostic.config()
end

local set_diag_config = function(conf)
    vim.diagnostic.config(conf)
end

local setdiag = function(level, min, field)
    local conf = get_diag_config()
    if type(conf[field]) ~= "table" then
        conf[field] = {}
    end
    if min then
        conf[field]['severity'] = { min = level }
    else
        conf[field]['severity'] = level
    end
    set_diag_config(conf)
end

M.set_diag_level = function(level)
    setdiag(level, false, 'virtual_text')
end

M.set_diag_min = function(level)
    setdiag(level, true, 'virtual_text')
end

M.set_sign_level = function(level)
    setdiag(level, false, 'signs')
end

M.set_sign_min = function(level)
    setdiag(level, true, 'signs')
end

M.set_underline_level = function(level)
    setdiag(level, false, 'underline')
end

M.set_underline_min = function(level)
    setdiag(level, true, 'underline')
end

M.set_diag_prefixes = function(t)
    -- set defaults
    setmetatable(t, { __index = { e = 'E: ', w = 'W: ', i = 'I: ', h = 'H: ' } })
    local e = t[1] or t.e
    local w = t[2] or t.w
    local i = t[3] or t.i
    local h = t[4] or t.h

    local conf = get_diag_config()
    local fmt = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return string.format("%s%s", e, diagnostic.message)
        end
        if diagnostic.severity == vim.diagnostic.severity.WARN then
            return string.format("%s%s", w, diagnostic.message)
        end
        if diagnostic.severity == vim.diagnostic.severity.INFO then
            return string.format("%s%s", i, diagnostic.message)
        end
        if diagnostic.severity == vim.diagnostic.severity.HINT then
            return string.format("%s%s", h, diagnostic.message)
        end
        return diagnostic.message
    end
    conf.virtual_text.format = fmt
    set_diag_config(conf)
end

return M
