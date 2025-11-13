     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/13                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Fetch Multiple Rows(FIX) Format            //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
     FEDPF001   IF   E           K DISK

     C* Data Structure Array Declaration
     D EmployeeDS    E DS                  EXTNAME('EDPF001')
     D                                     QUALIFIED DIM(250000)

     C* Variables
     D V_Counter       S              5P 0
     D V_NoOfRows      S              5P 0
     D V_RowsFetched   S              5P 0

     C* Declare Cursor
     C/EXEC SQL
     C+ DECLARE EmployeeCursor CURSOR FOR
     C+ SELECT * FROM EDPF001
     C/END-EXEC

     C* Open Cursor
     C/EXEC SQL
     C+ OPEN EmployeeCursor
     C/END-EXEC

     C* Set number of rows to fetch
     C                   EVAL      V_NoOfRows = %ELEM(EmployeeDS)

     C* Fetch up to 32,767 rows
     C/EXEC SQL
     C+ FETCH EmployeeCursor FOR :V_NoOfRows ROWS
     C+ INTO :EmployeeDS
     C/END-EXEC

     C* Check SQLCODE
     C                   IF        SQLCODE = 0

     C* Get number of rows fetched
     C/EXEC SQL
     C+ GET DIAGNOSTICS :V_RowsFetched = ROW_COUNT
     C/END-EXEC

     C* Loop through fetched rows
     C                   FOR       V_Counter = 1 TO V_RowsFetched
          DSPLY (%CHAR(EmployeeDS(V_Counter).EMPID) + ' ' +
          %TRIM(EmployeeDS(V_Counter).EMPNAME));
     C                   ENDFOR

     C* Display total rows fetched
          DSPLY %CHAR(V_RowsFetched);

     C                   ELSE
     C     'Fetch Failed'DSPLY
     C                   ENDIF

     C* Close Cursor
     C/EXEC SQL
     C+ CLOSE EmployeeCursor
     C/END-EXEC

     C                   SETON                                        LR

