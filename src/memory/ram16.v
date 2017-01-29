module ram16(input [3:0] address,
             input [15:0] in,
             input load,
             input clk,
             output [15:0] out);

    reg [15:0] memory [15:0];
    reg [3:0] address_internal;
    reg [15:0] out_internal;
    assign out = out_internal;

    always @(posedge clk) begin
        address_internal <= address;
        if (load) begin
            memory[address] <= in;
            out_internal <= in;
        end else begin
            out_internal <= memory[address];
        end
    end

    

endmodule
