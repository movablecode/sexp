
# Simple Info Renderer  (이하 SIR)

# 자동화된 개발 환경 (automated ENV)

  HTTP 웹 서비스
  로그 수집, 행동 패턴 파악

# 핵심 구현 목표
-  높은 페이지 생산성 (선언적 페이지 컴포넌트와 기능 구성)
- 빠른 반응 속도
- 가벼운 구동 환경
- 실시간 부분 갱신  (property update)


# 환경

- web-socket 기반. 고반응성. 가벼움. primus


spid : 속성, property 요소를 표현. storage property ID
soid : 객체, storage object ID
scid : 클래스. storage class ID

scid 에서 속성의 메타를 지정한다.
soid 에서 객체를 구체화한다.
spid 에서 세부 데이터를 상세화 한다. (객체내 속성의 구체화.)

  % spid 는 scid, soid 가 같이 지정되어야만 데이터가 구체화된다.
  scid 에서 속성의 메타를 가져오고, soid 에서 객체를 구체화한다.
  세부 데이터는 spid 를 이용해서 접근한다.

view component 에서
  정적 프레임 (static frame) 을 선언하고,
  동적 데이터 (dymamic data) 를 주입한다.
  위 두가지 요소로 화면을 렌더링 (rendering) 한다.

view 의 정적 프레임.
  static frame 은 컨포넌트 요소와 spid 를 선언함으로서 완료된다.
  컴포넌트 요소는 HTML 5 요소일 수 있으며, 이와 관련된 데이터 바인딩은 spid 를 기술한다.
  spid 는 scid, soid 가 같이 지정되어야만 데이터가 구체화되므로, scid,soid 를 지정해서 연결된 하부요소 또는 상위요소, 형제요소에게 같은 영향을 끼칠 수 있는 구조가 필요하다.
  이를 연결 컴포넌트라 규정하자.
  연결 컴포넌트는 시각화 되거나, 그렇지 않을 수도 있다.
  또한, 연결 컴포넌트는 해당 컴포넌트의 로컬 안에 존재할 수도 있고, 컴포넌트 외부에 존재할 수도 있다.
  연결 컴포넌트가 내부에 존재할 경우, 컴포넌트의 제거시에 쉽게 같이 제거될 수 있다.
  만약 연결 컴포넌트가 외부에 존재한다면, 컴포넌트의 제거시에 같이 제거될 수 있는 연결정보와 그에 따르는 생성, 삭제 작업이 필요하다.


mid 는 메타데이터를 가진다.

mid:
  DB Equility =>  None. Column Meta Info.
  컬럼 메타 정보.


cid:  Class ID.
  DB Equility =>  Table.
  mid 의 리퍼런스를 품는다.
  리퍼런스 mid 를 통해 pid 를 참조한다.
  pid 를 통해 컬럼구성을 만든다.
  실시간, 동적으로 cid 가 생성될 수 있어야 한다. cid 생성에 드는 비용이 가급적 적어야 효율이 생긴다.
  _id : class ID.
  _mid : Meta ID.

oid:  Object ID.
  DB Equilty =>  Row.
  oid 는 cid 가 구체화된 것으로 Key 로 검색이 가능해야 한다.
  _id : object ID.
  _cid : Class ID.
  _PA : property array. 속성을 배열 첨자로 보유
  _PM : property map. 속성을 이름-키의 맵으로 보유.
  _properties : 컬럼 데이터. _cid's _mid 정보를 참조해서 구성.


series 데이터는 동적 생성된 cid 로 표현하고, 개별 데이터는 oid 로 구현한다.
마지막 oid (latest row) 가 꽤 중요한 항목을 경우가 종종 있다.

oid 의 속성 참조

let o = oid instance.
이름 속성 (nid 3. key:'name')
  o._PM.name
  o._PA[3]
