\m5_TLV_version 1d: tl-x.org
\m5
   use(m5-1.0)   /// uncomment to use M5 macro library.

\SV
   m5_makerchip_module
\TLV
   $reset = *reset;

   |calc
      @1
         $toggle = $reset ? 1'b0 : >>!$toggle;
         $valid = $toggle;
         $sum[31:0]  = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];

      @2
         $out[31:0] = $valid ? ($op[0] ? $sum : $op[1] ? $diff : $op[2] ? $prod : $quot) : 32'b0;

   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule