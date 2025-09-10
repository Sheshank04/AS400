     **free
         dcl-s var1 Packed(3) Inz(15);
         dcl-s var2 Packed(3) Inz(5);
         dcl-s result Packed(3) Inz;

         result = var1 + var2;
         dsply result;

         result = var1 - var2;
         dsply result;

         result = var1 * var2;
         dsply result;

         result = var1 / var2;
         dsply result;

         result = 10;
         dsply result;

         result = result + 5;
         dsply result;

         result += 5;
         dsply result;

         result -= 5;
         dsply result;

         result *= 5;
         dsply result;

         result /= 5;
         dsply result;

        *INLR = *ON;
        dsply 'hello';
