**free

// Variable Declaration
dcl-s num zoned(2:0);
dcl-s result zoned(2:0);

// Mainline Calculation
num = 40;
result = 20*40;
dsply result;
*inlr = *on;

// *PSSR
begsr *pssr;
dsply 'result out of range';
return;
endsr;
