`timescale 1ns / 1ps
// Top-Level Module: MUL_top
// Combines Datapath and Controller for Sequential Multiplier
module MUL_top (
    input clk,         
    input start,       
    input [15:0] data_in, 
    output done        
);
    // Internal control signals between controller and datapath
    wire LdA, LdB, LdP, clrP, decB;
    wire eqz;

    // Instantiate Datapath
    MUL_datapath DP (
        .eqz(eqz), 
        .LdA(LdA), 
        .LdB(LdB), 
        .LdP(LdP), 
        .clrP(clrP), 
        .decB(decB), 
        .data_in(data_in), 
        .clk(clk)
    );
    // Instantiate Controller
    controller CU (
        .LdA(LdA), 
        .LdB(LdB), 
        .LdP(LdP), 
        .clrP(clrP), 
        .decB(decB), 
        .done(done), 
        .clk(clk), 
        .eqz(eqz), 
        .start(start)
    );
endmodule
