     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Use Overlay                                         //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// DS Declaration

dcl-ds Record qualified;
    id char(5) overlay(Record:1);
    name char(25) overlay(Record:6);
    amount char(10) overlay(Record:31);
    amount1 packed(10:2) overlay(Record:31);
end-ds;

// Mainline Calculation

Record = '1    Sheshank Srivastava      15000.00';
Record.amount1 = %dec(Record.amount:10:2);

dsply Record.id;
dsply Record.name;
dsply %char(Record.amount1);

*inlr=*on;
