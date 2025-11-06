
-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: PTS001.SQL                                               *
-- *                                                                  *
-- *  Purpose: To Use Replace Function                                *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      Description                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  03/11/25                                                        *
-- ********************************************************************

CREATE TABLE PT_PRODUCTTABLE_PTS001

     FOR SYSTEM NAME PTS001 (

  PT_PRODUCTTABLE_ID     FOR COLUMN PRODUCTID DECIMAL(5,0) NOT NULL DEFAULT 0,
  PT_PRODUCTTABLE_NAME   FOR COLUMN PRODUCTNM CHAR(30) NOT NULL DEFAULT ' ',
  PT_PRODUCTTABLE_PRICE  FOR COLUMN PRODUCTPR DECIMAL(10,2),
  PT_PRODUCTTABLE_STATUS FOR COLUMN PRODUCTST CHAR(15),

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
  CONSTRAINT PT_PTS001_PK PRIMARY KEY
    (PT_PRODUCTTABLE_ID))

 RCDFMT PTR001;

 LABEL ON TABLE PT_PRODUCTTABLE_PTS001
   IS 'Product Table';

 LABEL ON COLUMN PT_PRODUCTTABLE_PTS001
  (PT_PRODUCTTABLE_ID     TEXT IS 'Product ID',
   PT_PRODUCTTABLE_NAME   TEXT IS 'Product Name',
   PT_PRODUCTTABLE_PRICE  TEXT IS 'Product Price',
   PT_PRODUCTTABLE_STATUS TEXT IS 'Product Status',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
