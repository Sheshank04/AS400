**free

// Variable Declararion
dcl-s date1 zoned(10);

// Mainline Calculation

date1 = 20250908;

test(de) *ymd date1; // TEST (DE) Opcode
if %error;
dsply 'Invalid Date';
else;
dsply 'Valid Date';
endif;

date1 = 20210132;

test(de) *ymd date1; // TEST (DE) Opcode
if %error;
dsply 'Invalid Date';
else;
dsply 'Valid Date';
endif;

*inlr=*on;



