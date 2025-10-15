CREATE DATABASE boardEX;
USE boardEX;
DROP TABLE IF EXISTS Replys;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS UserList;
CREATE TABLE UserList (
  uIDX INT NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  uName VARCHAR(30) NOT NULL COMMENT '회원성명',
  uID VARCHAR(30) NOT NULL COMMENT '아이디',
  uPW VARCHAR(30) NOT NULL COMMENT '비밀번호',
  uEmail VARCHAR(64) NOT NULL COMMENT '회원이메일',
  joinDate DATETIME NOT NULL DEFAULT now() COMMENT '가입일자',
  level CHAR(1) NOT NULL DEFAULT 'U' COMMENT '회원등급 : U, A, D',
  isActivate BOOLEAN NOT NULL DEFAULT true COMMENT '활성상태',
  -- 컬럼 선언 후, 기본키 지정
  PRIMARY KEY (uIDX)
) COMMENT '회원목록';
CREATE TABLE board (
  bIDX INT NOT NULL AUTO_INCREMENT COMMENT '게시글번호',
  bTitle VARCHAR(255) NOT NULL COMMENT '제목',
  bContent TEXT NOT NULL COMMENT '내용',
  bType VARCHAR(2) NOT NULL COMMENT '게시판종류 : fb, nb',
  wDate DATETIME NOT NULL DEFAULT now() COMMENT '작성일자',
  mDate DATETIME NULL COMMENT '수정일자',
  hits INT NULL DEFAULT 0 COMMENT '조회수',
  uIDX INT NOT NULL COMMENT '작성자회원번호',
  -- 참조 대상 테이블의 기본키 컬럼이름과, 참조키 컬럼이름이 같을때
  -- uIDX INT FOREIGN KEY REFERENCES 테이블이름 NOT NULL COMMENT '작성자회원번호',
  -- uIDX INT FOREIGN KEY REFERENCES UserList NOT NULL COMMENT '작성자회원번호',
  PRIMARY KEY (bIDX),
  -- 컬럼 정의 선언 후, 외래키 지정
  -- FOREIGN KEY (참조키 컬럼이름) REFERENCES 참조대상테이블이름 (기본키컬럼이름)
  -- FOREIGN KEY (uIDX) REFERENCES UserList (uIDX)
  FOREIGN KEY (uIDX) REFERENCES UserList (uIDX)
) COMMENT '게시글목록';
CREATE TABLE Replys (
  rIDX INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  rText VARCHAR(255) NOT NULL COMMENT '댓글내용',
  wDate DATETIME NOT NULL DEFAULT now() COMMENT '작성일자',
  bIDX INT NOT NULL COMMENT '게시글번호',
  uIDX INT NOT NULL COMMENT '댓글작성회원번호',
  PRIMARY KEY (rIDX),
  FOREIGN KEY (uIDX) REFERENCES UserList (uIDX),
  FOREIGN KEY (bIDX) REFERENCES board (bIDX)
) COMMENT '댓글목록';
/*
 create table 테이블이름
 (
 컬럼이름 컬럼타입 [unsigned] [not null] [primary key] [AUTO_INCREMENT] [COMMENT '코멘트'],
 컬럼2 타입,
 ...
 컬럼n 타입 [,]
 -- 컬럼 선언과 동시에 기본키 지정
 이름 타입 primary key 선언 사항
 -- 컬럼 선언과 동시에 외래키 지정
 이름 타입 [CONSTRAINT 명칭] REFERENCES 대상테이블이름 (기본키컬럼)
 -- 컬럼이름이 동일한 경우
 컬럼 타입 [CONSTRAINT 명칭] FOREIGN KEY REFERENCES 대상테이블이름
 -- 컬럼 선언 이후, 기본키 외래키 지정
 PRIMARY KEY (컬럼이름),
 [CONSTRAINT 명칭] FOREIGN KEY (컬럼이름) REFERENCES 대상테이블 (기본키컬럼)
 );
 -- 테이블 생성 이후 alter를 이용하여, 기본키, 외래키 지정
 alter table 테이블이름 add primary key (컬럼이름);
 -- primary key 지정된 컬럼은 수정할 수 없습니다
 alter table 테이블이름 drop primary key;
 -- 외래키 지정
 alter table 테이블이름
 add [CONSTRAINT 제약조건이름] FOREIGN KEY (컬럼이름)
 REFERENCES 대상테이블 (컬럼이름)
 ON UPDATE [타입]
 ON DELETE [타입]
 -- 타입 : RESTRICT | CASCADE | NO ACTION | SET NULL | SET DEFAULT
 참조된 기본키값 데이터를 변경,삭제할때에
 RESTRICT : 해당 기본키값을 참조하고 있는 데이터가 존재하면, 변경 삭제를 하지 않음
 CASCADE : 해당 기본키값을 참조하고 있는 데이터들을 모두 변경, 삭제
 NO ACTION (기본 설정) : MySQL 에서는 RESTRICT와 동일 동작
 -- NO ACTION : 테이블의 데이터 변경을 시도 후 무결성 검사를 수행
 -- RESTRICT : 변경, 삭제 실행 전에 검사 수행
 -- 참조 무결성 검사가 실패하면 두 작업이 동일하게 작동 결과
 -- SET NULL : 해당 기본키값을 참조하는 데이터의 참조키값을 NULL로 변경
 -- SET DEFAULT : 해당 기본키값을 참조하는 데이터의 참조키값을 기본값으로 변경
 
 -- 외래키는 제약조건명으로 삭제
 alter table 테이블이름 drop foreign key 제약조건명;
 -- 제약조건 이름을 선언하지 않았으면 자동으로 부여
 -- 제약조건이름 확인
 select * from infomation_schema.table_constraints where table_name = '테이블이름';
 */
-- 관리자 회원 등록
INSERT INTO UserList (uName, uID, uPW, uEmail, joinDate, level)
VALUES (
    '홍길동',
    'honggd',
    'pw$hong123',
    'honggd@example.com',
    '2024-01-03',
    'A'
  );
-- 유저 등급을 기본값으로 일반 회원 등록
INSERT INTO UserList (uName, uID, uPW, uEmail, joinDate)
VALUES (
    '전우치',
    'junwoo',
    'pw$jun456',
    'junwoo@example.com',
    '2024-01-08'
  ),
  (
    '임꺽정',
    'imkj',
    'pw$im789',
    'imkj@example.com',
    '2024-01-15'
  ),
  (
    '성춘향',
    'seongch',
    'pw$sc012',
    'seongch@example.com',
    '2024-01-20'
  ),
  (
    '이몽룡',
    'leemr',
    'pw$lm345',
    'leemr@example.com',
    '2024-01-25'
  );
-- 가입 일자를 현재시간으로 등록
INSERT INTO UserList (uName, uID, uPW, uEmail) VALUE (
    '콩쥐',
    'kongj',
    'pw$kj678',
    'kongj@example.com'
  );
INSERT INTO UserList (uName, uID, uPW, uEmail) VALUE (
    '팥쥐',
    'patj',
    'pw$pj901',
    'patj@example.com'
  );
-- 로그인을 위한 sql문 예시
-- id -> uID / pw -> uPW
select count(*)
from UserList
where uID = 'honggd'
  and uPW = 'pw$hong123';
-- 전우치를 비활성 회원으로 변경
update UserList
set isActivate = false
where uIDX = 2;
-- 비활성 유저를 로그인시 체크하고자 할때
-- 전우치의 id pw는 일치하나, 비활성 회원임
select count(*)
from UserList
where uID = 'junwoo'
  and uPW = 'pw$jun456'
  and isActivate = true;
-- 아이디 비번이 일치하는 연결에 대해서 회원 정보 조회 하기
select uIDX,
  uName,
  uEmail,
  level
from UserList
where isActivate = true
  and uID = 'honggd';
-- hash를 이용한 비밀번호 관리 실습
CREATE TABLE Users (
  uIDX INT NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  uName VARCHAR(30) NOT NULL COMMENT '회원성명',
  uID VARCHAR(30) NOT NULL COMMENT '아이디',
  uPW VARCHAR(32) NOT NULL COMMENT '비밀번호',
  PRIMARY KEY (uIDX)
) COMMENT '회원목록';
INSERT INTO Users (uName, uID, uPW) VALUE ('팥쥐', 'ezen', md5('ezen'));
-- 사용자가 입력한 비번에 동일한 hash 함수 적용하기
select count(*)
from Users
where uID = 'ezen'
  and uPW = md5('ezen');
-- hash 함수 결과값 확인하기
INSERT INTO Users (uName, uID, uPW) VALUE ('콩쥐', 'kong', md5('ezem'));
-- 게시글 목록 테이블에 데이터 넣기
insert into board (bTitle, bContent, bType, uIDX) VALUE ('첫번째 게시글입니다', '내용내용내용', 'fb', 1);
-- 참조 무결성 검사 실패 예시 : 10번 회원 없음
insert into board (bTitle, bContent, bType, uIDX) VALUE ('두번째 게시글입니다', '내용내용내용', 'fb', 10);
/* 게시글 정보 조회시,
 +------+---------------------+--------------+-------+---------------------+-------+------+------+
 | bIDX | bTitle              | bContent     | bType | wDate               | mDate | hits | uIDX |
 +------+---------------------+--------------+-------+---------------------+-------+------+------+
 |    1 | 첫번째 게시글입니다 | 내용내용내용 | fb    | 2025-10-15 12:06:47 | NULL  |    0 |    1 |
 +------+---------------------+--------------+-------+---------------------+-------+------+------+
 -- 외래키 참조 컬럼인 uIDX의 값으로
 UserList 테이블에서 uName을 가져와야 합니다
 select uName from UserList where uIDX = 1
 */
insert into board (bTitle, bContent, bType, uIDX) VALUE ('두번째 게시글입니다', '내용내용내용', 'fb', 2);
insert into board (bTitle, bContent, bType, uIDX) VALUE ('세번째 게시글입니다', '내용내용내용', 'fb', 4);
-- 서브쿼리
select *,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName
from board;
-- board 테이블에서 모든 컬럼과 모든 행을 가져오고
-- 각 행에 대해서
-- board테이블의 uIDX값과 같은 값을 갖는
-- UserList 테이블의 uIDX가 있는 데이터 행에서 uName을 가져오세요
-- 게시글 목록용 sql문 예시
select bIDX,
  bTitle,
  uIDX,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName,
  wDate,
  hits
from board;
-- 게시글 데이터 넣기
INSERT INTO board (bTitle, bContent, uIDX, bType, wDate, hits)
VALUES (
    '[필독] 커뮤니티 이용 규칙 안내',
    '안녕하세요. 커뮤니티를 이용하실 때 지켜주셔야 할 규칙들을 안내드립니다.\n\n1. 타인에 대한 비방, 욕설은 금지됩니다.\n2. 상업적 광고는 삭제 조치됩니다.\n3. 불법 정보 공유 시 법적 책임을 지실 수 있습니다.\n\n모두가 즐거운 커뮤니티를 만들어주세요.',
    1,
    'nb',
    '2024-01-05 10:00:00',
    324
  ),
  (
    '2024년 1월 정기 점검 안내',
    '서비스 안정화를 위한 정기 점검이 진행됩니다.\n\n점검 일시: 2024년 1월 10일 오전 2시 ~ 6시\n점검 내용: 데이터베이스 최적화, 보안 업데이트\n\n점검 중에는 서비스 이용이 제한될 수 있습니다.',
    1,
    'nb',
    '2024-01-08 15:30:00',
    156
  ),
  (
    '신규 기능 업데이트 안내',
    '다음 주 목요일, 새로운 기능들이 추가됩니다!\n\n- 게시글 임시저장 기능\n- 댓글 좋아요 기능\n- 다크모드 지원\n\n많은 이용 부탁드립니다.',
    1,
    'nb',
    '2024-01-12 14:20:00',
    289
  ),
  (
    '개인정보 처리방침 개정 안내',
    '개인정보 보호법 개정에 따라 당사 개인정보 처리방침이 변경됩니다.\n\n시행일: 2024년 2월 1일\n주요 변경사항: 정보 보유기간, 제3자 제공 내역\n\n자세한 내용은 공지사항을 참고해주세요.',
    1,
    'nb',
    '2024-01-18 11:00:00',
    98
  ),
  (
    '[이벤트] 설날 맞이 출석 이벤트',
    '설날을 맞아 출석 이벤트를 진행합니다!\n\n기간: 2024년 2월 5일 ~ 2월 15일\n보상: 매일 출석 시 포인트 적립\n\n많은 참여 바랍니다!',
    1,
    'nb',
    '2024-01-25 10:30:00',
    412
  ),
  (
    '회원 등급제 도입 안내',
    '활동에 따라 회원 등급이 부여됩니다.\n\n등급: 새싹 → 일반 → 우수 → VIP\n혜택: 등급별 포인트 적립률 차등\n\n열심히 활동해주세요!',
    1,
    'nb',
    '2024-01-30 16:00:00',
    203
  ),
  (
    '2024년 2월 정기 점검 완료',
    '정기 점검이 성공적으로 완료되었습니다.\n\n주요 작업 내역:\n- 서버 성능 개선\n- 버그 수정\n- 보안 패치 적용\n\n원활한 서비스 이용이 가능합니다.',
    1,
    'nb',
    '2024-02-07 07:00:00',
    87
  ),
  (
    '[긴급] 일시적 접속 장애 복구 완료',
    '오늘 오전 발생한 접속 장애가 복구되었습니다.\n\n장애 시간: 09:00 ~ 09:45\n원인: 트래픽 급증\n조치: 서버 증설\n\n불편을 드려 죄송합니다.',
    1,
    'nb',
    '2024-02-09 10:30:00',
    267
  ),
  (
    '모바일 앱 출시 예정 안내',
    '커뮤니티 모바일 앱이 3월에 출시됩니다!\n\nOS: Android, iOS\n주요 기능: 푸시 알림, 빠른 댓글 작성\n\n베타 테스터를 모집할 예정이니 많은 관심 부탁드립니다.',
    1,
    'nb',
    '2024-02-14 13:00:00',
    345
  );
INSERT INTO board (bTitle, bContent, uIDX, bType, wDate, hits)
VALUES (
    '오늘 날씨 정말 좋네요!',
    '아침부터 햇살이 따뜻해서 기분이 좋습니다.\n산책하기 딱 좋은 날씨인 것 같아요.\n\n여러분도 좋은 하루 보내세요!',
    2,
    'fb',
    '2024-01-10 08:30:00',
    45
  ),
  (
    '맛있는 파스타 레시피 공유합니다',
    '어제 만든 크림 파스타가 정말 맛있어서 레시피를 공유합니다.\n\n재료: 스파게티면, 생크림, 베이컨, 마늘, 파마산 치즈\n\n1. 면을 삶는다\n2. 베이컨과 마늘을 볶는다\n3. 생크림을 넣고 졸인다\n4. 면과 함께 볶고 치즈를 뿌린다\n\n간단하지만 맛있어요!',
    3,
    'fb',
    '2024-01-12 19:45:00',
    128
  ),
  (
    '주말에 등산 가실 분?',
    '이번 주말에 북한산 등산 계획 중입니다.\n\n일시: 1월 14일(일) 오전 9시\n집합 장소: 북한산 입구\n\n함께 가실 분 댓글 남겨주세요!',
    4,
    'fb',
    '2024-01-11 14:20:00',
    67
  ),
  (
    '노트북 구매 추천 부탁드립니다',
    '대학생인데 노트북을 새로 사려고 합니다.\n\n용도: 문서 작업, 동영상 편집\n예산: 100만원 내외\n\n추천해주시면 감사하겠습니다!',
    5,
    'fb',
    '2024-01-15 16:00:00',
    93
  ),
  (
    '오늘 본 영화 후기',
    '어제 개봉한 액션 영화를 봤는데 정말 재미있었어요!\n\nCG도 화려하고 스토리도 탄탄했습니다.\n배우들 연기도 훌륭했구요.\n\n강력 추천합니다!',
    6,
    'fb',
    '2024-01-16 21:30:00',
    156
  ),
  (
    '퇴근 후 운동 루틴 공유',
    '헬스장 3개월째 다니고 있는데 효과가 있는 것 같아요.\n\n루틴:\n- 월수금: 웨이트 트레이닝\n- 화목: 유산소 운동\n- 주말: 휴식\n\n꾸준히 하는 게 중요한 것 같습니다.',
    7,
    'fb',
    '2024-01-18 22:00:00',
    84
  ),
  (
    '고양이 키우시는 분들께 질문',
    '처음 고양이를 입양했는데 잘 적응을 못하는 것 같아요.\n\n숨어만 있고 밥도 잘 안먹네요.\n어떻게 하면 좋을까요?',
    2,
    'fb',
    '2024-01-20 11:30:00',
    112
  ),
  (
    '강남 맛집 추천해주세요',
    '다음 주에 강남에서 친구 만나기로 했는데\n좋은 식당 있으면 추천 부탁드립니다.\n\n한식이면 더 좋겠습니다!',
    3,
    'fb',
    '2024-01-22 15:45:00',
    76
  ),
  (
    '취미로 시작한 그림 그리기',
    '3개월 전부터 유튜브 보면서 그림 연습 중입니다.\n\n처음에는 선 긋기도 힘들었는데\n이제는 간단한 캐릭터 정도는 그릴 수 있어요.\n\n취미 생활 정말 좋네요!',
    4,
    'fb',
    '2024-01-24 18:20:00',
    134
  ),
  (
    '겨울 여행지 추천 부탁드려요',
    '2월에 2박 3일로 국내 여행 가려고 합니다.\n\n겨울에 가기 좋은 곳 있을까요?\n눈 구경하고 온천도 즐기고 싶습니다.',
    5,
    'fb',
    '2024-01-26 13:00:00',
    98
  ),
  (
    '오늘 아침에 만든 샌드위치',
    '재료가 많이 없어서 간단하게 만들었는데\n의외로 맛있더라구요.\n\n통밀빵, 계란, 치즈, 토마토\n건강한 한 끼 식사 완성!',
    6,
    'fb',
    '2024-01-28 09:15:00',
    54
  ),
  (
    '책 추천 받습니다',
    '요즘 독서에 빠져있는데\n추천할만한 소설 있으면 알려주세요.\n\n장르는 상관없습니다!',
    7,
    'fb',
    '2024-01-30 20:00:00',
    89
  ),
  (
    '이직 고민 중입니다',
    '현재 직장에서 3년째 근무 중인데\n이직을 고민하고 있습니다.\n\n연봉은 오르는데 업무가 너무 반복적이에요.\n여러분이라면 어떻게 하시겠어요?',
    2,
    'fb',
    '2024-02-01 17:30:00',
    167
  ),
  (
    '피아노 배우고 싶은데',
    '30대인데 피아노를 배워보고 싶습니다.\n\n너무 늦은 나이일까요?\n성인 취미반 다니시는 분 계신가요?',
    3,
    'fb',
    '2024-02-03 14:00:00',
    121
  ),
  (
    '점심 메뉴 추천 좀...',
    '매일 점심 메뉴 고르는 게 너무 힘드네요.\n\n여러분은 오늘 뭐 드셨나요?\n추천 좀 부탁드립니다!',
    4,
    'fb',
    '2024-02-05 12:00:00',
    73
  ),
  (
    '재택근무 장단점',
    '회사에서 재택근무를 시작한 지 한 달 됐습니다.\n\n장점: 출퇴근 시간 절약, 편한 복장\n단점: 집중력 저하, 운동 부족\n\n여러분은 어떠신가요?',
    5,
    'fb',
    '2024-02-07 16:30:00',
    145
  ),
  (
    '최근 넷플릭스 추천작',
    '요즘 넷플릭스에서 재미있게 본 드라마 추천합니다.\n\n스토리 전개가 빠르고 연기가 훌륭해요.\n주말에 정주행 각입니다!',
    6,
    'fb',
    '2024-02-09 19:00:00',
    198
  ),
  (
    '새벽 러닝 시작했어요',
    '오늘부터 새벽 러닝을 시작했습니다.\n\n아침 공기가 정말 상쾌하네요.\n건강해지는 느낌이에요!',
    7,
    'fb',
    '2024-02-11 06:30:00',
    67
  ),
  (
    '핸드드립 커피 입문',
    '집에서 커피를 내려 마시기 시작했습니다.\n\n원두 선택부터 물 온도까지\n신경 쓸 게 많지만 재미있어요.\n\n카페 부럽지 않아요!',
    2,
    'fb',
    '2024-02-13 10:00:00',
    112
  ),
  (
    '혼자 여행 다녀왔어요',
    '처음으로 혼자 제주도 여행을 다녀왔습니다.\n\n처음엔 걱정했는데 정말 자유롭더라구요.\n제 속도에 맞춰 여행할 수 있어서 좋았어요.',
    3,
    'fb',
    '2024-02-15 22:00:00',
    187
  );
-- 게시글 목록용 sql문 예시
select bIDX,
  bTitle,
  uIDX,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName,
  wDate,
  hits
from board
where bType = 'fb' -- 자유게시판 글만
order by bIDX desc -- 최신글이 위로
limit 0, 10;
-- 페이지당 게시글수 10개 / 1페이지
-- 공지 게시판의 최신 글 3개를 내림차순으로 조회하세요
select bIDX,
  bTitle,
  uIDX,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName,
  wDate,
  hits
from board
where bType = 'nb' -- 자유게시판 글만
order by bIDX desc -- 최신글이 위로
limit 0, 3;
-- 3개만
-- select 절에서의 서브쿼리 : 스칼라 서브쿼리
-- 두 테이블간의 관계 설정
select board.bIDX,
  board.bTitle,
  board.uIDX as board_uIDX,
  (
    select uName
    from UserList
    where UserList.uIDX = board.uIDX
  ) as uName
from board;
-- from 절에서의 서브쿼리 : 인라인 뷰
-- 별도의 select 테이블을 생성하고, 생성된 테이블을 출처로 사용
select uName,
  level
from UserList;
select uname
from (
    select uName,
      level
    from UserList
  ) u
where u.level = 'A';
select uname
from (
    select uName,
      level
    from UserList
  ) u
where u.level = 'U';
select uname
from (
    select uName,
      level
    from UserList
    where isActivate = true
  ) u
where u.level = 'U';
-- where절에 작성된 서브쿼리 : 조건 필터링
-- board테이블의 데이터조회 : 조건 ->일반유저 회원이 작성한 게시글
-- 1. 일반 유저 목록 생성
select uidx
from UserList
where level = 'U';
-- 2. 일반 유저 목록을 조건으로 사용
select bidx,
  btitle,
  uidx
from board
where uidx in (
    select uidx
    from UserList
    where level = 'U'
  );
-- 일반유저 회원중 비활성 상태인 회원이 작성한 게시글
select bidx,
  btitle,
  uidx
from board
where uidx in (
    select uIDX
    from UserList
    where level = 'U'
      and isActivate = false
  );
-- 게시글에 댓글 달기
insert into Replys (rText, bIDX, uIDX) VALUE ('첫번째 댓글', 1, 11);
-- 1번글 / 1번회원
insert into Replys (rText, bIDX, uIDX)
VALUES ('두번째 댓글', 1, 4),
  -- 1번글 / 4번회원
  ('세번째 댓글', 1, 7);
-- 1번글 / 7번회원
-- 1번 게시글의 댓글 목록 조회하기
select *
from Replys
where bIDX = 1;
-- 댓글 3개 조회
-- 서브쿼리를 이용해서, 댓글 작성자의 이름을 같이 조회하기
select *,
  (
    select uName
    from UserList
    where uIDX = Replys.uIDX
  ) as uName
from Replys
where bIDX = 1;
-- 다음 sql문은 무결성 검사를 통과하지 못합니다
-- 사유 : 100번 게시글이 없음
insert into Replys (rText, bIDX, uIDX) VALUE ('1번 회원의 100번글에 작성한 첫번째 댓글', 100, 1);
-- 1번 게시글에 작성된 댓글의 개수
select count(*)
from Replys
where bIDX = 1;
-- 3번 게시글에 작성된 댓글의 개수
select count(*)
from Replys
where bIDX = 3;
-- 10번 게시글에 작성된 댓글의 개수
select count(*)
from Replys
where bIDX = 10;
-- 게시글 목록 조회 : 페이지당 10개의 개시글 1페이지
-- 서브쿼리를 사용하여 
-- 1 uName 컬럼 : 게시글 작성자 이름
-- 2 Reply_count 컬럼 : 각 게시글에 작성된 댓글 개수
select bIDX,
  bTitle,
  uIDX,
  wDate,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName,
  (
    select count(*)
    from Replys
    where bIDX = board.bIDX
  ) as Reply_count
from board
order by bIDX
limit 0, 10;
-- 댓글 생성하기 
insert into Replys (rText, bIDX, uIDX)
VALUES -- 1번글 댓글
  ('1번글, 댓글4', 1, 7),
('1번글, 댓글5', 1, 5),
  ('1번글, 댓글6', 1, 3),
  -- 3번글 댓글
  ('3번글, 댓글1', 3, 7),
  -- 4번글 댓글
  ('4번글, 댓글1', 4, 3),
('4번글, 댓글2', 4, 4),
  ('4번글, 댓글3', 4, 2),
  -- 8번글 댓글
  ('8번글, 댓글1', 8, 6),
('8번글, 댓글2', 8, 4),
  ('8번글, 댓글3', 8, 2),
  -- 10번글 댓글
  ('10번글, 댓글1', 10, 2),
('10번글, 댓글2', 10, 2),
  ('10번글, 댓글3', 10, 5),
('10번글, 댓글4', 10, 7),
  ('10번글, 댓글5', 10, 3),
('10번글, 댓글6', 10, 2),
  ('10번글, 댓글7', 10, 1);
-- 1번부터 10번 게시글 목록 조회 + 각 게시글의 댓글 수
select bIDX,
  bTitle,
  uIDX,
  (
    select uName
    from UserList
    where uIDX = board.uIDX
  ) as uName,
  wDate,
  hits,
  (
    select count(*)
    from Replys
    where bIDX = board.bIDX
  ) as reply_count
from board
limit 0, 10;
-- 1번글의 댓글 목록
select *,
  (
    select uName
    from UserList
    where uIDX = Replys.uIDX
  ) as uName
from Replys
where bIDX = 1;