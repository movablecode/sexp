
#   lua post

lua 에 관련된 커뮤니티 사이트.

ugc 는 계획 중.

뉴스와 컬럼, 연재를 한다.

형식보다는 내용이 훨씬 더 중요. 컨텐츠를 스스로 채운다.


##  구조

1.  page render.
1.  HTML sanitizing 을 이용한 partial-render.
1.  postgresql
1.  일반적인 웹 서비스를 만들어보고, 2차 단계로 전진.
  1.  인증 (user)
    User
      id          : serial
      email       : E-mail
      name        : 사용자명
      pswd        : password

  1.  게시판  (article,comments,uid)
    게시판은 그 형식이 항상 같다는 점을 유의해야 함.
      게시판 이름 (table명, class name)
      게시물: article
        id        : serial
        cname     : class name (table name)
        uid       : integer
        uname     : string : de-normalized
        title     : string
        content   : string
        ctime     : create time
        utime     : update time
        score_up    : integer
        score_down  : integer
        scorable  :  bool  (default:true)
      댓글: comments
        id        : serial
        uid       : integer
        uname     : string : de-normalized
        aid       : article id
        content   : string
        utime     : update time

    게시판은 동적으로 생성될 수 있어야 한다.
    단일 테이블이 계속 커짐으로 인한 성능문제는 튜닝으로 해결

    controller 는 library 와 비슷하게 간주할 것.

    유지보수가 가능한 상태를 계속 유지.

