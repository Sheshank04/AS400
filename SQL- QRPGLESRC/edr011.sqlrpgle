     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/14                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Delete using SQL Prepare and Execute       //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**FREE
        //Variable Declaration
        dcl-s SqlStmt varchar(200);
        dcl-s EmployeeDept char(20);

        //Main Calculation
        Exec sql
          set option commit = *none;

        SqlStmt = 'DELETE FROM EDPF001 WHERE EMPDEPT = ?';

        // Prepare the statement
        Exec SQL
          PREPARE DeleteStmt FROM :SqlStmt;

        EmployeeDept = 'IBMi';

        // Execute the prepared statement with parameter
        Exec SQL
          EXECUTE DeleteStmt USING :EmployeeDept;

        If SQLCODE = 0;
          dsply ('Delete Successfull');
          dsply SQLCODE;

        Else;
          dsply ('Delete Unsuccessfull');
          dsply SQLCODE;

        Endif;

        *inlr = *on;
