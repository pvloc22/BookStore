/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     27/07/2023 8:35:53 CH                        */
/*==============================================================*/


USE MASTER
GO
IF EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME = 'Library')
BEGIN 
   ALTER DATABASE Library  SET SINGLE_USER WITH ROLLBACK IMMEDIATE
   DROP DATABASE Library 
END
GO
CREATE DATABASE Library 
GO 
USE Library 
/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT 
(
   USERNAME             varchar(30)                    not null,
   ID                   varchar(7)                     null,
   PASSWORD             varchar(200)                   null,
   constraint PK_ACCOUNT primary key (USERNAME)
);

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN 
(
   ID                   varchar(7)                     not null,
   constraint PK_ADMIN primary key (ID)
);

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BANK 
(
   IDBANK               varchar(20)                    not null,
   NAMEBANK             varchar(150)                   null,
   constraint PK_BANK primary key (IDBANK)
);

/*==============================================================*/
/* Table: BANK_ACCOUNT_NUMBER                                   */
/*==============================================================*/
create table BANK_ACCOUNT_NUMBER 
(
   BANKACCNUM           varchar(15)                    not null,
   ID                   varchar(7)                     null,
   IDBANK               varchar(20)                    not null,
   BANKADDRESS          varchar(50)                    not null,
   PASSBANK             varchar(200)                   null,
   MONEY                float                          null,
   constraint PK_BANK_ACCOUNT_NUMBER primary key (BANKACCNUM)
);

/*==============================================================*/
/* Table: BANK_BRANCH                                           */
/*==============================================================*/
create table BANK_BRANCH 
(
   IDBANK               varchar(20)                    not null,
   BANKADDRESS          varchar(50)                    not null,
   constraint PK_BANK_BRANCH primary key (IDBANK, BANKADDRESS)
);

/*==============================================================*/
/* Table: BOOK                                                  */
/*==============================================================*/
create table BOOK 
(
   BID                  varchar(7)                     not null,
   TITTLE               varchar(50)                    null,
   AUTHOR               varchar(20)                    null,
   PUBLISHINGYEAR       integer                        null,
   GENRE                varchar(50)                    null,
   COUNTRY              varchar(50)                    null,
   LANGUAGE_BOOK        varchar(20)                    null,
   PRICE                float                          null,
   DURATION             integer                        null,
   HASLEFT              integer                        null,
   PATHIMAGE            varchar(70)                    null,
   PAGES                integer                        null,
   STATEBOOK            VARCHAR(5)                     NULL
   constraint PK_BOOK primary key (BID)
);

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT 
(
   ID                   varchar(7)                     not null,
   NUMBOOKSBORROWED     integer                        null,
   constraint PK_CLIENT primary key (ID)
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT 
(
   DPM_ID               varchar(7)                     not null,
   DPM_NAME             varchar(100)                   null,
   constraint PK_DEPARTMENT primary key (DPM_ID)
);

/*==============================================================*/
/* Table: DETAILED_TRANS                                        */
/*==============================================================*/
create table DETAILED_TRANS 
(
   BID                  varchar(7)                     not null,
   TID                  char(7)                        not null,
   CURRENTPRICE         float                          not null,
   CURRENTDURATION      float                          not null,
   constraint PK_DETAILED_TRANS primary key (BID, TID)
);

/*==============================================================*/
/* Table: FAVORITES                                             */
/*==============================================================*/
create table FAVORITES 
(
   ID                   varchar(7)                     not null,
   BID                  varchar(7)                     not null,
   constraint PK_FAVORITES primary key (ID, BID)
);

/*==============================================================*/
/* Table: LIBRARIAN                                             */
/*==============================================================*/
create table LIBRARIAN 
(
   ID                   varchar(7)                     not null,
   DPM_ID               varchar(7)                     not null,
   DEPARTMENT           varchar(30)                    null,
   CREATEDATE          DATETIME                      null,
   constraint PK_LIBRARIAN primary key (ID)
);

/*==============================================================*/
/* Table: PERMISION                                             */
/*==============================================================*/
create table PERMISION 
(
   ID_PER               integer                        not null,
   NAME_PER             varchar(30)                    null,
   constraint PK_PERMISION primary key (ID_PER)
);

/*==============================================================*/
/* Table: PER_DETAIL                                            */
/*==============================================================*/
create table PER_DETAIL 
(
   ID_DETAIL            integer                        not null,
   ID_PER               integer                        not null,
   ACTION_NAME          varchar(30)                    null,
   ACTION_CODE          varchar(20)                    null,
   CHECK_ACTION         integer                        null,
   constraint PK_PER_DETAIL primary key (ID_DETAIL)
);

/*==============================================================*/
/* Table: PLACE                                                 */
/*==============================================================*/
create table PLACE 
(
   BID                  varchar(7)                     not null,
   DPM_ID               varchar(7)                     not null,
   SHEFT                integer                        null,
   LINE                 integer                        null,
   constraint PK_PLACE primary key (BID, DPM_ID)
);

/*==============================================================*/
/* Table: TRANSACTIONS                                           */
/*==============================================================*/
create table TRANSACTIONS 
(
   TID                  char(7)                        not null,
   LI_ID                varchar(7)                     null,
   CLI_ID               varchar(7)                     null,
   BORROWEDDATE         date                           null,
   RETURNINGDATE        date                           null,
   TOTALPRICE           float                          null,
   TOTALDURATION        integer                        null,
   QUANTITY             integer                        null,
   STATE                varchar(10)                    null,
   constraint PK_TRANSACTIONS primary key (TID)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS 
(
   ID                   varchar(7)                     not null,
   USERNAME             varchar(30)                    null,
   ADDRESS_U            nvarchar(100)                    null,
   EMAIL                varchar(50)                    null,
   PHONENUMBER          varchar(12)                    null,
   ISACTIVE             integer                        null,
   LASTNAME             nvarchar(50)                    null,
   FIRSTNAME            nvarchar(50)                    null,
   TYPE_USER            varchar(30)                    null,
   GENRE                VARCHAR(50)                    null,
   CREATEDATE           DATETIME                      null
   constraint PK_USERS primary key (ID)
);

/*==============================================================*/
/* Table: USER_PER                                              */
/*==============================================================*/
create table USER_PER 
(
   ID_USER_PER          integer                        not null,
   ID                   varchar(7)                     null,
   ID_PER               integer                        null,
   LICENSED             integer                        null,
   constraint PK_USER_PER primary key (ID_USER_PER)
);
CREATE TABLE T_GENRE
(
   GENRE_NAME VARCHAR(50) NOT NULL,
   IS_ACTIVE VARCHAR(10) NULL
   constraint PK_T_GENRE primary key (GENRE_NAME)

)

alter table BOOK
   add constraint FK_BOOK_RELATIONS_T_GENRE foreign key (GENRE)
      references T_GENRE (GENRE_NAME);

alter table ACCOUNT
   add constraint FK_ACCOUNT_RELATIONS_USERS foreign key (ID)
      references USERS (ID);

alter table ADMIN
   add constraint FK_ADMIN_INHERITAN_USERS foreign key (ID)
      references USERS (ID);

alter table BANK_ACCOUNT_NUMBER
   add constraint FK_BANK_ACC_HAS_ACCOU_USERS foreign key (ID)
      references USERS (ID);

alter table BANK_ACCOUNT_NUMBER
   add constraint FK_BANK_ACC_MANAGE_BANK_BRA foreign key (IDBANK, BANKADDRESS)
      references BANK_BRANCH (IDBANK, BANKADDRESS);

alter table BANK_BRANCH
   add constraint FK_BANK_BRA_CO_NHIEU__BANK foreign key (IDBANK)
      references BANK (IDBANK);

alter table CLIENT
   add constraint FK_CLIENT_INHERITAN_USERS foreign key (ID)
      references USERS (ID);

alter table DETAILED_TRANS
   add constraint FK_DETAILED_GETS_BOOK foreign key (BID)
      references BOOK (BID);

alter table DETAILED_TRANS
   add constraint FK_DETAILED_OWNS_TRANSACT foreign key (TID)
      references TRANSACTIONS (TID);

alter table FAVORITES
   add constraint FK_FAVORITE_FAVORITES_BOOK foreign key (BID)
      references BOOK (BID);

alter table FAVORITES
   add constraint FK_FAVORITE_FAVORITES_CLIENT foreign key (ID)
      references CLIENT (ID);

alter table LIBRARIAN
   add constraint FK_LIBRAryRIA_INHERITAN_USERS foreign key (ID)
      references USERS (ID);

alter table LIBRARIAN
   add constraint FK_LIBRAryRIA_WORK_DEPARTME foreign key (DPM_ID)
      references DEPARTMENT (DPM_ID);

alter table PER_DETAIL
   add constraint FK_PER_DETA_RELATIONS_PERMISIO foreign key (ID_PER)
      references PERMISION (ID_PER);

alter table PLACE
   add constraint FK_PLACE_PLACE_DEPARTME foreign key (DPM_ID)
      references DEPARTMENT (DPM_ID);

alter table PLACE
   add constraint FK_PLACE_PLACE2_BOOK foreign key (BID)
      references BOOK (BID);

alter table TRANSACTIONS
   add constraint FK_TRANSACT_HANDLE_LIBRAryRIA foreign key (LI_ID)
      references LIBRARIAN (ID);

alter table TRANSACTIONS
   add constraint FK_TRANSACT_HAS_CLIENT foreign key (CLI_ID)
      references CLIENT (ID);

alter table USERS
   add constraint FK_USERS_RELATIONS_ACCOUNT foreign key (USERNAME)
      references ACCOUNT (USERNAME);

alter table USER_PER
   add constraint FK_USER_PER_ASSIGNMEN_PERMISIO foreign key (ID_PER)
      references PERMISION (ID_PER);

alter table USER_PER
   add constraint FK_USER_PER_RELATIONS_USERS foreign key (ID)
      references USERS (ID);

GO
INSERT INTO DEPARTMENT(DPM_ID, DPM_NAME) VALUES('DP_001', 'PHONG THI NGHIEM')
GO
INSERT INTO BANK(NAMEBANK, IDBANK) VALUES (N'Ngân hàng Thương mại cổ phần Á Châu', 'ACB')
INSERT INTO BANK(NAMEBANK, IDBANK) VALUES (N'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam','Agribank')
INSERT INTO BANK(NAMEBANK, IDBANK) VALUES (N'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam','BIDV')
INSERT INTO BANK(NAMEBANK, IDBANK) VALUES (N'Ngân hàng Thương mại cổ phần (TMCP) Quốc Tế Việt Nam','VIB')
INSERT INTO BANK(NAMEBANK, IDBANK) VALUES (N'Ngân hàng ngoại mến Việt Nam','VietcomBank')
GO
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'ACB', N'Bình Chiểu')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'ACB', N'Bình Trưng Tây')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'ACB', N'Hiệp Bình Chánh')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'Agribank', N'Linh Đông')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'Agribank', N'Linh Tây')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'Agribank', N'Linh Trung')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'Agribank', N'Quận 1')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'Agribank', N'Quận 3')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'BIDV', N'Hiệp Phú')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'BIDV', N'Long Trường')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'BIDV', N'Phước Bình')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VIB', N'Tăng Nhơn Phú B')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VIB', N'Trường Thạnh')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VIB', N'Trường Thọ')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VietcomBank', N'Long Phước')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VietcomBank', N'Quận 5')
INSERT INTO BANK_BRANCH(IDBANK, BANKADDRESS) VALUES (N'VietcomBank', N'Quận Phú Nhuận')
GO
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Trung', N'6380205558111', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Trung', N'6380205558112', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Trung', N'6380205558113', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 1', N'6380205558221', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 1', N'6380205558222', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 1', N'6380205558223', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 3', N'6380205558331', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 3', N'6380205558332', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Quận 3', N'6380205558333', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Đông', N'6380205558441', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Đông', N'6380205558442', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Đông', N'6380205558443', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Đông', N'6380205558444', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Tây', N'6380205558551', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Tây', N'6380205558552', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Tây', N'6380205558553', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'Agribank', N'Linh Tây', N'6380205558554', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Chiểu', N'6380205582111', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Chiểu', N'6380205582112', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Chiểu', N'6380205582113', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582221', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582222', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582223', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Bình Trưng Tây', N'6380205582224', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576032', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576031', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576033', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'ACB', N'Hiệp Bình Chánh', N'6380205576034', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561111', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561112', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561113', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Hiệp Phú', N'6380205561114', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Long Trường', N'6380205561221', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Long Trường', N'6380205561222', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Long Trường', N'6380205561223', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Long Trường', N'6380205561224', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Phước Bình', N'6380205561331', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Phước Bình', N'6380205561332', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Phước Bình', N'6380205561333', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'BIDV', N'Phước Bình', N'6380205561334', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thạnh', N'6380205575111', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thạnh', N'6380205575112', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thạnh', N'6380205575113', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thạnh', N'6380205575114', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thọ', N'6380205575221', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thọ', N'6380205575222', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thọ', N'6380205575223', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Trường Thọ', N'6380205575224', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575331', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575332', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575333', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VIB', N'Tăng Nhơn Phú B', N'6380205575334', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VietcomBank', N'Quận 5', N'6380205582114', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VietcomBank', N'Long Phước', N'6380205582331', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VietcomBank', N'Long Phước', N'6380205582332', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VietcomBank', N'Long Phước', N'6380205582333', 100000)
INSERT INTO BANK_ACCOUNT_NUMBER(IDBANK, BANKADDRESS, BANKACCNUM,MONEY) VALUES (N'VietcomBank', N'Long Phước', N'6380205582334', 100000)
GO
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Young Adult')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Thriller & Suspense')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Short Story')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Science Fiction')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Romance')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','New Adult')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Mystery')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Magical Realism')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Horror')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Historical Fiction')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Graphic Novel')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Fiction genres')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Fantasy')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Dystopian')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Contemporary Fiction')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Children')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Biography')
INSERT into T_GENRE(IS_ACTIVE,GENRE_NAME) VALUES('TRUE','Action & Adventure')
GO
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_001', N'Things Fall Apart', N'Chinua Achebe', 1958, N'Short Story', N'Nigeria', N'English', 8.2, 4, 27, N'images/things-fall-apart.jpg', 209)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_002', N'Fairy tales', N'Hans Christian Ander', 1836, N'Thriller & Suspense', N'Denmark', N'Danish', 18.1, 12, 25, N'images/fairy-tales.jpg', 784)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_003', N'The Divine Comedy', N'Dante Alighieri', 1315, N'Science Fiction', N'Italy', N'Italian', 19.8, 12, 10, N'images/the-divine-comedy.jpg', 928)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_004', N'The Epic Of Gilgamesh', N'Unknown', -1700, N'Horror', N'Sumer and Akkadian Empire', N'Akkadian', 14.4, 4, 12, N'images/the-epic-of-gilgamesh.jpg', 160)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_005', N'The Book Of Job', N'Unknown', -600, N'Romance', N'Achaemenid Empire', N'Hebrew', 9.9, 4, 23, N'images/the-book-of-job.jpg', 176)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_006', N'One Thousand and One Nights', N'Unknown', 1200, N'Mystery', N'India/Iran/Iraq/Egypt/Tajikistan', N'Arabic', 18.9, 4, 30, N'images/one-thousand-and-one-nights.jpg', 288)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_007', N'NjÃ¡l''s Saga', N'Unknown', 1350, N'Fantasy', N'Iceland', N'Old Norse', 9.8, 6, 25, N'images/njals-saga.jpg', 384)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_008', N'Pride and Prejudice', N'Jane Austen', 1813, N'Young Adult', N'United Kingdom', N'English', 17.8, 4, 20, N'images/pride-and-prejudice.jpg', 226)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_009', N'Le PÃ¨re Goriot', N'HonorÃ© de Balzac', 1835, N'Mystery', N'France', N'French', 8.9, 6, 25, N'images/le-pere-goriot.jpg', 443)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_010', N'Molloy, Malone Dies, The Unnamable, the trilogy', N'Samuel Beckett', 1952, N'Romance', N'Republic of Ireland', N'French, English', 14.5, 4, 15, N'images/molloy-malone-dies-the-unnamable.jpg', 256)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_011', N'The Decameron', N'Giovanni Boccaccio', 1351, N'Romance', N'Italy', N'Italian', 10, 12, 11, N'images/the-decameron.jpg', 1024)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_012', N'Ficciones', N'Jorge Luis Borges', 1965, N'Magical Realism', N'Argentina', N'Spanish', 12.2, 4, 25, N'images/ficciones.jpg', 224)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_013', N'Wuthering Heights', N'Emily Bront', 1847, N'Biography', N'United Kingdom', N'English', 18.2, 6, 23, N'images/wuthering-heights.jpg', 342)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_014', N'The Stranger', N'Albert Camus', 1942, N'Magical Realism', N'Algeria, French Empire', N'French', 18.3, 4, 17, N'images/l-etranger.jpg', 185)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_015', N'Poems', N'Paul Celan', 1952, N'New Adult', N'Romania, France', N'German', 18.6, 6, 24, N'images/poems-paul-celan.jpg', 320)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_016', N'Journey to the End of the Night', N'Louis-Ferdinand CÃ©l', 1932, N'Science Fiction', N'France', N'French', 17.9, 7, 11, N'images/voyage-au-bout-de-la-nuit.jpg', 505)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_017', N'Don Quijote De La Mancha', N'Miguel de Cervantes', 1610, N'Biography', N'Spain', N'Spanish', 15, 12, 23, N'images/don-quijote-de-la-mancha.jpg', 1056)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_018', N'The Canterbury Tales', N'Geoffrey Chaucer', 1450, N'Mystery', N'England', N'English', 19.8, 7, 22, N'images/the-canterbury-tales.jpg', 544)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_019', N'Stories', N'Anton Chekhov', 1886, N'Action & Adventure', N'Russia', N'Russian', 9.5, 4, 27, N'images/stories-of-anton-chekhov.jpg', 194)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_020', N'Nostromo', N'Joseph Conrad', 1904, N'Graphic Novel', N'United Kingdom', N'English', 13.7, 6, 11, N'images/nostromo.jpg', 320)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_021', N'Great Expectations', N'Charles Dickens', 1861, N'Action & Adventure', N'United Kingdom', N'English', 18, 4, 10, N'images/great-expectations.jpg', 194)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_022', N'Jacques the Fatalist', N'Denis Diderot', 1796, N'Fantasy', N'France', N'French', 20, 7, 16, N'images/jacques-the-fatalist.jpg', 596)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_023', N'Berlin Alexanderplatz', N'Alfred Dblin', 1929, N'Fantasy', N'Germany', N'German', 18.6, 7, 14, N'images/berlin-alexanderplatz.jpg', 600)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_024', N'Crime and Punishment', N'Fyodor Dostoevsky', 1866, N'Action & Adventure', N'Russia', N'Russian', 11.4, 7, 17, N'images/crime-and-punishment.jpg', 551)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_025', N'The Idiot', N'Fyodor Dostoevsky', 1869, N'Contemporary Fiction', N'Russia', N'Russian', 16.5, 7, 28, N'images/the-idiot.jpg', 656)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_026', N'The Possessed', N'Fyodor Dostoevsky', 1872, N'Short Story', N'Russia', N'Russian', 19.8, 12, 29, N'images/the-possessed.jpg', 768)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_027', N'The Brothers Karamazov', N'Fyodor Dostoevsky', 1880, N'New Adult', N'Russia', N'Russian', 9.2, 12, 14, N'images/the-brothers-karamazov.jpg', 824)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_028', N'Middlemarch', N'George Eliot', 1871, N'Horror', N'United Kingdom', N'English', 10.4, 12, 11, N'images/middlemarch.jpg', 800)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_029', N'Invisible Man', N'Ralph Ellison', 1952, N'New Adult', N'United States', N'English', 19.8, 7, 13, N'images/invisible-man.jpg', 581)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_030', N'Medea', N'Euripides', -431, N'Fiction genres', N'Greece', N'Greek', 19.4, 4, 21, N'images/medea.jpg', 104)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_031', N'Absalom, Absalom!', N'William Faulkner', 1936, N'Contemporary Fiction', N'United States', N'English', 9.3, 6, 30, N'images/absalom-absalom.jpg', 313)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_032', N'The Sound and the Fury', N'William Faulkner', 1929, N'Fantasy', N'United States', N'English', 12, 6, 19, N'images/the-sound-and-the-fury.jpg', 326)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_033', N'Madame Bovary', N'Gustave Flaubert', 1857, N'Mystery', N'France', N'French', 20, 7, 27, N'images/madame-bovary.jpg', 528)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_034', N'Sentimental Education', N'Gustave Flaubert', 1869, N'Fantasy', N'France', N'French', 12.9, 7, 22, N'images/l-education-sentimentale.jpg', 606)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_035', N'Gypsy Ballads', N'Federico GarcÃ­a Lor', 1928, N'Thriller & Suspense', N'Spain', N'Spanish', 14.6, 4, 11, N'images/gypsy-ballads.jpg', 218)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_036', N'One Hundred Years of Solitude', N'Gabriel GarcÃ­a MÃ¡r', 1967, N'Science Fiction', N'Colombia', N'Spanish', 14.6, 6, 16, N'images/one-hundred-years-of-solitude.jpg', 417)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_037', N'Love in the Time of Cholera', N'Gabriel GarcÃ­a MÃ¡r', 1985, N'Graphic Novel', N'Colombia', N'Spanish', 8.6, 6, 20, N'images/love-in-the-time-of-cholera.jpg', 368)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_038', N'Faust', N'Johann Wolfgang von ', 1832, N'Thriller & Suspense', N'Saxe-Weimar', N'German', 17.6, 4, 21, N'images/faust.jpg', 158)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_039', N'Dead Souls', N'Nikolai Gogol', 1842, N'Magical Realism', N'Russia', N'Russian', 18.2, 6, 21, N'images/dead-souls.jpg', 432)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_040', N'The Tin Drum', N'Gunter Grass', 1959, N'Contemporary Fiction', N'Germany', N'German', 10.7, 7, 14, N'images/the-tin-drum.jpg', 600)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_041', N'The Devil to Pay in the Backlands', N'JoÅ©o GuimarÅ©es Ros', 1956, N'Historical Fiction', N'Brazil', N'Portuguese', 11.6, 6, 18, N'images/the-devil-to-pay-in-the-backlands.jpg', 494)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_042', N'Hunger', N'Knut Hamsun', 1890, N'Children', N'Norway', N'Norwegian', 19.4, 4, 20, N'images/hunger.jpg', 176)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_043', N'The Old Man and the Sea', N'Ernest Hemingway', 1952, N'Mystery', N'United States', N'English', 16, 4, 16, N'images/the-old-man-and-the-sea.jpg', 128)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_044', N'Iliad', N'Homer', -735, N'Children', N'Greece', N'Greek', 10.9, 7, 20, N'images/the-iliad-of-homer.jpg', 608)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_045', N'Odyssey', N'Homer', -800, N'Magical Realism', N'Greece', N'Greek', 8, 6, 27, N'images/the-odyssey-of-homer.jpg', 374)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_046', N'A Doll''s House', N'Henrik Ibsen', 1879, N'Fiction genres', N'Norway', N'Norwegian', 8.7, 4, 12, N'images/a-Dolls-house.jpg', 68)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_047', N'Ulysses', N'James Joyce', 1922, N'New Adult', N'Irish Free State', N'English', 11.3, 4, 28, N'images/ulysses.jpg', 228)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_048', N'Stories', N'Franz Kafka', 1924, N'Dystopian', N'Czechoslovakia', N'German', 13, 6, 23, N'images/stories-of-franz-kafka.jpg', 488)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_049', N'The Trial', N'Franz Kafka', 1925, N'Mystery', N'Czechoslovakia', N'German', 11.4, 4, 11, N'images/the-trial.jpg', 160)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_050', N'The Castle', N'Franz Kafka', 1926, N'Dystopian', N'Czechoslovakia', N'German', 8.7, 6, 19, N'images/the-castle.jpg', 352)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_051', N'The recognition of Shakuntala', N'Klidsa', 150, N'Thriller & Suspense', N'India', N'Sanskrit', 18.1, 4, 29, N'images/the-recognition-of-shakuntala.jpg', 147)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_052', N'The Sound of the Mountain', N'Yasunari Kawabata', 1954, N'Mystery', N'Japan', N'Japanese', 10.6, 4, 14, N'images/the-sound-of-the-mountain.jpg', 288)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_053', N'Zorba the Greek', N'Nikos Kazantzakis', 1946, N'Fantasy', N'Greece', N'Greek', 19.3, 6, 28, N'images/zorba-the-greek.jpg', 368)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_054', N'Sons and Lovers', N'D. H. Lawrence', 1913, N'Thriller & Suspense', N'United Kingdom', N'English', 13.6, 6, 18, N'images/sons-and-lovers.jpg', 432)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_055', N'Independent People', N'Halldr Laxness', 1934, N'Mystery', N'Iceland', N'Icelandic', 11.5, 6, 16, N'images/independent-people.jpg', 470)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_056', N'Poems', N'Giacomo Leopardi', 1818, N'Mystery', N'Italy', N'Italian', 11.5, 4, 12, N'images/poems-giacomo-leopardi.jpg', 184)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_057', N'The Golden Notebook', N'Doris Lessing', 1962, N'Fantasy', N'United Kingdom', N'English', 16.6, 7, 13, N'images/the-golden-notebook.jpg', 688)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_058', N'Pippi Longstocking', N'Astrid Lindgren', 1945, N'Young Adult', N'Sweden', N'Swedish', 13.2, 4, 26, N'images/pippi-longstocking.jpg', 160)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_059', N'Diary of a Madman', N'Lu Xun', 1918, N'Dystopian', N'China', N'Chinese', 18.1, 6, 27, N'images/diary-of-a-madman.jpg', 389)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_060', N'Children of Gebelawi', N'Naguib Mahfouz', 1959, N'Contemporary Fiction', N'Egypt', N'Arabic', 9.3, 6, 24, N'images/children-of-gebelawi.jpg', 355)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_061', N'Buddenbrooks', N'Thomas Mann', 1901, N'Romance', N'Germany', N'German', 10.4, 12, 12, N'images/buddenbrooks.jpg', 736)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_062', N'The Magic Mountain', N'Thomas Mann', 1924, N'Dystopian', N'Germany', N'German', 17.5, 12, 15, N'images/the-magic-mountain.jpg', 720)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_063', N'Moby Dick', N'Herman Melville', 1851, N'Fantasy', N'United States', N'English', 16.8, 6, 25, N'images/moby-dick.jpg', 378)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_064', N'Essays', N'Michel de Montaigne', 1595, N'Short Story', N'France', N'French', 13.3, 6, 11, N'images/essais.jpg', 404)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_065', N'History', N'Elsa Morante', 1974, N'Mystery', N'Italy', N'Italian', 9.1, 7, 25, N'images/history.jpg', 600)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_066', N'Beloved', N'Toni Morrison', 1987, N'Fantasy', N'United States', N'English', 9, 6, 22, N'images/beloved.jpg', 321)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_067', N'The Tale of Genji', N'Murasaki Shikibu', 1006, N'Romance', N'Japan', N'Japanese', 13.4, 12, 24, N'images/the-tale-of-genji.jpg', 1360)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_068', N'The Man Without Qualities', N'Robert Musil', 1931, N'Historical Fiction', N'Austria', N'German', 13.7, 6, 29, N'images/the-man-without-qualities.jpg', 365)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_069', N'Lolita', N'Vladimir Nabokov', 1955, N'Action & Adventure', N'Russia/United States', N'English', 18.4, 6, 24, N'images/lolita.jpg', 317)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_070', N'Nineteen Eighty-Four', N'George Orwell', 1949, N'Short Story', N'United Kingdom', N'English', 9.4, 4, 24, N'images/nineteen-eighty-four.jpg', 272)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_071', N'Metamorphoses', N'Ovid', 100, N'Fantasy', N'Roman Empire', N'Classical Latin', 15.7, 7, 26, N'images/the-metamorphoses-of-ovid.jpg', 576)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_072', N'The Book of Disquiet', N'Fernando Pessoa', 1928, N'Action & Adventure', N'Portugal', N'Portuguese', 18.6, 4, 12, N'images/the-book-of-disquiet.jpg', 272)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_073', N'Tales', N'Edgar Allan Poe', 1950, N'Fantasy', N'United States', N'English', 17.8, 12, 12, N'images/tales-and-poems-of-edgar-allan-poe.jpg', 842)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_074', N'In Search of Lost Time', N'Marcel Proust', 1920, N'Young Adult', N'France', N'French', 8.5, 16, 21, N'images/a-la-recherche-du-temps-perdu.jpg', 2408)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_075', N'Gargantua and Pantagruel', N'Francois Rabelais', 1533, N'Action & Adventure', N'France', N'French', 10.6, 7, 28, N'images/gargantua-and-pantagruel.jpg', 623)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_076', N'Pedro PÃ¡ramo', N'Juan Rulfo', 1955, N'Mystery', N'Mexico', N'Spanish', 17.7, 4, 21, N'images/pedro-paramo.jpg', 124)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_077', N'The Masnavi', N'Rumi', 1236, N'New Adult', N'Sultanate of Rum', N'Persian', 17.8, 6, 27, N'images/the-masnavi.jpg', 438)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_078', N'Midnight''s Children', N'Salman Rushdie', 1981, N'Mystery', N'United Kingdom, India', N'English', 15.3, 7, 27, N'images/midnights-children.jpg', 536)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_079', N'Bostan', N'Saadi', 1257, N'Biography', N'Persia, Persian Empire', N'Persian', 10.2, 4, 15, N'images/bostan.jpg', 298)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_080', N'Season of Migration to the North', N'Tayeb Salih', 1966, N'Fiction genres', N'Sudan', N'Arabic', 10.6, 4, 20, N'images/season-of-migration-to-the-north.jpg', 139)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_081', N'Blindness', N'Jos Saramago', 1995, N'Children', N'Portugal', N'Portuguese', 8.7, 6, 25, N'images/blindness.jpg', 352)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_082', N'Hamlet', N'William Shakespeare', 1603, N'Fiction genres', N'England', N'English', 8.4, 6, 21, N'images/hamlet.jpg', 432)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_083', N'King Lear', N'William Shakespeare', 1608, N'Biography', N'England', N'English', 9.5, 6, 17, N'images/king-lear.jpg', 384)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_084', N'Othello', N'William Shakespeare', 1609, N'Short Story', N'England', N'English', 10.1, 6, 26, N'images/othello.jpg', 314)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_085', N'Oedipus the King', N'Sophocles', -430, N'Biography', N'Greece', N'Greek', 13.3, 4, 21, N'images/oedipus-the-king.jpg', 88)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_086', N'The Red and the Black', N'Stendhal', 1830, N'Mystery', N'France', N'French', 11, 7, 27, N'images/le-rouge-et-le-noir.jpg', 576)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_087', N'The Life And Opinions of Tristram Shandy', N'Laurence Sterne', 1760, N'Thriller & Suspense', N'England', N'English', 9, 7, 11, N'images/the-life-and-opinions-of-tristram-shandy.jpg', 640)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_088', N'Confessions of Zeno', N'Italo Svevo', 1923, N'Historical Fiction', N'Italy', N'Italian', 15.7, 6, 10, N'images/confessions-of-zeno.jpg', 412)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_089', N'Gulliver''s Travels', N'Jonathan Swift', 1726, N'Thriller & Suspense', N'Ireland', N'English', 15.4, 4, 21, N'images/gullivers-travels.jpg', 178)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_090', N'War and Peace', N'Leo Tolstoy', 1867, N'Horror', N'Russia', N'Russian', 19, 12, 16, N'images/war-and-peace.jpg', 1296)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_091', N'Anna Karenina', N'Leo Tolstoy', 1877, N'Action & Adventure', N'Russia', N'Russian', 16.7, 12, 25, N'images/anna-karenina.jpg', 864)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_092', N'The Death of Ivan Ilyich', N'Leo Tolstoy', 1886, N'Young Adult', N'Russia', N'Russian', 15.3, 4, 23, N'images/the-death-of-ivan-ilyich.jpg', 92)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_093', N'The Adventures of Huckleberry Finn', N'Mark Twain', 1884, N'Biography', N'United States', N'English', 10.5, 4, 20, N'images/the-adventures-of-huckleberry-finn.jpg', 224)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_094', N'Ramayana', N'Valmiki', -450, N'Dystopian', N'India', N'Sanskrit', 12.4, 4, 16, N'images/ramayana.jpg', 152)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_095', N'The Aeneid', N'Virgil', -23, N'Romance', N'Roman Empire', N'Classical Latin', 17.7, 6, 12, N'images/the-aeneid.jpg', 442)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_096', N'Mahabharata', N'Vyasa', -700, N'Science Fiction', N'India', N'Sanskrit', 14.4, 4, 17, N'images/the-mahab-harata.jpg', 276)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_097', N'Leaves of Grass', N'Walt Whitman', 1855, N'Magical Realism', N'United States', N'English', 10.3, 4, 10, N'images/leaves-of-grass.jpg', 152)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_098', N'Mrs Dalloway', N'Virginia Woolf', 1925, N'Contemporary Fiction', N'United Kingdom', N'English', 11, 4, 25, N'images/mrs-dalloway.jpg', 216)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_099', N'To the Lighthouse', N'Virginia Woolf', 1927, N'Fantasy', N'United Kingdom', N'English', 17.8, 4, 29, N'images/to-the-lighthouse.jpg', 209)
INSERT [dbo].[BOOK] (STATEBOOK,[BID], [TITTLE], [AUTHOR], [PUBLISHINGYEAR], [GENRE], [COUNTRY], [LANGUAGE_BOOK], [PRICE], [DURATION], [HASLEFT], [PATHIMAGE], [PAGES]) VALUES ('TRUE',N'BID_100', N'Memoirs of Hadrian', N'Marguerite Yourcenar', 1951, N'Magical Realism', N'France/Belgium', N'French', 15.7, 6, 12, N'images/memoirs-of-hadrian.jpg', 408)
GO
