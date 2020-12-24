`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2020 22:53:11
// Design Name: 
// Module Name: clk_pulse
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_pulse(
    input clk_200H,
    input inp_0,
    input inp_1,
    output clk_pulse
    );
    
    wire inp_or;
    reg FF1_reg, FF2_reg, FF3_reg;
    reg FF1_next, FF2_next,FF3_next;
    
    //2 Always blocks because of sequential Circuits. 1 Sequential and 1 Combinational
    assign inp_or = inp_0|inp_1;
    //Debouncing Circuitry
    always@(posedge clk_200H)       //Non Blocking Assignments used because we need 3 FF's, if we didn't do that
    begin                           // Only 1 FF will have been formed
        FF1_reg <= FF1_next;
        FF2_reg <= FF2_next;
        FF3_reg <= FF3_next;
    end
    always@(*)
        FF1_next = inp_or;
    always@(*)
        FF2_next = FF1_reg;
    always@(*)
        FF3_next = FF2_reg;
   assign clk_pulse = FF1_reg & FF2_reg &(~FF3_reg);
endmodule
