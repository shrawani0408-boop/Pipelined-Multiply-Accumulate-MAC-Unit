`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:32 09/26/2026 
// Design Name: 
// Module Name:    pipelined_mac 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pipelined_mac (
    input         clk,
    input         reset,
    input         enable,
    input  [7:0]  A,
    input  [7:0]  B,
    output [31:0] acc_out,
    output        valid_out
);

    // Stage 1: Registered multiplier output
    reg [15:0] product_reg;

    // Pipeline valid signal
    reg valid_reg;

    // Accumulator
    reg [31:0] accumulator;

    // Outputs
    assign acc_out   = accumulator;
    assign valid_out = valid_reg;

    always @(posedge clk) begin

        if (reset) begin

            product_reg <= 16'b0;
            accumulator <= 32'b0;
            valid_reg   <= 1'b0;

        end

        else begin

            // Stage 1: Multiply and register the product
            if (enable) begin
                product_reg <= A * B;
            end

            // The accumulator processes the product
            // from the previous pipeline stage
            if (valid_reg) begin
                accumulator <= accumulator + product_reg;
            end

            // Delay the enable signal by one clock
            valid_reg <= enable;

        end

    end

endmodule 