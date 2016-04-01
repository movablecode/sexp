--  migrations.moon

import create_table, types from require "lapis.db.schema"

{
  --  첫 테이블 생성 테스트
  [1]: =>
    create_table "tt02", {
      { "id", types.serial }
      { "title", types.text }
      { "content", types.text }

      "PRIMARY KEY (id)"
    }
}
