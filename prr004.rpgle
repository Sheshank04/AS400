**free

// FIle Declaration
dcl-f TESTPF1 usage(*input) keyed;

// Variable Declarartion
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
id=3;
chain id TESTPFR;
name = STD_NAME;
dsply (name);

*inlr = *on;
return;
