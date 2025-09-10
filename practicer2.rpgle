**free
         dcl-s var1 Packed(3) Inz(5);
         dcl-s var2 Packed(3) Inz(15);
         dcl-s result ind;

         dsply result;

         clear result;
         result = var1 = var2;
         dsply result;

         clear result;
         result = var1 <> var2;
         dsply result;

         clear result;
         result = var1 > var2;
         dsply result;

         clear result;
         result = var1 < var2;
         dsply result;

         clear result;
         result = var1 >= var2;
         dsply result;

         clear result;
         result = var1 <= var2;
         dsply result;

         clear result;
         result = (var1 < 6) and (var1 > 4);
         dsply result;

         clear result;
         result = (var1 < 6) and (var1 > var2);
         dsply result;

         clear result;
         result = (var1 < 6) or (var1>4);
         dsply result;

         clear result;
         result = not(var1 > var2);
         dsply result;

         clear result;
         result = not(var1 < var2);
         dsply result;

        *INLR = *ON;
