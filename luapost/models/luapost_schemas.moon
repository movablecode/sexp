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
scUser = TSchema.new "SiteUser","site_user"
with scUser
  \define {
    { 1, "id",        "NUM", "사용자 ID"}
    { 2, "email",     "STR", "이메일"}
    { 3, "uname",     "STR", "이름"}
    { 4, "password",  "STR", "암호"}
    { 5, "create_at", "NUM", "생성시각"}
    { 6, "update_at", "NUM", "갱신시각"}
  }
  \build!


scRate = TSchema.new "Rate","rate"
with scRate
  \define {
    { 1, "id",        "NUM", "Rate ID"}
    { 2, "rate_up",   "NUM", "추천 횟수"}
    { 3, "rate_down", "NUM", "비추천 횟수"}
    { 4, "rate",      "NUM", "추천 점수 (추천-비추천)"}
    { 5, "update_at", "NUM", "갱신시각"}
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
    { 6, "rate_id",   "NUM", "Rate ID"}
    { 7, "create_at", "NUM", "생성시각"}
    { 8, "update_at", "NUM", "갱신시각"}
  }
  \build!

scComment = TSchema.new "Comment","comment"
with scComment
  \define {
    { 1, "id",        "NUM", "댓글 ID"}
    { 2, "group",     "STR", "게시 그룹"}
    { 3, "content",   "STR", "본문"}
    { 4, "rate_id",   "NUM", "Rate ID"}
    { 5, "update_at", "NUM", "갱신시각"}
  }
  \build!



return {
  :scUser
  :scRate
  :scRateAction
  :scArticle
  :scComment
}
