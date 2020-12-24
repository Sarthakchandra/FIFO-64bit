`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2020 03:18:54
// Design Name: 
// Module Name: vio_wrapper
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


module vio_wrapper(
    input clk
    );
    wire reset,read,write,full,empty,almost_empty,almost_full;
    wire [3:0] din,dout,data_count;
    vio_0 vin1 (
      .clk(clk),                // input wire clk
      .probe_in0(dout),         // input wire [3 : 0] probe_in0
      .probe_in1(data_count),   // input wire [3 : 0] probe_in1
      .probe_in2(full),         // input wire [0 : 0] probe_in2
      .probe_in3(almost_full),  // input wire [0 : 0] probe_in3
      .probe_in4(empty),        // input wire [0 : 0] probe_in4
      .probe_in5(almost_empty), // input wire [0 : 0] probe_in5
      .probe_out0(din),         // output wire [3 : 0] probe_out0
      .probe_out1(reset),       // output wire [0 : 0] probe_out1
      .probe_out2(read),        // output wire [0 : 0] probe_out2
      .probe_out3(write)        // output wire [0 : 0] probe_out3
    );
    top_FIFO vin2(.clk_125M(clk),.reset(reset),.read(read),.write(write),.din(din),.full(full),
    .empty(empty),.almost_full(almost_full),.almost_empty(almost_empty),.dout(dout),.data_count(data_count));
    
endmodule
