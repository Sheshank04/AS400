     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Insensitive Scroll Cursor                  //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free
        Dcl-S EmployeeId zoned(5:0);
        Dcl-S EmployeeName char(40);

        exec sql
          set option commit = *none;

        exec sql declare EmployeeCursor sensitive dynamic scroll cursor for
            select EMPID, EMPNAME
            from EDPF001
            where EMPNAME = 'Sheshank'
            for update of EMPNAME;

        exec sql open EmployeeCursor;

        exec sql
          fetch first from EmployeeCursor into :EmployeeId, :EmployeeName;
        dsply SQLCODE;

        EmployeeName = 'Sheshank1';
        exec sql
          update EDPF001
          set EMPNAME = :EmployeeName
          where current of EmployeeCursor;
        dsply SQLCODE;

        exec sql
          insert into EDPF001 (EMPID, EMPNAME, EMPDEPT)
          values (004, 'Sheshank', 'IBMi');
        dsply SQLCODE;

        exec sql fetch last from EmployeeCursor into :EmployeeId, :EmployeeName;
        dsply EmployeeId;
        dsply SQLCODE;

        exec sql close EmployeeCursor;

        *inlr = *on;
