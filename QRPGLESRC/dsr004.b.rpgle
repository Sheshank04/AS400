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
    fullRecord char(40);
    id char(5) overlay(fullrecord);
    name char(25) overlay(fullrecord);
    amount char(10) overlay(fullrecord);
    amount1 packed(10:2) overlay(fullrecord);
end-ds;

// Mainline Calculation

Record.fullRecord = '1    Sheshank Srivastava      15000.00';
//Record.amount1 = %dec(Record.amount:10:2);

dsply Record.id;
dsply Record.name;
dsply Record.amount;
//dsply %char(Record.amount1);

*inlr=*on;
