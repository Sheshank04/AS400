     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE WITH HOLD & WITHOUT HOLD Cursor            //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free
        //Variable Declaration
        Dcl-S EmployeeId zoned(5:0);
        Dcl-S EmployeeName char(40);
        Dcl-S EmployeeDept char(20);

        //Mainline Calculation
        exec sql
          set option commit = *all;

        exec sql
          declare cursor_hold scroll cursor with hold for
          select EMPID, EMPNAME, EMPDEPT from EDPF001;

        exec sql
          declare cursor_nohold cursor for
          select EMPID, EMPNAME, EMPDEPT from EDPF001;

        exec sql open cursor_hold;
        exec sql open cursor_nohold;

        exec sql fetch next from cursor_hold into
          :EmployeeId, :EmployeeName, :EmployeeDept;
        dsply SQLCODE;

        exec sql fetch next from cursor_nohold into
          :EmployeeId, :EmployeeName, :EmployeeDept;
        dsply SQLCODE;

        exec sql commit;

        exec sql fetch next from cursor_hold into
          :EmployeeId, :EmployeeName, :EmployeeDept;
        dsply SQLCODE;

        exec sql fetch next from cursor_nohold into
          :EmployeeId, :EmployeeName, :EmployeeDept;
        dsply SQLCODE;

        exec sql close cursor_hold;

        *inlr = *on;

