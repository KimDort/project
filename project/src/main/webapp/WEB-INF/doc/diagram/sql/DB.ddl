/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		nno                           		NUMBER(38)		 NOT NULL,
		bname                         		VARCHAR2(10)		 DEFAULT 'NOTICE'		 NULL ,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		writer                        		VARCHAR2(50)		 NOT NULL,
		regdate                       		DATE		 NOT NULL,
		startDay                      		VARCHAR2(1000)		 NULL ,
		endDay                        		VARCHAR2(1000)		 NULL ,
		readCount                     		NUMBER(38)		 DEFAULT 0		 NULL ,
		strong                        		CHAR(1)		 NULL ,
		closed                        		CHAR(1)		 NULL ,
		deleted                       		CHAR(1)		 NULL ,
		display                       		CHAR(1)		 NULL ,
		file1                         		VARCHAR2(1000)		 NULL ,
		size1                         		LONG		 NULL ,
		thumb                         		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.nno is '게시번호';
COMMENT ON COLUMN NOTICE.bname is '게시물이름';
COMMENT ON COLUMN NOTICE.title is '제목';
COMMENT ON COLUMN NOTICE.content is '내용';
COMMENT ON COLUMN NOTICE.writer is '작성자';
COMMENT ON COLUMN NOTICE.regdate is '등록일';
COMMENT ON COLUMN NOTICE.startDay is '게시일';
COMMENT ON COLUMN NOTICE.endDay is '게시만료일';
COMMENT ON COLUMN NOTICE.readCount is '조회수';
COMMENT ON COLUMN NOTICE.strong is '강조';
COMMENT ON COLUMN NOTICE.closed is '비공개';
COMMENT ON COLUMN NOTICE.deleted is '삭제';
COMMENT ON COLUMN NOTICE.display is '화면표시여부';
COMMENT ON COLUMN NOTICE.file1 is '원본파일';
COMMENT ON COLUMN NOTICE.size1 is '파일사이즈';
COMMENT ON COLUMN NOTICE.thumb is '변환이미지';


ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_PK PRIMARY KEY (nno);
/**********************************/
/* Table Name: 이벤트 */
/**********************************/
CREATE TABLE event(
		eno                           		NUMBER(38)		 NOT NULL,
		bname                         		VARCHAR2(10)		 DEFAULT 'EVENT'		 NULL ,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NULL ,
		writer                        		VARCHAR2(80)		 NOT NULL,
		regdate                       		DATE		 DEFAULT sysdate		 NOT NULL,
		startday                      		VARCHAR2(1000)		 NULL ,
		endday                        		VARCHAR2(1000)		 NULL ,
		strong                        		CHAR(1)		 DEFAULT 'N'		 NULL ,
		closed                        		CHAR(1)		 DEFAULT 'N'		 NULL ,
		banner                        		CHAR(1)		 DEFAULT 'N'		 NULL ,
		quit                          		CHAR(1)		 DEFAULT 'N'		 NULL ,
		deleted                       		CHAR(1)		 DEFAULT 'N'		 NULL ,
		display                       		CHAR(1)		 NULL ,
		file1                         		VARCHAR2(1000)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		thumb1                        		VARCHAR2(1000)		 NULL ,
		file2                         		VARCHAR2(1000)		 NULL ,
		size2                         		NUMBER(10)		 NULL ,
		thumb2                        		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eno is '번호';
COMMENT ON COLUMN event.bname is '게시판이름';
COMMENT ON COLUMN event.title is '제목';
COMMENT ON COLUMN event.content is '내용';
COMMENT ON COLUMN event.writer is '작성';
COMMENT ON COLUMN event.regdate is '등록일';
COMMENT ON COLUMN event.startday is '이벤트시작일';
COMMENT ON COLUMN event.endday is '이벤트종료일';
COMMENT ON COLUMN event.strong is '강조';
COMMENT ON COLUMN event.closed is '비공개';
COMMENT ON COLUMN event.banner is '배너표시여부';
COMMENT ON COLUMN event.quit is '종료여부';
COMMENT ON COLUMN event.deleted is '삭제여부';
COMMENT ON COLUMN event.display is '화면표시여부';
COMMENT ON COLUMN event.file1 is '원본이미지파일';
COMMENT ON COLUMN event.size1 is '원본파일사이즈';
COMMENT ON COLUMN event.thumb1 is '이미지카피';
COMMENT ON COLUMN event.file2 is '배너이미지원본';
COMMENT ON COLUMN event.size2 is '배너사이즈';
COMMENT ON COLUMN event.thumb2 is '배너카피';


ALTER TABLE event ADD CONSTRAINT IDX_event_PK PRIMARY KEY (eno);

/**********************************/
/* Table Name: 쇼핑몰 */
/**********************************/
CREATE TABLE SHOP(
		sno                           		NUMBER(38)		 NOT NULL,
		bname                         		VARCHAR2(10)		 DEFAULT 'SHOP'		 NULL ,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		writer                        		VARCHAR2(80)		 NOT NULL,
		regdate                       		DATE		 NOT NULL,
		startDay                      		VARCHAR2(1000)		 NULL ,
		endDay                        		VARCHAR2(1000)		 NULL ,
		goodCount                     		NUMBER(38)		 DEFAULT 0		 NULL ,
		readCount                     		NUMBER(38)		 DEFAULT 0		 NULL ,
		salecost                      		NUMBER(38)		 DEFAULT 0		 NULL ,
		strong                        		CHAR(1)		 NULL ,
		closed                        		CHAR(1)		 NULL ,
		deleted                       		CHAR(1)		 NULL ,
		display                       		CHAR(1)		 NULL ,
		file1                         		VARCHAR2(1000)		 NULL ,
		size1                         		LONG		 NULL ,
		thumb                         		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE SHOP is '쇼핑몰';
COMMENT ON COLUMN SHOP.sno is '번호';
COMMENT ON COLUMN SHOP.bname is '게시판이름';
COMMENT ON COLUMN SHOP.title is '제목';
COMMENT ON COLUMN SHOP.content is '내용';
COMMENT ON COLUMN SHOP.writer is '작성자';
COMMENT ON COLUMN SHOP.regdate is '작성일';
COMMENT ON COLUMN SHOP.startDay is '게시일';
COMMENT ON COLUMN SHOP.endDay is '게시만료일';
COMMENT ON COLUMN SHOP.goodCount is '좋아요';
COMMENT ON COLUMN SHOP.readCount is '조회수';
COMMENT ON COLUMN SHOP.salecost is '할인금액';
COMMENT ON COLUMN SHOP.strong is '강조';
COMMENT ON COLUMN SHOP.closed is '비공개';
COMMENT ON COLUMN SHOP.deleted is '삭제';
COMMENT ON COLUMN SHOP.display is '화면표시여부';
COMMENT ON COLUMN SHOP.file1 is '이미지파일';
COMMENT ON COLUMN SHOP.size1 is '이미지사이즈';
COMMENT ON COLUMN SHOP.thumb is '덤프';


ALTER TABLE SHOP ADD CONSTRAINT IDX_SHOP_PK PRIMARY KEY (sno);


/**********************************/
/* Table Name: 쿠킹클래스 */
/**********************************/
CREATE TABLE COOK(
		cno                           		NUMBER(38)		 NOT NULL,
		bname                         		VARCHAR2(10)		 DEFAULT 'COOK'		 NULL ,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		writer                        		VARCHAR2(80)		 NOT NULL,
		regdate                       		DATE		 NOT NULL,
		startDay                      		VARCHAR2(1000)		 NULL ,
		endDay                        		VARCHAR2(1000)		 NULL ,
		startTime                     		VARCHAR2(1000)		 NULL ,
		endTime                       		VARCHAR2(1000)		 NULL ,
		minMember                     		NUMBER(38)		 NOT NULL,
		maxMember                     		NUMBER(38)		 NULL ,
		cost                          		NUMBER(38)		 NULL ,
		salecost                      		NUMBER(38)		 DEFAULT 0		 NULL ,
		someReady                     		VARCHAR2(300)		 NULL ,
		sellThingNum                  		VARCHAR2(38)		 NULL ,
		readCount                     		NUMBER(38)		 DEFAULT 0		 NULL ,
		strong                        		CHAR(1)		 NULL ,
		closed                        		CHAR(1)		 NULL ,
		deleted                       		CHAR(1)		 NULL ,
		sale                          		CHAR(1)		 NULL ,
		display                       		CHAR(1)		 NULL ,
		file1                         		VARCHAR2(1000)		 NULL ,
		size1                         		LONG		 NULL ,
		thumb                         		VARCHAR2(1000)		 NULL 
);

COMMENT ON TABLE COOK is '쿠킹클래스';
COMMENT ON COLUMN COOK.cno is '번호';
COMMENT ON COLUMN COOK.bname is '게시판이름';
COMMENT ON COLUMN COOK.title is '제목';
COMMENT ON COLUMN COOK.content is '내용';
COMMENT ON COLUMN COOK.writer is '작성자';
COMMENT ON COLUMN COOK.regdate is '작성일';
COMMENT ON COLUMN COOK.startDay is '시작일';
COMMENT ON COLUMN COOK.endDay is '만료일';
COMMENT ON COLUMN COOK.startTime is '시작시간';
COMMENT ON COLUMN COOK.endTime is '끝시간';
COMMENT ON COLUMN COOK.minMember is '최소인원';
COMMENT ON COLUMN COOK.maxMember is '최대인원';
COMMENT ON COLUMN COOK.cost is '결제금액';
COMMENT ON COLUMN COOK.salecost is '할인금액';
COMMENT ON COLUMN COOK.someReady is '준비물';
COMMENT ON COLUMN COOK.sellThingNum is '팔물건들';
COMMENT ON COLUMN COOK.readCount is '조회수';
COMMENT ON COLUMN COOK.strong is '강조';
COMMENT ON COLUMN COOK.closed is '비공개';
COMMENT ON COLUMN COOK.deleted is '삭제';
COMMENT ON COLUMN COOK.sale is '세일';
COMMENT ON COLUMN COOK.display is '화면표시여부';
COMMENT ON COLUMN COOK.file1 is '이미지파일';
COMMENT ON COLUMN COOK.size1 is '이미지사이즈';
COMMENT ON COLUMN COOK.thumb is '덤프';


ALTER TABLE COOK ADD CONSTRAINT IDX_COOK_PK PRIMARY KEY (cno);

DROP TABLE COOK;


/*강조 여부가 아닌 데이터 가져오기*/
SELECT NNO, TITLE, CONTENT, THUMB, STRONG, CLOSED, DELETED, DISPLAY, R FROM
(SELECT NNO, TITLE, CONTENT, THUMB, STRONG, CLOSED, DELETED, DISPLAY,  ROWNUM AS R 
FROM NOTICE WHERE STRONG !='Y' ORDER BY NNO DESC)WHERE 5>R
/*강조 여부가 맞는 데이터 가져오기*/
SELECT NNO, STRONG, CLOSED, DELETED, TITLE, CONTENT, THUMB, R, DISPLAY FROM
    (SELECT NNO, STRONG, CLOSED, DELETED, ROWNUM AS R, TITLE, CONTENT, THUMB AS THUMB ,DISPLAY
    FROM NOTICE  WHERE STRONG='Y' ORDER BY NNO DESC)WHERE  4>R
/*이벤트 부분 배너 출력 여부 검색*/
 SELECT * FROM (SELECT ENO, TITLE, CONTENT, BANNER, STRONG, CLOSED, DELETED, THUMB2, ROWNUM AS R FROM EVENT 
    WHERE BANNER='Y' ORDER BY ENO DESC)WHERE R < 5
/*게시물 번호 최대값 구하기*/    
SELECT NVL(MAX(ENO),0)+1 AS ENO FROM EVENT

/*공지사항 강조여부 가져오기*/
  SELECT NNO, STRONG, CLOSED, DELETED, TITLE, CONTENT, THUMB, R, DISPLAY FROM
    (SELECT NNO, STRONG, CLOSED, DELETED, ROWNUM AS R, TITLE, CONTENT, THUMB AS THUMB ,DISPLAY
    FROM NOTICE WHERE STRONG='Y' ORDER BY NNO DESC)WHERE  4>R
