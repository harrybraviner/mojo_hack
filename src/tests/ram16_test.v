module ram16_test;
    reg [3:0] address;
    reg [15:0] in;
    reg load;
    wire [15:0] out;
    reg clk;

    ram16 theRam(.address(address), .in(in), .load(load),
                 .clk(clk), .out(out));

     initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);

        $display("Set register 0 to abcd and read it...");
        clk = 0;
        in = 16'habcd;
        address = 4'h0;
        load = 1;
        #1;
        clk=1;
        display;

        $display("Wait a cycle and see what it reads...");
        #1;
        clk=0;
        load=0;
        #1;
        clk=1;
        display;

        $display("Set register d to 0110 and read from it...");
        in=16'h0110;
        address=4'hd;
        load=1;
        clk=0;
        #1;
        clk=1;
        display;

        $display("Now read from register 0...");
        load=0;
        address=4'h0;
        clk=0;
        #1;
        clk=1;
        display;

     end

     task display;
        #1 $display("out: %4h\n", out);
     endtask

endmodule
