     A* -----------------------------------------------------------------------//
     A* CREATED BY.......: Programmers.io @ 2025                               //
     A* CREATE DATE......: 2025/09/19                                          //
     A* DEVELOPER........: Sheshank Srivastava                                 //
     A* DESCRIPTION......: max and min array                                   //
     A* -----------------------------------------------------------------------//
     A* Modification Log                                                       //
     A* -----------------------------------------------------------------------//
     A* Date     Mod_ID      Developer   Case and Description                  //
     A* YY/MM/DD ----------  ----------  --------------------------------------//
     A*                                                                        //
     A* -----------------------------------------------------------------------//

**free

// DS Declaration

dcl-ds Info qualified dim(10);
    name char(10);
    id char(10);
    dcl-ds address;
        haddr char(15);
        oaddr char(15);
    end-ds;
end-ds;

Info(1).name = 'Sheshank';
Info(1).id = '00001';
Info(1).address.haddr = 'Lucknow';
Info(1).address.oaddr = 'Jaipur';

//dsply Info;
dsply Info(1);
dsply Info(1).address;
//dsply address;
//dsply Info.address;

*inlr = *on;

