**free

// File DEclaration
dcl-f TESTPF1 usage(*input:*output) keyed;

// Variable DEclaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
STD_ID = 7;
STD_NAME = 'F';
STD_CLASS = 12;
//write TESTPFR;
//dsply 'Record Added';
*inlr = *on;
write TESTPFR;
dsply 'Record Added';
return;
