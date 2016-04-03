--  tmodel.moon
import ObjectEntry from require "lib.object_access"

--  create new column
--    idx:      index
--    name:     name
--    ctype:    data type
--    desc:     description
new_col = (idx,name,ctype,desc)->
  return {
    :idx
    :name
    :ctype
    :desc
  }

--
--
--  Persistence engine for Schema
--
--
class TPersistence
  persistences: {}


--
--  Schema.
--    Database Schema
--    Columns, Column-Sequences, Descriptions
--
class TSchema
  schemas: {}

  --  constructor
  new: (name,table_name)=>
    @name = name
    table_name = table_name or name
    @table_name = table_name      --  table name
    @columns = {}                 --  numeric indexed column data
    @col_names = {}               --  string indexed column data
    @col_map = {}
    @option = nil
    @validate_hash = 0            --  schema validate hash
    @@schemas[@name] = self

  --  properties
  getName: ()=>
    tostring @name

  --  methods
  add_col: (name,ctype,desc)=>
    idx = #@columns + 1
    @set_col idx,va[1],va[2],va[3]

  set_col: (va)=>
    nc = new_col va[1],va[2],va[3],va[4]
    @columns[nc.idx] = nc
    @col_names[nc.name] = nc
    @col_map[nc.name] = nc.idx

  setOption: (opt)=>
    @option = opt

  define: (va)=>
    for k,v in pairs(va)
      @set_col v
    #@columns

  getColumn: (idx)=>
    @columns[idx]

  getColumnIndexByName: (name)=>
    @col_map[name]

  getColumns: ()=>
    @columns

  inheritFrom: (org)->
    for k,v in pairs(org\getColumns!)
      x.columns[k] = v
      x.col_names[v.name] = v
      x.col_map[v.name] = v.idx

  -- printInfo: ()=>
  --   for k,v in pairs(@columns)

  --  build Schema, Meta, Space, Persistence
  build: ()=>
    @columns

  --  make JSON object and hashing it's value
  toJSON: ()=>
    @columns

  --  statics
  clone: (tname)->
    x = TSchema tname
    for k,v in pairs(@columns)
      x.columns[k] = v
      x.col_names[v.name] = v
      x.col_map[v.name] = v.idx


--
--  Model.  (as database table)
--    
--
class TModel
  test_var: 100

  new: ()=>
    @test_var2 = @test_var
    @data = {}
    @entry = ObjectEntry.new self
    @schema_name = @schema_name or @__class.__name
    @setSchema @schema_name
    mt = getmetatable @
    @__index0 = mt.__index
    -- mt.__index = (t,k,v)->
    --   r = @get k
    --   if r==nil then
    --     return @__index0 t,k,v
    --   else
    --     return r

  getSchema: ()=> @schema

  setSchema: (scname)=>
    scname = scname or @__class.__name
    @schema_name = scname
    @schema = TSchema.schemas[@schema_name]
    print "called setSchema: ",@schema_name,tostring(@schema)
    -- @table_name = @schema.table_name

  getSchemaName: ()=> @schema_name

  getTableName: ()=>
    if @table_name
      @table_name
    else if @schema
      @schema.table_name
    else
      @schema_name

  getEntry: ()=> @entry

  get: (key)=>
    if type(key)=="number"
      return @data[key]
    elseif type(key)=="string"
      idx = @schema\getColumnIndexByName(key)
      if idx
        return @data[idx]
      else
        return nil
    else
      return nil

  set: (key,value)=>
    if type(key)=="number"
      @data[key] = value
    elseif type(key)=="string"
      idx = @schema\getColumnIndexByName(key)
      if idx
        @data[idx] = value
      else
        return nil
    return nil

  --  static


return {
  :TSchema
  :TModel
}
