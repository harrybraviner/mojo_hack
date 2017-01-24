module register_test;
    reg clk;
    reg rst;
    reg load;
    reg  [15:0] in;
    wire [15:0] out;

    // Instantiate the design under test
    register reg1(clk, rst, load, in, out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);

        $display("Reset the register");
        clk=0;
        rst=1;
        #1;
        clk=1;
        display;

        $display("Set in to 0xabcd");
        in=16'habcd;
        rst=0;
        clk=0;
        #1;
        clk=1;
        display;


        $display("Set the load bit");
        load = 1;
        clk=0;
        clk=1;
        display;

        $display("Unset the load bit");
        load = 0;
        clk=0;
        clk=1;
        display;

        $display("Set the rst bit");
        rst = 1;
        clk=0;
        clk=1;
        display;
    end

    task display;
        #1 $display("out: %4h", out);
    endtask
endmodule
