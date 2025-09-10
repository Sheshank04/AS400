**free

// Variable Declarartion
dcl-s a zoned(2:0) inz(20);
dcl-s date1 DATE;
dcl-s result char(30);

// MAinline Calculation

result = %char(a); // %char() BIF
dsply result;
date1 = %date(); // %date() BIF
result = %char(date1); // %char() BIF
dsply result;
result = %char(date1: *MDY); // %char() BIF
dsply result;

*inlr = *on;
