module mix_columns(
    input  [127:0] state,
    output [127:0] result
);

// Column 1
wire [7:0] a0, a1, a2, a3;
wire [7:0] b0, b1, b2, b3;

assign a0 = state[127:120];
assign a1 = state[95:88];
assign a2 = state[63:56];
assign a3 = state[31:24];

assign result[127:120] = b0;
assign result[95:88]   = b1;
assign result[63:56]   = b2;
assign result[31:24]   = b3;

// Column 2
wire [7:0] c0, c1, c2, c3;
wire [7:0] d0, d1, d2, d3;

assign c0 = state[119:112];
assign c1 = state[87:80];
assign c2 = state[55:48];
assign c3 = state[23:16];

assign result[119:112] = d0;
assign result[87:80]   = d1;
assign result[55:48]   = d2;
assign result[23:16]   = d3;

// Column 3
wire [7:0] e0, e1, e2, e3;
wire [7:0] f0, f1, f2, f3;

assign e0 = state[111:104];
assign e1 = state[79:72];
assign e2 = state[47:40];
assign e3 = state[15:8];

assign result[111:104] = f0;
assign result[79:72]   = f1;
assign result[47:40]   = f2;
assign result[15:8]    = f3;

// Column 4
wire [7:0] g0, g1, g2, g3;
wire [7:0] h0, h1, h2, h3;

assign g0 = state[103:96];
assign g1 = state[71:64];
assign g2 = state[39:32];
assign g3 = state[7:0];

assign result[103:96] = h0;
assign result[71:64]  = h1;
assign result[39:32]  = h2;
assign result[7:0]    = h3;

// XTIME Function
function [7:0] xtime;
    input [7:0] a;

    begin
        if (a[7] == 1'b1)
            xtime = (a << 1) ^ 8'h1B;
        else
            xtime = a << 1;
    end
endfunction

// Column 1 Equations
assign b0 = xtime(a0) ^ (xtime(a1) ^ a1) ^ a2 ^ a3;
assign b1 = a0 ^ xtime(a1) ^ (xtime(a2) ^ a2) ^ a3;
assign b2 = a0 ^ a1 ^ xtime(a2) ^ (xtime(a3) ^ a3);
assign b3 = (xtime(a0) ^ a0) ^ a1 ^ a2 ^ xtime(a3);

// Column 2 Equations
assign d0 = xtime(c0) ^ (xtime(c1) ^ c1) ^ c2 ^ c3;
assign d1 = c0 ^ xtime(c1) ^ (xtime(c2) ^ c2) ^ c3;
assign d2 = c0 ^ c1 ^ xtime(c2) ^ (xtime(c3) ^ c3);
assign d3 = (xtime(c0) ^ c0) ^ c1 ^ c2 ^ xtime(c3);

// Column 3 Equations
assign f0 = xtime(e0) ^ (xtime(e1) ^ e1) ^ e2 ^ e3;
assign f1 = e0 ^ xtime(e1) ^ (xtime(e2) ^ e2) ^ e3;
assign f2 = e0 ^ e1 ^ xtime(e2) ^ (xtime(e3) ^ e3);
assign f3 = (xtime(e0) ^ e0) ^ e1 ^ e2 ^ xtime(e3);

// Column 4 Equations
assign h0 = xtime(g0) ^ (xtime(g1) ^ g1) ^ g2 ^ g3;
assign h1 = g0 ^ xtime(g1) ^ (xtime(g2) ^ g2) ^ g3;
assign h2 = g0 ^ g1 ^ xtime(g2) ^ (xtime(g3) ^ g3);
assign h3 = (xtime(g0) ^ g0) ^ g1 ^ g2 ^ xtime(g3);

endmodule


