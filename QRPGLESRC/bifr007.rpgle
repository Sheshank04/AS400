     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/12                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: %found & %equal                                     //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

dcl-f testpf1 usage(*input) keyed;

dcl-s cID packed(5:0) inz(1);
dcl-s CName char(20);
dcl-s found ind;

chain cID testpfr;
If %found();
    dsply'Found';
endif;

setll cID testpfr;
if %equal();
    dsply 'Record Matched';
endif;

*inlr = *on;
