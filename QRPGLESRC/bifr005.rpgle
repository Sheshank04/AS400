     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %uns &  %unsh                                       //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s num1 packed(5:2) inz(123.56);
dcl-s char1 char(10) inz('123.45');

dcl-s result packed(5:0);

result = %uns(num1);
dsply %char(result);

result = %unsh(num1);
dsply %char(result);

result = %unsh(char1);
dsply %char(result);

// result = %uns('abc');
// dsply %char(result);

result = %uns(char1);
dsply %char(result);

*inlr = *on;

