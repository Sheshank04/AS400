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

dcl-s array char(10) dim(7) ctdata perrcd(1);
dcl-s counter packed(2) inz(1);

// Mainline Calculation

// for loop
for counter = 1 to 7 by 1;
    dsply array(counter);
endfor;

*inlr = *on;

**ctdata array
monday
tuesday
wednesday
thursday
friday
saturday
sunday
