     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Use of FOR loop(FREE)                               //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free

// Variable Declaration
dcl-s count zoned(2:0);
dcl-s num zoned(2:0);
dcl-s result zoned(2:0);

// Mainline Calculation
dsply 'Enter a number' '' num;

for count = 1 to 10;
    result = num * count;
    dsply result;
endfor;

for count = 1 to 10 by 2;
    result = num * count;
    dsply result;
endfor;

for count = 10 downto 1;
    result = num * count;
    dsply result;
endfor;

for count = 10 downto 1 by 2;
    result = num * count;
    dsply result;
endfor;

*inlr = *on;


