     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %inth and % dech                                    //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s num1 packed(5:2) inz(12.23);
dcl-s num2 packed(5:2) inz(12.09);
dcl-s num3 packed(5:2) inz(13.93);
dcl-s result1 packed(3:0);
dcl-s result2 packed(5:1);

// Mainline Calculation

//%inth()
result1 = %inth(num1);
dsply (%char(result1));

result1 = %inth(num2);
dsply (%char(result1));

result1 = %inth(num3);
dsply (%char(result1));

//%dech()
result2 = %dech(num1:5:1);
dsply (%char(result2));

result2 = %dech(num2:5:1);
dsply (%char(result2));

result2 = %dec(num2:5:1);
dsply (%char(result2));


*inlr = *on;







