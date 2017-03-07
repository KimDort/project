drop table cook;
drop table thing;
drop table shop;
drop table notice;
drop table event;
		select display from cook where cno =1;
SELECT THING.* FROM 
		(SELECT @ROWNUM:=@ROWNUM+1 AS R,THING.* FROM THING,
		(SELECT @ROWNUM:=0)R WHERE STRONG='Y' ORDER BY tno DESC)thing LIMIT 4

delete from cook;
SELECT EVENT.* FROM 
		(SELECT @ROWNUM:=@ROWNUM+1 AS R,EVENT.* FROM EVENT,
		(SELECT @ROWNUM:=0)R WHERE BANNER='Y' ORDER BY ENO DESC)EVENT LIMIT 4
SELECT COOK.* FROM 
		(SELECT @ROWNUM:=@ROWNUM+1 AS R,COOK.* FROM COOK,
		(SELECT @ROWNUM:=0)R WHERE STRONG='Y' ORDER BY CNO DESC)COOK LIMIT 4
SELECT * FROM EVENT WHERE BANNER='Y' AND ENO < 5 ORDER BY ENO DESC
SELECT NOTICE.* FROM 
		(SELECT @ROWNUM:=@ROWNUM+1 AS R,NOTICE.* FROM NOTICE,
		(SELECT @ROWNUM:=0)R WHERE STRONG!='Y' ORDER BY NNO DESC)NOTICE LIMIT 4
		
		SELECT NOTICE.* FROM 
		(SELECT @ROWNUM:=@ROWNUM+1 AS R,NOTICE.* FROM NOTICE,
		(SELECT @ROWNUM:=0)R WHERE STRONG!='Y')NOTICE WHERE 5 > R ORDER BY NNO DESC

desc member
desc cook;
commit;
select * from member;
select * from notice;
delete from member;
select * from cook
drop table member;
SELECT ifnull(MAX(mno), 0)+1 as mno FROM MEMBER
SELECT NOTICE.* FROM (SELECT @ROWNUM:=@ROWNUM+1 AS R,NOTICE.* FROM NOTICE,(SELECT @ROWNUM:=0)R ORDER BY NOTICE.NNO)NOTICE WHERE NOTICE.R < 5 AND NOTICE.STRONG='Y'

SELECT * FROM (SELECT ENO, TITLE, CONTENT, STARTDAY, ENDDAY,BANNER, STRONG, CLOSED, DELETED, QUIT, THUMB2, ROWNUM AS R FROM EVENT 
    WHERE BANNER='Y' ORDER BY ENO DESC)WHERE R < 5;
    
    SELECT * FROM EVENT WHERE BANNER='Y' AND ENO < 5 ORDER BY ENO DESC;
    SELECT NNO, STRONG, CLOSED,	DELETED, TITLE, CONTENT, THUMB DISPLAY FROM	(SELECT NNO, STRONG,
		CLOSED, DELETED,ROWNUM AS R, TITLE, CONTENT, THUMB AS THUMB ,DISPLAY FROM NOTICE WHERE STRONG='Y' ORDER BY NNO DESC)WHERE 4>R
		SELECT * FROM NOTICE WHERE STRONG='Y' AND NNO <5 ORDER BY NNO DESC
/**********************************/
/* Table Name: �������� */
/**********************************/
		show tables;
		drop table notice;
CREATE TABLE NOTICE(
		nno                           		INT(38)		 NOT NULL,
		bname                         		VARCHAR(100)		 DEFAULT 'NOTICE'		 NULL,
		title                         		VARCHAR(200)		 NOT NULL,
		content                       		TEXT		 NOT NULL,
		writer                        		VARCHAR(50)		 NOT NULL,
		regdate                       		DATE		 NOT NULL,
		startDay                      		VARCHAR(1000)		 NULL,
		endDay                        		VARCHAR(1000)		 NULL,
		readCount                     		INT(38)		 DEFAULT 0		 NULL,
		strong                        		CHAR(1)		 NULL,
		closed                        		CHAR(1)		 NULL,
		deleted                       		CHAR(1)		 NULL,
		display                       		CHAR(1)		 NULL,
		file1                         		VARCHAR(1000)		 NULL,
		size1                         		INT(10)		 NULL,
		thumb                         		VARCHAR(1000)		 NULL
)

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		id                            		VARCHAR(80)		 NOT NULL COMMENT '회원아이디(email)',
		mno                           		INT(38)		 NOT NULL COMMENT '회원번호',
		password                      		VARCHAR(80)		 NOT NULL COMMENT '회원암호',
		name                          		VARCHAR(12)		 NOT NULL COMMENT '회원이름',
		nickname                      		VARCHAR(50)		 NOT NULL COMMENT '회원닉네임',
		phone                         		VARCHAR(15)		 NOT NULL COMMENT '회원전화번호',
		zipcode                       		INT(7)		 NOT NULL COMMENT '우편번호',
		address1                      		VARCHAR(80)		 NOT NULL COMMENT '회원주소',
		address2                      		VARCHAR(80)		 NOT NULL COMMENT '회원상세주소',
		auth                          		VARCHAR(30)		 NOT NULL COMMENT '회원인증코드',
		auth2                         		VARCHAR(30)		 NULL  COMMENT '회원인증2',
		regdate                       		DATE		 NULL  COMMENT '가입날짜',
		confirm                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '회원인증여부',
		mlevel                        		CHAR(1)		 DEFAULT 'N'		 NOT NULL COMMENT '회원레벨',
		mdrop                         		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '회원탈퇴신청',
		point                         		INT(10)		 DEFAULT 0		 NULL  COMMENT '포인트',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '사진',
		size1                         		INT(10)		 NULL  COMMENT '사이즈',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '덤프사진파일'
) COMMENT='회원';

drop table member;
/**********************************/
/* Table Name: �̺�Ʈ */
/**********************************/
CREATE TABLE event(
		eno                           		INT(38)		 NOT NULL COMMENT '��ȣ',
		bname                         		VARCHAR(100)		 DEFAULT 'EVENT'		 NULL  COMMENT '�Խ����̸�',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		TEXT		 NULL  COMMENT '����',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '�ۼ�',
		regdate                       		DATE		 	 NOT NULL COMMENT '�����',
		startday                      		VARCHAR(100)		 NULL  COMMENT '�̺�Ʈ������',
		endday                        		VARCHAR(100)		 NULL  COMMENT '�̺�Ʈ������',
		strong                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '����',
		closed                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '�����',
		banner                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '���ǥ�ÿ���',
		quit                          		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '���Ῡ��',
		deleted                       		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '��������',
		display                       		CHAR(1)		 NULL  COMMENT 'ȭ��ǥ�ÿ���',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '�����̹�������',
		size1                         		INT(10)		 NULL  COMMENT '�������ϻ�����',
		thumb1                        		VARCHAR(1000)		 NULL  COMMENT '�̹���ī��',
		file2                         		VARCHAR(1000)		 NULL  COMMENT '����̹�������',
		size2                         		INT(10)		 NULL  COMMENT '��ʻ�����',
		thumb2                        		VARCHAR(1000)		 NULL  COMMENT '���ī��'
) COMMENT='�̺�Ʈ';


/**********************************/
/* Table Name: ���θ� */
/**********************************/
CREATE TABLE SHOP(
		sno                           		INT(38)		 NOT NULL COMMENT '��ȣ',
		bname                         		VARCHAR(10)		 DEFAULT 'SHOP'		 NULL  COMMENT '�Խ����̸�',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT '����',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '�ۼ���',
		regdate                       		DATE		 NOT NULL COMMENT '�ۼ���',
		startDay                      		VARCHAR(1000)		 NULL  COMMENT '�Խ���',
		endDay                        		VARCHAR(1000)		 NULL  COMMENT '�Խø�����',
		goodCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '���ƿ�',
		readCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '��ȸ��',
		salecost                      		INT(38)		 DEFAULT 0		 NULL  COMMENT '���αݾ�',
		strong                        		CHAR(1)		 NULL  COMMENT '����',
		closed                        		CHAR(1)		 NULL  COMMENT '�����',
		deleted                       		CHAR(1)		 NULL  COMMENT '����',
		display                       		CHAR(1)		 NULL  COMMENT 'ȭ��ǥ�ÿ���',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '�̹�������',
		size1                         		INT(10)		 NULL  COMMENT '�̹���������',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '����'
) COMMENT='���θ�';

/**********************************/
/* Table Name: 쿠킹클래스 */
/**********************************/
CREATE TABLE COOK(
		cno                           		INT(38)		 NOT NULL COMMENT '번호',
		bname                         		VARCHAR(10)		 DEFAULT 'COOK'		 NULL  COMMENT '게시판이름',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		TEXT		 NOT NULL COMMENT '내용',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '작성자',
		regdate                       		DATE		 NOT NULL COMMENT '작성일',
		askStart                      		VARCHAR(100)		 NULL  COMMENT '신청날짜시작',
		askEnd                         		VARCHAR(100)		 NULL  COMMENT '신청날짜마감',
		startDay                      		VARCHAR(1000)		 NULL  COMMENT '시작일',
		endDay                        		VARCHAR(1000)		 NULL  COMMENT '만료일',
		startTime                     		VARCHAR(1000)		 NULL  COMMENT '시작시간',
		endTime                       		VARCHAR(1000)		 NULL  COMMENT '끝시간',
		minMember                     		INT(38)		 NOT NULL COMMENT '최소인원',
		maxMember                     		INT(38)		 NULL  COMMENT '최대인원',
		cost                          		INT(38)		 NULL  COMMENT '결제금액',
		salecost                      		INT(38)		 DEFAULT 0		 NULL  COMMENT '할인금액',
		someReady                     		VARCHAR(300)		 NULL  COMMENT '준비물',
		sellThingNum                  		VARCHAR(38)		 NULL  COMMENT '팔물건들',
		readCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '조회수',
		strong                        		CHAR(1)		 NULL  COMMENT '강조',
		closed                        		CHAR(1)		 NULL  COMMENT '비공개',
		deleted                       		CHAR(1)		 NULL  COMMENT '삭제',
		sale                          		CHAR(1)		 NULL  COMMENT '세일',
		display                       		CHAR(1)		 NULL  COMMENT '화면표시여부',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '이미지파일',
		size1                         		INT(10)		 NULL  COMMENT '이미지사이즈',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '덤프'
) COMMENT='쿠킹클래스';

drop table cook
/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE thing(
		tno                           		INT(38)		 NOT NULL COMMENT '��ǰ��ȣ',
		category                      		CHAR(1)		 NULL  COMMENT 'ī�װ�',
		name                          		VARCHAR(1000)		 NULL  COMMENT '�̸�',
		content                       		TEXT		 NULL  COMMENT '����',
		stock                         		INT(38)		 NULL  COMMENT '���',
		buycost                       		INT(10)		 NULL  COMMENT '����',
		sellcost                      		INT(38)		 NULL  COMMENT '�ǸŰ�',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '�̹���',
		size1                         		INT(10)		 NULL  COMMENT '������',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '����',
		strong                        		CHAR(1)		 NULL  COMMENT '����',
		closed                        		CHAR(1)		 NULL  COMMENT '�����',
		deleted                       		CHAR(1)		 NULL  COMMENT '����'
) COMMENT='����';


ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_PK PRIMARY KEY (nno);

ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (id);

ALTER TABLE event ADD CONSTRAINT IDX_event_PK PRIMARY KEY (eno);

ALTER TABLE SHOP ADD CONSTRAINT IDX_SHOP_PK PRIMARY KEY (sno);

ALTER TABLE COOK ADD CONSTRAINT IDX_COOK_PK PRIMARY KEY (cno);

ALTER TABLE thing ADD CONSTRAINT IDX_thing_PK PRIMARY KEY (tno);

desc thing
