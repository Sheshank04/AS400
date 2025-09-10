     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Use of NESTED loop(FREE)                            //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free

// Variable Declaration
dcl-s i zoned(2:0);
dcl-s j zoned(2:0);
dcl-s result char(50);

// Mainline Calculation

// Outer Loop
for i = 1 to 5;
    result = ' ';

    // Inner Loop
    for j = 1 to i;
        result = %trim(result) + '*';
    endfor;

    dsply result;

endfor;

*inlr = *on;
