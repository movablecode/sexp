lapis = require "lapis"
html = require "lapis.html"
db = require "lapis.db"
config = require "lapis.config"

tnt = require 'resty.tarantool'

class extends html.Widget
  content: =>
    act = @params.act or "def"
    h1 act
    lfn = {
      add: ->
        h3 "OK this is ADD"
      def: ->
        h2 tostring config.session_name
        h2 "Test tt02 table iteration"
        res = db.query "SELECT * FROM tt02"
        p type(res)
        for k,v in pairs res
          p k
          p type(v)
          for k2,v2 in pairs v
            p k2
            p v2
      test1: ->
        TestLog = require "models.TestLog"
        h3 sf "OK this is TEST1: %s",tostring(TestLog)
      tnt01: ->
        p sf "%s - %s - %s", (type tnt),(tostring tnt),(tostring tnt.new)
        tar, err = tnt\new {
          host: '127.0.0.1'
          port: 3301
          user: 'guest'
          -- password: 'some_password'
          socket_timeout: 2000
        }
        tar\connect!
        p tar\ping!
      t01: ->
        import TSchema,TModel from require 'lib.tmodel'

        sch1 = TSchema "User","users"
        sch2 = TSchema "Article"
        p sf "%s - %s",sch1\getName!,sch1.table_name
        p sf "%s - %s",sch2\getName!,sch2.table_name

        cnum = sch1\define {
          { 1, "id",      "STR", "사용자 ID"}
          { 2, "email",   "STR", "email 주소"}
          { 3, "name",    "STR", "사용자 이름"}
          { 4, "pswd",    "STR", "패스워드"}
        }
        p cnum
        col = sch1\getColumn 2
        p tostring col.name
        p tostring col.desc

        class User extends TModel
          schema_name: 'User'
          test_var: 150
          table_name: 'cave3'

        cave = User!
        cave2 = User!
        cave2.test_var = 200
        cave2.table_name = 'cave2'
        p cave\getTableName!
        p cave2\getTableName!
        p TModel.table_name
        p cave\getTableName!
        p sf "test_var: %s / %s",tostring(cave.test_var),tostring(cave2.test_var)
        p sf "test_var2: %s / %s",tostring(cave.test_var2),tostring(cave2.test_var2)
        p User.__name
        p cave.__class.__name
        p cave.katana
        cave\set("pswd","david")
        p cave\get("pswd")
        p cave\get("pswd")
        cave\set("pswd","david2")
        p cave\get("pswd")
        p cave\get("pswd")
        p "THIS"
        ent = cave\getEntry!
        p ent["pswd"]
        ent.pswd = "Katana"
        p ent["pswd"]
        p cave\get("pswd")
      t02: ->
        import TSchema,TModel from require 'lib.tmodel'
        --  Comment 라는 스키마 생성
        h3 "스키마 생성"
        sch1 = TSchema "Comment"
        p sf "%s - %s",sch1\getName!,sch1.table_name
        cnum = sch1\define {
          { 1, "id",        "NUM", "주석 ID"}
          { 2, "pid",       "NUM", "상위 주석 ID"}
          { 3, "content",   "STR", "코멘트"}
          { 4, "rate_up",   "NUM", "Rate-Up 횟수"}
          { 5, "rate_down", "NUM", "Rate-Down 횟수"}
          { 6, "rate",      "NUM", "Rate 점수"}
        }
        p cnum
        --  모델을 만든다.
        object_info = (o)->
          p sf "스키마/테이블명: %s/%s",o\getSchemaName!,o\getTableName!
          s = o\getSchema!
          p tostring s
          p o.schema_name
          -- for k,v in pairs(o\getSchema!\getColumns!)
          --   p sf "__> %3d: %s",k,v.desc
        h3 "모델을 만든다."
        class Comment extends TModel
        --  모델의 인스턴스. (레코드/객체)
        --  최소한 하나의 인스턴스는 있어야 테이블 연산이 가능.
        c = Comment!
        object_info c
        --  동적으로 모델을 만들고 인스턴싱
        --  같은 스키마를 공유하지만, 저장 테이블은 다르다.
        Comment2 = class extends TModel
          schema_name: "Comment"
          table_name: "Comment2"
        c2 = Comment2!
        p "동적생성된 모델, 테이블만 다르다."
        object_info c2
        -- p c2.__class.__name


    }
    fn = lfn[act]
    fn! if fn
