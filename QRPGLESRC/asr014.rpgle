     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Pattern 2                                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration
dcl-s i packed(2:0);
dcl-s j packed(2:0);
dcl-s result char(50);

// Mainline Calculation

// Outer For Loop
for i = 1 to 5 by 2;
    result = ' ';

    // Inner For Loop
    for j = 1 to i;
        result = %trim(result) + '*';
    endfor;

    dsply result;

endfor;

*inlr = *on;
