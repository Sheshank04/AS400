**FREE
ctl-opt dftactgrp(*NO) actgrp(*CALLER);

dcl-s sqlStmt varchar(200);
dcl-s empDept char(10);

empDept = 'HR';  // Example department to delete

// Build dynamic SQL statement
sqlStmt = 'DELETE FROM EMPLOYEE WHERE DEPT = ?';

// Prepare the statement
exec sql
   PREPARE DelStmt FROM :sqlStmt;

// Execute the prepared statement with parameter
exec sql
   EXECUTE DelStmt USING :empDept;

if sqlcode = 0;
   dsply ('Records deleted successfully for Dept: ' + empDept);
else;
   dsply ('Error deleting records. SQLCODE=' + %char(sqlcode));
endif;

*inlr = *on;
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

