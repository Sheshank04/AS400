**free

// File Declaration
dcl-f TESTPF1 usage(*delete) keyed;

// Variable Declaration
dcl-s id zoned(5:0);
dcl-s name char(30);
dcl-s class zoned(2:0);

// Mainline Calculation
id = 6;
chain id TESTPFR;
delete TESTPFR;
dsply 'Record Deleted';

*inlr = *on;
return;
