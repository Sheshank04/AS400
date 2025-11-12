     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Dynamic SQL                                //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free
        //Variable Declaration
        Dcl-s SqlStatement char(500);
        Dcl-s V_EmployeeId zoned(5:0);
        Dcl-s V_EmployeeName char(40);
        Dcl-s V_EmployeeDept char(20);

        Dcl-c qte const('''');

        Exec SQL
          Set option Commit = *None;

        //Mainline Calculation
        SqlStatement = 'INSERT INTO EDPF001 (EMPID, EMPNAME, EMPDEPT)'
                      +' VALUES (?, ?, ?)';

        Exec SQL
          Prepare InsertStatement from :SqlStatement;

        V_EmployeeId = 201;
        V_EmployeeName = 'Vikas Kumar';
        V_EmployeeDept = 'RPG';

        Exec SQL
          Execute InsertStatement using
          :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

        If SQLCODE = 0;
          dsply 'Insert Successful';

        Else;
          dsply 'Insert Failed';

        Endif;

        V_EmployeeId = 202;
        V_EmployeeName = 'Rohit Singh';
        V_EmployeeDept = 'Java';

        Exec SQL
          Execute InsertStatement using
          :V_EmployeeId, :V_EmployeeName, :V_EmployeeDept;

        V_EmployeeId = 203;
        V_EmployeeName = 'Anubhav Shukla';
        V_EmployeeDept = 'EDI';

        SqlStatement = 'INSERT INTO EDPF001 (EMPID, EMPNAME, EMPDEPT)'
                      +' VALUES ('+ %trim(%char(V_EmployeeID)) + ',' +
                        qte + %trim(V_EmployeeName) + qte + ',' +
                        qte + %trim(V_EmployeeDept) + qte + ')';

        Exec SQL
          execute immediate :SqlStatement;

        If SQLCODE = 0;
          dsply 'Insert Successful';

        Else;
          dsply 'Insert Failed';

        Endif;

        *inlr = *on;
