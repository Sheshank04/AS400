     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/16                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %split() and %subarr() and %split                   //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable  Declaration

dcl-s array1 char(10) dim(5);
dcl-s array2 char(10) dim(5);
dcl-s array3 char(10) dim(5);
dcl-s count packed(2) inz(1);

// Mainline Calculation

// %list

array1 = %list('a' : 'b' : 'c' : 'd' : 'e');

for count = 1 to 5;
    dsply array1(count);
endfor;

// %split

array2 = %split('a b c.d e' : ' .');

for count = 1 to 5;
    dsply array2(count);
endfor;

// %subarr

array3 = %subarr(array2 : 2: 3);

for count = 1 to 5;
    dsply array3(count);
endfor;


*inlr = *on;
