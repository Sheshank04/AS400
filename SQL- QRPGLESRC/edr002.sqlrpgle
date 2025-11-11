     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Practice using Cursor                      //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free
        Ctl-Opt Option(*Nodebugio:*Srcstmt);
        //Variable Declaration
        dcl-s V_EmployeeId zoned(5:0);
        dcl-s V_EmployeeName char(40);
        dcl-s V_EmployeeDept char(20);

        //Mainline Calculation
        Exec SQL

          Declare EmployeeCursor1 cursor for
          Select EMPID, EMPNAME, EMPDEPT
          from EDPF001;

        Exec SQL open EmployeeCursor1;
          Dow SQLCODE = 0;

            EXEC SQL fetch from EmployeeCursor1 into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            If SQLCODE = 100;
              Leave;
            Endif;

            dsply V_EmployeeName;

          Enddo;
        Exec SQL close EmployeeCursor1;

        Exec SQL

          Declare EmployeeCursor2 cursor for
          Select EMPID, EMPNAME
          from EDPF001
          where EMPDEPT = 'RPG';

        Exec SQL open EmployeeCursor2;
          Dow SQLCODE = 0;

            EXEC SQL fetch from EmployeeCursor2 into
            :V_EmployeeId, :V_EmployeeName;

            If SQLCODE = 100;
              Leave;
            Endif;

          dsply (%char(V_EmployeeId)
          + ' ' + %trim(V_EmployeeName));

          Enddo;
        Exec SQL close EmployeeCursor2;

        *inlr = *on;
