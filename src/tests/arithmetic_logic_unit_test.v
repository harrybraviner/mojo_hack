module arithmetic_logic_unit_test;
    reg [15:0] x;
    reg [15:0] y;
    reg nx, ny, zx, zy, f, no;
    wire [15:0] out;
    wire zr, ng;

    arithmetic_logic_unit alu(.x(x), .y(y),
                              .zx(zx), .nx(nx),
                              .zy(zy), .ny(ny),
                              .f(f), .no(no),
                              .out(out), .zr(zr), .ng(ng));                              

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);

        $display("Identity on x...");
        x = 16'h0abc;
        y = 16'h0444;
        zx = 0; nx = 0; zy = 1; ny = 0;
        f = 1; no = 0;
        display;

        $display("Identity on y...");
        x = 16'h0abc;
        y = 16'h0444;
        zx = 1; nx = 0; zy = 0; ny = 0;
        f = 1; no = 0;
        display;

        $display("Negative of x... (should output ffff)");
        x = 16'h0001;
        y = 16'h0444;
        zx = 0; nx = 0; zy = 1; ny = 1;
        f = 1; no = 1;
        display;

        $display("Negative of y... (should output ffe0)");
        x = 16'h0001;
        y = 16'h0020;
        zx = 1; nx = 1; zy = 0; ny = 0;
        f = 1; no = 1;
        display;

        $display("x - y... (should output ffe1)");
        x = 16'h0001;
        y = 16'h0020;
        zx = 0; nx = 1; zy = 0; ny = 0;
        f = 1; no = 1;
        display;

        $display("x + y... (should output 0021)");
        x = 16'h0001;
        y = 16'h0020;
        zx = 0; nx = 0; zy = 0; ny = 0;
        f = 1; no = 0;
        display;

        $display("x & y... (should output 0020)");
        x = 16'h0031;
        y = 16'h0020;
        zx = 0; nx = 0; zy = 0; ny = 0;
        f = 0; no = 0;
        display;

        $display("x | y... (should output 0031)");
        x = 16'h0031;
        y = 16'h0020;
        zx = 0; nx = 1; zy = 0; ny = 1;
        f = 0; no = 1;
        display;
    end

    task display;
        #1
        $display("x: %4h\ty:%4h\nzx: %1b, nx: %1b, zy: %1b, ny: %1b, f: %1b\nout: %4h\tzr: %1b\tng: %1b\n", x, y, zx, nx, zy, ny, f, out, zr, ng);
    endtask
endmodule
