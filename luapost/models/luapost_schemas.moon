--  luapost_schemas.moon
import TSchema,TModel from require 'lib.tmodel'

--  Lua Post 사이트에 필요한 Schema, Model 들을
--  정리한다.
--  모든 모델들과 데이터-구조는 이 파일에서 정의됨.


--- Site User
--
--  스키마:      siteUser
--  테이블:      site_user
--
--  sophia 테이블은 인덱스를 하나만 지원한다.
--
scUser = TSchema.new "SiteUser","site_user"
with scUser
  \define {
    { 1, "id",        "NUM", "사용자 ID"}
    { 2, "email",     "STR", "이메일"}
    { 3, "uname",     "STR", "이름"}
    { 4, "password",  "STR", "암호"}
    { 5, "create_at", "NUM", "생성시각"}
    { 6, "update_at", "NUM", "갱신시각"}
    { 7, "facebook",  "STR", "facebook ID"}
    { 8, "twitter",   "STR", "twitter ID"}
    { 9, "google",    "STR", "google plus ID"}
  }
  \setOption {
    persistence: "sophia"
    indexes: {
      { "pk", {"id"} }
      -- { "pk_email", {"email"} }
    }
  }
  \build!

additional_user_index = {}

make_user_index = (postfix,desc) ->
  lpostfix = postfix\lower!
  idx_var = "scUser"..postfix
  idx_name = "SiteUser"..postfix
  idx_table = "site_user_"..lpostfix
  idx_obj = TSchema.new idx_name,idx_table
  with idx_obj
    \define {
      { 1, lpostfix,    "STR", desc}
      { 2, "id",        "NUM", "사용자 ID"}
    }
    \setOption {
      persistence: "sophia"
      indexes: {
        { "pk", {lpostfix} }
      }
    }
    \build!
  additional_user_index[idx_var] = idx_obj

make_user_index "email","이메일"
make_user_index "facebook","페이스북"
make_user_index "twitter","트위터"
make_user_index "google","구글플러스"


-- scUserEmail = TSchema.new "SiteUserEmail","site_user_email"
-- with scUserEmail
--   \define {
--     { 1, "email",     "STR", "이메일"}
--     { 2, "id",        "NUM", "사용자 ID"}
--   }
--   \setOption {
--     persistence: "sophia"
--     indexes: {
--       { "pk", {"email"} }
--     }
--   }
--   \build!



--  article, comment 는 모두 같은 ID 넘버링을 따른다.
--  rating 은 그래서 id 만으로도 추적이 된다.
--  이것을 ratable ID 라고 하자.
--  ratable ID 가 쓰이는 곳은 글과 댓글이며, 이들은 모두 같은 ID 채번을 공유한다.

scRatable = TSchema.new "Ratable","ratable"
with scRatable
  \define {
    { 1, "id",        "NUM", "Rate ID"}
    { 2, "rate_up",   "NUM", "추천 횟수"}
    { 3, "rate_down", "NUM", "비추천 횟수"}
    { 4, "rate",      "NUM", "추천 점수 (추천-비추천)"}
    { 5, "update_at", "NUM", "갱신시각"}
  }
  \setOption {
    persistence: "sophia"
    indexes: {
      { "pk", {"id"} }
    }
  }
  \build!

scRateAction = TSchema.new "RateAction","rate_action"
with scRateAction
  \define {
    { 1, "id",        "NUM", "Rate ID"}
    { 2, "user_id",   "NUM", "rate 유저"}
    { 3, "rate",      "NUM", "rate +1/-1"}
    { 4, "update_at", "NUM", "갱신시각"}
  }
  \build!

scArticle = TSchema.new "Article","article"
with scArticle
  \define {
    { 1, "id",        "NUM", "글 ID"}
    { 2, "group",     "STR", "게시 그룹"}
    { 3, "title",     "STR", "제목"}
    { 4, "content",   "STR", "본문"}
    { 5, "password",  "STR", "암호"}
    { 6, "create_at", "NUM", "생성시각"}
    { 7, "update_at", "NUM", "갱신시각"}
    { 8, "rate_up",   "NUM", "추천 횟수"}
    { 9, "rate_down", "NUM", "비추천 횟수"}
    {10, "rate",      "NUM", "추천 점수 (추천-비추천)"}
    {11, "rate_at",   "NUM", "평가 시각"}
  }
  \setOption {
    persistence: "sophia"
    indexes: {
      { "pk", {"group","id"} }
    }
  }
  \build!

scComment = TSchema.new "Comment","comment"
with scComment
  \define {
    { 1, "id",        "NUM", "댓글 ID"}
    { 2, "aid",       "NUM", "article ID"}
    { 3, "pid",       "NUM", "부모댓글 ID"}
    { 4, "content",   "STR", "본문"}
    { 5, "update_at", "NUM", "갱신시각"}
    { 6, "rate_up",   "NUM", "추천 횟수"}
    { 7, "rate_down", "NUM", "비추천 횟수"}
    { 8, "rate",      "NUM", "추천 점수 (추천-비추천)"}
    { 9, "rate_at",   "NUM", "평가 시각"}
  }
  \setOption {
    persistence: "sophia"
    indexes: {
      { "pk", {"aid","id"} }
    }
  }
  \build!


return_object = {
  :scUser
  :scRatable
  :scRateAction
  :scArticle
  :scComment
}
for k,v in pairs(additional_user_index)
  return_object[k] = v

return return_object
