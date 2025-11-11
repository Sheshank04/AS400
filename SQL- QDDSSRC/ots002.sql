-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: OTS002.SQL                                               *
-- *                                                                  *
-- *  Purpose: Order Table to practice exception join                 *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      DescriOTion                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  05/11/25                                                        *
-- ********************************************************************

CREATE TABLE OT_ORDERTABLE_OTS002

     FOR SYSTEM NAME OTS002 (

  OT_ORDERTABLE_ID         FOR COLUMN ORDERID DECIMAL(5,0) NOT NULL DEFAULT 0,
  OT_ORDERTABLE_CUSTOMERID FOR COLUMN CUSTOMERID DECIMAL (5,0),
  OT_ORDERTABLE_DATE       FOR COLUMN ORDERDT DATE,

--  *******************************************************************
--  * CREATE CDC COLUMNS FOR CHANGE DATA CAOTURE                      *
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
  CONSTRAINT OT_OTS002_PK PRIMARY KEY
    (OT_ORDERTABLE_ID))

 RCDFMT OTR002;

 LABEL ON TABLE OT_ORDERTABLE_OTS002
   IS 'Order Table';

 LABEL ON COLUMN OT_ORDERTABLE_OTS002
  (OT_ORDERTABLE_ID         TEXT IS 'Order ID',
   OT_ORDERTABLE_CUSTOMERID TEXT IS 'Customer ID',
   OT_ORDERTABLE_DATE       TEXT IS 'Order Date',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
