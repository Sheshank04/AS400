-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: CTS002.SQL                                               *
-- *                                                                  *
-- *  Purpose: Customer Table to practice exception join              *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      DescriOTion                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  05/11/25                                                        *
-- ********************************************************************

CREATE OR REPLACE TABLE CT_CUSTOMERTABLE_CTS002

     FOR SYSTEM NAME CTS002 (

  CT_CUSTOMERTABLE_ID   FOR COLUMN CUSTOMERID DECIMAL(5,0) NOT NULL DEFAULT 0,
  CT_CUSTOMERTABLE_NAME FOR COLUMN CUSTOMERNM CHAR(50) NOT NULL DEFAULT ' ',

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
  CONSTRAINT CT_CTS002_PK PRIMARY KEY
    (CT_CUSTOMERTABLE_ID))

 RCDFMT CTR002;

 LABEL ON TABLE CT_CUSTOMERTABLE_CTS002
   IS 'Customer Table';

 LABEL ON COLUMN CT_CUSTOMERTABLE_CTS002
  (CT_CUSTOMERTABLE_ID TEXT IS 'Customer ID',
   CT_CUSTOMERTABLE_NAME TEXT IS 'Customer Name',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
