--  migrations.moon

db = require "lapis.db"
schema = require "lapis.db.schema"
util = require "lapis.util"


import
  create_table
  add_column
  create_index
  drop_index
  drop_column
  drop_table
  from schema

import
  serial
  varchar
  text
  time
  integer
  foreign_key
  boolean
  enum
  from schema.types


{
  --  첫 테이블 생성 테스트
  [1]: =>
    create_table "tt02", {
      { "id", serial }
      { "title", text }
      { "content", text }

      "PRIMARY KEY (id)"
    }

    create_table "test_log", {
      { "id", serial primary_key:true }
      { "uid", integer }
    }

  --  generic article & comments
  --  prefix "ga_"  => Generic Attempts A.
  [2]: =>

    --  generic users
    create_table "users", {
      { "id", serial primary_key:true }
      { "uid", integer }
      { "name", varchar }
      { "email", varchar }
      { "pswd", varchar }
      { "role", varchar }
      { "created_at", time }  --  Create Time
      { "updated_at", time }  --  Update Time
    }
    create_index "users", "email", unique: true

    --  generic article
    create_table "ga_article", {
      { "id", serial primary_key:true }
      { "cname", text }       --  article classification (as table)
      { "uid", integer }      --  user ID
      { "title", text }       --  title.
      { "content", text }     --  content. (as markdown)
      { "created_at", time }  --  Create Time
      { "updated_at", time }  --  Update Time
      --  scorable
      { "score_up", integer }
      { "score_down", integer }
      { "score", integer }
    }
    create_index "ga_article", "cname","id", unique: true

    --  generic comment
    create_table "ga_comment", {
      { "id", serial primary_key:true }
      { "cname", text }
      { "uid", integer }
      { "pc_id", integer null:true }    --  parent comment ID
      { "content", text }     --  as markdown
      { "updated_at", time }  --  update time
      --  scorable
      { "score_up", integer }
      { "score_down", integer }
      { "score", integer }
      -- "PRIMARY KEY (id)"
    }
    create_index "ga_comment", "cname","id", unique: true


  --
}
