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
         $reset = *reset;
      ?$valid
         @1
            $aa_sq[7:0] = $aa[3:0] * $aa;
            $bb_sq[7:0] = $bb[3:0] * $bb;
         @2
            $cc_sq[8:0] = $aa_sq[7:0] + $bb_sq[7:0];
         @3
            $cc[4:0] = sqrt($cc_sq);
   
      @4
         $total_dist[63:0] =          //mux
             *reset ? '0 :            //reset signal defined in macro
             $valid ? >>1$total_dist + $cc :  //add cc value to previous total distance
                      >>1$total_dist; // retains previous value
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule