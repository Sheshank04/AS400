     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/11                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %editw                                              //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

//Variable Declaration

dcl-s input1 packed(5:0) Inz(1105);
dcl-s input2 packed(8:0) Inz(11092025);
dcl-s input3 packed(5:0) Inz(12345);
dcl-s input4 packed(5:0) Inz(12345);
dcl-s input5 packed(5:0) Inz(-12345);
dcl-s input6 packed(5:0) Inz(-12345);

dcl-s output1 char(20);
dcl-s output2 char(20);
dcl-s output3 char(20);
dcl-s output4 char(20);
dcl-s output5 char(20);
dcl-s output6 char(20);

//Mainline Calculation

output1    = %editw(input1:'   .  AM');
dsply output1;

output2   = %editw(input2:'  /  /    ');
dsply output2;

output3   = %editw(input3:'   .  $');
dsply output3;

output4    = %editw(input4:'   .  CR');
dsply output4;

output5    = %editw(input5:'   .  CR');
dsply output5;

output6    = %editw(input6:'   .  -');
dsply output6;

*inlr = *on;

