module BCDConverter(r, b);
input [7:0] b;
output [11:0] r;
wire [3:0] B1, B2, B3, B4, B5, B6, B7;

ConverterBlock c1(B1, {1'b0, b[7:5]});
ConverterBlock c2(B2, {B1[2:0], b[4]});
ConverterBlock c3(B3, {B2[2:0], b[3]});
ConverterBlock c4(B4, {B3[2:0], b[2]});
ConverterBlock c5(B5, {B4[2:0], b[1]});
ConverterBlock c6(B6, {1'b0, B1[3], B2[3], B3[3]});
ConverterBlock c7(B7, {B6[2:0], B4[3]});
assign r = {1'b0, 1'b0, B6[3], B7, B5, b[0]};

endmodule

module ConverterBlock(r, b);
input [3:0] b;
output [3:0] r;

assign r = b>4 ? b+3 : b;

endmodule