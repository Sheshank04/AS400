     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Compile Time Array                                  //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s months char(10) dim(24) ctdata perrcd(2);
dcl-s counter packed(2) inz(1);

// Mainline Calculation

// for loop
for counter = 1 to 12 by 1;
    dsply months(counter);
endfor;

*inlr = *on;

**ctdata months
January   31
February  28
March     31
April     30
May       31
June      30
July      31
August    31
September 30
October   31
November  30
December  31
