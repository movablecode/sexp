
--  convert number to megabytes
function MB(v)
  local value = tonumber(v)
  local addi = 1
  if (value % (1024*1024))==0 then addi=0  end
  return math.floor((value / (1024*1024)))+addi
end

--  convert number to kilobytes
function KB(v)
  local value = tonumber(v)
  local addi = 1
  if (value % (1024))==0 then addi=0  end
  return math.floor((value / (1024)))+addi
end

-------------------------------------------------------------------------------
--  Utilities
--
function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
        return key, t[key]
    end
    -- fetch the next value
    key = nil
    for i = 1,table.getn(t.__orderedIndex) do
        if t.__orderedIndex[i] == state then
            key = t.__orderedIndex[i+1]
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end

--  string.trim
function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

--  string.split
function split(str, pat)
  local t = {}
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = str:find(fpat, 1)
  while s do
    if s ~= 1 or cap ~= "" then
      table.insert(t,trim(cap))
    end
    last_end = e+1
    s, e, cap = str:find(fpat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    table.insert(t,trim(cap))
  end
  return t
end

-- string split... to array (table)
function split_spc(ln)
  local vars = {}
  if string.match(ln, "^#") then
  else
    for item in string.gmatch(ln,"%S+") do
      -- vars[]
      vars[#vars+1] = item
    end
  end
  return vars
end

-- string split... to array (table) pure
function split_space(ln)
  local vars = {}
  for item in string.gmatch(ln,"%S+") do
    -- vars[]
    vars[#vars+1] = item
  end
  return vars
end

--  scan dir.
function scandir(directory)
  if unexpected_condition then error() end
  local i, t, popen = 0, {}, io.popen
  for filename in popen('ls -a '..directory):lines() do
      i = i + 1
      t[i] = filename
  end
  return t
end


--  Prepare to Bits Enumerations
function prepare_bits(defs)
  local k,v
  for k,v in ipairs(defs) do
      defs[v] = k
  end
  return defs
end

--  Encode to Bits
function encode_bits(heads,tbl)
    local res = 0
    local k,v,m
    for k,v in ipairs(tbl) do
        local x = heads[v]
        if (x) then
            m = 2 ^ (x-1)
            res = res + m
        end
    end
    return res
end

--  Decode from Bits
function decode_bits(heads,value)
    local res = {}
    local m,k
    for k = 1,#heads do
        m = math.floor(value%2)
        value = math.floor(value/2)
        if (m>0) then
            res[#res+1] = heads[k]
            res[heads[k]] = true
        elseif (value<1) then
            break
        end
    end
    return res
end

--  Print Out Array
function warr(tbl)
  w("{")
  for k,v in ipairs(tbl) do
    w(v..", ")
  end
  w("}\n")
end

--  Push HEAD
function push_head(q,v)
    table.insert(q,1,v)
end

--  Push TAIL
function push_tail(q,v)
    q[#q+1]=v
end

--  Pop HEAD
function pop_head(q)
    local item=nil
    if (#q>0) then   item = q[1]   table.remove(q,1)  end
    return item
end

--  Pop TAIL
function pop_tail(q)
    local item=nil
    if (#q>0) then   item= q[#q]   table.remove(q,#q)  end
    return item
end

--  Get Ratio string
function getRatioStr(nval,nmax,digit)
  local ratio=0
  if (nmax>0) then ratio=nval/nmax*100  end
  local s = digit.."/"..digit.." (%3.0f%%)"
  return sf(s,nval,nmax,ratio)
end

--  enum  (convert)
function enum(enum_type, enum_value)
    local v = ffi.cast(enum_type, enum_value)
    return tonumber(v)
end

--  forbid global variable allocation
function forbid_global ()
  local mt = {}
  --mt.__index = function (_,k)
  --  p ("access: "..k)
  --end
  mt.__newindex = function (_,k,v)
    p ("Forbid global var. assignment:  "..k.." = "..v)
  end
  setmetatable(_G,mt)
end

--  ceiling_up
function ceiling_up (v,unit,addition)
  local v2 = v+addition
  local div = math.floor(v2/unit)
  v2 = (div+1) * unit
  return v2
end

local primes = {
  509,
  1021,
  2039,
  4093,
  8191,
  16381,
  32749,
  65521,
  131071,
  262139,
  524287,
  1048573,
  2097143,
  4194301,
  8388593,
}

function calc_bucket_size(a)
  local pnumber = a*2
  local ii,iv
  for ii,iv in ipairs(primes) do
    if (pnumber<iv) then
      pnumber = iv
      break;
    end
  end
  if pnumber>65521 then
    pnumber=65521
  end
  return pnumber
end

function file_exist(fname)
  local f = io.open(fname,"r")
  if f~=nil then  f:close()  return true  end
  return false
end

function get_file_ext(fname)
  local va = split(fname,"[.]")
  return va[#va]
end

--  Push HEAD
function push_head(q,v)
    table.insert(q,1,v)
end

--  Push TAIL
function push_tail(q,v)
    q[#q+1]=v
end

--  Pop HEAD
function pop_head(q)
    local item=nil
    if (#q>0) then   item = q[1]   table.remove(q,1)  end
    return item
end

--  Pop TAIL
function pop_tail(q)
    local item=nil
    if (#q>0) then   item= q[#q]   table.remove(q,#q)  end
    return item
end


shell=io.popen
function instant_shell(...)  local output = shell(sf(...))  output:close()  end



local lfs = require "lfs"
require "lpeg"
require "moonscript"


moon = require "moonscript.base"
do_moonfile = function (fname)
  local fn = assert(moon.loadfile(fname))
  if (fn==nil) then
    print ("error",fname)
  else
    return fn()
  end
end
execl_script = function (fname,eb)
  if (fname==nil) then
    return
  end
  eb = eb or 0
  if (eb>0) then
    fname = sf("%s/%s",SCRDIR,fname)
    local fn0 = fname..".moon"
    if file_exist(fn0) then
      do_moonfile(fn0)
    else
      fn0 = fname..".lua"
      dofile(fn0)
    end
  else
    if file_exist(fname) then
      local ext = get_file_ext(fname)
      if (ext=="moon") then
        do_moonfile(fname)
      else
        dofile(fname)
      end
    end
  end
end
