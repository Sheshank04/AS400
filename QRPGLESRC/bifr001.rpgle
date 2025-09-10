     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/09                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %dec                                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Variable Description

dcl-s number1 packed(7:2);
dcl-s number2 packed(5:0);
dcl-s number3 packed(7:3);
dcl-s number4 packed(5:2);
dcl-s number5 packed(6:2);
dcl-s number6 packed(4:2);
dcl-s char1 char(10) inz('600');
dcl-s num packed(6:2);
// dcl-s number7 packed(3:4);

// Mainline Calculation

number1 = %dec(12345.6);
dsply (%char(number1));

number2 = %dec(1234 : 5: 0);
dsply (%char(number2));

number3 = %dec(123.45 : 7: 3);
dsply (%char(number3));

number4 = %dec(25 :5 : 2);
dsply (%char(number4));

number5 = %dec('1234.5' :6 :2);
dsply (%char(number5));

number6 = %dec('99' :4 :2);
dsply (%char(number6));

num = %dec(char1 : 6: 2);
dsply (%char(num));

// number7 = %dec('99.23' :3 :4);
// dsply (%char(number7));

*inlr = *on;


