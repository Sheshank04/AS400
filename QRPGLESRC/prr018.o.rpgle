**free

// File Declaration
dcl-f PRPF001 usage(*input) keyed;

// Variable Declaration
dcl-s id packed(5:0);
dcl-s name char(20);

// Mainline Calculation
setgt *loval PRPFR1;
readp PRPFR1;
dow not %eof();
    id = ID;
    name = NAME;
    dsply (%char(id)+' '+name);
    readp PRPFR1;
enddo;
*INLR=*ON;
