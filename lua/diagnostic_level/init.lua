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

return M
