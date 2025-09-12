     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/                                          //
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

dcl-s input1 packed(5:2) Inz(256.90);
dcl-s input2 packed(9:2) Inz(1243455.87);
dcl-s input3 packed(8:0) Inz(10092025);

dcl-s output1 char(20);
dcl-s output2 char(20);
dcl-s output3 char(20);

// Mainline Calculation

output1 = %editw(input1:'$  , .  ');
dsply output1;

output2 = %editw(input2:'    %  , .  ');
dsply output2;

output2 = %editw(input2:',      , .  ');
dsply output2;

output2 = %editw(input2:'    *  , .  ');
dsply output2;

output3 = %editw(input3:'  .  .    ');
dsply output3;

*inlr = *on;
