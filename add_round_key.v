module add_round_key(
input [127:0]state,
input [127:0]round_key,
output [127:0]result);

assign result = state ^ round_key;

endmodule
