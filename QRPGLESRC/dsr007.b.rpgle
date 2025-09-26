     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/18                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: Data Structure(Data Area)                           //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// Data Structure Declaration

dcl-ds DS_DataArea dtaara('SHESHANK/DA001');
    First char(10) pos(1);
    Last char(20) pos(11);
    Fld char(20) pos(31);
end-ds;

// Mainline Calculation

// Read
in *lock DS_DataArea;
dsply DS_DataArea;

// Write
Fld = 'Ibmi Intern 2025(II)';
out DS_DataArea;
unlock DS_DataArea;

dsply DS_DataArea;

*inlr = *on;
