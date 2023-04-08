DROP TABLE "REPORT";
DROP TABLE "QNA";
DROP TABLE "LIKE";
DROP TABLE "PST_CATEGORY";
DROP TABLE "MEMBER_GRADE";
DROP TABLE "REPLY_REPORT";
DROP TABLE "REPLY_LIKE";
DROP TABLE "POST_LIKE";
DROP TABLE "MEMBER_REPORT";
DROP TABLE "STORE";            -- 왜안들감?
DROP TABLE "NOTICEBOARD_POST"; --길어서 안들어감
DROP TABLE "FILE";
DROP TABLE "MEMBER";
DROP TABLE "MENU";
DROP TABLE "REPLY";
DROP TABLE "BRAND";
DROP TABLE "REPORT";
DROP TABLE "QNA";
DROP TABLE "LIKE";
DROP TABLE "PST_CATEGORY";
DROP TABLE "MEMBER_GRADE";
DROP TABLE "REPLY_REPORT";
DROP TABLE "REPLY_LIKE";
DROP TABLE "POST_LIKE";
DROP TABLE "MEMBER_REPORT";
DROP TABLE "STORE";            -- 왜안들감?
DROP TABLE "NOTICEBOARD_POST"; --길어서 안들어감
DROP TABLE "FILE";
DROP TABLE "MEMBER";
DROP TABLE "MENU";
DROP TABLE "REPLY";
DROP TABLE "BRAND";
DROP TABLE "REPORT";
DROP TABLE "QNA";
DROP TABLE "LIKE";
DROP TABLE "PST_CATEGORY";
DROP TABLE "MEMBER_GRADE";
DROP TABLE "REPLY_REPORT";
DROP TABLE "REPLY_LIKE";
DROP TABLE "POST_LIKE";
DROP TABLE "MEMBER_REPORT";
DROP TABLE "STORE";            -- 왜안들감?
DROP TABLE "NOTICEBOARD_POST"; --길어서 안들어감
DROP TABLE "FILE";
DROP TABLE "MEMBER";
DROP TABLE "MENU";
DROP TABLE "REPLY";
DROP TABLE "BRAND";


SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(12)		NOT NULL,
	"MEMBER_PWD"	VARCHAR2(15)		NOT NULL,
	"MEMBER_NICKNAME"	VARCHAR2(30)		NOT NULL,
	"MEMBER_NAME"	VARCHAR2(15)		NOT NULL,
	"EMAIL"	VARCHAR2(30)		NOT NULL,
	"PHONE"	VARCHAR2(11)		NOT NULL,
	"BIRTH"	DATE		NULL,
	"GENDER"	CHAR(3)		NULL,
	"ADDRESS"	VARCHAR2(150)		NULL,
	"BLACKLIST"	CHAR(1)	DEFAULT 'N'	NULL,
	"MEMBER_POINT"	NUMBER		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL
);

--------------------------------------------------------------------------------
--------------------------    MUNU 관련     -------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE MENU (
    MENU_ID NUMBER PRIMARY KEY,
    MENU_NAME" VARCHAR2(90) NOT NULL,
    MENU_PRICE NUMBER NOT NULL,
    MENU_CATEGORY VARCHAR2(90) NOT NULL,
    STORE_ID NUMBER NOT NULL,
    FOREIGN KEY (STORE_ID) REFERENCES STORE(STORE_ID) 
);

COMMENT ON COLUMN MENU.MENU_ID IS '메뉴번호';
COMMENT ON COLUMN MENU.MENU_NAME IS '메뉴명';
COMMENT ON COLUMN MENU.MENU_PRICE  IS '메뉴가격';
COMMENT ON COLUMN MENU.MENU_CATEGORY IS '메뉴종류';
COMMENT ON COLUMN MENU.STORE_ID IS '매장번호';

CREATE SEQUENCE SEQ_MNO
NOCACHE;

INSERT INTO MENU 
VALUES (SEQ_MNO.NEXTVAL, '뿌링클치킨', 20000, '치킨', 1) 

--------------------------------------------------------------------------------
----------------------------    STORE 관련        -------------------------------
--------------------------------------------------------------------------------

CREATE TABLE STORE (
    STORE_ID NUMBER PRIMARY KEY,
    STORE_NAME VARCHAR2(90) NOT NULL,
    STORE_ADDSS	VARCHAR2(300) NOT NULL,
    STORE_PHONE	CHAR(11) NULL,
    STORE_TIME VARCHAR2(1000) NULL,
    MAP_LAT VARCHAR2(10) NULL,
    MAP_LNG VARCHAR2(10) NULL,
    BRAND_ID VARCHAR(15) NOT NULL,
    FOREIGN KEY (BRAND_ID) REFERENCES BRAND(BRAND_ID) 
);

COMMENT ON COLUMN STORE.STORE_ID IS '매장번호';
COMMENT ON COLUMN STORE.STORE_NAME IS '매장명';
COMMENT ON COLUMN STORE.STORE_ADDSS IS '주소';
COMMENT ON COLUMN STORE.STORE_PHONE IS '매장 전화번호';
COMMENT ON COLUMN STORE.STORE_TIME IS '영업시간';
COMMENT ON COLUMN STORE.MAP_LAT IS '위도';
COMMENT ON COLUMN STORE.MAP_LNG IS '경도';
COMMENT ON COLUMN STORE.BRAND_ID IS '브랜드코드';

CREATE SEQUENCE SEQ_SNO
NOCACHE;

INSERT INTO STORE
VALUES (SEQ_SNO.NEXTVAL, 'BHC치킨 당산점', '서울 영등포구 당산로49길 9 골드라인', '02-2677-9290', '매일 12:00 - 24:00', '11111111234', '2333333345', '1')   


--------------------------------------------------------------------------------
--------------------------    BRAND 관련     ------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE BRAND (
    BRAND_ID VARCHAR2(15) PRIMARY KEY,
    BRAND_NAME VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN BRAND.BRAND_ID IS '브랜드코드'
COMMENT ON COLUMN BRAND.BRAND_NAME IS '브랜드이름'

CREATE SEQUENCE SEQ_BNO
NOCACHE;

INSERT INTO STORE
VALUES (SEQ_BNO.NEXTVAL, 'BHC') 

-----------------------------------------------------------------------------------------------------------

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_CATEGORY"	VARCHAR(15)		NULL,
	"REPORT_HISTORY"	VARCHAR2(1000)		NULL,
	"REPORT_TYPE"	NUMBER		NULL,
	"REPORT_ANSWER"	VARCHAR2(1000)		NULL,
	"PST_ID"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

CREATE TABLE "NOTICEBOARD_POST" (
	"PST_ID"	NUMBER		NOT NULL,
	"PST_TITLE"	VARCHAR2(150)		NULL,
	"POST_IN"	VARCHAR2(1500)		NULL,
	"PST_VIEW"	NUMBER		NULL,
	"PST_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"PST_DEL"	CHAR(1)	DEFAULT 'Y'	NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"POSTLIST"	NUMBER		NOT NULL
);

CREATE TABLE "QNA" (
	"ASK_NO"	NUMBER		NOT NULL,
	"ASK_TYPE"	NUMBER	DEFAULT 1	NULL,
	"ASK_TITLE"	VARCHAR(15)		NULL,
	"ASK_CONTENT"	VARCHAR2(300)		NULL,
	"ASK_DATE"	VARCHAR2(100)		NULL,
	"ANSWER_CONTENT"	VARCHAR2(300)		NULL,
	"ANSWER_DATE"	VARCHAR2(100)		NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

CREATE TABLE "REPLY" (
	"REPLY_ID"	NUMBER		NOT NULL,
	"REPLY_POST"	VARCHAR2(1000)		NOT NULL,
	"REPLY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"REPLY_DEL"	CHAR(1)	DEFAULT 'Y'	NULL,
	"PST_ID"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

CREATE TABLE "LIKE" (
	"MENU_ID"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);
CREATE TABLE "FILE" (
	"FILE_ID"	NUMBER		NULL,
	"FILE_INSTROG"	VARCHAR2(255)		NULL,
	"FILE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"THUMBNAIL"	NUMBER		NULL,
	"PST_ID"	NUMBER		NOT NULL
);
CREATE TABLE "PST_CATEGORY" (
	"POSTLIST"	NUMBER		NOT NULL,
	"PST_LISTALL"	VARCHAR2(30)		NULL
);
CREATE TABLE "MEMBER_GRADE" (
	"MEMBER_CODE"	VARCHAR(2)		NOT NULL,
	"GRADE_NAME"	VARCHAR2(10)		NULL,
	"POINT_MIN"	NUMBER		NOT NULL,
	"POINT_MAX"	NUMBER		NOT NULL
);
CREATE TABLE "REPLY_REPORT" (
	"RR_NO"	NUMBER		NOT NULL,
	"RR_HISTORY"	VARCHAR2(1000)		NOT NULL,
	"RR_TYPE"	NUMBER	DEFAULT 1	NULL,
	"RR_ANSWER"	VARCHAR2(1000)		NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"REPLY_ID"	NUMBER		NULL
);
CREATE TABLE "REPLY_LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"REPLY_ID"	NUMBER		NULL
);
CREATE TABLE "POST_LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"PST_ID"	NUMBER		NOT NULL
);
CREATE TABLE "MEMBER_REPORT" (
	"MR_NO"	NUMBER		NOT NULL,
	"MR_HISTORY"	VARCHAR2(1000)		NULL,
	"MR_TYPE"	NUMBER	DEFAULT 1	NOT NULL,
	"MR_ANSWER"	VARCHAR2(1000)		NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_NO2"	NUMBER		NOT NULL
);






















------------------------------------------------



ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);
ALTER TABLE "MENU" ADD CONSTRAINT "PK_MENU" PRIMARY KEY (
	"MENU_ID"
);
ALTER TABLE "STORE" ADD CONSTRAINT "PK_STORE" PRIMARY KEY (
	"STORE_ID"
);
ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);
ALTER TABLE "NOTICEBOARD_POST" ADD CONSTRAINT "PK_NOTICEBOARD_POST" PRIMARY KEY (
	"PST_ID"
);
ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"ASK_NO"
);
ALTER TABLE "BRAND" ADD CONSTRAINT "PK_BRAND" PRIMARY KEY (
	"BRAND_ID"
);
ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_ID"
);
ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY (
	"FILE_ID"
);
ALTER TABLE "PST_CATEGORY" ADD CONSTRAINT "PK_PST_CATEGORY" PRIMARY KEY (
	"POSTLIST"
);
ALTER TABLE "MEMBER_GRADE" ADD CONSTRAINT "PK_MEMBER_GRADE" PRIMARY KEY (
	"MEMBER_CODE"
);
ALTER TABLE "REPLY_REPORT" ADD CONSTRAINT "PK_REPLY_REPORT" PRIMARY KEY (
	"RR_NO"
);
ALTER TABLE "MEMBER_REPORT" ADD CONSTRAINT "PK_MEMBER_REPORT" PRIMARY KEY (
	"MR_NO"
);
ALTER TABLE "MENU" ADD CONSTRAINT "FK_STORE_TO_MENU_1" FOREIGN KEY (
	"STORE_ID"
)
REFERENCES "STORE" (
	"STORE_ID"
);
ALTER TABLE "STORE" ADD CONSTRAINT "FK_BRAND_TO_STORE_1" FOREIGN KEY (
	"BRAND_ID"
)
REFERENCES "BRAND" (
	"BRAND_ID"
);
-----------------------
ALTER TABLE "REPORT" ADD CONSTRAINT "FK_NB_POST_TO_RPT_1" FOREIGN KEY (
	"PST_ID"
)
REFERENCES "NOTICEBOARD_POST" (
	"PST_ID"
);
-----------------------
ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

---------------------------------
ALTER TABLE "NOTICEBOARD_POST" ADD CONSTRAINT "FK_MB_TO_NB_POST_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
---------------------------------

ALTER TABLE "NOTICEBOARD_POST" ADD CONSTRAINT "FK_PST_CAT_TO_NB_POST_1" FOREIGN KEY (
	"POSTLIST"
)
REFERENCES "PST_CATEGORY" (
	"POSTLIST"
);

-------------------------------------


ALTER TABLE "QNA" ADD CONSTRAINT "FK_MEMBER_TO_QNA_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_NOTICEBOARD_POST_TO_REPLY_1" FOREIGN KEY (
	"PST_ID"
)
REFERENCES "NOTICEBOARD_POST" (
	"PST_ID"
);
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MENU_TO_LIKE_1" FOREIGN KEY (
	"MENU_ID"
)
REFERENCES "MENU" (
	"MENU_ID"
);
ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MEMBER_TO_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "FILE" ADD CONSTRAINT "FK_NOTICEBOARD_POST_TO_FILE_1" FOREIGN KEY (
	"PST_ID"
)
REFERENCES "NOTICEBOARD_POST" (
	"PST_ID"
);
ALTER TABLE "REPLY_REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "REPLY_REPORT" ADD CONSTRAINT "FK_REPLY_TO_REPLY_REPORT_1" FOREIGN KEY (
	"REPLY_ID"
)
REFERENCES "REPLY" (
	"REPLY_ID"
);
ALTER TABLE "REPLY_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "REPLY_LIKE" ADD CONSTRAINT "FK_REPLY_TO_REPLY_LIKE_1" FOREIGN KEY (
	"REPLY_ID"
)
REFERENCES "REPLY" (
	"REPLY_ID"
);
ALTER TABLE "POST_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_POST_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

---------------------------------
ALTER TABLE "POST_LIKE" ADD CONSTRAINT "FK_NBP_LIKE_1" FOREIGN KEY ("PST_ID")
REFERENCES "NOTICEBOARD_POST" ("PST_ID");
---------------------------------

ALTER TABLE "MEMBER_REPORT" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
ALTER TABLE "MEMBER_REPORT" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_REPORT_2" FOREIGN KEY (
	"MEMBER_NO2"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);
