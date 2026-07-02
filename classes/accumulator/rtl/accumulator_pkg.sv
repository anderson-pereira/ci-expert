package accumulator_pkg;

    typedef enum logic [2:0] {
        HOLD = 3'b000,
        LOAD = 3'b001,
        ADD  = 3'b010,
        SUB  = 3'b011,
        MULT = 3'b100
    } operation_t;

endpackage