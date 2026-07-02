`timescale 1ns/1ps

module ula #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,

    input  logic [2:0] op,

    output logic [WIDTH-1:0] result
);

    // =========================
    // Enum dos opcodes
    // =========================
    typedef enum logic [2:0] {
        NOP  = 3'b000,
        ADD  = 3'b001,
        SUB  = 3'b010,
        MULT = 3'b011,
        LSHT = 3'b100,
        RSHT = 3'b101
    } operation_t;

    always_comb begin

        case(operation_t'(op))

            NOP:  result = a + 0;
            ADD:  result = a + b;
            SUB:  result = a - b;
            MULT: result = a * b;
            LSHT: result = a << b;
            RSHT: result = a >> b;

            default: result = '0;

        endcase

    end

endmodule