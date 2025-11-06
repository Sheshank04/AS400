-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: PTS002.SQL                                               *
-- *                                                                  *
-- *  Purpose: To Use Translate Function                              *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      Description                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  04/11/25                                                        *
-- ********************************************************************

CREATE TABLE PT_PRODUCTTABLE_PTS002

     FOR SYSTEM NAME PTS002 (

  PT_PRODUCTTABLE_ID   FOR COLUMN PRODUCTID DECIMAL(5,0) NOT NULL DEFAULT 0,
  PT_PRODUCTTABLE_NAME FOR COLUMN PRODUCTNM CHAR(30) NOT NULL DEFAULT ' ',
  PT_PRODUCTTABLE_CODE FOR COLUMN PRODUCTCD CHAR(30),

--  *******************************************************************
--  * CREATE CDC COLUMNS FOR CHANGE DATA CAPTURE                      *
--  *******************************************************************
    CREATEUSER VARCHAR(20) ALLOCATE(10) NOT NULL DEFAULT USER,
    CREATETIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHANGEJOB  VARCHAR(28) CCSID 37 GENERATED ALWAYS AS (QSYS2.JOB_NAME),
    CHANGEUSER VARCHAR(18) CCSID 37 GENERATED ALWAYS AS (USER),
    CHANGETIME TIMESTAMP NOT NULL
     GENERATED ALWAYS FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP,

--  ******************************************************************
--  * PRIMARY KEY                                                    *
--  ******************************************************************
  CONSTRAINT PT_PTS002_PK PRIMARY KEY
    (PT_PRODUCTTABLE_ID))

 RCDFMT PTR002;

 LABEL ON TABLE PT_PRODUCTTABLE_PTS002
   IS 'Product Table';

 LABEL ON COLUMN PT_PRODUCTTABLE_PTS002
  (PT_PRODUCTTABLE_ID   TEXT IS 'Product ID',
   PT_PRODUCTTABLE_NAME TEXT IS 'Product Name',
   PT_PRODUCTTABLE_CODE TEXT IS 'Product Code',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
