     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: max and min array                                   //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable  Declaration

dcl-s Array Packed(5) Dim(5);
dcl-s max Packed(5);
dcl-s min Packed(5);

// Mainline Calculation

Array(1)=10520;
Array(2)=10514;
Array(3)=25148;
Array(4)=12154;
Array(5)=35531;

// %MAXARR

max = %MAXARR(Array);
dsply %char(max);
dsply ('Maximum number of array is ' + %char(Array(max)));

// %MINARR
min = %MINARR(Array);
dsply %char(min);
dsply ('Minimum number of array is ' + %char(Array(min)));

*inlr = *on;
