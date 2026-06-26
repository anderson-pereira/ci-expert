`timescale 1ns/1ps

module tb_ula;

    parameter WIDTH = 8;

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;

    logic [2:0] op;

    logic [WIDTH-1:0] result;

    // =========================
    // Opcodes locais do TB
    // =========================
    typedef enum logic [2:0] {
        NOP  = 3'b000,
        ADD  = 3'b001,
        SUB  = 3'b010,
        MULT = 3'b011,
        LSHT = 3'b100,
        RSHT = 3'b101
    } operation_t;

    // =========================
    // DUT
    // =========================
    ula #(
        .WIDTH(WIDTH)
    ) dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        $fsdbDumpfile("waves.fsdb");
        $fsdbDumpvars(0, tb_ula);
    end

    initial begin

        $display("Inicio da simulacao");

        a = 8;
        b = 2;

        op = NOP;
        #10
        $display("NOP  -> result = %0d", result);

        op = ADD;
        #10
        $display("ADD  -> result = %0d", result);

        op = SUB;
        #10
        $display("SUB  -> result = %0d", result);

        op = MULT;
        #10
        $display("MULT -> result = %0d", result);

        op = LSHT;
        #10
        $display("LSHT -> result = %0d", result);

        op = RSHT;
        #10
        $display("RSHT -> result = %0d", result);

        $finish;

    end

endmodule