module mod12_up (
    input clk,
    input rst,
    input load,
    input [3:0] d,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;       // reset to 0
    else if (load) 
            q <= 4'd11;        // load only if value
    else if (q >= 4'd11)
        q <= 4'b0000;       // wrap to 0 after 11
    else
        q <= q + 1'b1;     // increment
end

endmodule
