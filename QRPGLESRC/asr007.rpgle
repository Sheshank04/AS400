     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/10                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Table of 9                                          //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Description

dcl-s number packed(2:0);
dcl-s i packed(2:0);
dcl-s result packed(2:0);

// Mainline Calculation

dsply 'Enter the Number: ' '' number;

// for loop
for i = 1 to 10;
    result = number * i;
    dsply (%char(number)+'*'+%char(i)+'='+%char(result));
endfor;

*inlr = *on;
