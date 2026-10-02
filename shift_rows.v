module shift_rows(
    input  [127:0] state,
    output [127:0] result
);
// Row 0: no shift
    assign result = {state[127:120],  
        state[87:80],
        state[47:40],
        state[7:0],
// Row 1: shift left by 1
        state[95:88],    
        state[55:48],
        state[15:8],
        state[103:96],
// Row 2: shift left by 2
        state[63:56],    
        state[23:16],
        state[111:104],
        state[71:64],
// Row 3: shift left by 3
        state[31:24],    
        state[119:112],
        state[79:72],
        state[39:32]};
endmodule
