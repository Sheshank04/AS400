     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/17                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %split                                              //
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
dcl-s array2 packed(10:5) dim(5);
dcl-s array3 packed(10:0) dim(5);
dcl-s count packed(2) inz(1);

// Mainline Calculation

// %split

// char to dec
// array2 = %split('a b c d e' : ' ');

// for count = 1 to 5;
//     dsply array2(count);
// endfor;

// char to int
// array3 = %split('a b c d e' : ' ');

// for count = 1 to 5;
//     dsply array3(count);
// endfor;

// num to char
array1 = %split('1 2 3 4 5' : ' ');

for count = 1 to 5;
    dsply array1(count);
endfor;

array2 = %split(1 3 4 5 6: ' ');

for count = 1 to 5;
    dsply array2(count);
endfor;

array1 = %split(1.2 3 4.5 6 9: ' ');

for count = 1 to 5;
    dsply array1(count);
endfor;

//
array1 = %split('1 A 3 # 5' : ' ');

for count = 1 to 5;
    dsply array1(count);
endfor;

// num to dec
array2 = %split(1 3 4 5 6: ' ');

for count = 1 to 5;
    dsply array2(count);
endfor;

// dec to int
array3 = %split(1.2 3 4.5 6 9: ' ');

for count = 1 to 5;
    dsply array3(count);
endfor;

// dec to char
array1 = %split('1.2 3 4.5 6 9' : ' ');

for count = 1 to 5;
    dsply array1(count);
endfor;


*inlr = *on;
