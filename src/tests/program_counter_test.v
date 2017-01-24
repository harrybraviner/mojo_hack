module program_counter_test;
    reg clk;
    reg rst;
    reg load;
    reg inc;
    reg  [14:0] in;
    wire [14:0] out;

    // Instantiate the design under test
    program_counter pc1(clk, rst, inc, load, in, out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);

        $display("Reset the counter");
        clk=0;
        rst=1;
        #1;
        clk=1;
        display;

        $display("Set in to 0x2bcd");
        in=15'h2bcd;
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

        $display("Set the inc bit");
        inc = 1;
        clk=0;
        clk=1;
        display;

        $display("Cycle the clock again");
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
