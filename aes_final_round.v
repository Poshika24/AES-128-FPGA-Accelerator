module aes_final_round(
    input  [127:0] state,
    input  [127:0] round_key,
    output [127:0] result
);

wire [127:0] sub_bytes_out;
wire [127:0] shift_rows_out;
//sub bytes
sub_bytes u_sub_bytes (
    .state(state),
    .result(sub_bytes_out));
//shift rows
shift_rows u_shift_rows (
    .state(sub_bytes_out),
    .result(shift_rows_out));
//addround key
add_round_key u_add_round_key (
    .state(shift_rows_out),
    .round_key(round_key),
    .result(result));
endmodule
