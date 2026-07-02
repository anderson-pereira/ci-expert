module memory 
    import vending_pkg::*; 
#(
    parameter dft_coffe_price = 8'h19,
    parameter dft_water_price = 8'h32,
    parameter dft_juice_price = 8'h4B,
    parameter dft_snack_price = 8'h64,
    parameter dft_coffe_stock = 8'h05,
    parameter dft_water_stock = 8'h05,
    parameter dft_juice_stock = 8'h03,
    parameter dft_snack_stock = 8'h02 
)(
    input  logic        clk,
    input  logic        rst,
    input  logic        mem_read,
    input  logic        mem_write,
    input  item_e       sel_item,
    output item_info_t  item_info
);

    item_info_t mem_array [NUM_ITEMS];

    always_ff @(posedge clk) begin
        if(rst) begin
            mem_array[COFFE] <= '{price: dft_coffe_price, stock: dft_coffe_stock};
            mem_array[WATER] <= '{price: dft_water_price, stock: dft_water_stock};
            mem_array[JUICE] <= '{price: dft_juice_price, stock: dft_juice_stock};
            mem_array[SNACK] <= '{price: dft_snack_price, stock: dft_snack_stock};
            
            item_info <= '0; 
        end
        else begin
            if (mem_write) begin
                mem_array[sel_item].stock <= mem_array[sel_item].stock - 1'd1;
            end
            if (mem_read) begin
                item_info <= mem_array[sel_item];
            end
        end
    end

endmodule
