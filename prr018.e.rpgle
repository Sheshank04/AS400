**free

// File Declaration
dcl-f PRPF001 usage(*input) keyed;

// Variable Declaration
dcl-s id packed(5:0);
dcl-s name char(20);

// Mainline Calculation
setll *loval PRPFR1;
read PRPFR1;
dow not %eof();
    id = ID;
    name = NAME;
    dsply (%char(id)+' '+name);
    read PRPFR1;
enddo;
*INLR=*ON;
