     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/22                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(Indicator)                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// File Declaration using INDDS

dcl-f idsdspf002 workstn INDDS(DS1);

// Data Structure Declaration

dcl-ds DS1;
     Exit Ind Pos(03);
     Red Ind Pos(10);
     Blue Ind Pos(20);
end-ds;

     //Do-While Loop

     dow Exit = *off;
          exfmt rec001;
          select;

          when color = 'R';
               exsr clearall;
               Red = *on;

          when color = 'B';
               exsr clearall;
               Blue = *on;

          other;
               Red = *on;
               Blue = *on;
          endsl;
     enddo;

*inlr = *on;

// Subroutine Begin

Begsr clearall;
     Reset Red;
     Reset Blue;
Endsr;
