module subtractor 
    import vending_pkg::*;
(
    input  price_t credit,
    input  item_info_t item_info,
    output price_t change
);
    assign change = credit - item_info.price;

endmodule
