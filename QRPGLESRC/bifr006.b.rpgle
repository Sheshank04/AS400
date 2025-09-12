     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: time                                                //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s time1 time;
dcl-s timestamp1 timestamp;
dcl-s date1 date;
dcl-s result packed(25:5);
dcl-s hour packed(2:0);
dcl-s minute packed(2:0);

// Mainline Calculation

time1 = %time();

date1 = %date();
timestamp1 = %timestamp();
dsply timestamp1;

result = %subdt(timestamp1: *seconds: 5: 3);
dsply %char(result);

result = %subdt(timestamp1: *ms);
dsply %char(result);

hour = %subdt(timestamp1: *h);
minute = %subdt(timestamp1: *mn);

dsply (%char(hour) + '.' + %char(minute));

// result = %subdt(timestamp1: *minutes: 5: 3);
// dsply %char(result);

*inlr = *on;
