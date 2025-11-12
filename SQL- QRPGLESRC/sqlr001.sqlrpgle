     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/11/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: SQLRPGLE Registers                                  //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free
        //Variable Declaration
        Dcl-S  V_SessionUser Char(30);
        Dcl-S  V_Timestamp Timestamp;
        Dcl-S  V_Date1 Date;
        Dcl-S  V_Date2 Varchar(8);
        Dcl-s V_Charvar Char(30);

        //Mainline Calculation
        Exec SQL
          Set :V_SessionUser = Session_User;
          dsply ('Session User is ' + %trim(V_SessionUser));

        Exec SQL
          Values NOW() into :V_TimeStamp;
          dsply ('Timestamp is ' + %char(V_Timestamp));

        Exec SQL
          Set :V_Date1 = Current Date - 5 Days;
          dsply ('Date is ' + %char(V_Date1));

        Exec SQL
          Set :V_Date2 = Varchar_Format(Current Date, 'yyyymmdd');
          dsply ('Date All Digits is ' + %char(V_Date2));

        Exec SQL
          Set :V_Charvar = Current Schema;
          dsply ('Schema: ' +  %trim(V_Charvar));

        *inlr = *on;

