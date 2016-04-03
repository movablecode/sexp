
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


1.  유지보수가 가능한 상태 (managable, managed)
  소스로부터 스키마가 만들어진다. 소스의 변경사항을 스키마가 따라간다.
  스키마는 데이터의 구성.
    스키마는 소스에서 영속적 매체로 전달.
    스키마의 변경관리는 소스의 관리를 뜻함.
    소스의 스키마와 영속 매체와의 차이는 영속매체가 스스로 맞춘다.
    사용자는 소스의 스키마만 관리하고, 한 지점에서 관리하고 스키마 변경사항을 배포한다.
  모델은 스키마, 이와 관련된 스키마 중심의 로직을 담는다.
    모델은 하나의 레코드/객체를 표현 할 수 있다.
    모델은 외부에서 배열(array)을 받아들여 데이터를 완전하게 구성할 수 있다.
    모델의 인스턴스는 레코드객체이다.
    레코드/객체를 생성하려면
      빈 모델을 새로 생성하거나,
      다른 모델로부터 복사한다.

  스키마를 만들고 난 후, 

