`timescale 1ns / 1ps

module MUL_datapath (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk);
  input LdA, LdB, LdP, clrP, decB,clk;
  input [15:0] data_in;
  output eqz;
  wire [15:0] X, Y, Z, Bout, Bus;
  assign Bus = data_in; 
  PIPO1 A (X,Bus,clk,LdA);
  PIPO2 P (Y,Z,LdP,clrP,clk);
  CNTR B (Bout,Bus,LdB,decB,clk);
  Add AD (Z,X,Y);
  EQZ COMP (eqz,Bout);
endmodule

module PIPO1(dout,din,ld,clk);
  input [15:0] din;
  input ld,clk;
  output reg [15:0] dout;
  always @ (posedge clk)
    if (ld) dout <= din;
endmodule   

module PIPO2(dout,din,ld,clr,clk);
  input [15:0] din;
  input ld,clr,clk;
  output reg [15:0] dout;
  always @ (posedge clk)
   if (ld) dout <= din;
   else if (clr) dout <= 16'b0;
endmodule

module Add (out,in1,in2);
  input [15:0]in1, in2; 
  output reg [15:0] out;
  always @(*)
   out=in1+in2;
endmodule 

module EQZ (eqz,data);
  input [15:0] data;
  output eqz;
  assign eqz=(data==0);
endmodule

module CNTR (dout,din,ld,dec,clk);
  input [15:0] din;
  input ld,dec,clk;
  output reg [15:0] dout;
  always @(posedge clk)
   begin
    if (ld) dout<= din;
    else if (dec) dout<=dout-1;
   end
endmodule    
