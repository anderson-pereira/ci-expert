package vending_pkg;

    typedef logic [7:0] price_t;
    typedef logic [7:0] stock_t;
    typedef logic [1:0] coin_in_t;
    typedef logic [1:0] item_t;
    typedef logic [2:0] state_t;

    typedef struct packed {
        price_t price;
        stock_t stock;
    } item_info_t;

    typedef enum state_t {
        IDLE     = 3'b000,
        COLLECT  = 3'b001,
        CHECK    = 3'b010,
        DISPENSE = 3'b011,
        CHANGE   = 3'b100,
        ERROR    = 3'b101
    } state_e;

    typedef enum coin_in_t {
        COIN_0   = 2'd0,
        COIN_25  = 2'd1,
        COIN_50  = 2'd2,
        COIN_100 = 2'd3
    } coin_in_e;

    typedef enum price_t {
        COIN_0_VAL   = 8'd0,
        COIN_25_VAL  = 8'd25,
        COIN_50_VAL  = 8'd50,
        COIN_100_VAL = 8'd100
    } coin_val_e;

    typedef enum item_t {
        COFFE = 2'b00,
        WATER = 2'b01,
        JUICE = 2'b10,
        SNACK = 2'b11
    } item_e;

    localparam int NUM_ITEMS = 4; // Formality compatible parameter.

endpackage
