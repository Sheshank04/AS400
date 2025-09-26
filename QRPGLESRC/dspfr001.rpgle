     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/22                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: DSPF RPG Code                                       //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// File Declaration

dcl-f idsdspf001 workstn;

     //Do-While Loop

     dow *In03 = *off;

          exfmt rec001;
          select;

          when color = 'R';
               exsr clearall;
               *In10 = *on;

          when color = 'B';
               exsr clearall;
               *In20 = *on;

          other;
               *In10 = *on;
               *In20 = *on;

          endsl;
     enddo;
*inlr = *on;

// Subroutine

Begsr clearall;

     Reset *In10;
     Reset *In20;

Endsr;
