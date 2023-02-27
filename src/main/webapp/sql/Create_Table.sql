CREATE TABLE CATEGORY( 
	CATENUM INT PRIMARY KEY,
	CATEL VARCHAR(50),
	CATEM VARCHAR(50)
);

CREATE TABLE PRODUCT( 
   PNUM INT PRIMARY KEY AUTO_INCREMENT,
   CATENUM INT,
   PNAME VARCHAR(100) NOT NULL,
   FIXPRICE INT DEFAULT 0,
   SELPRICE INT DEFAULT 0,
   RDATE DATE,
   REPERSON VARCHAR(20),
   REAGE INT,
   BRAND VARCHAR(50),
   PIMG VARCHAR(1000) NOT NULL,
   INFOIMG VARCHAR(1000) NOT NULL,
   PRODUCTCNT INT DEFAULT 50,
   FOREIGN KEY (CATENUM) REFERENCES CATEGORY(CATENUM) ON DELETE CASCADE
);


CREATE TABLE MEMBER( 
   MNUM INT PRIMARY KEY AUTO_INCREMENT,
   MID VARCHAR(30) NOT NULL, 
   MPW VARCHAR(30) NOT NULL,  
   MNAME VARCHAR(30) NOT NULL,
   MEMAIL VARCHAR(100) UNIQUE,
   MTEL VARCHAR(100),
   MPOINT INT,
   ZIPCODE VARCHAR(50),
   USERADDR VARCHAR(100),
   DETAILADDR VARCHAR(100),
   MDATE DATE,
   KAKAOLOGIN VARCHAR(100),
   SCORE INT DEFAULT '0',
   MSTATUS VARCHAR(1) DEFAULT '0' CONSTRAINT MSTATUS CHECK(MSTATUS IN ('0','1')),
   MIMG VARCHAR(100)
);

CREATE TABLE DIB( 
   	DIBNUM INT PRIMARY KEY AUTO_INCREMENT,
	PNUM INT,
	FOREIGN KEY (PNUM) REFERENCES PRODUCT(PNUM) ON DELETE CASCADE,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER(MNUM) ON DELETE CASCADE,
	DCNT INT
);

CREATE TABLE ADDRESS( 
	ANUM INT PRIMARY KEY AUTO_INCREMENT,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER(MNUM) ON DELETE CASCADE,
	SHIPNAME VARCHAR(20),
	DESTINATION VARCHAR(20),
	ZIPCODE VARCHAR(50),
	USERADDR VARCHAR(100),
	DETAILADDR VARCHAR(100),
	TEL VARCHAR(20),
	ISDEFAULT VARCHAR(1) DEFAULT '0' CONSTRAINT ISDEFAULT_BL CHECK(ISDEFAULT IN('0','1'))
);


CREATE TABLE MORDER(
	ONUM INT PRIMARY KEY AUTO_INCREMENT,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER(MNUM) ON DELETE CASCADE,
	OSHIPNAME VARCHAR(20),
	OZIPCODE VARCHAR(50),
	OUSERADDR VARCHAR(100),
	ODETAILADDR VARCHAR(50),
	OTEL VARCHAR(20),
	ODATE DATE,
	OSTATUS INT,
	OPOINT INT
);

CREATE TABLE ORDERDETAIL(
	ODNUM INT PRIMARY KEY AUTO_INCREMENT,			  
	ONUM INT,
	FOREIGN KEY (ONUM) REFERENCES MORDER(ONUM) ON DELETE CASCADE,
	PNUM INT,
	FOREIGN KEY (PNUM) REFERENCES PRODUCT(PNUM) ON DELETE CASCADE,
	CNT INT
);

/*CREATE TABLE NOTICECATEGORY(
	NCNUM INT PRIMARY KEY,
	NCNAME VARCHAR(50) NOT NULL
);*/
CREATE TABLE SUECATEGORY(
	SCNUM INT PRIMARY KEY AUTO_INCREMENT,
	SCNAME VARCHAR(50)
);
CREATE TABLE BOARD(
	BNUM INT PRIMARY KEY AUTO_INCREMENT,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER(MNUM) ON DELETE CASCADE,
	BTITLE VARCHAR(50) NOT NULL,
	BCONTENT VARCHAR(1000) NOT NULL,
	BRATE VARCHAR(10) NOT NULL,
	BCNT INT,
	BDATE DATETIME,
	BWDATE DATETIME,
	BCDATE DATETIME,
	BSTATUS VARCHAR(1) DEFAULT '0' CONSTRAINT BSTATUS CHECK(BSTATUS IN ('0','1')),
	BLATITUDE VARCHAR(30) NOT NULL,
	BLONGITUDE VARCHAR(30) NOT NULL,
	BLOCAL VARCHAR(20) NOT NULL,
	BACTION VARCHAR(1) DEFAULT '0' CONSTRAINT BACTION CHECK (BACTION IN ('0','1','2')),
	BADRESS VARCHAR(70)
);

CREATE TABLE APPLICANT(
	ANUM INT PRIMARY KEY AUTO_INCREMENT,
	BNUM INT,
	FOREIGN KEY (BNUM) REFERENCES BOARD (BNUM) ON DELETE CASCADE,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER (MNUM) ON DELETE CASCADE,
	ACHK VARCHAR(1) DEFAULT '0' CONSTRAINT ACHK CHECK(ACHK IN('0','1'))
);
CREATE TABLE COMMENT (
	CNUM INT PRIMARY KEY AUTO_INCREMENT,
	BNUM INT,
	FOREIGN KEY (BNUM) REFERENCES BOARD (BNUM) ON DELETE CASCADE,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER (MNUM) ON DELETE CASCADE,
	CCONTENT VARCHAR(300),
	CWDATE DATETIME,
	CCDATE DATETIME
);

CREATE TABLE SUE(
	SNUM INT PRIMARY KEY AUTO_INCREMENT,
	BNUM INT,
	FOREIGN KEY (BNUM) REFERENCES BOARD (BNUM) ON DELETE CASCADE,
	MNUM INT,
	FOREIGN KEY (MNUM) REFERENCES MEMBER (MNUM) ON DELETE CASCADE,
	SCNUM INT,
	FOREIGN KEY (SCNUM) REFERENCES SUECATEGORY (SCNUM) ON DELETE CASCADE,
	SDATE DATETIME,
	SRESULT VARCHAR(1) DEFAULT '0' CONSTRAINT SRESULT CHECK (SRESULT IN ('0'.'1'))
);
/*CREATE TABLE NOTICE(
	NNUM INT AUTO_INCREMENT PRIMARY KEY,
	NTITLE VARCHAR (50)NOT NULL,
	NCONTENT VARCHAR (1000) NOT NULL,
	NWDATE DATETIME,
	NCNUM INT,
	FOREIGN KEY (NCNUM) REFERENCES NOTICECATEGORY (NCNUM)ON DELETE CASCADE,
	NPIN VARCHAR(1) DEFAULT '0' CONSTRAINT NPIN CHECK(NPIN IN ('0','1'))
);*/
