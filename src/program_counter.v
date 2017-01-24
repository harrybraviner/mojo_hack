// 15-bit program counter

module program_counter(input clk,
                       input rst,
                       input inc,
                       input load,
                       input [14:0] in,
                       output [14:0] out);

    reg [14:0] out_q, out_d;

    assign out = out_q;

    always @(*)
    begin
        out_d = out_q;
    end

    always @(posedge clk)
    begin
        if (rst) begin
            out_q <= 15'b0;
        end else begin
            if (load) begin
                out_q <= in;
            end else begin
                if (inc) begin
                    out_q <= out_d + 15'b1;
                end else begin
                    out_q <= out_d;
                end
            end
        end
    end

endmodule
