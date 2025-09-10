     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Use of if statement                                 //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//
**free

// Variable Declaration
dcl-s score zoned(2:0) inz(80);
dcl-s grade char(10);

// Mainline Calculation
if score >= 90;
    grade = 'A';
endif;

if score >= 80 and score < 90;
    grade = 'B';
endif;

if score >= 60 and score < 80;
    grade = 'C';
endif;

if score < 60;
    grade = 'F';
endif;

dsply ('Score:' + %char(score));
dsply ('Grade:' + grade);

*inlr = *on;
