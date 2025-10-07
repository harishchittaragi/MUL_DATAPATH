`timescale 1ns / 1ps
// =====================================================
// Testbench for MUL_top
// Sequential Multiplier with Internal Signal Monitoring
// =====================================================
module tb_MUL_top;
   reg clk;
   reg start;
   reg [15:0]data_in;
   wire done;
 MUL_top DUT(
 .clk(clk),
 .start(start),
 .data_in(data_in),
 .done(done)
 );
 always #5 clk=~clk;
 initial begin
   clk=0;
   start=0;
   data_in=16'b0;
   #10
   data_in=16'd9;
   start=1;
   #10 start=0;
   #20
   data_in=16'd4;
   #500;
   if (done)
     $display("\n Multiplication completed at time %0t",$time);
   else
     $display("\n Multiplication not completed within simulation time.");
     
   #20 $finish;
  end
  initial begin
  $display(" Time | start | data_in | LdA | LdB | LdP | clrP | decB | eqz | done | A | B | P ");
  $monitor("  %4  | %b    | %4b     | %b  | %b  | %b  | %b   | %b   | %b  | %b   |%4d|%4d|%4d",
           $time ,start,data_in, DUT.CU.LdA, DUT.CU.LdB, DUT.CU.LdP, DUT.CU.clrP, DUT.CU.decB, DUT.CU.eqz,done,
            DUT.DP.A.dout, DUT.DP.B.dout, DUT.DP.P.dout);
   end  
endmodule
