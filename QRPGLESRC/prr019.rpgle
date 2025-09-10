**free

// Variable Declarartion
dcl-s a zoned(3:0) inz(20);
dcl-s b zoned(3:0) inz(30);
dcl-s result zoned(10:0);
dcl-s result1 zoned(7:2);
dcl-s date1 DATE;
dcl-s char1 char(10) inz('-2017.89');

// Mainline Calculation

result = a-b;
dsply result;
result = %abs(a-b); // %abs() BIF
dsply result;

date1 = %date(); // %date() BIF
result = %dec(date1); // %dec() BIF
dsply result;
result = %dec(date1:*YMD); // %dec() BIF
dsply result;

result1 = %dec(char1:7:2); // %dec() BIF
dsply %char(result1); // %cahr() BIF
result1 = %dec(char1:6:2); // %dec() BIF
dsply %char(result1); // %char() BIF

*inlr = *on;
