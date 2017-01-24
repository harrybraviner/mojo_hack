// 16-bit register
// out(t) = out(t-1) if load(t-1) = 0 && rst(t-1) = 0
// out(t) = in(t-1)  if load(t-1) = 1 && rst(t-1) = 0
// out(t) = 0 if rst(t-1) = 0

module register (input clk,
                 input rst,
                 input load,
                 input  [15:0] in,
                 output [15:0] out);

    reg [15:0] out_q, out_d;

    assign out = out_q;

    always @(*)
    begin
        out_d = out_q;
    end

    always @(posedge clk or posedge rst)
    begin
        if (rst == 1'b1) begin
            out_q <= 16'b0;
        end else begin
            if (load == 1'b1) begin
                out_q <= out_d;
            end else begin
                out_q <= in;
            end
        end
    end

endmodule
