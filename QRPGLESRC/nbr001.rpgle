     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/17                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Nesting BIF                                         //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Declaration

// 1
dcl-s fullName varchar(30) inz('  Sheshank Srivastava');
dcl-s firstName char(10);

// 2
dcl-s dob date inz(d'2003-11-04');
//dcl-s today date;
dcl-s age packed(3:0);

// 3
dcl-s sentence char(30) inz('I love AS400');
dcl-s newSentence char(20);

// 4
//dcl-s ts timestamp;
dcl-s time1 char(8);

// Mainline Calculation

// 1
firstName = %trim(%subst(fullName: %scan(' ': fullName): %scanr(' ':fullname)));
dsply firstname;

// 2
age = %diff(%date(): dob: *years);
dsply %char(age);

// 3
newSentence = %replace('IBM i': sentence: %scan('AS400': sentence): 5);
dsply newSentence;

// 4
time1 = %subst(%char(%timestamp()): 12: 5);
dsply time1;

*inlr = *on;
