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
         $aa_sq[7:0] = $a_in[3:0] * $a_in[3:0];
         $bb_sq[7:0] = $b_in[3:0] * $b_in[3:0];
      @2
         $cc_sq[8:0] = $aa_sq[7:0] + $bb_sq[7:0];
      @3
         $cc[4:0] = sqrt($cc_sq);
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
