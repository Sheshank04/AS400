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

        //Data Structure Declaration
        dcl-ds EmployeeDS EXTNAME('EDPF001') Qualified Dim(10);
        end-ds;

        //Variable Declaration
        dcl-s V_Counter zoned(5:0);
        dcl-s V_NoOfRows zoned(5:0);
        dcl-s V_RowsFetched zoned(5:0);

        Exec SQL
          Declare EmployeeCursor cursor for
          Select *
          from EDPF001;

        Exec SQL open EmployeeCursor;

          V_NoOfRows = %elem(EmployeeDS);
          Exec SQL
            fetch EmployeeCursor for :V_NoOfRows rows
            into :EmployeeDS;

            if SQLCODE = 0;
              EXEC SQL GET DIAGNOSTICS :V_RowsFetched
              = ROW_COUNT;

              for V_Counter = 1 to V_RowsFetched;
                dsply (%char(EmployeeDS(V_Counter).EMPID) + ' ' +
                      %trim(EmployeeDS(V_Counter).EMPNAME));
              endfor;

              dsply %char(V_RowsFetched);

            else;
              dsply 'Fetch Failed';

            endif;

        Exec SQL close EmployeeCursor;

        *inlr = *on;
