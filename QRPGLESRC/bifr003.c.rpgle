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

// Variable Declaration

dcl-s input1 packed(5:0) inz(00012);
dcl-s input2 packed(5:0) inz(00012);
dcl-s input3 packed(5:0) inz(01234);
dcl-s input4 packed(5:0) inz(01234);
dcl-s input5 packed(5:0) inz(01234);
dcl-s input6 packed(5:0) inz(01234);
dcl-s input7 packed(8:0) inz(11092025);

dcl-s output1 char(20);
dcl-s output2 char(20);
dcl-s output3 char(20);
dcl-s output4 char(20);
dcl-s output5 char(20);
dcl-s output6 char(20);
dcl-s output7 char(20);

// Mainline Calculation

output1    = %editw(input1:'     ');
dsply output1;

output2    = %editw(input2:'0     ');
dsply output2;

output3    = %editw(input3:'   .  000');
dsply output3;

output4    = %editw(input4:'0   .  000');
dsply output4;

output5    = %editw(input5:'   .  $');
dsply output5;

output6    = %editw(input6:'  0.  000');
dsply output6;

output7    = %editw(input7:'0  /  /    ');
dsply output7;

*inlr = *on;
