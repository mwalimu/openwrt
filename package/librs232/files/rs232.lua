local type, setmetatable, pairs, tostring = type, setmetatable, pairs, tostring
local sf = string.format
local rs232_core = require("luars232")
module("rs232")

local rs232 = { }
rs232.__index = rs232

function rs232:enum(e)
	if not e then return nil end
	if not e:match("^RS232_.*") then e = 'RS232_' .. e end
	local r = rs232_core[e]
	if not r then self:dbg("enum() unknown '%s'", e) end
	return r
end

function rs232:close()
	if not self.o then return end
	self:dbg("close() closing device %s", self.o:device())
	self.o:close()
	self.o = nil
end

function rs232:open(cfg)
	e, self.o, se = rs232_core.open(cfg.dev)
	if e ~= rs232_core.RS232_ERR_NOERROR then
		return false, se
	end

	self.o:set_baud_rate(self:enum(cfg.baud) or rs232_core.RS232_BAUD_115200)
	self.o:set_data_bits(self:enum(cfg.data) or rs232_core.RS232_DATA_8)
	self.o:set_parity(self:enum(cfg.parity) or rs232_core.RS232_PARITY_NONE)
	self.o:set_stop_bits(self:enum(cfg.stop) or rs232_core.RS232_STOP_1)

	self:dbg("open() OK, %s", tostring(self.o))
	return true
end

function rs232:read(count, timeout)
	local e, d, c
	if timeout then
		e, d, c = self.o:read(count, timeout)
	else
		e, d, c = self.o:read(count)
	end

	if e ~= rs232_core.RS232_ERR_NOERROR and e ~= rs232_core.RS232_ERR_TIMEOUT then
		return nil, rs232_core.error_tostring(e)
	end

	if d then 
		self:dbg("read() data: '%s' hex: '%s' len: %d",
			 self:pretty_white(d), self:tohex(d), c)
	else
		-- USB unplugged while reading?!
		if e == rs232_core.RS232_ERR_NOERROR and not d then
			return nil, 'read() device disappeared?!'
		end

		self:dbg("read() nothing read...")
	end

	return d
end

function rs232:write(data, timeout)
	local e, c

	self:dbg("write() data: '%s' hex: '%s' len: %d",
		  self:pretty_white(data), self:tohex(data), #data)

	if timeout then
		e, c = self.o:write(data, timeout)
	else
		e, c = self.o:write(data)
	end
	if e ~= rs232_core.RS232_ERR_NOERROR then
		return false, rs232_core.error_tostring(e)
	end
	
	return true, c
end

function rs232:read_until(match, timeout, r)
	local d, e = self:read(50, timeout or 5000)
	if e then return nil, e end

	if r then
		if d then d=r..d else d=r end
	end

	if d and d:match(match) then
		self:dbg("read_until() have match: '%s'",
			 self:pretty_white(d:match(match)))
		return d
	end

	if not d and timeout then
		return nil, 'timeout'
	end

	return self:read_until(match, timeout, d)
end

function rs232:pretty_white(s)
	if not s then return '' end
	return s:gsub('\r', '\\r'):gsub('\n', '\\n'):gsub('\t', '\\t')
end

function rs232:tohex(s)
	if not s then return '' end
	return s:gsub(".", function(x) return sf("%02x ", x:byte()) end)
end

function rs232:push(t, v) t[#t+1] = v end
function rs232:set_debug(v) self.debug = v end
function rs232:set_log_function(fn) self.log_fn = fn end
function rs232:log(...) if self.log_fn then self.log_fn(sf(...)) end end
function rs232:dbg(...) if not self.debug then return end self:log(...) end

function new()
	local p = {
		debug = false,
		log_fn = nil,
		port = nil,
	}

	setmetatable(p, rs232)
	return p
end
