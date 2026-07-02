module subtractor 
    import vending_pkg::*;
(
    input  price_t credit,
    input  price_t price,
    output price_t change
);
    assign change = credit - price;

endmodule
