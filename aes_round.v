module aes_round(
    input  [127:0] state,
    input  [127:0] round_key,
    output [127:0] result);

wire [127:0] sub_bytes_out;
wire [127:0] shift_rows_out;
wire [127:0] mix_columns_out;

//sub bytes
sub_bytes u_sub_bytes (
    .state(state),
    .result(sub_bytes_out));
//shift rows
shift_rows u_shift_rows (
    .state(sub_bytes_out),
    .result(shift_rows_out));
//mixcolumns
mix_columns u_mix_columns (
    .state(shift_rows_out),
    .result(mix_columns_out));
//addround key
add_round_key u_add_round_key (
    .state(mix_columns_out),
    .round_key(round_key),
    .result(result)
);
endmodule
