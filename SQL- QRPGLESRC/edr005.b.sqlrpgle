     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Update Using Cursor                        //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**FREE
        //Variable Declaration
        Dcl-S EmployeeId zoned(5:0);
        Dcl-S EmployeeName char(40);
        Dcl-S EmployeeDept char(20);

        Exec SQL
          Set option Commit = *None;

        // Declare cursor to select only rows where DEPT = 'EDI'
        Exec SQL
          DECLARE EmployeeCursor1 CURSOR FOR
            SELECT EMPID, EMPNAME, EMPDEPT
            FROM EDPF001
            WHERE EMPDEPT = 'Cobol'
            FOR UPDATE OF EMPDEPT;

        // Open cursor
        Exec SQL OPEN EmployeeCursor1;

        // Fetch and update each row
          Dow SqlCode = 0;
            Exec SQL FETCH EmployeeCursor1 into :EmployeeId, :EmployeeName, :EmployeeDept;

              EmployeeDept = 'EDI';
              Exec SQL
                UPDATE EDPF001
                SET EMPDEPT = :EmployeeDept
                WHERE CURRENT OF EmployeeCursor1;

          EndDo;
          dsply 'Update Succesful';
        // Close cursor
        Exec SQL CLOSE EmployeeCursor1;

        *inlr = *on;
