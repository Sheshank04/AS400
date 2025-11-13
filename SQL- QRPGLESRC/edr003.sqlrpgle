     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Fetch Multiple Rows                        //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free
// Data Structure Declaration
dcl-ds EmployeeDS extname('EDPF001') qualified dim(500);
end-ds;

// Variable Declaration
dcl-s V_ChunkSize zoned(5:0) inz(500);
dcl-s V_RowsFetched zoned(5:0);
dcl-s V_TotalFetched zoned(10:0) inz(0);
dcl-s i zoned(5:0);

// Declare Cursor
exec sql
   declare EmployeeCursor cursor for
   select * from EDPF001;

// Open Cursor
exec sql open EmployeeCursor;

// Loop until no more rows
dow '1' = '1';  // Or use dow true;
   exec sql
      fetch EmployeeCursor for :V_ChunkSize rows
      into :EmployeeDS;

   if SQLCODE = 0;
      exec sql get diagnostics :V_RowsFetched = ROW_COUNT;

      if V_RowsFetched = 0;
         leave; // No more rows
      endif;

      V_TotalFetched += V_RowsFetched;

      // Process fetched rows
      for i = 1 to V_RowsFetched;
         dsply (%char(EmployeeDS(i).EMPID) + ' ' +
                %trim(EmployeeDS(i).EMPNAME));
      endfor;

      dsply ('Chunk fetched: ' + %char(V_RowsFetched) +
             ' | Total so far: ' + %char(V_TotalFetched));

   else;
      leave; // Fetch failed
   endif;
enddo;

// Close Cursor
exec sql close EmployeeCursor;

*inlr = *on;

