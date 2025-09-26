     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %Xfoot() & %Elem                                    //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

dcl-s array packed(5) dim(7);
dcl-s count packed(5);

// Mainline Calculation

array(1) = 10;
array(2) = 90;
array(3) = 20;
array(4) = 60;
array(5) = 18;
array(6) = 19;

// %Elem

count = %elem(array);
dsply %char(count);

// %Xfoot

count = %xfoot(array);
dsply %char(count);

*inlr = *on;
