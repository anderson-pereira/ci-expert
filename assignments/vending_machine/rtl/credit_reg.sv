module credit_reg 
    import vending_pkg::*; 
(
    input  logic        clk,
    input  logic        rst,
    input  logic        cancel,
    input  logic        credit_load,
    input  coin_in_e    coin_in,
    output price_t      credit
);

    price_t coin_value;

    always_comb begin
        case (coin_in)
            COIN_0   : coin_value = COIN_0_VAL;
            COIN_25  : coin_value = COIN_25_VAL;
            COIN_50  : coin_value = COIN_50_VAL;
            COIN_100 : coin_value = COIN_100_VAL;
            default  : coin_value = COIN_0_VAL;
        endcase
    end

    always_ff @(posedge clk) begin
        if (rst || cancel) begin
            credit <= price_t'(0); 
        end else if (credit_load) begin
            credit <= credit + coin_value;
        end
    end

endmodule
