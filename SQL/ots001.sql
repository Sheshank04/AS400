-- *------------------------------------------------------------------*
-- *  DESIGNED BY: Sheshank Srivastava                                *
-- *                                                                  *
-- *  Table: OTS001.SQL                                               *
-- *                                                                  *
-- *  Purpose: Order Table for Assignment                             *
-- *                                                                  *
-- ********************************************************************
-- *                      Mod ID                                      *
-- *    Date    Initials  Number      DescriOTion                     *
-- *  --------  --------  --------    ------------------------------- *
-- *  04/11/25                                                        *
-- ********************************************************************

CREATE TABLE OT_ORDERTABLE_OTS001

     FOR SYSTEM NAME OTS001 (

  OT_ORDERTABLE_ID           FOR COLUMN ORDERID CHAR (6) NOT NULL DEFAULT ' ',
  OT_ORDERTABLE_ITEMPURCHASED FOR COLUMN ITEMPU CHAR(50) NOT NULL DEFAULT ' ',
  OT_ORDERTABLE_ITEMPRICE     FOR COLUMN ITEMPR DECIMAL(10,2),

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
  CONSTRAINT OT_OTS001_PK PRIMARY KEY
    (OT_ORDERTABLE_ID))

 RCDFMT OTR001;

 LABEL ON TABLE OT_ORDERTABLE_OTS001
   IS 'Order Table';

 LABEL ON COLUMN OT_ORDERTABLE_OTS001
  (OT_ORDERTABLE_ID            TEXT IS 'Order ID',
   OT_ORDERTABLE_ITEMPURCHASED TEXT IS 'Item Purchased',
   OT_ORDERTABLE_ITEMPRICE     TEXT IS 'Item Price',
   CREATEUSER TEXT IS 'CREATE USER ID',
   CREATETIME TEXT IS 'CREATE TIMESTAMP',
   CHANGEJOB  TEXT IS 'CHANGE JOB',
   CHANGEUSER TEXT IS 'CHANGE USER',
   CHANGETIME TEXT IS 'CHANGE TIMESTAMP');
