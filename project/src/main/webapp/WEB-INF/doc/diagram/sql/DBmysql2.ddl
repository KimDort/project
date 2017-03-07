select * from shoporder;
delete from shoporder;
commit
select count(*) from address_streecode;
select count(*) from address_info;
select count(*) from address_lotnumber;
show tables;
select * from cook;
update cook set display='Y' where cno=9;
commit;
select * from member;
delete from member;
select * from shop;
select * from category;
select * from event;
select * from thing;
select * from ctgroup;
select * from thing where ctgroup=6 and category=1;
select * from(select * from thing as th
join shopmorething as sht on th.tno=sht.tno)th.tno=1;
select * from thing where tno=(select tno from shopmorething where sno=13);

drop table shoporder;
/**********************************/
/* Table Name: 주문테이블 */
/**********************************/
CREATE TABLE shoporder(
		ono                           		INT(38)		 NOT NULL COMMENT '번호',
		ordernum                      		VARCHAR(100)		 NOT NULL COMMENT '주문번호',
		orderer                       		INT(38)		 NULL  COMMENT '주문자',
		bankname                      		VARCHAR(100)		 NULL  COMMENT '입금자명',
		bank                          		VARCHAR(100)		 NULL  COMMENT '입금은행',
		tno                           		INT(38)		 NULL  COMMENT '상품번호',
		sno                           		INT(38)		 NULL  COMMENT '주문상품페이지',
		cost                          		INT(38)		 NULL  COMMENT '상품가격',
		orderstock                    		INT(10)		 NULL  COMMENT '주문갯수',
		usepoint                      		INT(38)		 NULL  COMMENT '사용포인트',
		totalcost                     		INT(38)		 NULL  COMMENT '총결제금액',
		zipcode                       		VARCHAR(100)		 NULL  COMMENT '주문우편번호',
		address1                      		VARCHAR(1000)		 NULL  COMMENT '주문주소',
		address2                      		VARCHAR(1000)		 NULL  COMMENT '주문상세주소',
		phone                         		VARCHAR(100)		 NULL  COMMENT '주문전화번호',
		method                        		CHAR(1)		 NULL  COMMENT '결제방법',
		ispayment                     		CHAR(1)		 NULL  COMMENT '결제여부',
		orderdate                     		VARCHAR(100)		 NULL  COMMENT '주문일자',
		processing                    		CHAR(1)		 NULL  COMMENT '처리상태',
		cancel                        		CHAR(1)		 NULL  COMMENT '취소여부',
		iscancel                      		CHAR(1)		 NULL  COMMENT '취소상태'
) COMMENT='주문테이블';

ALTER TABLE shoporder ADD CONSTRAINT IDX_shoporder_PK PRIMARY KEY (ono);
ALTER TABLE shoporder ADD CONSTRAINT IDX_shoporder_FK0 FOREIGN KEY (tno) REFERENCES thing (tno);

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
ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (id);

/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		nno                           		INT(38)		 NOT NULL COMMENT '게시번호',
		bname                         		VARCHAR(100)		 DEFAULT 'NOTICE'		 NULL  COMMENT '게시판이름',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		TEXT		 NOT NULL COMMENT '내용',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '작성자',
		regdate                       		DATE		 NOT NULL COMMENT '등록일',
		startDay                      		VARCHAR(1000)		 NULL  COMMENT '게시일',
		endDay                        		VARCHAR(1000)		 NULL  COMMENT '게시만료일',
		readCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '조회수',
		strong                        		CHAR(1)		 NULL  COMMENT '강조',
		closed                        		CHAR(1)		 NULL  COMMENT '비공개',
		deleted                       		CHAR(1)		 NULL  COMMENT '삭제',
		display                       		CHAR(1)		 NULL  COMMENT '화면표시여부',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '원본파일',
		size1                         		INT(10)		 NULL  COMMENT '파일사이즈',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '변환이미지'
) COMMENT='공지사항';

ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_PK PRIMARY KEY (nno);
ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_FK0 FOREIGN KEY (writer) REFERENCES MEMBER (id);

drop table event;
/**********************************/
/* Table Name: 이벤트 */
/**********************************/
CREATE TABLE event(
		eno                           		INT(38)		 NOT NULL COMMENT '번호',
		bname                         		VARCHAR(10)		 DEFAULT 'EVENT'		 NULL  COMMENT '게시판이름',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		TEXT		 NULL  COMMENT '내용',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '작성',
		regdate                       		DATE		 NOT NULL COMMENT '등록일',
		startday                      		VARCHAR(1000)		 NULL  COMMENT '이벤트시작일',
		endday                        		VARCHAR(1000)		 NULL  COMMENT '이벤트종료일',
		strong                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '강조',
		closed                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '비공개',
		banner                        		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '배너표시여부',
		quit                          		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '종료여부',
		deleted                       		CHAR(1)		 DEFAULT 'N'		 NULL  COMMENT '삭제여부',
		display                       		CHAR(1)		 NULL  COMMENT '화면표시여부',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '원본이미지파일',
		size1                         		INT(10)		 NULL  COMMENT '원본파일사이즈',
		thumb1                        		VARCHAR(1000)		 NULL  COMMENT '이미지카피',
		file2                         		VARCHAR(1000)		 NULL  COMMENT '배너이미지원본',
		size2                         		INT(10)		 NULL  COMMENT '배너사이즈',
		thumb2                        		VARCHAR(1000)		 NULL  COMMENT '배너카피',
		saleshop                      		INT(38)		 NULL  COMMENT '세일상품',
		salecook                      		INT(38)		 NULL  COMMENT '세일쿠킹클래스'
) COMMENT='이벤트';

ALTER TABLE event ADD CONSTRAINT IDX_event_PK PRIMARY KEY (eno);
ALTER TABLE event ADD CONSTRAINT IDX_event_FK0 FOREIGN KEY (writer) REFERENCES MEMBER (id);
ALTER TABLE event ADD CONSTRAINT IDX_event_FK1 FOREIGN KEY (saleshop) REFERENCES SHOP (sno);
ALTER TABLE event ADD CONSTRAINT IDX_event_FK2 FOREIGN KEY (salecook) REFERENCES COOK (cno);

drop table cook;
drop table cookmorething;
delete from cook;
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
		askEnd                        		VARCHAR(100)		 NULL  COMMENT '신청날짜마감',
		startDay                      		VARCHAR(1000)		 NULL  COMMENT '시작일',
		endDay                        		VARCHAR(1000)		 NULL  COMMENT '만료일',
		startTime                     		VARCHAR(1000)		 NULL  COMMENT '시작시간',
		endTime                       		VARCHAR(1000)		 NULL  COMMENT '끝시간',
		minMember                     		INT(38)		 NOT NULL COMMENT '최소인원',
		maxMember                     		INT(38)		 NULL  COMMENT '최대인원',
		cost                          		INT(38)		 NULL  COMMENT '결제금액',
		salecost                      		INT(38)		 DEFAULT 0		 NULL  COMMENT '할인금액',
		someReady                     		VARCHAR(300)		 NULL  COMMENT '준비물',
		readCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '조회수',
		strong                        		CHAR(1)		 NULL  COMMENT '강조',
		st_begin                      		VARCHAR(100)		 NULL  COMMENT '강조시작날짜',
		st_end                        		VARCHAR(100)		 NULL  COMMENT '강조끝날짜',
		st_day                        		VARCHAR(100)		 NULL  COMMENT '강조등록일이후날짜',
		closed                        		CHAR(1)		 NULL  COMMENT '비공개',
		clo_begin                     		VARCHAR(100)		 NULL  COMMENT '비공개시작날짜',
		clo_end                       		VARCHAR(100)		 NULL  COMMENT '비공개끝날짜',
		clo_day                       		VARCHAR(100)		 NULL  COMMENT '비공개등록후날짜',
		deleted                       		CHAR(1)		 NULL  COMMENT '삭제',
		del_begin                     		VARCHAR(100)		 NULL  COMMENT '삭제시작날짜',
		del_end                       		VARCHAR(100)		 NULL  COMMENT '삭제끝날짜',
		del_day                        		VARCHAR(100)		 NULL  COMMENT '삭제등록후날짜',
		sale                          		CHAR(1)		 NULL  COMMENT '세일',
		sale_begin                    		VARCHAR(100)		 NULL  COMMENT '세일시작날짜',
		sale_end                      		VARCHAR(100)		 NULL  COMMENT '세일끝날짜',
		sale_day                      		VARCHAR(100)		 NULL  COMMENT '세일등록후날짜',
		display                       		CHAR(1)		 NULL  COMMENT '화면표시여부',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '이미지파일',
		size1                         		INT(10)		 NULL  COMMENT '이미지사이즈',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '덤프'
) COMMENT='쿠킹클래스';

ALTER TABLE COOK ADD CONSTRAINT IDX_COOK_PK PRIMARY KEY (cno);
ALTER TABLE COOK ADD CONSTRAINT IDX_COOK_FK0 FOREIGN KEY (writer) REFERENCES MEMBER (id);





select * from thing;
delete from thing;
commit;
drop table thing;
/**********************************/
/* Table Name: 물건 */
/**********************************/
CREATE TABLE thing(
		tno                           		INT(38)		 NOT NULL COMMENT '상품번호',
		ctgroup                       		INT(38)		 NULL  COMMENT '카테고리그룹',
		category                      		INT(38)		 NULL  COMMENT '카테고리',
		name                          		VARCHAR(1000)		 NULL  COMMENT '이름',
		stock                         		INT(38)		 NULL  COMMENT '재고',
		buycost                       		INT(10)		 NULL  COMMENT '원가',
		sellcost                      		INT(38)		 NULL  COMMENT '판매가',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '이미지',
		size1                         		INT(10)		 NULL  COMMENT '사이즈',
		thumb                         		VARCHAR(1000)		 NULL  COMMENT '덤프'
) COMMENT='물건';

ALTER TABLE thing ADD CONSTRAINT IDX_thing_PK PRIMARY KEY (tno);
ALTER TABLE thing ADD CONSTRAINT IDX_thing_FK0 FOREIGN KEY (category) REFERENCES category (ctno);


/**********************************/
/* Table Name: 카테고리그룹 */
/**********************************/
CREATE TABLE ctgroup(
		ctgroup                       		INT(10)		 NOT NULL COMMENT '그룹번호',
		name                          		VARCHAR(30)		 NULL  COMMENT '이름'
) COMMENT='카테고리그룹';

ALTER TABLE ctgroup ADD CONSTRAINT IDX_ctgroup_PK PRIMARY KEY (ctgroup);


/**********************************/
/* Table Name: 물건카테고리 */
/**********************************/
CREATE TABLE category(
		ctno                          		INT(38)		 NULL  COMMENT '상품번호',
		ctname                        		VARCHAR(30)		 NULL  COMMENT '이름',
		ctgroup                       		INT(10)		 NULL  COMMENT '카테고리그룹',
		count                         		INT(38)		 NULL  COMMENT '등록된글'
) COMMENT='물건카테고리';

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (ctno);
ALTER TABLE category ADD CONSTRAINT IDX_category_FK0 FOREIGN KEY (ctgroup) REFERENCES ctgroup (ctgroup);

drop table ctgroup;
drop table category;
drop table shopmorething;
drop table cookmorething;
drop table cook;
drop table  shop;
drop table thing;
drop table event;
/**********************************/
/* Table Name: 쇼핑몰 */
/**********************************/
CREATE TABLE SHOP(
		sno                           		INT(38)		 NOT NULL COMMENT '번호',
		tno                           		INT(38)		 NULL  COMMENT '상품번호',
		bname                         		VARCHAR(10)		 DEFAULT 'SHOP'		 NULL  COMMENT '게시판이름',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '제목',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT '내용',
		writer                        		VARCHAR(80)		 NOT NULL COMMENT '작성자',
		regdate                       		DATE		 NOT NULL COMMENT '작성일',
		startDay                      		VARCHAR(1000)		 NULL  COMMENT '게시일',
		endDay                        		VARCHAR(1000)		 NULL  COMMENT '게시만료일',
		goodCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '좋아요',
		readCount                     		INT(38)		 DEFAULT 0		 NULL  COMMENT '조회수',
		cost                          		INT(38)		 NULL  COMMENT '가격',
		salecost                      		INT(38)		 DEFAULT 0		 NULL  COMMENT '할인금액',
		strong                        		CHAR(1)		 NULL  COMMENT '강조',
		st_begin                      		VARCHAR(100)		 NULL  COMMENT '강조시작날짜',
		st_end                        		VARCHAR(100)		 NULL  COMMENT '강조끝날짜',
		st_day                        		VARCHAR(100)		 NULL  COMMENT '강조등록후날짜',
		closed                        		CHAR(1)		 NULL  COMMENT '비공개',
		clo_begin                     		VARCHAR(100)		 NULL  COMMENT '비공개시작날짜',
		clo_end                       		VARCHAR(100)		 NULL  COMMENT '비공개끝날짜',
		clo_day                       		VARCHAR(100)		 NULL  COMMENT '비공개등록후날짜',
		deleted                       		CHAR(1)		 NULL  COMMENT '삭제',
		del_begin                     		VARCHAR(100)		 NULL  COMMENT '삭제시작날짜',
		del_end                       		VARCHAR(100)		 NULL  COMMENT '삭제끝날짜',
		del_day                       		VARCHAR(100)		 NULL  COMMENT '삭제등록후날짜',
		display                       		CHAR(1)		 NULL  COMMENT '화면표시여부',
		sale                          		CHAR(1)		 NULL  COMMENT '세일여부',
		sale_begin                    		VARCHAR(100)		 NULL  COMMENT '세일시작날짜',
		sale_end                      		VARCHAR(100)		 NULL  COMMENT '세일끝날짜',
		sale_day                      		VARCHAR(100)		 NULL  COMMENT '세일등록후날짜',
		file1                         		VARCHAR(1000)		 NULL  COMMENT '이미지파일'
) COMMENT='쇼핑몰';

ALTER TABLE SHOP ADD CONSTRAINT IDX_SHOP_PK PRIMARY KEY (sno);
ALTER TABLE SHOP ADD CONSTRAINT IDX_SHOP_FK0 FOREIGN KEY (writer) REFERENCES MEMBER (id);
ALTER TABLE SHOP ADD CONSTRAINT IDX_SHOP_FK1 FOREIGN KEY (tno) REFERENCES thing (tno);

drop table shopmorething;
/**********************************/
/* Table Name: 추가상품 */
/**********************************/
CREATE TABLE ShopMoreThing(
		mno                           		INT(10)		 NOT NULL COMMENT '테이블번호',
		sno                           		INT(38)		 NULL  COMMENT '번호',
		tno                           		INT(38)		 NULL  COMMENT '상품번호'
) COMMENT='추가상품';

ALTER TABLE ShopMoreThing ADD CONSTRAINT IDX_ShopMoreThing_PK PRIMARY KEY (mno);
ALTER TABLE ShopMoreThing ADD CONSTRAINT IDX_ShopMoreThing_FK0 FOREIGN KEY (sno) REFERENCES SHOP (sno);
ALTER TABLE ShopMoreThing ADD CONSTRAINT IDX_ShopMoreThing_FK1 FOREIGN KEY (tno) REFERENCES thing (tno);


drop table CookMoreThing;
/**********************************/
/* Table Name: 추가상품 */
/**********************************/
CREATE TABLE CookMoreThing(
		mno                           		INT(10)		 NOT NULL COMMENT '테이블번호',
		cno                           		INT(38)		 NULL  COMMENT '번호',
		sno                           		INT(38)		 NULL  COMMENT '번호'
) COMMENT='추가상품';

ALTER TABLE CookMoreThing ADD CONSTRAINT IDX_CookMoreThing_PK PRIMARY KEY (mno);
ALTER TABLE CookMoreThing ADD CONSTRAINT IDX_CookMoreThing_FK0 FOREIGN KEY (cno) REFERENCES COOK (cno);
ALTER TABLE CookMoreThing ADD CONSTRAINT IDX_CookMoreThing_FK1 FOREIGN KEY (sno) REFERENCES SHOP (sno);









/*도로명 코드*/
LOAD DATA INFILE 'address_streecode_utf8.txt'
IGNORE INTO TABLE address_streecode FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n' 
(StreetCode,Street, EngStreet, EupMyunDongNo, City, EngCity, Citied, EngCitied,
EupMyun, EngEupMyun, IsEupMyun, EupMyunCode, IsUse, ChangeCause, ChangeInfo, NotifiDate,DeleteDate)

/* 강원도 주소 정보 */
LOAD DATA INFILE 'address_gangwondo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)

/* 경기도 주소 정보 */
LOAD DATA INFILE 'address_gyounggido_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 경상남도 주소 정보 */
LOAD DATA INFILE 'address_kyoungsangnamdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 경상북도 주소 정보 */
LOAD DATA INFILE 'address_kyoungsangbukdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 광주광역시 주소 정보 */
LOAD DATA INFILE 'address_gawongju_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 대구광역시 주소 정보 */
LOAD DATA INFILE 'address_daegu_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 대전광역시 주소 정보 */
LOAD DATA INFILE 'address_daejeun_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 부산광역시 주소 정보 */
LOAD DATA INFILE 'address_busan_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 서울특별시 주소 정보 */
LOAD DATA INFILE 'address_seoul_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 세종특별시 주소 정보 */
LOAD DATA INFILE 'address_sesong_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 울산광역시 주소 정보 */
LOAD DATA INFILE 'address_ulsan_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 인천광역시 주소 정보 */
LOAD DATA INFILE 'address_inchen_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 전라남도 주소 정보 */
LOAD DATA INFILE 'address_jenlasamdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 전라북도 주소 정보 */
LOAD DATA INFILE 'address_jenlabukdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 제주특별자치도 주소 정보 */
LOAD DATA INFILE 'address_jeju_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 충청남도 주소 정보 */
LOAD DATA INFILE 'address_chungchennamdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/* 충청북도 주소 정보 */
LOAD DATA INFILE 'address_chungchenbukdo_utf8.txt'
IGNORE INTO TABLE address_info FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, StreetCode, EupMyunDongNo, IsBasement, BuildingOriNo, BuildingSecNo, 
BaseAreaNo, IsChangeCode, NotifiDate, BeforeStreeAddress, IsDetailAddress)


/*지번 정보 목록*/
/* 강원도 지번 정보 */
LOAD DATA INFILE 'address_lot_ganwondo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 경기도 지번 정보 */
LOAD DATA INFILE 'address_lot_gyounggido_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 경상남도 지번 정보 */
LOAD DATA INFILE 'address_lot_gyoungsangnamdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 경상북도 지번 정보 */
LOAD DATA INFILE 'address_lot_gyoungsangbukdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 광주 지번 정보 */
LOAD DATA INFILE 'address_lot_gwaonju_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 대구 지번 정보 */
LOAD DATA INFILE 'address_lot_deagu_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 대전 지번 정보 */
LOAD DATA INFILE 'address_lot_deajen_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 부산 지번 정보 */
LOAD DATA INFILE 'address_lot_busan_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 서울 지번 정보 */
LOAD DATA INFILE 'address_lot_seoul_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 세종 지번 정보 */
LOAD DATA INFILE 'address_lot_sesoung_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 울산 지번 정보 */
LOAD DATA INFILE 'address_lot_ulsan_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 인천 지번 정보 */
LOAD DATA INFILE 'address_lot_inchen_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 전라남도 지번 정보 */
LOAD DATA INFILE 'address_lot_jenlanamdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 전라북도 지번 정보 */
LOAD DATA INFILE 'address_lot_jenlabukdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 제주 지번 정보 */
LOAD DATA INFILE 'address_lot_jeju_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 충청남도 지번 정보 */
LOAD DATA INFILE 'address_lot_chungchengnamdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/* 충청북도 지번 정보 */
LOAD DATA INFILE 'address_lot_chungchengbukdo_utf8.txt'
IGNORE INTO TABLE address_lotnumber FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, serialnumber, LegalDongCode, StateCity, Citied, LegalEupMyeon, LegalRi,
IsMountain, LotNoOriNo, LotNoSecNo, IsRepresent )

/*부가 정보 목록*/
/* 강원도 부가 정보 */
LOAD DATA INFILE 'address_option_ganwondo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 경기도 부가 정보 */
LOAD DATA INFILE 'address_option_gyounggido_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 경상남도 부가 정보 */
LOAD DATA INFILE 'address_option_gyoungsangnamdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 경상북도 부가 정보 */
LOAD DATA INFILE 'address_option_gyoungsangbukdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 광주 부가 정보 */
LOAD DATA INFILE 'address_option_gwaonju_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 대구 부가 정보 */
LOAD DATA INFILE 'address_option_deagu_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 대전 부가 정보 */
LOAD DATA INFILE 'addressaddress_option_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 부산 부가 정보 */
LOAD DATA INFILE 'address_option_busan_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 서울 부가 정보 */
LOAD DATA INFILE 'address_option_seoul_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 세종 부가 정보 */
LOAD DATA INFILE 'address_option_sesoung_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 울산 부가 정보 */
LOAD DATA INFILE 'address_option_ulsan_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 인천 부가 정보 */
LOAD DATA INFILE 'address_option_inchen_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 전라남도 부가 정보 */
LOAD DATA INFILE 'address_option_jenlanamdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 전라북도 부가 정보 */
LOAD DATA INFILE 'address_option_jenlabukdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 제주 부가 정보 */
LOAD DATA INFILE 'address_option_jeju_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 충청남도 부가 정보 */
LOAD DATA INFILE 'address_option_chungchengnamdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

/* 충청북도 부가 정보 */
LOAD DATA INFILE 'address_option_chungchengbukdo_utf8.txt'
IGNORE INTO TABLE address_optioninfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
(AdminNo, AdministrativeDong, Administrative, Zipcode, ZipcodeSerialNum, DeliveryName,
BuildingRegName, CitiedBuilding, ApartmentHave )

select count(*) from address_info;

show innodb status \G
SET foreign_key_checks = 1;

delete from address_info;
delete from address_lotnumber;
select count(*)from address_info;
select count(*)from address_lotnumber;
drop table address_optioninfo;
select address_info.adminno, address_lotnumber.adminno from address_info, address_lotnumber where address_info.adminno=address_lotnumber.adminno;

/**********************************/
/* Table Name: 부가정보 */
/**********************************/
CREATE TABLE address_optioninfo(
		AdminNo                       		VARCHAR(50)		 NOT NULL COMMENT '관리번호',
		AdministrativeDong            		VARCHAR(10)		 NULL  COMMENT '행정동코드',
		Administrative                		VARCHAR(20)		 NULL  COMMENT '행정동명',
		Zipcode                       		VARCHAR(5)		 NULL  COMMENT '우편번호',
		ZipcodeSerialNum              		VARCHAR(3)		 NULL  COMMENT '우편번호일련번호',
		DeliveryName                  		VARCHAR(40)		 NULL  COMMENT '다량배달처명',
		BuildingRegName               		VARCHAR(40)		 NULL  COMMENT '건축물대장건물명',
		CitiedBuilding                		VARCHAR(200)		 NULL  COMMENT '시군구 건물명',
		ApartmentHave                 		CHAR(1)		 NULL  COMMENT '공동주택여부'
) COMMENT='부가정보';

ALTER TABLE address_optioninfo ADD CONSTRAINT IDX_address_optioninfo_PK PRIMARY KEY (AdminNo);
ALTER TABLE address_optioninfo ADD CONSTRAINT IDX_address_optioninfo_FK0 FOREIGN KEY (AdminNo) REFERENCES address_info (AdminNo);



/**********************************/
/* Table Name: 도로명코드 */
/**********************************/
CREATE TABLE address_streecode(
		StreetCode                    		VARCHAR(50)		 NOT NULL COMMENT '도로명코드',
		Street                        		VARCHAR(80)		 NULL  COMMENT '도로명',
		EngStreet                     		VARCHAR(80)		 NULL  COMMENT '도로명로마자',
		EupMyunDongNo                 		VARCHAR(2)		 NULL  COMMENT '읍면동일련번호',
		City                          		VARCHAR(20)		 NULL  COMMENT '시도명',
		EngCity                       		VARCHAR(40)		 NULL  COMMENT '시도로마자',
		Citied                        		VARCHAR(20)		 NULL  COMMENT '시군구명',
		EngCitied                     		VARCHAR(40)		 NULL  COMMENT '시군구명로마자',
		EupMyun                       		VARCHAR(20)		 NULL  COMMENT '읍면동명',
		EngEupMyun                    		VARCHAR(40)		 NULL  COMMENT '읍면동명 로마자',
		IsEupMyun                     		CHAR(1)		 NULL  COMMENT '읍면동구분',
		EupMyunCode                   		VARCHAR(3)		 NULL  COMMENT '읍면동코드',
		IsUse                         		CHAR(1)		 NULL  COMMENT '사용여부',
		ChangeCause                   		CHAR(1)		 NULL  COMMENT '변경사유',
		ChangeInfo                    		VARCHAR(14)		 NULL  COMMENT '변경이력정보',
		NotifiDate                    		VARCHAR(8)		 NULL  COMMENT '고시일자',
		DeleteDate                    		VARCHAR(8)		 NULL  COMMENT '말소일자'
) COMMENT='도로명코드';

ALTER TABLE address_streecode ADD CONSTRAINT IDX_address_streecode_PK PRIMARY KEY (StreetCode, EupMyunDongNo);



/**********************************/
/* Table Name: 주소정보 */
/**********************************/
CREATE TABLE address_info(
		AdminNo                       		VARCHAR(50)		 NOT NULL COMMENT '관리번호',
		StreetCode                    		VARCHAR(50)		 NULL  COMMENT '도로명코드',
		EupMyunDongNo                 		VARCHAR(2)		 NULL  COMMENT '읍면동일련번호',
		IsBasement                    		CHAR(1)		 NULL  COMMENT '지하여부',
		BuildingOriNo                 		INT(5)		 NULL  COMMENT '건물본번',
		BuildingSecNo                 		INT(5)		 NULL  COMMENT '건물부번',
		BaseAreaNo                    		VARCHAR(5)		 NULL  COMMENT '기초구역번호',
		IsChangeCode                  		VARCHAR(5)		 NULL  COMMENT '변경사유코드',
		NotifiDate                    		VARCHAR(8)		 NULL  COMMENT '고시일자',
		BeforeStreeAddress            		VARCHAR(25)		 NULL  COMMENT '변경전도로명주소',
		IsDetailAddress               		CHAR(1)		 NULL  COMMENT '상세주소부여여부'
) COMMENT='주소정보';

ALTER TABLE address_info ADD CONSTRAINT IDX_address_info_PK PRIMARY KEY (AdminNo);
ALTER TABLE address_info ADD CONSTRAINT IDX_address_info_FK0 FOREIGN KEY (StreetCode,EupMyunDongNo) REFERENCES address_streecode (StreetCode,EupMyunDongNo);



/**********************************/
/* Table Name: 지번정보 */
/**********************************/
CREATE TABLE address_lotnumber(
		AdminNo                       		VARCHAR(50)		 NOT NULL COMMENT '관리번호',
		serialnumber                  		INT(3)		 NOT NULL COMMENT '일련번호',
		LegalDongCode                 		VARCHAR(10)		 NULL  COMMENT '법정동코드',
		StateCity                     		VARCHAR(20)		 NULL  COMMENT '시도명',
		Citied                        		VARCHAR(20)		 NULL  COMMENT '시군구명',
		LegalEupMyeon                 		VARCHAR(20)		 NULL  COMMENT '법정읍면동명',
		LegalRi                       		VARCHAR(20)		 NULL  COMMENT '법정리명',
		IsMountain                    		CHAR(1)		 NULL  COMMENT '산여부',
		LotNoOriNo                    		INT(4)		 NULL  COMMENT '지번본번',
		LotNoSecNo                    		INT(4)		 NULL  COMMENT '지번부번',
		IsRepresent                   		CHAR(1)		 NULL  COMMENT '대표여부'
) COMMENT='지번정보';

ALTER TABLE address_lotnumber ADD CONSTRAINT IDX_address_lotnumber_PK PRIMARY KEY (AdminNo, serialnumber);
ALTER TABLE address_lotnumber ADD CONSTRAINT IDX_address_lotnumber_FK0 FOREIGN KEY (AdminNo) REFERENCES address_info (AdminNo);



/**********************************/
/* Table Name: 건물정보 */
/**********************************/
CREATE TABLE BuildingInfo(
		LegalCode                     		VARCHAR(20)		 NULL  COMMENT '법정코드',
		StateCity                     		VARCHAR(40)		 NULL  COMMENT '시도명',
		Citied                        		VARCHAR(40)		 NULL  COMMENT '시군구명',
		LegalEupMyeon                 		VARCHAR(40)		 NULL  COMMENT '법정읍동명',
		LegalRi                       		VARCHAR(40)		 NULL  COMMENT '법정리명',
		IsMountain                    		CHAR(1)		 NULL  COMMENT '산여부',
		LotNumOri                     		INT(10)		 NULL  COMMENT '지번본번(번지)',
		LotNumSec                     		INT(10)		 NULL  COMMENT '지번부번(호)',
		StreetCode                    		VARCHAR(30)		 NULL  COMMENT '도로명코드',
		Street                        		VARCHAR(80)		 NULL  COMMENT '도로명',
		IsBasement                    		CHAR(1)		 NULL  COMMENT '지하여부',
		BuildingOri                   		INT(10)		 NULL  COMMENT '건물본번',
		BuildingSec                   		INT(10)		 NULL  COMMENT '건물부번',
		RegBuilding                   		VARCHAR(40)		 NULL  COMMENT '건축물대장건물명',
		DetailBuilding                		VARCHAR(100)		 NULL  COMMENT '상세건물명',
		BuildingAdmin                 		VARCHAR(30)		 NOT NULL COMMENT '건물관리번호',
		EupMyeonSerial                		VARCHAR(10)		 NULL  COMMENT '읍면동일련번호',
		AdminVillageSerial            		VARCHAR(20)		 NULL  COMMENT '행정동코드',
		AdminVillage                  		VARCHAR(40)		 NULL  COMMENT '행정동명',
		Zipcode                       		VARCHAR(5)		 NULL  COMMENT '우편번호',
		ZipSerial                     		VARCHAR(5)		 NULL  COMMENT '우편일련번호',
		Delivery                      		VARCHAR(40)		 NULL  COMMENT '다량배달처명',
		MoveCode                      		VARCHAR(10)		 NULL  COMMENT '이동사유코드',
		NotifiDate                    		VARCHAR(8)		 NULL  COMMENT '고시일자',
		BeforeStreet                  		VARCHAR(25)		 NULL  COMMENT '변동전도로명주소',
		CitiedBuilding                		VARCHAR(200)		 NULL  COMMENT '시군군용건물명',
		IsApartment                   		CHAR(1)		 NULL  COMMENT '공동주택여부',
		BaseArea                      		VARCHAR(10)		 NULL  COMMENT '기초구역번호',
		IsDetailAddress               		CHAR(1)		 NULL  COMMENT '상세주소여부',
		etc1                          		VARCHAR(15)		 NULL  COMMENT '비고',
		etc2                          		VARCHAR(15)		 NULL  COMMENT '비고2'
) COMMENT='건물정보';

ALTER TABLE BuildingInfo ADD CONSTRAINT IDX_BuildingInfo_PK PRIMARY KEY (BuildingAdmin);

/**********************************/
/* Table Name: 도로명주소 */
/**********************************/
CREATE TABLE StreetAddress(
		LegalCode                     		VARCHAR(20)		 NULL  COMMENT '법정동코드',
		StateCity                     		VARCHAR(40)		 NULL  COMMENT '시도명',
		Citied                        		VARCHAR(40)		 NULL  COMMENT '시군구명',
		LegalEupMyeon                 		VARCHAR(40)		 NULL  COMMENT '법정읍면동명',
		LegalRi                       		VARCHAR(40)		 NULL  COMMENT '법정리명',
		IsMountain                    		CHAR(1)		 NULL  COMMENT '산여부',
		LotNumOri                     		INT(10)		 NULL  COMMENT '지번본번(번지)',
		LotNumSec                     		INT(10)		 NULL  COMMENT '지번부번(호)',
		StreetCode                    		VARCHAR(20)		 NULL  COMMENT '도로명코드',
		IsBaseMent                    		CHAR(1)		 NULL  COMMENT '지하여부',
		BuildingOri                   		INT(10)		 NULL  COMMENT '건물본번',
		BuildingSec                   		INT(10)		 NULL  COMMENT '건물부번',
		LotNumSerial                  		INT(20)		 NULL  COMMENT '지번일련번호',
		MoveCode                      		VARCHAR(10)		 NULL  COMMENT '이동사유코드'
) COMMENT='도로명주소';
ALTER TABLE StreetAddress ADD CONSTRAINT IDX_StreetAddress_PK1 PRIMARY KEY (StreetCode,IsBaseMent,BuildingOri,BuildingSec,LotNumSerial);

/**********************************/
/* Table Name: 도로명코드 */
/**********************************/
CREATE TABLE StreetCode(
		StateCityCode                 		VARCHAR(10)		 NULL  COMMENT '시군구코드',
		StreetNum                     		VARCHAR(10)		 NULL  COMMENT '도로명번호',
		Street                        		VARCHAR(80)		 NULL  COMMENT '도로명',
		EngStreet                     		VARCHAR(80)		 NULL  COMMENT '영문도로명',
		EupMyeonSerial                		VARCHAR(10)		 NULL  COMMENT '읍면동일련번호',
		StateCity                     		VARCHAR(40)		 NULL  COMMENT '시도명',
		Citied                        		VARCHAR(10)		 NULL  COMMENT '시군구명',
		IsEupMyeon                    		CHAR(1)		 NULL  COMMENT '읍면동구분',
		EupMyeonCode                  		VARCHAR(10)		 NULL  COMMENT '읍면동코드',
		EupMyeon                      		VARCHAR(40)		 NULL  COMMENT '읍면동명',
		OverStreetNo                  		VARCHAR(7)		 NULL  COMMENT '상위도로명번호',
		OverStreet                    		VARCHAR(80)		 NULL  COMMENT '상위도로명',
		IsUse                         		CHAR(1)		 NULL  COMMENT '사용여부',
		ChangeCause                   		CHAR(1)		 NULL  COMMENT '변경이력사유',
		ChangeInfo                    		VARCHAR(20)		 NULL  COMMENT '변경이력정보',
		EngCitied                     		VARCHAR(40)		 NULL  COMMENT '영문시도명',
		EngStateCity                  		VARCHAR(40)		 NULL  COMMENT '영문시군구명',
		EngEupMyeon                   		VARCHAR(40)		 NULL  COMMENT '영문읍면동명',
		NotifiDate                    		VARCHAR(10)		 NULL  COMMENT '고시일자',
		DeleteDate                    		VARCHAR(10)		 NULL  COMMENT '말소일자'
) COMMENT='도로명코드';

ALTER TABLE StreetCode ADD CONSTRAINT IDX_StreetCode_PK PRIMARY KEY (StateCityCode, StreetNum, EupMyeonSerial);

/* 부산 건물 정보 */
LOAD DATA INFILE 'build_busan_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 충청북도 건물 정보 */
LOAD DATA INFILE 'build_chungbuk_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 충청남도 건물 정보 */
LOAD DATA INFILE 'build_chungnam_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 대구 건물 정보 */
LOAD DATA INFILE 'build_daegu_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 대전 건물 정보 */
LOAD DATA INFILE 'build_daejeon_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 강원도 건물 정보 */
LOAD DATA INFILE 'build_gangwon_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 광주 건물 정보 */
LOAD DATA INFILE 'build_gwangju_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경상북도 건물 정보 */
LOAD DATA INFILE 'build_gyeongbuk_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경상남도 건물 정보 */
LOAD DATA INFILE 'build_gyeongnam_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경기도 건물 정보 */
LOAD DATA INFILE 'build_gyunggi_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 인천 건물 정보 */
LOAD DATA INFILE 'build_incheon_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 제주 건물 정보 */
LOAD DATA INFILE 'build_jeju_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 전라북도 건물 정보 */
LOAD DATA INFILE 'build_jeonbuk_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 전라남도 건물 정보 */
LOAD DATA INFILE 'build_jeonnam_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 세종시 건물 정보 */
LOAD DATA INFILE 'build_sejong_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 서울시 건물 정보 */
LOAD DATA INFILE 'build_seoul_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 울산시 건물 정보 */
LOAD DATA INFILE 'build_ulsan_utf8.txt'
INTO TABLE BuildingInfo FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 부산 지번 정보 */
LOAD DATA INFILE 'jibun_busan_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 충청북도 지번 정보 */
LOAD DATA INFILE 'jibun_chungbuk_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 충청남도 지번 정보 */
LOAD DATA INFILE 'jibun_chungnam_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 대구 지번 정보 */
LOAD DATA INFILE 'jibun_daegu_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 대전 지번 정보 */
LOAD DATA INFILE 'jibun_daejeon_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 강원도 지번 정보 */
LOAD DATA INFILE 'jibun_gangwon_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 광주 지번 정보 */
LOAD DATA INFILE 'jibun_gwangju_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경상북도 지번 정보 */
LOAD DATA INFILE 'jibun_gyeongbuk_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경상남도 지번 정보 */
LOAD DATA INFILE 'jibun_gyeongnam_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 경기도 지번 정보 */
LOAD DATA INFILE 'jibun_gyunggi_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 인천 지번 정보 */
LOAD DATA INFILE 'jibun_incheon_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 제주 지번 정보 */
LOAD DATA INFILE 'jibun_jeju_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 전라북도 지번 정보 */
LOAD DATA INFILE 'jibun_jeonbuk_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 전라남도 지번 정보 */
LOAD DATA INFILE 'jibun_jeonnam_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 세종시 지번 정보 */
LOAD DATA INFILE 'jibun_sejong_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 서울시 지번 정보 */
LOAD DATA INFILE 'jibun_seoul_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

/* 울산시 지번 정보 */
LOAD DATA INFILE 'jibun_ulsan_utf8.txt'
INTO TABLE StreetAddress FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'



/* 도로명 코드 정보 */
LOAD DATA INFILE 'road_code_total_utf8.txt'
INTO TABLE StreetCode FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'

select count(*) from buildinginfo

Create View 요약주소VIEW 
AS 
Select Distinct 법정동코드, 시도명, 시굮구명, 읍면동명, 법정리명, 도로명코드, 도로명,                      
지하여부, 건물본번, 건물부번, 시굮구건물명, 산여부, 지번본번, 지번부번,                     
기초구역번호(새우편번호), 공동주택여부, 읍면동일렦번호  
From  건물정보 
Union Select Distinct 
X.법정동코드, X.시도명, X.시굮구명, X.읍면동명, X.리명, X.도로명코드,                      
B.도로명, B.지하여부, B.건물본번, B.건물부번, B.시굮구건물명, X.산여부,                      
X.지번본번, X.지번부번, B.기초구역번호, B.공동주택여부, B.읍면동일렦번호  
From 건물정보  B, 관렦지번 X Where B.도로명코드 = X.도로명코드     
And B.지하여부  = X.지하여부    And B.건물본번   = X.건물본번    And B.건물부번   = X.건물부번 

create view easyview
as 
select distinct  LegalCode, StateCity, Citied, LegalEupMyeon, LegalRi, StreetCode, Street,
IsBasement, BuildingOri, BuildingSec, CitiedBuilding, IsMountain, LotNumOri, LotNumSec,
BaseArea, IsApartment, EupMyeonSerial
from BuildingInfo 
union select distinct x.LegalCode, x.StateCity, x.Citied,x.LegalEupMyeon, x.LegalRi, x.StreetCode,
b.Street, b.IsBasement, b.BuildingOri, b.BuildingSec, b.CitiedBuilding, x.IsMountain,
x.LotNumOri, x.LotNumSec, b.BaseArea, b.IsApartment, b.EupMyeonSerial
from buildinginfo as b, streetaddress as x where b.StreetCode= x.StreetCode
and b.BuildingOri=x.BuildingOri and b.BuildingSec= x.BuildingSec

create view easyview as
select distinct 
	a.LegalCode, a.StateCity, a.Citied, a.LegalEupMyeon, a.LegalRi, a.StreetCode, a.Street,
	a.IsBasement, a.BuildingOri, a.BuildingSec, a.CitiedBuilding, a.IsMountain, a.LotNumOri, a.LotNumSec,
	a.BaseArea, a.IsApartment, a.EupMyeonSerial, y.IsEupMyeon
from buildinginfo as a, streetcode as y
	where a.StreetCode= concat(y.StateCityCode,y.StreetNum) and a.EupMyeonSerial = y.EupMyeonSerial
union
	select distinct x.LegalCode, x.StateCity, x.Citied, x.LegalEupMyeon, x.LegalRi, x.StreetCode,
			b.Street, b.IsBasement, b.BuildingOri, b.BuildingSec, b.CitiedBuilding, x.IsMountain,
			x.LotNumOri, x.LotNumSec, b.BaseArea, b.IsApartment, b.EupMyeonSerial, y.IsEupMyeon
	from BuildingInfo as b, StreetAddress as x, StreetCode as y
		where b.StreetCode=x.StreetCode and b.IsBasement=x.IsBasement
			and b.BuildingOri=x.BuildingOri and b.BuildingSec=x.BuildingSec
			and b.StreetCode=concat(y.StateCityCode,y.StreetNum) and b.EupMyeonSerial=y.EupMyeonSerial;
		
			/* 테스트용 쿼리문 단계별 작성 */
		select distinct a.statecity as city, b.citied as citied from streetaddress as a, streetcode as b
		where a.streetcode = concat(b.StateCityCode,b.StreetNum)
			
Create View 요약주소 As
	         Select Distinct  A. 법정동코드, A.시도명, A.시군구명, A.읍면동명, A.법정리명, A.도로명코드,
	                     A.도로명, A.지하여부, A.건물본번, A.건물부번, A.시군구건물명, A.산여부, A.지번본번,
	                     A.지번부번, A.기초구역번호(새우편번호), A.공동주택여부, A.읍면동일련번호 , Y.읍면동구분
	            From 건물정보 A, 도로명코드 Y   
	               Where A.도로명코드 = Y.도로명코드   /* 도로명코드 = 시군구코드(5) +도로명번호(7) */  
	               And A.읍면동일련번호 = Y.읍면동일련번호 
	          Union
	          Select Distinct X.법정동코드, X.시도명, X.시군구명, X.읍면동명, X.리명, X.도로명코드,
	                      B.도로명, B.지하여부, B.건물본번, B.건물부번, B.시군구건물명, X.산여부,
	                      X.지번본번, X.지번부번, B.기초구역번호, B.공동주택여부, B.읍면동일련번호, Y.읍면동구분
	            From 건물정보  B, 관련지번 X, 도로명코드 Y 
	         Where B.도로명코드 = X.도로명코드  And B.지하여부  = X.지하여부
	                 And B.건물본번   = X.건물본번      And B.건물부번   = X.건물부번
	                 And B.도로명코드 = Y.도로명코드  And B.읍면동일련번호 = Y.읍면동일련번호

select a.BaseArea as zipcode,concat(
	a.StateCity, ' ', a.Citied, if(a.IsEupMyeon,'0', concat(' ', a.LegalEupMyeon,' ')),' ',
	a.Street, 
		case when a.IsBasement='0' then ''
			when a.IsBasement='1' then ' 지하'
			when a.IsBasement='2' then ' 공중'
			end
			,' ',
	a.BuildingOri, 
		if(a.BuildingSec='0','',concat('-', a.BuildingSec)),
	case 
		when a.IsEupMyeon='0' and a.IsApartment='0' then ''
		when a.IsEupMyeon='0' and a.IsApartment='1' then concat('(', a.CitiedBuilding, ')')
		when a.IsEupMyeon='1' and a.IsApartment='0' then concat('(', a.LegalEupMyeon, ')')
		when a.IsEupMyeon='1' and a.IsApartment='1' then concat('(', a.LegalEupMyeon, ',', a.CitiedBuilding, ')') 
		end)
	from easyview as a
		where a.BuildingOri='' and a.BuildingSec=''
		like concat('', '%' and a.Street like '신촌', '%' and a.Citied like '서대문구', '%' and a.StateCity like '서울특별시', '%');
	
		select distinct * from easyview as a where a.BuildingOri='10' and a.BuildingSec
		like concat('4', '%' and a.Street like '신촌', '%' and a.Citied like '서대문구', '%' and a.StateCity like '서울특별시', '%');
		
		select distinct a.street from easyview as a where a.street like '신촌%'
				
		Select A.기초구역번호 AS 새우편번호,
	            A.시도명 || ' ' || A.시군구명 || Decode(B.읍면동구분, '0', ' ' ||
	            A. 읍면동명, '') || ' ' ||
	            A.도로명 || Decode(A.지하여부, 0, '', '1',' 지하', '2', '공중') || ' ' ||
	            A.건물본번 || Decode(A.건물부번, 0, '', '-' || A.건물부번) ||
	            Case When (A.읍면동구분='0' And A.공동주택여부='0') Then ''
	            When (A. 읍면동구분='0' And A.공동주택여부='1') Then
	            '(' || A.시군구용 건물명 || ')'
	            When (A. 읍면동구분='1' And A.공동주택여부='0') Then
	            '(' || A.읍면동명 || ')' When (A. 읍면동구분='1' And A.공동주택
	            여부='1') Then '(' || A.읍면동명 || ',' || A.시군구용건물명 || ')'
	            End AS 도로명주소
	  From 요약주소View A
	Where A.건물본번  =  Param5   And to_char(A.건물부번) LIKE  Param4  || '%'
	    And A.도로명  LIKE  Param3  || '%'   And A.시군구명 LIKE  Param2  || '%'
	    And A.시도명      LIKE  Param1  || '%'
	    
	    select distinct askStart, askend from cook;
	    
	    desc streetcode;
	    select statecity, street from buildinginfo where street like '%신촌%';
	    
	    select statecity, citied, LegalEupMyeon, LegalRi,street, zipcode, BuildingOri, BuildingSec, CitiedBuilding, LotNumOri, LotNumSec 
		from easyview
		where street like concat('%', '이대','%') or LegalEupMyeon like concat('%', '이대','%');
		
		select statecity, citied, LegalEupMyeon, LegalRi,street, zipcode, BuildingOri, BuildingSec, CitiedBuilding, LotNumOri, LotNumSec 
		from buildinginfo use index(index_buildinginfo)
		where street like concat('%', '이대','%') or LegalEupMyeon like concat('%', '이대','%');
		
		create view easyview as
		select statecity, citied, LegalEupMyeon, LegalRi,street, zipcode, BuildingOri, BuildingSec, CitiedBuilding, LotNumOri, LotNumSec 
		from buildinginfo use index(index_buildinginfo)
		
		alter table buildinginfo add index index_buildinginfo (legaleupmyeon, street);
		alter table buildinginfo drop index index_buildinginfo
		show index from easyview
		alter table easyview add index index_buildinginfo (legaleupmyeon, street);
		commit;
		drop view easyview;
		
		select statecity, citied, LegalEupMyeon, LegalRi,street, zipcode, BuildingOri, BuildingSec, CitiedBuilding, LotNumOri, LotNumSec 
   from buildinginfo where 
   match(LegalEupMyeon,street) against('-신촌역*');
   
   select statecity, citied, LegalEupMyeon, LegalRi,street, zipcode, BuildingOri, if(BuildingSec='0','',concat('-', BuildingSec))as BuildingSec
   , CitiedBuilding
   
   select count(*) from member where id='n.kayo.7.21.kayo@gmail.com';
   SELECT COUNT(id) FROM MEMBER WHERE id='n.kayo.7.21.kayo@gmail.com'
   select * from member;
   
   select concat(statecity,' ' ,citied,' ', legaleupmyeon,' ' ,legalri,' ', street,' ',
   	buildingOri, if(BuildingSec='0','',concat('-', BuildingSec)),' ',CitiedBuilding)as address1,zipcode
   	from buildinginfo where(street REGEXP '신촌역로' or legaleupmyeon '신촌역로')
   alter table buildinginfo add fulltext(LegalEupMyeon,street);
   
   select concat(statecity,' ' ,citied,' ', legaleupmyeon,' ' ,legalri,' ', street,' ',
   	buildingOri, if(BuildingSec='0','',concat('-', BuildingSec)),' ',CitiedBuilding)as address1,zipcode
   	from buildinginfo where street like concat('%', '신촌역로','%') or legaleupmyeon like concat('%', '신촌역로', '%')
   	
   	
   	insert into ctgroup values((select IFNULL(MAX(ct.ctgroup),0)+1 from ctgroup as ct),'test' );
   	delete from ctgroup
   	
   	
   	select distinct A.BaseAreaNo as zipcode, concat(B.City,' ', B.Citied,' ',IF(B.IsEupMyun='0', '', concat('',B.EupMyun,'')),' ',
   	B.Street,A.BuildingOriNo, CASE WHEN A.BuildingSecNo='0' THEN '' ELSE concat('-',A.BuildingSecNo) END,
			if(D.CitiedBuilding='','',concat(' (',d.CitiedBuilding,')'))) as address1
   	from address_optioninfo as D, address_info as A, address_streecode as B   
   	WHERE B.StreetCode = A.StreetCode AND B.EupMyunDongNo = A.EupMyunDongNo  AND A.AdminNo = D.AdminNo 
  	AND B.Citied LIKE concat('서대문', '%')
  	AND B.Street LIKE concat('신촌', '%')
  	
   	select eupmyun from address_streecode;
   	
   	select * from address_streecode where street LIKE concat('신촌', '%');
   	select street from address_streecode where City LIKE concat('신촌', '%')
   	
   	SELECT DISTINCT
	A.BaseAreaNo AS newzipcode
	, concat(B.City,' ', B.Citied,' ',IF(B.IsEupMyun, '0', concat('',B.EupMyun,'')),' ', 
	B.Street, CASE WHEN A.IsBasement='0' THEN ' '
			WHEN a.IsBasement='1' THEN ' 지하'
			WHEN a.IsBasement='2' THEN ' 공중'
			end, A.BuildingOriNo, CASE WHEN A.BuildingSecNo=0 THEN '' ELSE '-' END, A.BuildingSecNo,
			CASE WHEN (B.IsEupMyun='0' AND D.ApartmentHave = '0') THEN ''
			WHEN (B.IsEupMyun='0' AND D.ApartmentHave = '1') THEN concat(' (',D.CitiedBuilding,')')
			WHEN (B.IsEupMyun='1' AND D.ApartmentHave = '0') THEN concat(' (',B.EupMyun,')')
			WHEN (B.IsEupMyun='1' AND D.ApartmentHave = '1') THEN concat(' (',B.EupMyun,',',D.CitiedBuilding,')')
			END AS streetaddress)
			FROM address_optioninfo as D, address_info as A, address_streecode as B 
WHERE B.StreetCode = A.StreeCode
  AND B.EupMyunDongNo = A.EupMyunDongNo
  AND A.AdminNo = D.AdminNo
  AND B.City LIKE concat('신촌', '%')
  AND B.Citied LIKE concat('신촌', '%')
  AND B.Street LIKE concat('신촌', '%')
  AND A.BuildingOriNo = ''
  AND A.BuildingSecNo = ''
	
	
	SELECT DISTINCT
	A.BaseAreaNo AS newzipcode
	, B.City||' '||B.Citied||' '||
	DECODE(B.IsEupMyun,'0',''||B.EupMyun,'')||' '||
	B.Street||DECODE(A.IsBasement,0,' ',1,' 지하',2,' 공중')||
	A.BuildingOriNo||DECODE(A.BuildingSecNo,0,'','-'||A.BuildingSecNo)||
	CASE WHEN (B.IsEupMyun = '0' AND D.ApartmentHave = '0') THEN ''
                    WHEN (B.IsEupMyun = '0' AND D.ApartmentHave ='1') THEN ' ('||D.CitiedBuilding||')' 
                    WHEN (B.IsEupMyun = '1' AND D.ApartmentHave ='0') THEN ' ('||B.EupMyun||')'  
                    WHEN (B.IsEupMyun = '1' AND D.ApartmentHave ='1') THEN ' ('||B.EupMyun||','||D.CitiedBuilding||')' 
        END AS streetaddress
FROM 
	address_optioninfo as D, address_info as A, address_streetcode as B 
WHERE B.StreetCode = A.StreetCode
  AND B.EupMyunDongNo = A.EupMyunDongNo
  AND A.AdminNo = D.AdminNo
  AND B.City LIKE Param1 || '%'
  AND B.Citied LIKE Param2 || '%'
  AND B.Street LIKE Param3 || '%'
  AND A.BuildingOriNo = Param4
  AND A.BuildingSecNo = Param5
  
  SELECT DISTINCT
	A.기초구역번호 AS 새우편번호
	, B.시도명||' '||B.시군구명||' '||DECODE(B.읍면동구분,'0',''||B.읍면동명,'')||' '||
	B.도로명||DECODE(A.지하여부,0,' ',1,' 지하',2,' 공중')||
	A.건물본번||DECODE(A.건물부번,0,'','-'||A.건물부번)||
	CASE WHEN (B.읍면동구분 = '0' AND D.공동주택여부 = '0') THEN ''
                    WHEN (B.읍면동구분 = '0' AND D.공동주택여부 ='1') THEN ' ('||D.시군구 건물명||')' 
                    WHEN (B.읍면동구분 = '1' AND D.공동주택여부 ='0') THEN ' ('||B.읍면동명||')'  
                    WHEN (B.읍면동구분 = '1' AND D.공동주택여부 ='1') THEN ' ('||B.읍면동명||','||D.시군구 건물명||')' 
        END AS 도로명주소
FROM 
	부가정보 D, 도로명주소 A, 도로명코드 B, 지번정보 C 
WHERE B.도로명코드 = A.도로명코드
  AND B.읍면동일련번호 = A.읍면동일련번호
  AND D.관리번호 = A.관리번호
  AND A.관리번호 = C.관리번호
  AND C.읍면동명  LIKE Param3 || '%'
  AND C.지번본번 = Param4
  AND C.지번부번 = Param5