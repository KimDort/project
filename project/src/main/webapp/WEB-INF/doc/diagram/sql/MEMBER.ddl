/**********************************/
/* Table Name: 회원 */
/**********************************/
drop table member;
alter table member modify(photo varchar2(100) null default 'NO_IMAGE.gif');
CREATE TABLE MEMBER(
    id                                VARCHAR2(80)     NOT NULL,
    mno                               NUMBER(38)     NOT NULL,
    password                          VARCHAR2(80)     NOT NULL,
    name                              VARCHAR2(12)     NOT NULL,
    nickname                          VARCHAR2(50)     NOT NULL,
    photo                             VARCHAR2(30)     DEFAULT 'NO_IMAGE.gif'  NULL,
    phone                             VARCHAR2(15)     NOT NULL,
    zipcode                           VARCHAR2(7)    NOT NULL,
    address1                          VARCHAR2(80)     NOT NULL,
    address2                          VARCHAR2(80)     NOT NULL,
    auth                              VARCHAR2(30)     NOT NULL,
    confirm                           CHAR(1)    DEFAULT 'N'     NOT NULL,
    mlevel                            CHAR(1)    DEFAULT 'N'     NOT NULL,
    mdrop                             CHAR(1)    DEFAULT 'N'     NULL ,
    point                             NUMBER(10)     DEFAULT 0     NULL 
);

CREATE SEQUENCE MEMBER_mno_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TRIGGER MEMBER_mno_TRG
BEFORE INSERT ON MEMBER
FOR EACH ROW
BEGIN
IF :NEW.mno IS NOT NULL THEN
  SELECT MEMBER_mno_SEQ.NEXTVAL INTO :NEW.mno FROM DUAL;
END IF;
END;

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.id is '회원아이디(email)';
COMMENT ON COLUMN MEMBER.mno is '회원번호';
COMMENT ON COLUMN MEMBER.password is '회원암호';
COMMENT ON COLUMN MEMBER.name is '회원이름';
COMMENT ON COLUMN MEMBER.nickname is '회원닉네임';
COMMENT ON COLUMN MEMBER.photo is '회원사진';
COMMENT ON COLUMN MEMBER.phone is '회원전화번호';
COMMENT ON COLUMN MEMBER.zipcode is '우편번호';
COMMENT ON COLUMN MEMBER.address1 is '회원주소';
COMMENT ON COLUMN MEMBER.address2 is '회원상세주소';
COMMENT ON COLUMN MEMBER.auth is '회원인증코드';
COMMENT ON COLUMN MEMBER.confirm is '회원인증여부';
COMMENT ON COLUMN MEMBER.mlevel is '회원레벨';
COMMENT ON COLUMN MEMBER.mdrop is '회원탈퇴신청';
COMMENT ON COLUMN MEMBER.point is '포인트';


ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (id);

