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
**free
        Ctl-opt Option(*Nodebugio:*Srcstmt);

        //Data Structure Declaration
        Dcl-ds EmployeeDS Qualified Dim(5);
          EMPID zoned(5:0);
          EMPNAME char(40);
          EMPDEPT char(20);
        End-ds;

        //Variable Declaration
        Dcl-s V_Counter zoned(5:0) inz(1);
        Dcl-s V_Text char(40);
        Dcl-s V_ID zoned(5:0) inz(205);

        //Mainline Execution
        Exec Sql
          Set option commit = *none;

        For V_Counter = 1 to 5;
          EmployeeDS(V_Counter).EMPID = V_ID;
          EmployeeDS(V_Counter).EMPNAME  = 'Sheshank';
          EmployeeDS(V_Counter).EMPDEPT = 'IBMi';
          V_ID = V_ID + 1;
        Endfor;

        Exec Sql
            Insert Into EDPF001 5 rows Values (:EmployeeDS);

        Exec Sql
            Get Diagnostics condition 1 :V_Text = Message_text;
            dsply V_Text;

        *inlr = *on;

