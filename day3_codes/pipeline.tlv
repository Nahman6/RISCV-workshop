\m5_TLV_version 1d: tl-x.org
\m5
  
   
   use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
    `include "sqrt32.v"
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   |calc
      
      @1
         $err1[7:0] = $bad_input[3:0] + $illegal_op[3:0];
      @3
         $err2[8:0] = $err1[7:0] + $overflow[7:0];
      @6 
         $err3[8:0] = $err2[8:0] + $div_by_zero[8:0]
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule