     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Practice                                   //
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
        dcl-s V_Message char(50);

        //Data-Structure Declaration
        dcl-ds EmployeeDS1 EXTNAME('EDPF001') Qualified;
        end-ds;

        dcl-ds EmployeeDS2 Qualified;

          EMPNAME char(40);
          EMPDEPT char(20);

        end-ds;

        //Mainline Calculation
        V_EmployeeId = 102;

        Exec SQL

          Select EMPNAME
          into :V_EmployeeName
          from EDPF001
          where EMPID = :V_EmployeeId;

        dsply V_EmployeeName;

        Exec SQL

          Select EMPNAME
          into :V_EmployeeName
          from EDPF001
          where EMPDEPT = 'RPG';

        exec SQL GET DIAGNOSTICS CONDITION 1
        :V_Message = MESSAGE_TEXT;

        dsply V_Message;

        Exec SQL

          Select EMPNAME
          into :V_EmployeeName
          from EDPF001
          where EMPDEPT = 'RPG'
          fetch first row only;

        dsply V_EmployeeName;

        Exec SQL

          Select *
          into :EmployeeDS1
          from EDPF001
          where EMPID = :V_EmployeeId;

        dsply EmployeeDS1.EMPID;
        dsply EmployeeDS1.EMPNAME;
        dsply EmployeeDS1.EMPDEPT;

        Exec SQL

          Select EMPNAME, EMPDEPT
          into :EmployeeDS2
          from EDPF001
          where EMPID = :V_EmployeeId;

        dsply EmployeeDS2.EMPNAME;
        dsply EmployeeDS2.EMPDEPT;

        *inlr = *on;
