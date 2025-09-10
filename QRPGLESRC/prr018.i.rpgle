**free

// File Declaration
dcl-f PRPF001 usage(*input) keyed;

// Variable Declaration
dcl-s id packed(5:0);
dcl-s name char(20);

// Mainline Calculation
setll *hival PRPFR1;
read PRPFR1;
    id = ID;
    name = NAME;
    dsply (%char(id)+' '+name);
*INLR=*ON;
