`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:53 09/26/2026
// Design Name:   pipelined_mac
// Module Name:   pipelined_mac_tb.v
// Project Name:  MAC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipelined_mac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module pipelined_mac_tb;

    reg clk;
    reg reset;
    reg enable;
    reg [7:0] A;
    reg [7:0] B;

    wire [31:0] acc_out;
    wire valid_out;

    integer expected_acc;
    integer pending_product;
    integer pending_valid;

    pipelined_mac uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .A(A),
        .B(B),
        .acc_out(acc_out),
        .valid_out(valid_out)
    );

    // Clock: 10 ns period
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin

        reset = 1'b1;
        enable = 1'b0;
        A = 8'd0;
        B = 8'd0;

        expected_acc = 0;
        pending_product = 0;
        pending_valid = 0;

        // Reset
        #10;

        reset = 1'b0;
        enable = 1'b1;

        // 3 x 4 = 12
        A = 8'd3;
        B = 8'd4;
        #10;

        // 2 x 5 = 10
        A = 8'd2;
        B = 8'd5;
        #10;

        // 6 x 2 = 12
        A = 8'd6;
        B = 8'd2;
        #10;

        // 10 x 10 = 100
        A = 8'd10;
        B = 8'd10;
        #10;

        // Disable MAC
        enable = 1'b0;
        A = 8'd20;
        B = 8'd20;
        #10;

        $display("PIPELINED MAC TEST COMPLETE");


        $finish;

    end

    // Automatic checker
    always @(posedge clk) begin

        #1;

        if (reset) begin

            expected_acc = 0;
            pending_product = 0;
            pending_valid = 0;

        end

        else begin

            // Accumulate the product from the previous cycle
            if (pending_valid) begin
                expected_acc = expected_acc + pending_product;
            end

            // Check DUT output
            if (acc_out == expected_acc) begin

                $display("PASS: time=%0t  A=%d B=%d  ACC=%d",
                         $time, A, B, acc_out);

            end

            else begin

                $display("FAIL: time=%0t  Expected=%d  Actual=%d",
                         $time, expected_acc, acc_out);

            end

            // Store current input for next pipeline cycle
            if (enable) begin

                pending_product = A * B;
                pending_valid = 1;

            end

            else begin

                pending_product = 0;
                pending_valid = 0;

            end

        end

    end

endmodule