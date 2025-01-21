module HEXDisplayDriver(binary_num, segments);
input [3:0] binary_num;
output [6:0] segments;

assign segments[0] = (!binary_num[0] && !binary_num[1] && binary_num[2]) || (binary_num[0] && !binary_num[1] && !binary_num[2] && !binary_num[3]);
assign segments[1] = (binary_num[0] ^ binary_num[1]) && binary_num[2];
assign segments[2] = !binary_num[0] && binary_num[1] && !binary_num[2];
assign segments[3] = (!binary_num[0] && !binary_num[1] && binary_num[2]) || (binary_num[0] && !binary_num[1] && !binary_num[2]) || (binary_num[0] && binary_num[1] && binary_num[2]) || (binary_num[0] && binary_num[3]);
assign segments[4] = binary_num[0] || (!binary_num[0] && !binary_num[1] && binary_num[2]);
assign segments[5] = (binary_num[0] && !binary_num[3] && !binary_num[2]) || (binary_num[1] && !binary_num[2] && !binary_num[3]) || (binary_num[0] && binary_num[1]);
assign segments[6] = (binary_num[0] && binary_num[1] && binary_num[2]) || (!binary_num[1] && !binary_num[2] && !binary_num[3]);

endmodule
