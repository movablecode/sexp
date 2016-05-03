--
--  Object TUple Mapper for tarantool (O.TU.M)
--  
--  author: Sangmin Lee
--
--

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

  new: (name) =>
    @name = name or @name
    @@persistences[@name] = self

  build: (o) => {}

  writeChanges: (schema,model)=>
    print "write changes..."

  getPersistence: (name)=> @@persistences[name]


--  persistence: tarantool
class TPersistenceTarantool extends TPersistence

--  persistence: tarantool - memtx
class TPersistenceTarantoolMemtx extends TPersistenceTarantool
  new: () => super 'memtx'
  build: (o) => {}
  writeChanges: (schema,model)=>
    print "write changes in tarantool.memtx !"
TPersistenceTarantoolMemtx!


--  persistence: tarantool - sophia
class TPersistenceTarantoolSophia extends TPersistenceTarantool
  new: () => super 'sophia'
  build: (o) =>
    print "build tarantool.sophia"
  writeChanges: (schema,model)=>
    print "write changes in tarantool.sophia !"
TPersistenceTarantoolSophia!


--  Resty remote persistence
class TPersistenceResty extends TPersistence
  new: (name) =>
    super 'resty'
    @@persistences['memtx'] = self
    @@persistences['sophia'] = self
  build: (o) =>
    print "build resty"

class TPersistencePostgresql extends TPersistence
  new: () => super 'postgresql'
  build: (o) =>
    print "build postgresql"



--
--  Schema.
--    Database Schema
--    Columns, Column-Sequences, Descriptions
--
class TSchema
  schemas: {}

  --  constructor
  new: =>
    @columns = {}                 --  numeric indexed column data
    @col_names = {}               --  string indexed column data
    @col_map = {}
    @option = nil
    @validate_hash = 0            --  schema validate hash
    @indexes = {}                 --  index map
    @persistence

  --  register
  register: (name,table_name)=>
    @name = name
    table_name = table_name or name
    @table_name = table_name      --  table name
    @@schemas[@name] = self

  --  properties
  getName: ()=>
    tostring @name

  getSchema: (name)=> @@schemas[name]

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

  setOption: (o)=>
    o.persistence = o.persistence or 'resty'
    o.indexes = o.indexes or {}
    @persistece = TPersistence\getPersistence o.persistence

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
    --  use persistence
    @persistece\build self

  --  make JSON object string
  toJSON: ()=>
    @columns

  --  make schema from JSON object
  fromJSON: (j)=>
    @columns

  writeChanges: (model)=>
    if @persistence
      @persistence\writeChanges self, model


  --  statics
  clone: (tname)->
    x = TSchema tname
    for k,v in pairs(@columns)
      x.columns[k] = v
      x.col_names[v.name] = v
      x.col_map[v.name] = v.idx

  instance: (opt)->
    opt.name = opt.name or "none"
    opt.table = opt.table or opt.name
    x = TSchema\getSchema opt.name
    if x==nil
      x = TSchema!
      x\register opt.name,opt.table
    with x
      \define opt.columns
      \setOption opt.option
      \build!
    return x



--
--  Model.  (as database table/row)
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
    @modified = {}

  getSchema: ()=> @schema

  setSchema: (scname)=>
    scname = scname or @__class.__name
    @schema_name = scname
    @schema = TSchema.schemas[@schema_name]
    -- print "called setSchema: ",@schema_name,tostring(@schema)
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

  getModified: ()=> @modified

  loadFrom: ()=>
    -- if @schema
    --   (@schema.getPersistence!)\loadFrom


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
      @setData(key,value)
    elseif type(key)=="string"
      idx = @schema\getColumnIndexByName(key)
      if idx
        @setData(idx,value)
      else
        return nil
    return nil

  --  raw set method with numeric/integer key
  setData: (ikey,value)=>
    @data[ikey] = value
    @modified[ikey] = value

  flush: ()=>
    --  do modified to schema/persistence
    if @schema
      @schema\writeChanges self
    @modified = {}


  --  static


return {
  :TSchema
  :TModel
  :TPersistence
  :TPersistenceResty
}
