--  migrate_buffer.moon

{
  [1]: =>
    create_table "score_log", {
      { "id", serial primary_key:true }
      { "uid", integer }
    }

    --  generic article
    create_table "garticle", {
      { "id", serial primary_key:true }
      { "cname", text }       --  article classification (as table)
      { "uid", integer }      --  user ID
      { "title", text }       --  title.
      { "content", text }     --  content. (as markdown)
      { "ctime", time }       --  Create Time
      { "utime", time }       --  Update Time

      --  scorable
      { "score_up", integer }
      { "score_down", integer }
      { "score", integer }

      -- "PRIMARY KEY (id)"
    }

    --  generic comment
    create_table "gcomment", {
      { "id", serial primary_key:true }
      { "cname", text }
      { "uid", integer }
      { "pc_id", integer null:true }    --  parent comment ID
      { "content", text }     --  as markdown
      { "utime", time }       --  update time

      --  scorable
      { "score_up", integer }
      { "score_down", integer }
      { "score", integer }

      -- "PRIMARY KEY (id)"
    }
}
