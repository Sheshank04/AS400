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

dcl-ds monthsInfo qualified;
    field1 char(120);
    field2 char(24);
    month char(10) dim(12) overlay(field1);
    days char(2) dim(12) overlay(field2);
end-ds;

// Variable Declaration

dcl-s i packed(2:0) inz(1);

// Mainline Calculation

monthsInfo.field1 = 'January   February  March     April     May       '+
                    'June      July      August    September October   '+
                    'November  December';

monthsInfo.field2 = '312831303130313130313031';

for i = 1 to 12;
    dsply monthsInfo.month(i);
    dsply monthsInfo.days(i);
endfor;

//dsply monthsInfo;

*inlr = *on;

