module comparator 
    import vending_pkg::*; 
(
    input  price_t      credit,
    input  item_info_t  item_info,
    output logic        can_sell
);

    assign can_sell = (credit >= item_info.price) && (item_info.stock > stock_t'(0));

endmodule
