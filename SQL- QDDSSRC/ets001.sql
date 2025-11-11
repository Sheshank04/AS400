-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: ETS001.SQL                                               *
-- *                                                                  *
-- *  Purpose: Employee Table to practice exception join              *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      DescriOTion                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  05/11/25                                                        *
-- ********************************************************************

CREATE OR REPLACE TABLE ET_EMPLOYEETABLE_ETS001

     FOR SYSTEM NAME ETS001 (

  ET_EMPLOYEETABLE_ID    FOR COLUMN EMPLOYEEID DECIMAL(5,0) NOT NULL DEFAULT 0,
  ET_EMPLOYEETABLE_NAME  FOR COLUMN EMPLOYEENM CHAR(50) NOT NULL DEFAULT ' ',
  ET_EMPLOYEETABLE_DEPARTMENTID FOR COLUMN DEPTID DECIMAL(5,0),

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
  CONSTRAINT ET_ETS001_PK PRIMARY KEY
    (ET_EMPLOYEETABLE_ID))

 RCDFMT ETR001;

 LABEL ON TABLE ET_EMPLOYEETABLE_ETS001
   IS 'Employee Table';

 LABEL ON COLUMN ET_EMPLOYEETABLE_ETS001
  (ET_EMPLOYEETABLE_ID TEXT IS 'Employee ID',
   ET_EMPLOYEETABLE_NAME TEXT IS 'Employee Name',
   ET_EMPLOYEETABLE_DEPARTMENTID TEXT IS 'Department ID',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
