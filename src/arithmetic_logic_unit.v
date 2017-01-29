module arithmetic_logic_unit(input [15:0] x,
                             input [15:0] y,
                             input zx,
                             input nx,
                             input zy,
                             input ny,
                             input  f,
                             input no,
                             output [15:0] out,
                             output zr,
                             output ng);

   // Zero the inputs, if requested
   wire [15:0] x_stage1 = {16{~zx}} & x;
   wire [15:0] y_stage1 = {16{~zy}} & y;

   // Bitwise negation of the inputs, if requested
   wire [15:0] x_stage2 = ({16{nx}} & ~x_stage1) | ({16{~nx}} & x_stage1);
   wire [15:0] y_stage2 = ({16{ny}} & ~y_stage1) | ({16{~ny}} & y_stage1);

   wire [15:0] f_output = ({16{f}} & (x_stage2 + y_stage2)) | ({16{~f}} & (x_stage2 & y_stage2));

   // Bitwise negation of the output, if requested
   wire [15:0] out_stage1 = ({16{no}} & ~f_output) | ({16{~no}} & f_output);

   assign out = out_stage1;
   assign zr  = ~|out_stage1;
   assign ng  = out_stage1[15];

endmodule

