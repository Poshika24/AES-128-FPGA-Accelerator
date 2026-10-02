module aes_top(
    input  [127:0] plaintext,
    input  [127:0] key,
    output [127:0] ciphertext
);

wire [127:0] round0_state;

wire [127:0] round1_state;
wire [127:0] round2_state;
wire [127:0] round3_state;
wire [127:0] round4_state;
wire [127:0] round5_state;
wire [127:0] round6_state;
wire [127:0] round7_state;
wire [127:0] round8_state;
wire [127:0] round9_state;

wire [127:0] round1_key;
wire [127:0] round2_key;
wire [127:0] round3_key;
wire [127:0] round4_key;
wire [127:0] round5_key;
wire [127:0] round6_key;
wire [127:0] round7_key;
wire [127:0] round8_key;
wire [127:0] round9_key;
wire [127:0] round10_key;

wire [127:0] cipher_text;

// KEY EXPANSION
key_expansion u_key_expansion (
    .key(key),
    .round1_key(round1_key),
    .round2_key(round2_key),
    .round3_key(round3_key),
    .round4_key(round4_key),
    .round5_key(round5_key),
    .round6_key(round6_key),
    .round7_key(round7_key),
    .round8_key(round8_key),
    .round9_key(round9_key),
    .round10_key(round10_key));

// INITIAL ADD ROUND KEY
add_round_key u_initial_add_round_key (
    .state(plaintext),
    .round_key(key),
    .result(round0_state));
// ROUND 1
aes_round u_round1 (
    .state(round0_state),
    .round_key(round1_key),
    .result(round1_state));
// ROUND 2
aes_round u_round2 (
    .state(round1_state),
    .round_key(round2_key),
    .result(round2_state));
// ROUND 3
aes_round u_round3 (
    .state(round2_state),
    .round_key(round3_key),
    .result(round3_state));
// ROUND 4
aes_round u_round4 (
    .state(round3_state),
    .round_key(round4_key),
    .result(round4_state));
// ROUND 5
aes_round u_round5 (
    .state(round4_state),
    .round_key(round5_key),
    .result(round5_state));
// ROUND 6
aes_round u_round6 (
    .state(round5_state),
    .round_key(round6_key),
    .result(round6_state));
// ROUND 7
aes_round u_round7 (
    .state(round6_state),
    .round_key(round7_key),
    .result(round7_state));
// ROUND 8
aes_round u_round8 (
    .state(round7_state),
    .round_key(round8_key),
    .result(round8_state));
// ROUND 9
aes_round u_round9 (
    .state(round8_state),
    .round_key(round9_key),
    .result(round9_state));
// FINAL ROUND - ROUND 10
aes_final_round u_final_round (
    .state(round9_state),
    .round_key(round10_key),
    .result(cipher_text));
	 
assign ciphertext = cipher_text;

endmodule
