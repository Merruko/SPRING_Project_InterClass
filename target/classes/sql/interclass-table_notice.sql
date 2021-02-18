--------------------------------------------------------
--  ������ ������ - �����-2��-18-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "HR"."NOTICE" 
   (	"SEQ" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE), 
	"WRITER" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(200 BYTE), 
	"REGDATE" DATE, 
	"CNT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.NOTICE
SET DEFINE OFF;

Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (1,'공지사항1','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (2,'공지사항2','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (3,'공지사항3','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (4,'공지사항4','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (5,'공지사항5','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (6,'공지사항6','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (7,'공지사항7','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (8,'공지사항8','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (9,'공지사항9','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);
Insert into HR.NOTICE (SEQ,TITLE,WRITER,CONTENT,REGDATE,CNT) values (10,'공지사항10','관리자','이래라저래라',to_date('21/02/18','RR/MM/DD'),0);

--------------------------------------------------------
--  DDL for Index SYS_C007016
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007016" ON "HR"."NOTICE" ("SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "HR"."NOTICE" ADD PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
