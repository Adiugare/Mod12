`timescale 1ns/1ps
module mod12_up_tb;
    reg [3:0] d;
    reg clk, rst, load;
    wire [3:0] q;

    parameter CYCLE = 10;

    // Instantiate DUT
    mod12_up dut(
        .d(d),
        .clk(clk),
        .rst(rst),
        .load(load),
        .q(q)
    );

    // Clock generation
    always begin
    #(CYCLE/2); 
    clk = 0;
    #(CYCLE/2);
     clk = ~clk;
     end

    // Initialization task
    task initialize;
        begin
            d = 4'b0;
            load = 1'b0;
            rst = 1'b0;
        end
    endtask

    // Reset task
    task rst_dut;
        begin
            @(negedge clk);
            rst = 1;
            @(negedge clk);
            rst = 0;
        end
    endtask

    // Load data task
    task load_inputs(input l,input [3:0] data_val);
        begin
            @(negedge clk);
            load = l;
            d = data_val;
            @(negedge clk);
            load = 1'b0;
            d = 4'b0;
        end
    endtask

    // Test sequence
    initial begin
        initialize;
        rst_dut;
        load_inputs(0,4'b0101);   
        #10;
        load_inputs(1,4'b1111);   
        #10;
        load_inputs(0,4'b111);
        #10;
        load_inputs(1,4'b1011);   // load 3
        #10;
        load_inputs(0,4'b1001);   // load 7
        #10;
        load_inputs(1,4'b1110);
        #10;
        load_inputs(0,4'b1010);   // load 3
        #10;
        load_inputs(1,4'b1100); 
         load_inputs(0,4'b1001);   // load 7
        #10;
        load_inputs(1,4'b1110);
        #10;
        load_inputs(0,4'b1010);   // load 3
        #10;
        load_inputs(1,4'b1100); 
        #100;
        $finish;
    end

    // Printing signal values during simulation
    initial 
    $monitor(" d=%b, rst=%b, load=%b, q=%b, clk=%b", 
               d, rst, load, q, clk);

endmodule
