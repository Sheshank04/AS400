-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: DTS001.SQL                                               *
-- *                                                                  *
-- *  Purpose: Department Table to practice exception join            *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      DescriOTion                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  05/11/25                                                        *
-- ********************************************************************

CREATE OR REPLACE TABLE DT_DEPARTMENTTABLE_DTS001

     FOR SYSTEM NAME DTS001 (

  DT_DEPARTMENTTABLE_ID   FOR COLUMN DEPTID DECIMAL(5,0) NOT NULL DEFAULT 0,
  DT_DEPARTMENTTABLE_NAME FOR COLUMN DEPTNM CHAR(50) NOT NULL DEFAULT ' ',

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
  CONSTRAINT DT_DTS001_PK PRIMARY KEY
    (DT_DEPARTMENTTABLE_ID))

 RCDFMT ETR001;

 LABEL ON TABLE DT_DEPARTMENTTABLE_DTS001
   IS 'Department Table';

 LABEL ON COLUMN DT_DEPARTMENTTABLE_DTS001
  (DT_DEPARTMENTTABLE_ID TEXT IS 'Department ID',
   DT_DEPARTMENTTABLE_NAME TEXT IS 'Department Name',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
