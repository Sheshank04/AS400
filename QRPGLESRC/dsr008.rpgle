     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(PSDS)                                //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Data Structure Declaration

dcl-ds ps psds qualified;
    Program char(10) pos(1);
    SrcFile char(10) pos(304);
    SrcLib char(10) pos(314);
    Date1 char(8) pos(191);
end-ds;

// Mainline Calculation

dsply ps.Program;
dsply ps.SrcFile;
dsply ps.SrcLib;
dsply ps.Date1;

*inlr = *on;
