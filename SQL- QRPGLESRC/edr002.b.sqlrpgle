     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Practice using Cursor(Scrollable)          //
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
        Exec SQL set option CLOSQLCSR = *ENDMOD;

        Exec SQL

          Declare EmployeeCursor scroll cursor for
          Select EMPID, EMPNAME, EMPDEPT
          from EDPF001;

        Exec SQL open EmployeeCursor;

          //Last Record
          Exec SQL
            fetch last from EmployeeCursor into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            dsply V_EmployeeName;

          //Next Record
          Exec SQL
            fetch next from EmployeeCursor into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            dsply V_EmployeeName;

          //First Record
          Exec SQL
            fetch first from EmployeeCursor into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            dsply V_EmployeeName;

          //+2th Record
          Exec SQL
            fetch relative 2 from EmployeeCursor into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            dsply V_EmployeeName;

          //Previous Record
          Exec SQL
            fetch prior from EmployeeCursor into
            :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

            dsply V_EmployeeName;

          // Exec SQL
          //   fetch absolute 3 from EmployeeCursor into
          //   :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

          //   dsply V_EmployeeName;

        Exec SQL close EmployeeCursor;

        *inlr = *on;
